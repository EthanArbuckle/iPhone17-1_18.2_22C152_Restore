@interface _UIKeyboardBasedTextSelectionGestureController
+ (id)sharedInstance;
- (BOOL)allowOneFingerDeepPress;
- (BOOL)delayForceMagnify;
- (BOOL)didLongForcePress;
- (BOOL)oneFingerForcePressShouldCancelTouchesInView;
- (BOOL)oneFingerForcePressShouldFailWithoutForce;
- (Class)textInteractionClass;
- (double)oneFingerForcePressMinimumDuration;
- (void)_cleanupDeadGesturesIfNecessary;
- (void)setDelayForceMagnify:(BOOL)a3;
- (void)setDidLongForcePress:(BOOL)a3;
@end

@implementation _UIKeyboardBasedTextSelectionGestureController

+ (id)sharedInstance
{
  if (qword_1EB25B400 != -1) {
    dispatch_once(&qword_1EB25B400, &__block_literal_global_544);
  }
  v2 = (void *)qword_1EB25B408;
  return v2;
}

- (Class)textInteractionClass
{
  return (Class)objc_opt_class();
}

- (void)_cleanupDeadGesturesIfNecessary
{
  [(_UIKeyboardBasedTextSelectionGestureController *)self setDelayForceMagnify:0];
  v3.receiver = self;
  v3.super_class = (Class)_UIKeyboardBasedTextSelectionGestureController;
  [(_UIKeyboardTextSelectionGestureController *)&v3 _cleanupDeadGesturesIfNecessary];
}

- (void)setDelayForceMagnify:(BOOL)a3
{
  self->_delayForceMagnify = a3;
}

- (double)oneFingerForcePressMinimumDuration
{
  return 0.5;
}

- (BOOL)oneFingerForcePressShouldFailWithoutForce
{
  return 0;
}

- (BOOL)oneFingerForcePressShouldCancelTouchesInView
{
  return 1;
}

- (BOOL)allowOneFingerDeepPress
{
  v2 = +[_UITextSelectionSettings sharedInstance];
  objc_super v3 = [v2 enableDeepPress];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)delayForceMagnify
{
  return self->_delayForceMagnify;
}

- (BOOL)didLongForcePress
{
  return self->_didLongForcePress;
}

- (void)setDidLongForcePress:(BOOL)a3
{
  self->_didLongForcePress = a3;
}

@end