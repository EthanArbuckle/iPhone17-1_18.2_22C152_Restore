@interface _UIDocumentUnavailableBrowserPresentationController
- (BOOL)_shouldDisableInteractionDuringTransitions;
- (BOOL)_shouldDismiss;
- (BOOL)shouldPresentInFullscreen;
- (_UIDocumentUnavailableBrowserPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (double)smallestDetentValue;
- (id)browserDelegate;
- (void)_sendDidChangeSelectedDetentIdentifier;
- (void)_sendDidInvalidateDetentValues;
- (void)_sendDidInvalidateUntransformedFrame;
- (void)_sendPerformLayout;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionWillBegin;
- (void)setSelectedDetentIdentifier:(id)a3;
@end

@implementation _UIDocumentUnavailableBrowserPresentationController

- (_UIDocumentUnavailableBrowserPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)_UIDocumentUnavailableBrowserPresentationController;
  v4 = [(UISheetPresentationController *)&v10 initWithPresentedViewController:a3 presentingViewController:a4];
  v5 = v4;
  if (v4)
  {
    [(UISheetPresentationController *)v4 setPreferredCornerRadius:0.0];
    [(_UIDocumentUnavailableBrowserPresentationController *)v5 setSelectedDetentIdentifier:@"_UIDocumentUnavailableViewBrowserViewControllerMediumDetent"];
    [(UISheetPresentationController *)v5 setLargestUndimmedDetentIdentifier:@"com.apple.UIKit.full"];
    v6 = +[UISheetPresentationControllerDetent customDetentWithIdentifier:@"_UIDocumentUnavailableViewBrowserViewControllerMediumDetent" resolver:&__block_literal_global_611];
    v11[0] = v6;
    v7 = +[UISheetPresentationControllerDetent _fullDetent];
    v11[1] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    [(UISheetPresentationController *)v5 setDetents:v8];

    [(UISheetPresentationController *)v5 _setShouldScaleDownBehindDescendantSheets:0];
    [(UISheetPresentationController *)v5 _setWantsBottomAttached:1];
    [(UISheetPresentationController *)v5 _setPreferredShadowOpacity:0.4];
    [(UISheetPresentationController *)v5 _setShadowRadius:100.0];
  }
  return v5;
}

- (double)smallestDetentValue
{
  if (!a1) {
    return 0.0;
  }
  v2 = [a1 _detentValues];
  uint64_t v3 = [v2 count];

  if (!v3)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:sel_smallestDetentValue object:a1 file:@"_UIDocumentUnavailableBrowserPresentationController.m" lineNumber:52 description:@"UIKit internal inconsistency: expected sheet detent in browser presentation controller."];
  }
  v4 = [a1 _detentValues];
  v5 = [v4 firstObject];
  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (void)setSelectedDetentIdentifier:(id)a3
{
  v5 = [(UISheetPresentationController *)self selectedDetentIdentifier];
  v9.receiver = self;
  v9.super_class = (Class)_UIDocumentUnavailableBrowserPresentationController;
  [(UISheetPresentationController *)&v9 setSelectedDetentIdentifier:a3];
  double v6 = [(UISheetPresentationController *)self selectedDetentIdentifier];
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"_UIDocumentViewControllerLandingBrowserPresentationControllerDidChangeSelectedDetentIdentifierNotification" object:self];
  }
}

- (void)_sendDidChangeSelectedDetentIdentifier
{
  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentUnavailableBrowserPresentationController;
  [(UISheetPresentationController *)&v4 _sendDidChangeSelectedDetentIdentifier];
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"_UIDocumentViewControllerLandingBrowserPresentationControllerDidChangeSelectedDetentIdentifierNotification" object:self];
}

- (void)_sendDidInvalidateDetentValues
{
  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentUnavailableBrowserPresentationController;
  [(UISheetPresentationController *)&v4 _sendDidInvalidateDetentValues];
  uint64_t v3 = -[_UIDocumentUnavailableBrowserPresentationController browserDelegate]((id *)&self->super.super.super.isa);
  [v3 browserPresentationControllerDidInvalidateSheetDetentValues:self];
}

- (id)browserDelegate
{
  if (WeakRetained)
  {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 72);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void)_sendDidInvalidateUntransformedFrame
{
  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentUnavailableBrowserPresentationController;
  [(UISheetPresentationController *)&v4 _sendDidInvalidateUntransformedFrame];
  uint64_t v3 = -[_UIDocumentUnavailableBrowserPresentationController browserDelegate]((id *)&self->super.super.super.isa);
  [v3 browserPresentationControllerDidInvalidateUntransformedFrame:self];
}

- (void)_sendPerformLayout
{
  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentUnavailableBrowserPresentationController;
  [(UISheetPresentationController *)&v4 _sendDidInvalidateUntransformedFrame];
  uint64_t v3 = -[_UIDocumentUnavailableBrowserPresentationController browserDelegate]((id *)&self->super.super.super.isa);
  [v3 browserPresentationControllerPerformLayout:self];
}

- (void)presentationTransitionWillBegin
{
  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentUnavailableBrowserPresentationController;
  [(UISheetPresentationController *)&v4 presentationTransitionWillBegin];
  uint64_t v3 = -[_UIDocumentUnavailableBrowserPresentationController browserDelegate]((id *)&self->super.super.super.isa);
  [v3 browserPresentationControllerPresentationTransitionWillBegin:self];
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentUnavailableBrowserPresentationController;
  [(UISheetPresentationController *)&v5 presentationTransitionDidEnd:a3];
  objc_super v4 = -[_UIDocumentUnavailableBrowserPresentationController browserDelegate]((id *)&self->super.super.super.isa);
  [v4 browserPresentationControllerPresentationTransitionDidEnd:self];
}

- (void)dismissalTransitionWillBegin
{
  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentUnavailableBrowserPresentationController;
  [(UISheetPresentationController *)&v4 dismissalTransitionWillBegin];
  uint64_t v3 = -[_UIDocumentUnavailableBrowserPresentationController browserDelegate]((id *)&self->super.super.super.isa);
  [v3 browserPresentationControllerDismissalTransitionWillBegin:self];
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentUnavailableBrowserPresentationController;
  [(UISheetPresentationController *)&v5 dismissalTransitionDidEnd:a3];
  objc_super v4 = -[_UIDocumentUnavailableBrowserPresentationController browserDelegate]((id *)&self->super.super.super.isa);
  [v4 browserPresentationControllerDismissalTransitionDidEnd:self];
}

- (BOOL)shouldPresentInFullscreen
{
  return 0;
}

- (BOOL)_shouldDismiss
{
  return 0;
}

- (BOOL)_shouldDisableInteractionDuringTransitions
{
  return 0;
}

- (void).cxx_destruct
{
}

@end