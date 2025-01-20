@interface UIKeyboardTouchInfo
- (BOOL)delayed;
- (BOOL)didPlayKeyFeedback;
- (BOOL)dragged;
- (BOOL)maySuppressUpAction;
- (CGPoint)initialDragPoint;
- (CGPoint)initialPoint;
- (NSMutableArray)touchHistory;
- (UIKBTouchState)touch;
- (UIKBTree)key;
- (UIKBTree)keyplane;
- (UIKBTree)slidOffKey;
- (UIKeyboardTouchInfo)init;
- (int)fingerID;
- (int)initialKeyState;
- (int)stage;
- (int64_t)continuousPathState;
- (unint64_t)processedTouchCount;
- (void)addTouch:(id)a3;
- (void)setContinuousPathState:(int64_t)a3;
- (void)setDelayed:(BOOL)a3;
- (void)setDidPlayKeyFeedback:(BOOL)a3;
- (void)setDragged:(BOOL)a3;
- (void)setFingerID:(int)a3;
- (void)setInitialDragPoint:(CGPoint)a3;
- (void)setInitialKeyState:(int)a3;
- (void)setInitialPoint:(CGPoint)a3;
- (void)setKey:(id)a3;
- (void)setKeyplane:(id)a3;
- (void)setMaySuppressUpAction:(BOOL)a3;
- (void)setProcessedTouchCount:(unint64_t)a3;
- (void)setSlidOffKey:(id)a3;
- (void)setStage:(int)a3;
@end

@implementation UIKeyboardTouchInfo

- (UIKeyboardTouchInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardTouchInfo;
  v2 = [(UIKeyboardTouchInfo *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    touchHistory = v2->_touchHistory;
    v2->_touchHistory = v3;

    v2->_processedTouchCount = 0;
  }
  return v2;
}

- (UIKBTouchState)touch
{
  return (UIKBTouchState *)[(NSMutableArray *)self->_touchHistory lastObject];
}

- (void)addTouch:(id)a3
{
}

- (NSMutableArray)touchHistory
{
  return self->_touchHistory;
}

- (UIKBTree)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (UIKBTree)keyplane
{
  return self->_keyplane;
}

- (void)setKeyplane:(id)a3
{
}

- (UIKBTree)slidOffKey
{
  return self->_slidOffKey;
}

- (void)setSlidOffKey:(id)a3
{
}

- (CGPoint)initialPoint
{
  double x = self->_initialPoint.x;
  double y = self->_initialPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialPoint:(CGPoint)a3
{
  self->_initialPoint = a3;
}

- (int)stage
{
  return self->_stage;
}

- (void)setStage:(int)a3
{
  self->_stage = a3;
}

- (CGPoint)initialDragPoint
{
  double x = self->_initialDragPoint.x;
  double y = self->_initialDragPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialDragPoint:(CGPoint)a3
{
  self->_initialDragPoint = a3;
}

- (BOOL)dragged
{
  return self->_dragged;
}

- (void)setDragged:(BOOL)a3
{
  self->_dragged = a3;
}

- (BOOL)maySuppressUpAction
{
  return self->_maySuppressUpAction;
}

- (void)setMaySuppressUpAction:(BOOL)a3
{
  self->_maySuppressUpAction = a3;
}

- (BOOL)delayed
{
  return self->_delayed;
}

- (void)setDelayed:(BOOL)a3
{
  self->_delayed = a3;
}

- (int)initialKeyState
{
  return self->_initialKeyState;
}

- (void)setInitialKeyState:(int)a3
{
  self->_initialKeyState = a3;
}

- (int)fingerID
{
  return self->_fingerID;
}

- (void)setFingerID:(int)a3
{
  self->_fingerID = a3;
}

- (int64_t)continuousPathState
{
  return self->_continuousPathState;
}

- (void)setContinuousPathState:(int64_t)a3
{
  self->_continuousPathState = a3;
}

- (unint64_t)processedTouchCount
{
  return self->_processedTouchCount;
}

- (void)setProcessedTouchCount:(unint64_t)a3
{
  self->_processedTouchCount = a3;
}

- (BOOL)didPlayKeyFeedback
{
  return self->_didPlayKeyFeedback;
}

- (void)setDidPlayKeyFeedback:(BOOL)a3
{
  self->_didPlayKeyFeedback = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slidOffKey, 0);
  objc_storeStrong((id *)&self->_keyplane, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_touchHistory, 0);
}

@end