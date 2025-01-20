@interface CACDictationRecognizerModeOverlayViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isOverlay;
- (int64_t)zOrder;
- (void)loadView;
- (void)setDictationRecognizerMode:(int)a3;
- (void)setImageRect:(CGRect)a3;
@end

@implementation CACDictationRecognizerModeOverlayViewController

- (void)loadView
{
  v3 = objc_alloc_init(CACDictationRecognizerModeOverlayView);
  [(CACDictationRecognizerModeOverlayViewController *)self setView:v3];
}

- (void)setImageRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(CACDictationRecognizerModeOverlayViewController *)self view];
  objc_msgSend(v7, "setImageRect:", x, y, width, height);
}

- (void)setDictationRecognizerMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(CACDictationRecognizerModeOverlayViewController *)self view];
  [v4 setDictationRecognizerMode:v3];
}

- (int64_t)zOrder
{
  return 9;
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