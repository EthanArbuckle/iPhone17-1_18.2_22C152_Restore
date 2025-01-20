@interface _UIGestureStudyClickInteraction
- (BOOL)usesForce;
- (CGPoint)locationInCoordinateSpace:(id)a3;
- (CGPoint)originalCentroid;
- (NSString)description;
- (NSString)eventName;
- (SEL)action;
- (UIView)view;
- (_UIClickInteractionDriving)driver;
- (_UIGestureStudyClickInteraction)initWithTarget:(id)a3 action:(SEL)a4 useForce:(BOOL)a5;
- (double)duration;
- (double)movement;
- (double)startTimestamp;
- (id)target;
- (void)clickDriver:(id)a3 didPerformEvent:(unint64_t)a4;
- (void)clickDriver:(id)a3 shouldBegin:(id)a4;
- (void)didMoveToView:(id)a3;
- (void)setAction:(SEL)a3;
- (void)setDriver:(id)a3;
- (void)setOriginalCentroid:(CGPoint)a3;
- (void)setStartTimestamp:(double)a3;
- (void)setTarget:(id)a3;
- (void)setUsesForce:(BOOL)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation _UIGestureStudyClickInteraction

- (_UIGestureStudyClickInteraction)initWithTarget:(id)a3 action:(SEL)a4 useForce:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UIGestureStudyClickInteraction;
  v9 = [(_UIGestureStudyClickInteraction *)&v17 init];
  v10 = v9;
  if (v9)
  {
    [(_UIGestureStudyClickInteraction *)v9 setTarget:v8];
    [(_UIGestureStudyClickInteraction *)v10 setAction:a4];
    [(_UIGestureStudyClickInteraction *)v10 setUsesForce:v5];
    objc_opt_class();
    v11 = objc_opt_new();
    [(_UIGestureStudyClickInteraction *)v10 setDriver:v11];

    v12 = [(_UIGestureStudyClickInteraction *)v10 driver];
    [v12 setDelegate:v10];

    v13 = [(_UIGestureStudyClickInteraction *)v10 driver];
    double v14 = _UIClickPresentationAllowableMovementForDriver(v13, 0);
    v15 = [(_UIGestureStudyClickInteraction *)v10 driver];
    [v15 setAllowableMovement:v14];

    [(_UIGestureStudyClickInteraction *)v10 setStartTimestamp:978307200.0];
    -[_UIGestureStudyClickInteraction setOriginalCentroid:](v10, "setOriginalCentroid:", 1.79769313e308, 1.79769313e308);
  }

  return v10;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(_UIGestureStudyClickInteraction *)self usesForce];
  BOOL v5 = NSStringFromBOOL();
  v6 = [v3 stringWithFormat:@"<%@: %p usesForce = %@>", v4, self, v5];;

  return (NSString *)v6;
}

- (void)willMoveToView:(id)a3
{
  id v3 = [(_UIGestureStudyClickInteraction *)self driver];
  [v3 setView:0];
}

- (void)didMoveToView:(id)a3
{
  p_view = &self->_view;
  id v5 = objc_storeWeak((id *)&self->_view, a3);
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)p_view);
    v7 = [(_UIGestureStudyClickInteraction *)self driver];
    [v7 setView:WeakRetained];
  }
}

- (void)clickDriver:(id)a3 shouldBegin:(id)a4
{
}

- (void)clickDriver:(id)a3 didPerformEvent:(unint64_t)a4
{
  id v6 = a3;
  id v10 = v6;
  switch(a4)
  {
    case 0uLL:
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      -[_UIGestureStudyClickInteraction setStartTimestamp:](self, "setStartTimestamp:");
      v7 = [(_UIGestureStudyClickInteraction *)self view];
      [(_UIGestureStudyClickInteraction *)self locationInCoordinateSpace:v7];
      -[_UIGestureStudyClickInteraction setOriginalCentroid:](self, "setOriginalCentroid:");
      goto LABEL_9;
    case 1uLL:
      int v8 = 1;
      goto LABEL_7;
    case 2uLL:
      v7 = [(_UIGestureStudyClickInteraction *)self target];
      v9 = [(_UIGestureStudyClickInteraction *)self action];
      if (dyld_program_sdk_at_least()) {
        objc_msgSend(v7, v9, self);
      }
      else {
        objc_msgSend(v7, sel_performSelector_withObject_, v9, self);
      }
LABEL_9:

      goto LABEL_10;
    case 3uLL:
      [(_UIGestureStudyClickInteraction *)self setStartTimestamp:978307200.0];
      -[_UIGestureStudyClickInteraction setOriginalCentroid:](self, "setOriginalCentroid:", 1.79769313e308, 1.79769313e308);
      id v6 = v10;
      int v8 = 0;
LABEL_7:
      objc_msgSend(v10, "setAllowableMovement:", _UIClickPresentationAllowableMovementForDriver(v6, v8));
LABEL_10:
      id v6 = v10;
      break;
    default:
      break;
  }
}

- (NSString)eventName
{
  if ([(_UIGestureStudyClickInteraction *)self usesForce]) {
    v2 = @"EventTypeForcePress";
  }
  else {
    v2 = @"EventTypeLongPress";
  }
  return (NSString *)v2;
}

- (CGPoint)locationInCoordinateSpace:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIGestureStudyClickInteraction *)self driver];
  [v5 locationInCoordinateSpace:v4];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (double)duration
{
  [(_UIGestureStudyClickInteraction *)self startTimestamp];
  double v4 = v3;
  double result = 0.0;
  if (v4 < 978307200.0)
  {
    objc_msgSend(MEMORY[0x1E4F1C9C8], "timeIntervalSinceReferenceDate", 0.0);
    double v7 = v6;
    [(_UIGestureStudyClickInteraction *)self startTimestamp];
    return v7 - v8;
  }
  return result;
}

- (double)movement
{
  [(_UIGestureStudyClickInteraction *)self originalCentroid];
  if (v4 == 1.79769313e308 && v3 == 1.79769313e308) {
    return 0.0;
  }
  double v6 = [(_UIGestureStudyClickInteraction *)self view];
  [(_UIGestureStudyClickInteraction *)self locationInCoordinateSpace:v6];
  double v8 = v7;
  double v10 = v9;

  [(_UIGestureStudyClickInteraction *)self originalCentroid];
  return sqrt((v11 - v8) * (v11 - v8) + (v12 - v10) * (v12 - v10));
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (_UIClickInteractionDriving)driver
{
  return self->_driver;
}

- (void)setDriver:(id)a3
{
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  return WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (SEL)action
{
  return self->_action;
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (BOOL)usesForce
{
  return self->_usesForce;
}

- (void)setUsesForce:(BOOL)a3
{
  self->_usesForce = a3;
}

- (double)startTimestamp
{
  return self->_startTimestamp;
}

- (void)setStartTimestamp:(double)a3
{
  self->_startTimestamp = a3;
}

- (CGPoint)originalCentroid
{
  double x = self->_originalCentroid.x;
  double y = self->_originalCentroid.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOriginalCentroid:(CGPoint)a3
{
  self->_originalCentroid = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_driver, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end