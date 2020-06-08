//
//  MainHelpViewController.swift
//  CoronaContact
//

import Reusable
import UIKit

final class MainHelpViewController: UIViewController, StoryboardBased, ViewModelBased, FlashableScrollIndicators {
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var instructionsView: InstructionsView!

    var viewModel: MainHelpViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        flashScrollIndicators()
    }

    private func setupUI() {
        title = "automatic_handshake_help_title".localized

        instructionsView.instructions = [
            .init(index: 1, text: "automatic_handshake_help_instruction_first".localized),
            .init(index: 2, text: "automatic_handshake_help_instruction_second".localized),
            .init(index: 3, text: "automatic_handshake_help_instruction_third".localized),
            .init(index: 4, text: "automatic_handshake_help_instruction_fourth".localized),
        ]
    }

    @IBAction func faqButtonTapped(_ sender: Any) {
        viewModel?.openFAQ()
    }
}
