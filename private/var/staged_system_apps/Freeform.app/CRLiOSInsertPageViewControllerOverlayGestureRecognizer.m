@interface CRLiOSInsertPageViewControllerOverlayGestureRecognizer
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation CRLiOSInsertPageViewControllerOverlayGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if (![(CRLiOSInsertPageViewControllerOverlayGestureRecognizer *)self state])
  {
    [(CRLiOSInsertPageViewControllerOverlayGestureRecognizer *)self setState:3];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

@end