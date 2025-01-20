@interface _UISharingViewPresentationController
- (BOOL)suppressDismissalHandlerUnlessDimmingViewTapped;
- (id)dismissalHandler;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)setDismissalHandler:(id)a3;
- (void)setSuppressDismissalHandlerUnlessDimmingViewTapped:(BOOL)a3;
@end

@implementation _UISharingViewPresentationController

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIPresentationController *)self dismissing]
    && (!self->_suppressDismissalHandlerUnlessDimmingViewTapped
     || [(UIPopoverPresentationController *)self _popoverIsDismissingBecauseDismissInteractionOccurred]))
  {
    v5 = [(_UISharingViewPresentationController *)self dismissalHandler];

    if (v5)
    {
      v6 = [(_UISharingViewPresentationController *)self dismissalHandler];
      v6[2]();

      [(_UISharingViewPresentationController *)self setDismissalHandler:0];
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)_UISharingViewPresentationController;
  [(UIPopoverPresentationController *)&v7 dismissalTransitionDidEnd:v3];
}

- (id)dismissalHandler
{
  return self->_dismissalHandler;
}

- (void)setDismissalHandler:(id)a3
{
}

- (BOOL)suppressDismissalHandlerUnlessDimmingViewTapped
{
  return self->_suppressDismissalHandlerUnlessDimmingViewTapped;
}

- (void)setSuppressDismissalHandlerUnlessDimmingViewTapped:(BOOL)a3
{
  self->_suppressDismissalHandlerUnlessDimmingViewTapped = a3;
}

- (void).cxx_destruct
{
}

@end