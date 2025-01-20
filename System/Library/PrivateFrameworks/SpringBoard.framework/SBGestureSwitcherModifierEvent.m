@interface SBGestureSwitcherModifierEvent
- (BOOL)isCanceled;
- (BOOL)isGestureEvent;
- (BOOL)isMouseEvent;
- (BOOL)isPointerTouch;
- (CGPoint)averageTouchVelocityOverTimeDuration:(double)a3;
- (CGPoint)locationInContainerView;
- (CGPoint)translationInContainerView;
- (CGPoint)velocityInContainerView;
- (NSUUID)gestureID;
- (SBAppLayout)selectedAppLayout;
- (SBGestureRecognizerTouchHistoryProviding)touchHistoryProvider;
- (SBGestureSwitcherModifierEvent)initWithGestureID:(id)a3 selectedAppLayout:(id)a4 gestureType:(int64_t)a5 phase:(unint64_t)a6;
- (double)averageTouchPathAngleOverTimeDuration:(double)a3;
- (double)hysteresis;
- (double)lastTouchTimestamp;
- (double)peakSpeed;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)gestureType;
- (int64_t)touchType;
- (int64_t)type;
- (unint64_t)hidEventSenderID;
- (unint64_t)phase;
- (void)setCanceled:(BOOL)a3;
- (void)setHidEventSenderID:(unint64_t)a3;
- (void)setHysteresis:(double)a3;
- (void)setLastTouchTimestamp:(double)a3;
- (void)setLocationInContainerView:(CGPoint)a3;
- (void)setMouseEvent:(BOOL)a3;
- (void)setPhase:(unint64_t)a3;
- (void)setPointerTouch:(BOOL)a3;
- (void)setTouchHistoryProvider:(id)a3;
- (void)setTouchType:(int64_t)a3;
- (void)setTranslationInContainerView:(CGPoint)a3;
- (void)setVelocityInContainerView:(CGPoint)a3;
@end

@implementation SBGestureSwitcherModifierEvent

- (SBGestureSwitcherModifierEvent)initWithGestureID:(id)a3 selectedAppLayout:(id)a4 gestureType:(int64_t)a5 phase:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBGestureSwitcherModifierEvent;
  v13 = [(SBGestureSwitcherModifierEvent *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_gestureID, a3);
    objc_storeStrong((id *)&v14->_selectedAppLayout, a4);
    v14->_gestureType = a5;
    v14->_phase = a6;
    v14->_touchType = 0;
    v14->_mouseEvent = 0;
    v14->_pointerTouch = 0;
  }

  return v14;
}

- (int64_t)type
{
  return 2;
}

- (BOOL)isGestureEvent
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBGestureSwitcherModifierEvent;
  v4 = [(SBChainableModifierEvent *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSUUID *)self->_gestureID copy];
  v6 = (void *)*((void *)v4 + 4);
  *((void *)v4 + 4) = v5;

  uint64_t v7 = [(SBAppLayout *)self->_selectedAppLayout copy];
  v8 = (void *)*((void *)v4 + 5);
  *((void *)v4 + 5) = v7;

  *((void *)v4 + 6) = self->_gestureType;
  *((void *)v4 + 7) = self->_phase;
  *((void *)v4 + 8) = self->_touchType;
  v4[25] = self->_mouseEvent;
  v4[24] = self->_pointerTouch;
  v4[26] = self->_canceled;
  *((void *)v4 + 9) = *(void *)&self->_lastTouchTimestamp;
  *(CGPoint *)(v4 + 104) = self->_locationInContainerView;
  *(CGPoint *)(v4 + 120) = self->_translationInContainerView;
  *(CGPoint *)(v4 + 136) = self->_velocityInContainerView;
  *((void *)v4 + 10) = *(void *)&self->_hysteresis;
  objc_storeStrong((id *)v4 + 12, self->_touchHistoryProvider);
  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBGestureSwitcherModifierEvent;
  v4 = [(SBSwitcherModifierEvent *)&v12 descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v5 = [(NSUUID *)self->_gestureID UUIDString];
  [v4 appendString:v5 withName:@"gestureID"];

  unint64_t v6 = self->_phase - 1;
  if (v6 > 2) {
    uint64_t v7 = @"Possible";
  }
  else {
    uint64_t v7 = off_1E6B0A6E0[v6];
  }
  [v4 appendString:v7 withName:@"phase"];
  v8 = SBStringForFluidSwitcherGestureType(self->_gestureType);
  [v4 appendString:v8 withName:@"gestureType"];

  v9 = [(SBAppLayout *)self->_selectedAppLayout succinctDescription];
  id v10 = (id)[v4 appendObject:v9 withName:@"selectedAppLayout"];

  return v4;
}

