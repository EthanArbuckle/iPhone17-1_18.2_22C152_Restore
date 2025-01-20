@interface _UIPressClickInteractionDriver
+ (BOOL)prefersCancelsTouchesInView;
+ (BOOL)requiresForceCapability;
- (BOOL)allowsFeedback;
- (BOOL)cancelsTouchesInView;
- (BOOL)clicksUpAutomaticallyAfterTimeout;
- (BOOL)hasExceededAllowableMovement;
- (BOOL)isCurrentlyAcceleratedByForce;
- (CGPoint)locationInCoordinateSpace:(id)a3;
- (NSArray)triggers;
- (UIView)view;
- (_UIClickInteractionDriverDelegate)delegate;
- (_UIPressClickInteractionDriver)init;
- (_UISimplePressGestureRecognizer)pressGR;
- (double)allowableMovement;
- (double)maximumEffectProgress;
- (double)touchDuration;
- (unint64_t)driverStyle;
- (unint64_t)inputPrecision;
- (void)_addToView:(id)a3;
- (void)_gestureRecognizerFailed:(id)a3;
- (void)_handlePressGesture:(id)a3;
- (void)_removeFromView;
- (void)cancelInteraction;
- (void)setAllowableMovement:(double)a3;
- (void)setCancelsTouchesInView:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setPressGR:(id)a3;
- (void)setTriggers:(id)a3;
- (void)setView:(id)a3;
@end

@implementation _UIPressClickInteractionDriver

- (void)setView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_view, obj);
    [(_UIPressClickInteractionDriver *)self _removeFromView];
    id v6 = objc_loadWeakRetained((id *)&self->_view);

    v5 = obj;
    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_view);
      [(_UIPressClickInteractionDriver *)self _addToView:v7];

      v5 = obj;
    }
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)_removeFromView
{
  id v5 = [(_UIPressClickInteractionDriver *)self pressGR];
  v3 = [v5 view];
  v4 = [(_UIPressClickInteractionDriver *)self pressGR];
  [v3 removeGestureRecognizer:v4];
}

- (_UIPressClickInteractionDriver)init
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)_UIPressClickInteractionDriver;
  v2 = [(_UIPressClickInteractionDriver *)&v9 init];
  if (v2)
  {
    v8[0] = xmmword_186B94CA0;
    v8[1] = unk_186B94CB0;
    v3 = [MEMORY[0x1E4F29238] valueWithBytes:v8 objCType:"{_UIPressTrigger=qqdB}"];
    v10[0] = v3;
    v7[0] = xmmword_186B94CC0;
    v7[1] = unk_186B94CD0;
    v4 = [MEMORY[0x1E4F29238] valueWithBytes:v7 objCType:"{_UIPressTrigger=qqdB}"];
    v10[1] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
    [(_UIPressClickInteractionDriver *)v2 setTriggers:v5];
  }
  return v2;
}

- (void)setAllowableMovement:(double)a3
{
  self->_allowableMovement = a3;
}

- (void)_addToView:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIPressClickInteractionDriver *)self pressGR];

  if (!v5)
  {
    id v6 = [[_UISimplePressGestureRecognizer alloc] initWithTarget:self action:sel__handlePressGesture_];
    [(_UIPressClickInteractionDriver *)self setPressGR:v6];

    id v7 = [(_UIPressClickInteractionDriver *)self pressGR];
    [v7 setName:@"com.apple.UIKit.keyPressClickDriverPrimary"];

    v8 = [(_UIPressClickInteractionDriver *)self pressGR];
    [v8 setDelegate:self];

    objc_super v9 = [(_UIPressClickInteractionDriver *)self pressGR];
    v10 = [(_UIPressClickInteractionDriver *)self triggers];
    [v9 setTriggers:v10];
  }
  id v11 = [(_UIPressClickInteractionDriver *)self pressGR];
  [v4 addGestureRecognizer:v11];
}

- (_UISimplePressGestureRecognizer)pressGR
{
  return self->_pressGR;
}

- (void)setTriggers:(id)a3
{
  id v5 = (NSArray *)a3;
  if (self->_triggers != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_triggers, a3);
    id v6 = [(_UIPressClickInteractionDriver *)self pressGR];
    id v7 = [(_UIPressClickInteractionDriver *)self triggers];
    [v6 setTriggers:v7];

    id v5 = v8;
  }
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (void)setPressGR:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pressGR, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (BOOL)requiresForceCapability
{
  return 0;
}

+ (BOOL)prefersCancelsTouchesInView
{
  return 0;
}

- (double)touchDuration
{
  return 0.0;
}

- (BOOL)hasExceededAllowableMovement
{
  return 0;
}

- (BOOL)isCurrentlyAcceleratedByForce
{
  return 0;
}

- (BOOL)clicksUpAutomaticallyAfterTimeout
{
  return 0;
}

- (double)maximumEffectProgress
{
  return 1.0;
}

- (unint64_t)inputPrecision
{
  return 1;
}

- (BOOL)allowsFeedback
{
  return 1;
}

- (CGPoint)locationInCoordinateSpace:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIPressClickInteractionDriver *)self view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = [v5 _focusSystem];
  v15 = [v14 focusedItem];

  if (v15)
  {
    v16 = _UIParentCoordinateSpaceForFocusItem(v15);

    [v15 frame];
    double v19 = v18 + v17 * 0.5;
    double v22 = v21 + v20 * 0.5;
  }
  else
  {
    double v19 = v7 + v11 * 0.5;
    double v22 = v9 + v13 * 0.5;
    v16 = v5;
  }
  objc_msgSend(v16, "convertPoint:toCoordinateSpace:", v4, v19, v22);
  double v24 = v23;
  double v26 = v25;

  double v27 = v24;
  double v28 = v26;
  result.y = v28;
  result.x = v27;
  return result;
}

- (void)cancelInteraction
{
  v3 = [(_UIPressClickInteractionDriver *)self pressGR];
  [v3 setEnabled:0];

  id v4 = [(_UIPressClickInteractionDriver *)self pressGR];
  [v4 setEnabled:1];
}

- (unint64_t)driverStyle
{
  v2 = [(_UIPressClickInteractionDriver *)self pressGR];
  v3 = [v2 activeTrigger];
  id v4 = v3;
  if (v3)
  {
    [v3 _UIPressTriggerValue];
    unint64_t v5 = v7;
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)_handlePressGesture:(id)a3
{
  if ([a3 state] == 1)
  {
    id v4 = [(_UIPressClickInteractionDriver *)self delegate];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __54___UIPressClickInteractionDriver__handlePressGesture___block_invoke;
    v5[3] = &unk_1E52EBCD8;
    v5[4] = self;
    [v4 clickDriver:self shouldBegin:v5];
  }
}

- (void)_gestureRecognizerFailed:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIPressClickInteractionDriver *)self pressGR];

  if (v5 == v4)
  {
    id v6 = [(_UIPressClickInteractionDriver *)self delegate];
    [v6 clickDriver:self didPerformEvent:3];
  }
}

- (_UIClickInteractionDriverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIClickInteractionDriverDelegate *)WeakRetained;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (double)allowableMovement
{
  return self->_allowableMovement;
}

- (BOOL)cancelsTouchesInView
{
  return self->_cancelsTouchesInView;
}

- (void)setCancelsTouchesInView:(BOOL)a3
{
  self->_cancelsTouchesInView = a3;
}

@end