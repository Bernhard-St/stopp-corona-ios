//
//  SelfTestingStatusReportCoordinator.swift
//  CoronaContact
//

import UIKit

final class SelfTestingStatusReportCoordinator: Coordinator, ErrorPresentableCoordinator {
    lazy var rootViewController: SelfTestingStatusReportViewController = {
        SelfTestingStatusReportViewController.instantiate()
    }()

    var navigationController: UINavigationController
    let updateKeys: Bool

    init(navigationController: UINavigationController, updateKeys: Bool) {
        self.navigationController = navigationController
        self.updateKeys = updateKeys
    }

    override func start() {
        rootViewController.viewModel = SelfTestingStatusReportViewModel(with: self, updateKeys: updateKeys)
        navigationController.pushViewController(rootViewController, animated: true)
    }

    override func finish(animated: Bool = false) {}

    func goBackToTanConfirmation() {
        navigationController.popViewController(animated: true)
    }

    func goBackToPersonalData() {
        let personalDataViewController = navigationController.viewControllers.first { $0 is SelfTestingPersonalDataViewController }

        guard let viewController = personalDataViewController else {
            return
        }

        navigationController.popToViewController(viewController, animated: true)
    }

    func showConfirmation() {
        let child = SelfTestingConfirmationCoordinator(navigationController: navigationController, updateKeys: updateKeys)
        addChildCoordinator(child)
        child.start()
    }
}
