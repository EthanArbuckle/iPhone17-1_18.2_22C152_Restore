@interface RAPReportComposerNavigationController
- (PlaceCardDismissable)dismissalDelegate;
- (void)setDismissalDelegate:(id)a3;
@end

@implementation RAPReportComposerNavigationController

- (PlaceCardDismissable)dismissalDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dismissalDelegate);

  return (PlaceCardDismissable *)WeakRetained;
}

- (void)setDismissalDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end