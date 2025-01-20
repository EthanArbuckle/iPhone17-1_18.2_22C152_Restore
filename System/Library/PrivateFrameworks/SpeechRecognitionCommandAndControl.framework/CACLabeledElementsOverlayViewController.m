@interface CACLabeledElementsOverlayViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isOverlay;
- (int64_t)zOrder;
- (void)loadView;
- (void)setLabeledElements:(id)a3;
@end

@implementation CACLabeledElementsOverlayViewController

- (void)loadView
{
  v3 = [CACLabeledElementsOverlayView alloc];
  id v5 = [MEMORY[0x263F82B60] mainScreen];
  [v5 bounds];
  v4 = -[CACLabeledElementsOverlayView initWithFrame:](v3, "initWithFrame:");
  [(CACLabeledElementsOverlayViewController *)self setView:v4];
}

- (void)setLabeledElements:(id)a3
{
  id v4 = a3;
  id v5 = [(CACLabeledElementsOverlayViewController *)self view];
  [v5 clearLabeledElements];

  id v6 = [(CACLabeledElementsOverlayViewController *)self view];
  [v6 addLabeledElements:v4];
}

- (int64_t)zOrder
{
  return 10;
}

- (BOOL)isOverlay
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end