- (CGPoint)averageTouchVelocityOverTimeDuration:(double)a3
{
  [(SBGestureRecognizerTouchHistoryProviding *)self->_touchHistoryProvider averageTouchVelocityOverTimeDuration:a3];
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)averageTouchPathAngleOverTimeDuration:(double)a3
{
  [(SBGestureRecognizerTouchHistoryProviding *)self->_touchHistoryProvider averageTouchPathAngleOverTimeDuration:a3];
  return result;
}

- (double)peakSpeed
{
  [(SBGestureRecognizerTouchHistoryProviding *)self->_touchHistoryProvider peakSpeed];
  return result;
}

- (NSUUID)gestureID
{
  return self->_gestureID;
}

- (SBAppLayout)selectedAppLayout
{
  return self->_selectedAppLayout;
}

- (int64_t)gestureType
{
  return self->_gestureType;
}

- (unint64_t)phase
{
  return self->_phase;
}

- (void)setPhase:(unint64_t)a3
{
  self->_phase = a3;
}

- (int64_t)touchType
{
  return self->_touchType;
}

- (void)setTouchType:(int64_t)a3
{
  self->_touchType = a3;
}

- (BOOL)isPointerTouch
{
  return self->_pointerTouch;
}

- (void)setPointerTouch:(BOOL)a3
{
  self->_pointerTouch = a3;
}

- (BOOL)isMouseEvent
{
  return self->_mouseEvent;
}

- (void)setMouseEvent:(BOOL)a3
{
  self->_mouseEvent = a3;
}

- (BOOL)isCanceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (double)lastTouchTimestamp
{
  return self->_lastTouchTimestamp;
}

- (void)setLastTouchTimestamp:(double)a3
{
  self->_lastTouchTimestamp = a3;
}

- (CGPoint)locationInContainerView
{
  double x = self->_locationInContainerView.x;
  double y = self->_locationInContainerView.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLocationInContainerView:(CGPoint)a3
{
  self->_locationInContainerView = a3;
}

- (CGPoint)translationInContainerView
{
  double x = self->_translationInContainerView.x;
  double y = self->_translationInContainerView.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTranslationInContainerView:(CGPoint)a3
{
  self->_translationInContainerView = a3;
}

- (CGPoint)velocityInContainerView
{
  double x = self->_velocityInContainerView.x;
  double y = self->_velocityInContainerView.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setVelocityInContainerView:(CGPoint)a3
{
  self->_velocityInContainerView = a3;
}

- (double)hysteresis
{
  return self->_hysteresis;
}

- (void)setHysteresis:(double)a3
{
  self->_hysteresis = a3;
}

- (unint64_t)hidEventSenderID
{
  return self->_hidEventSenderID;
}

- (void)setHidEventSenderID:(unint64_t)a3
{
  self->_hidEventSenderID = a3;
}

- (SBGestureRecognizerTouchHistoryProviding)touchHistoryProvider
{
  return self->_touchHistoryProvider;
}

- (void)setTouchHistoryProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchHistoryProvider, 0);
  objc_storeStrong((id *)&self->_selectedAppLayout, 0);
  objc_storeStrong((id *)&self->_gestureID, 0);
}

@end