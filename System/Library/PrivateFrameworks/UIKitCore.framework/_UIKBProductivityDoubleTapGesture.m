@interface _UIKBProductivityDoubleTapGesture
+ (id)productivityDoubleTapGestureRecognizerWithTarget:(id)a3 action:(SEL)a4 delegate:(id)a5;
@end

@implementation _UIKBProductivityDoubleTapGesture

+ (id)productivityDoubleTapGestureRecognizerWithTarget:(id)a3 action:(SEL)a4 delegate:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = [(UITapGestureRecognizer *)[_UIKBProductivityDoubleTapGesture alloc] initWithTarget:v8 action:a4];

  if (v9)
  {
    [(UIGestureRecognizer *)v9 setAllowedTouchTypes:&unk_1ED3EFCC8];
    [(UIGestureRecognizer *)v9 setName:@"com.apple.UIKit.undointeraction.threeFingerDoubleTap"];
    [(UIGestureRecognizer *)v9 setDelegate:v7];
    [(UITapGestureRecognizer *)v9 setNumberOfTapsRequired:2];
    [(UITapGestureRecognizer *)v9 setNumberOfTouchesRequired:3];
    [(UIGestureRecognizer *)v9 setDelaysTouchesBegan:0];
    [(UIGestureRecognizer *)v9 setDelaysTouchesEnded:0];
    if (_isSystemGestureForDelegate(v7)) {
      [(UIGestureRecognizer *)v9 setCancelsTouchesInView:0];
    }
    v10 = +[_UITextSelectionSettings sharedInstance];
    [v10 allowableSeparation];
    [(UITapGestureRecognizer *)v9 _setAllowableSeparation:v11 + v11];

    [(UITapGestureRecognizer *)v9 setMaximumIntervalBetweenSuccessiveTaps:0.35];
    [(UITapGestureRecognizer *)v9 _setAllowableTouchTimeSeparation:0.06];
    v12 = v9;
  }

  return v9;
}

@end