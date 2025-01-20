@interface RCPSyntheticEventStream
+ (id)eventStreamWithCLIArguments:(id)a3;
+ (id)eventStreamWithEventActions:(id)a3;
- ($47924B278A36D4A2860F70134BF18786)activePoints;
- (BOOL)_isEdgePoint:(CGPoint)a3 getMask:(unsigned int *)a4;
- (BOOL)scalePointerPhaseScrollToPixels;
- (CAMediaTimingFunction)pointerCurveFunction;
- (CAMediaTimingFunction)touchCurveFunction;
- (CGPoint)_normalizePoint:(CGPoint)a3;
- (CGSize)gsScreenPointSize;
- (CGSize)screenSize;
- (RCPEventSenderProperties)senderProperties;
- (RCPPointerTrackingChildEventStream)pointerChildEventStream;
- (RCPSyntheticEventStream)init;
- (__IOHIDEvent)_createIOHIDGameControllerEventForDpadButton:(int64_t)a3;
- (__IOHIDEvent)_createIOHIDWithEventType:(int64_t)a3;
- (__IOHIDEvent)_createIOSButtonHIDEventWithButtonType:(int64_t)a3 down:(BOOL)a4;
- (__IOHIDEvent)_createIOSButtonHIDEventWithPage:(unsigned int)a3 usage:(unsigned int)a4 down:(BOOL)a5;
- (__IOHIDEvent)_parentZeroPointerEvent;
- (double)_nextPointerDeltaFrom:(uint64_t)a3 to:(double)a4 step:(double)a5 steps:(double)a6;
- (double)_nextTouchLocationFrom:(double)a3 to:(double)a4 at:(double)a5;
- (double)defaultPressure;
- (double)defaultRadius;
- (double)gsScreenScaleFactor;
- (double)pointerFrequency;
- (double)touchMoveInterval;
- (id)_splitStringIntoArrayOfCharacters:(id)a3;
- (int64_t)touchFrequency;
- (unint64_t)_currentMachTime;
- (unint64_t)activePointCount;
- (unsigned)transducerType;
- (void)_addIOHIDEventToProcessingBuffer:(__IOHIDEvent *)a3;
- (void)_delayBetweenMove:(int)a3 elapsedTime:(double)a4;
- (void)_dragWithStartPoint:(CGPoint)a3 mask:(unint64_t)a4 endPoint:(CGPoint)a5 mask:(unint64_t)a6 duration:(double)a7 tapAndWait:(double)a8 lift:(BOOL)a9 pressure:(double)a10 radius:(double)a11;
- (void)_finalizeHomeButtonEvents;
- (void)_finalizePointerButtonMasks;
- (void)_finalizeProcessingEventBuffer;
- (void)_flickWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 pressure:(double)a6 radius:(double)a7;
- (void)_hoverAtPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 pressure:(double)a5 radius:(double)a6 edgeMaskOptions:(id *)a7 withEventType:(int64_t)a8 withZPosition:(double)a9 withAzimuthAngle:(double)a10 withRollAngle:(double)a11 withAltitudeAngle:(double)a12;
- (void)_initScreenProperties;
- (void)_initScreenPropertiesForScreen:(id)a3;
- (void)_knobEventForOffset:(CGVector)a3 buttonMask:(unsigned int)a4 oldButtonMask:(unsigned int)a5;
- (void)_moveLastTouchPoint:(CGPoint)a3 eventMask:(unint64_t)a4;
- (void)_pressButtonEventForIndex:(int64_t)a3 down:(BOOL)a4;
- (void)_setMajorRadiusForAllPoints:(double)a3;
- (void)_setPressureForAllPoints:(double)a3;
- (void)_squeezeWithPhase:(unsigned __int16)a3 withPage:(id)a4 withUsage:(id)a5 withVersion:(unsigned __int8)a6 withStage:(unsigned int)a7 withTransition:(unsigned int)a8 withNextThreshold:(double)a9 withPressedThreshold:(double)a10 withReleasedThreshold:(double)a11 withNormalizedForce:(double)a12 withNormalizedForceVelocity:(double)a13;
- (void)_tap:(CGPoint)a3 withPressure:(double)a4;
- (void)_touchDownAtPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 pressure:(double)a5 radius:(double)a6 edgeMaskOptions:(id *)a7;
- (void)_touchSensitiveButtonEventWithPhase:(unsigned __int16)a3 withPage:(id)a4 withUsage:(id)a5 withStage:(unsigned int)a6 withTransition:(unsigned int)a7 withNormalizedForce:(double)a8 withNormalizedForceVelocity:(double)a9 withNormalizedPositionX:(double)a10 withNormalizedPositionDeltaX:(double)a11 withNormalizedPositionY:(double)a12 withNormalizedPositionDeltaY:(double)a13 withMajorRadius:(double)a14 withMinorRadius:(double)a15 withMask:(unsigned int)a16 withTouch:(int)a17 withNextThreshold:(double)a18 withPressedThreshold:(double)a19 withReleasedThreshold:(double)a20;
- (void)_updateTouchPoints:(CGPoint *)a3 count:(unint64_t)a4;
- (void)_withPointerEventStreamAtFrequency:(int64_t)a3 perform:(id)a4;
- (void)_wrapInPointerParentAndAddToProcessingBuffer:(__IOHIDEvent *)a3;
- (void)advanceTime:(double)a3;
- (void)barrelRollAtLocation:(CGPoint)a3 withZPosition:(double)a4 withAltitudeAngle:(double)a5 withAzimuthAngle:(double)a6 withRollAngle:(double)a7;
- (void)beginButtonPressForButtonType:(int64_t)a3;
- (void)beginButtonPressWithPage:(unint64_t)a3 usage:(unint64_t)a4;
- (void)composeDockGestureInMotion:(unsigned __int16)a3 frequency:(unint64_t)a4 actionBlock:(id)a5;
- (void)composeDockGestureOfFlavor:(unsigned __int16)a3 motion:(unsigned __int16)a4 frequency:(unint64_t)a5 actionBlock:(id)a6;
- (void)composeNavigationGestureInMotion:(unsigned __int16)a3 frequency:(unint64_t)a4 actionBlock:(id)a5;
- (void)composeWithSender:(id)a3 actionBlock:(id)a4;
- (void)dealloc;
- (void)doubleFingerTap:(CGPoint)a3;
- (void)doubleTap:(CGPoint)a3;
- (void)dragWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5;
- (void)dragWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 pressure:(double)a6;
- (void)dragWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 pressure:(double)a6 radius:(double)a7;
- (void)dragWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 radius:(double)a6;
- (void)dragWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 tapAndWait:(double)a6 lift:(BOOL)a7;
- (void)dragWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 tapAndWait:(double)a6 lift:(BOOL)a7 pressure:(double)a8;
- (void)dragWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 tapAndWait:(double)a6 lift:(BOOL)a7 pressure:(double)a8 radius:(double)a9;
- (void)dragWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 tapAndWait:(double)a6 lift:(BOOL)a7 radius:(double)a8;
- (void)dragWithStartPoint:(CGPoint)a3 mask:(unint64_t)a4 endPoint:(CGPoint)a5 mask:(unint64_t)a6 duration:(double)a7;
- (void)edgeOrb:(CGPoint)a3;
- (void)edgeOrbSwipe:(CGPoint)a3 withEndLocation:(CGPoint)a4 withDuration:(double)a5;
- (void)endButtonPressForButtonType:(int64_t)a3;
- (void)endButtonPressWithPage:(unint64_t)a3 usage:(unint64_t)a4;
- (void)flipRingerSwitchToValue:(BOOL)a3;
- (void)hover:(CGPoint)a3 withZPosition:(double)a4;
- (void)hover:(CGPoint)a3 withZPosition:(double)a4 withAltitudeAngle:(double)a5 withAzimuthAngle:(double)a6 withRollAngle:(double)a7;
- (void)hoverAtLocation:(CGPoint)a3 withDuration:(double)a4;
- (void)hoverAtLocation:(CGPoint)a3 withDuration:(double)a4 withZPosition:(double)a5;
- (void)hoverAtLocation:(CGPoint)a3 withDuration:(double)a4 withZPosition:(double)a5 withAltitudeAngle:(double)a6 withAzimuthAngle:(double)a7 withRollAngle:(double)a8;
- (void)hoverToTap:(CGPoint)a3 withZPosition:(double)a4;
- (void)hoverToTapAtLocation:(CGPoint)a3 withDuration:(double)a4;
- (void)hoverToTapAtLocation:(CGPoint)a3 withDuration:(double)a4 withZPosition:(double)a5;
- (void)knobNudge:(CGVector)a3 buttonMask:(unsigned int)a4 duration:(double)a5;
- (void)liftUp:(CGPoint)a3;
- (void)liftUp:(CGPoint)a3 touchCount:(unint64_t)a4;
- (void)liftUpActivePointsByIndex:(id)a3;
- (void)liftUpAtAllActivePoints;
- (void)liftUpAtAllActivePointsWithEventType:(int64_t)a3;
- (void)liftUpAtPoints:(CGPoint *)a3 touchCount:(unint64_t)a4;
- (void)moveToPoint:(CGPoint)a3 duration:(double)a4;
- (void)moveToPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 duration:(double)a5;
- (void)moveToPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 pressure:(double)a5 duration:(double)a6;
- (void)moveToPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 pressure:(double)a5 duration:(double)a6 radius:(double)a7;
- (void)multifingerDragWithPointArray:(CGPoint *)a3 numPoints:(unint64_t)a4 duration:(double)a5 numFingers:(unint64_t)a6;
- (void)peekAndPop:(CGPoint)a3 commit:(BOOL)a4 duration:(double)a5;
- (void)peekAndPop:(CGPoint)a3 commit:(BOOL)a4 duration:(double)a5 pressure:(double)a6 radius:(double)a7;
- (void)peekAndPop:(CGPoint)a3 commit:(BOOL)a4 duration:(double)a5 presure:(double)a6;
- (void)peekAndPop:(CGPoint)a3 commit:(BOOL)a4 duration:(double)a5 radius:(double)a6;
- (void)pinchCloseWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5;
- (void)pinchCloseWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 pressure:(double)a6;
- (void)pinchCloseWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 pressure:(double)a6 radius:(double)a7;
- (void)pinchCloseWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 radius:(double)a6;
- (void)pinchOpenWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5;
- (void)pinchOpenWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 pressure:(double)a6;
- (void)pinchOpenWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 pressure:(double)a6 radius:(double)a7;
- (void)pinchOpenWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 radius:(double)a6;
- (void)pointerBeginPressingButton:(int64_t)a3;
- (void)pointerDiscreteGesture:(id)a3 duration:(double)a4 frequency:(int64_t)a5;
- (void)pointerDiscreteScroll:(CGPoint)a3 duration:(double)a4;
- (void)pointerDiscreteScroll:(CGPoint)a3 duration:(double)a4 frequency:(int64_t)a5;
- (void)pointerEndPressingButton:(int64_t)a3;
- (void)pointerMoveByDelta:(CGVector)a3 duration:(double)a4;
- (void)pointerMoveDelta:(CGPoint)a3 duration:(double)a4 frequency:(int64_t)a5;
- (void)pointerMoveFromOriginPoint:(CGPoint)a3 toDestinationPoint:(CGPoint)a4 duration:(double)a5 frequency:(int64_t)a6;
- (void)pointerMoveToPoint:(CGPoint)a3 duration:(double)a4;
- (void)pointerPhasedFlick:(CGPoint)a3 duration:(double)a4;
- (void)pointerPhasedFlick:(CGPoint)a3 duration:(double)a4 frequency:(int64_t)a5;
- (void)pointerPhasedScroll:(CGPoint)a3 duration:(double)a4;
- (void)pointerPhasedScroll:(CGPoint)a3 duration:(double)a4 frequency:(int64_t)a5;
- (void)pointerRotation:(double)a3 duration:(double)a4 frequency:(int64_t)a5;
- (void)pointerScale:(double)a3 duration:(double)a4 frequency:(int64_t)a5;
- (void)pointerSetAbsolutePosition:(CGPoint)a3;
- (void)pointerTranslatation:(CGPoint)a3 duration:(double)a4 frequency:(int64_t)a5;
- (void)pressButtons:(id)a3 duration:(double)a4;
- (void)pressButtonsWithPages:(id)a3 usages:(id)a4 duration:(double)a5;
- (void)pressDiscreteGameControllerButton:(int64_t)a3 duration:(double)a4;
- (void)rotate:(CGPoint)a3 withRadius:(double)a4 rotation:(double)a5 duration:(double)a6 touchCount:(unint64_t)a7;
- (void)rotateCrown:(double)a3 direction:(int64_t)a4 duration:(double)a5;
- (void)sendFlickWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5;
- (void)sendFlickWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 pressure:(double)a6;
- (void)sendFlickWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 radius:(double)a6;
- (void)sendUnicodeString:(id)a3;
- (void)sendUnicodeString:(id)a3 synthesizePerCharacterEvents:(BOOL)a4 durationBetweenEvents:(double)a5;
- (void)sendUnicodeStringByCharacters:(id)a3 durationBetweenEvents:(double)a4;
- (void)setActivePointCount:(unint64_t)a3;
- (void)setGsScreenPointSize:(CGSize)a3;
- (void)setGsScreenScaleFactor:(double)a3;
- (void)setPointerChildEventStream:(id)a3;
- (void)setPointerCurveFunction:(id)a3;
- (void)setPointerFrequency:(double)a3;
- (void)setScalePointerPhaseScrollToPixels:(BOOL)a3;
- (void)setSenderProperties:(id)a3;
- (void)setTouchCurveFunction:(id)a3;
- (void)setTouchFrequency:(int64_t)a3;
- (void)setTransducerType:(unsigned int)a3;
- (void)squeeze;
- (void)squeezeAtLocation:(CGPoint)a3;
- (void)stylusBarrelDoubleTap;
- (void)tap:(CGPoint)a3;
- (void)tap:(CGPoint)a3 pressure:(double)a4;
- (void)tap:(CGPoint)a3 radius:(double)a4;
- (void)tap:(CGPoint)a3 withPressure:(double)a4 radius:(double)a5;
- (void)tapToWakeAtPoint:(CGPoint)a3;
- (void)taps:(unint64_t)a3 location:(CGPoint)a4 withNumberOfTouches:(unint64_t)a5;
- (void)taps:(unint64_t)a3 location:(CGPoint)a4 withNumberOfTouches:(unint64_t)a5 pressure:(double)a6 radius:(double)a7;
- (void)tapsNoLift:(unint64_t)a3 location:(CGPoint)a4 withNumberOfTouches:(unint64_t)a5;
- (void)touchDown:(CGPoint)a3;
- (void)touchDown:(CGPoint)a3 touchCount:(unint64_t)a4;
- (void)touchDown:(CGPoint)a3 touchCount:(unint64_t)a4 pressure:(double)a5;
- (void)touchDown:(CGPoint)a3 touchCount:(unint64_t)a4 pressure:(double)a5 radius:(double)a6;
- (void)touchDown:(CGPoint)a3 touchCount:(unint64_t)a4 radius:(double)a5;
- (void)touchDownAtPoints:(CGPoint *)a3 touchCount:(unint64_t)a4;
- (void)touchDownAtPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 pressure:(double)a5;
- (void)touchDownAtPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 pressure:(double)a5 radius:(double)a6;
- (void)touchDownAtPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 radius:(double)a5;
- (void)touchSensitiveButtonClickWithPage:(id)a3 withUsage:(id)a4 withTouch:(int)a5 withNormalizedPositionY:(double)a6 withNormalizedPositionDeltaY:(double)a7;
- (void)touchSensitiveButtonEngagedWithDuration:(double)a3 withPage:(id)a4 withUsage:(id)a5 withTouch:(int)a6 withNormalizedPositionY:(double)a7 withNormalizedPositionDeltaY:(double)a8;
- (void)touchSensitiveButtonEngagedWithLiftWithDuration:(double)a3 withPage:(id)a4 withUsage:(id)a5 withTouch:(int)a6 withNormalizedPositionY:(double)a7 withNormalizedPositionDeltaY:(double)a8;
- (void)touchSensitiveButtonEngagedWithPage:(id)a3 withUsage:(id)a4 withTouch:(int)a5 withNormalizedPositionY:(double)a6 withNormalizedPositionDeltaY:(double)a7;
- (void)touchSensitiveButtonHoldWithDuration:(double)a3 withPage:(id)a4 withUsage:(id)a5 withTouch:(int)a6 withNormalizedPositionY:(double)a7 withNormalizedPositionDeltaY:(double)a8;
- (void)touchSensitiveButtonHoldWithPage:(id)a3 withUsage:(id)a4 withTouch:(int)a5 withNormalizedPositionY:(double)a6 withNormalizedPositionDeltaY:(double)a7;
- (void)touchSensitiveButtonIntermediatePressWithDuration:(double)a3 withPage:(id)a4 withUsage:(id)a5 withTouch:(int)a6 withNormalizedPositionY:(double)a7 withNormalizedPositionDeltaY:(double)a8;
- (void)touchSensitiveButtonIntermediatePressWithPage:(id)a3 withUsage:(id)a4 withTouch:(int)a5 withNormalizedPositionY:(double)a6 withNormalizedPositionDeltaY:(double)a7;
- (void)touchSensitiveButtonLiftWithPage:(id)a3 withUsage:(id)a4;
- (void)touchSensitiveButtonReleaseHoldWithPage:(id)a3 withUsage:(id)a4 withTouch:(int)a5 withNormalizedPositionY:(double)a6 withNormalizedPositionDeltaY:(double)a7;
- (void)touchTapDown:(CGPoint)a3;
- (void)vendorEventWithPage:(id)a3 withUsage:(id)a4 withVersion:(unsigned __int8)a5;
- (void)vendorEventWithPage:(id)a3 withUsage:(id)a4 withVersion:(unsigned __int8)a5 withData:(id)a6;
- (void)withExclusiveChildStream:(id)a3 perform:(id)a4;
@end

@implementation RCPSyntheticEventStream

- (void)taps:(unint64_t)a3 location:(CGPoint)a4 withNumberOfTouches:(unint64_t)a5 pressure:(double)a6 radius:(double)a7
{
  if (a3)
  {
    double y = a4.y;
    double x = a4.x;
    for (unint64_t i = a3 - 1; ; --i)
    {
      -[RCPSyntheticEventStream touchDown:touchCount:pressure:radius:](self, "touchDown:touchCount:pressure:radius:", a5, x, y, a6, a7);
      [(RCPSyntheticEventStream *)self advanceTime:0.05];
      -[RCPSyntheticEventStream liftUp:touchCount:](self, "liftUp:touchCount:", a5, x, y);
      if (!i) {
        break;
      }
      [(RCPSyntheticEventStream *)self advanceTime:0.15];
    }
  }
}

- (void)touchDown:(CGPoint)a3 touchCount:(unint64_t)a4 pressure:(double)a5 radius:(double)a6
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v6 = (void *)MEMORY[0x1F4188790](self, a2, (__n128)a3, *(__n128 *)&a3.y, *(__n128 *)&a5, *(__n128 *)&a6);
  if (v7)
  {
    unint64_t v12 = 0;
    v13 = (double *)&v14[-2 * v7 + 1];
    do
    {
      *(v13 - 1) = v8 + (double)v12;
      double *v13 = v9 + (double)v12;
      v12 += 50;
      v13 += 2;
    }
    while (50 * v7 != v12);
  }
  objc_msgSend(v6, "_touchDownAtPoints:touchCount:pressure:radius:edgeMaskOptions:", v10, v11);
}

- (void)liftUp:(CGPoint)a3 touchCount:(unint64_t)a4
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (a4 >= 5) {
    unint64_t v4 = 5;
  }
  else {
    unint64_t v4 = a4;
  }
  if (v4)
  {
    v5 = (char *)&v7[1] - (16 * v4);
    unint64_t v6 = v4;
    do
    {
      *(CGPoint *)(v5 - 8) = a3;
      v5 += 16;
      --v6;
    }
    while (v6);
  }
  [(RCPSyntheticEventStream *)self liftUpAtPoints:a3.x touchCount:a3.y];
}

- (void)liftUpAtPoints:(CGPoint *)a3 touchCount:(unint64_t)a4
{
  unint64_t v7 = [(RCPSyntheticEventStream *)self activePointCount];
  unint64_t v8 = v7 - a4;
  if (a4)
  {
    unint64_t v9 = 80 * v7 - 80 * a4;
    do
    {
      double v10 = [(RCPSyntheticEventStream *)self activePoints];
      CGPoint v11 = *a3++;
      *(CGPoint *)((char *)&v10->var4 + v9) = v11;
      *(unsigned char *)([(RCPSyntheticEventStream *)self activePoints] + v9 + 72) = 0;
      v9 += 80;
      --a4;
    }
    while (a4);
  }
  unint64_t v12 = [(RCPSyntheticEventStream *)self _createIOHIDWithEventType:6];
  [(RCPSyntheticEventStream *)self _addIOHIDEventToProcessingBuffer:v12];
  CFRelease(v12);
  [(RCPSyntheticEventStream *)self setActivePointCount:v8];
}

- (void)advanceTime:(double)a3
{
  self->_currentTimeOffset = self->_currentTimeOffset + a3;
}

- (void)_touchDownAtPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 pressure:(double)a5 radius:(double)a6 edgeMaskOptions:(id *)a7
{
  if (a4)
  {
    unint64_t v11 = a4;
    do
    {
      unint64_t v13 = [(RCPSyntheticEventStream *)self activePointCount];
      double x = a3->x;
      double y = a3->y;
      *(CGPoint *)([(RCPSyntheticEventStream *)self activePoints] + 80 * v13 + 32) = *a3;
      *(double *)([(RCPSyntheticEventStream *)self activePoints] + 80 * v13 + 56) = a5;
      if (a7 && !a7->var1)
      {
        unsigned int var0 = a7->var0;
        *(_DWORD *)([(RCPSyntheticEventStream *)self activePoints] + 80 * v13 + 68) = var0;
      }
      else
      {
        -[RCPSyntheticEventStream _normalizePoint:](self, "_normalizePoint:", x, y);
        double v17 = v16;
        double v19 = v18;
        *(_DWORD *)([(RCPSyntheticEventStream *)self activePoints] + 80 * v13 + 68) = 0;
        -[RCPSyntheticEventStream _isEdgePoint:getMask:](self, "_isEdgePoint:getMask:", [(RCPSyntheticEventStream *)self activePoints] + 80 * v13 + 68, v17, v19);
      }
      uint64_t v21 = 5 * v13;
      *(unsigned char *)([(RCPSyntheticEventStream *)self activePoints] + 16 * v21 + 72) = 0;
      *(double *)([(RCPSyntheticEventStream *)self activePoints] + 16 * v21 + 48) = a6;
      [(RCPSyntheticEventStream *)self setActivePointCount:[(RCPSyntheticEventStream *)self activePointCount] + 1];
      ++a3;
      --v11;
    }
    while (v11);
  }
  v22 = -[RCPSyntheticEventStream _createIOHIDWithEventType:](self, "_createIOHIDWithEventType:", 1, a5, a6);
  [(RCPSyntheticEventStream *)self _addIOHIDEventToProcessingBuffer:v22];
  CFRelease(v22);
}

- (__IOHIDEvent)_createIOHIDWithEventType:(int64_t)a3
{
  v5 = [(RCPSyntheticEventStream *)self activePoints];
  double x = v5->var4.x;
  double y = v5->var4.y;
  [(RCPSyntheticEventStream *)self activePoints];
  -[RCPSyntheticEventStream _normalizePoint:](self, "_normalizePoint:", x, y);
  [(RCPSyntheticEventStream *)self activePoints];
  [(RCPSyntheticEventStream *)self activePoints];
  [(RCPSyntheticEventStream *)self activePoints];
  if ((unint64_t)(a3 - 1) > 0xB) {
    int v8 = 0;
  }
  else {
    int v8 = dword_1A9077D1C[a3 - 1];
  }
  if ([(RCPSyntheticEventStream *)self activePointCount])
  {
    unint64_t v9 = 0;
    uint64_t v10 = 68;
    do
    {
      v8 |= [(RCPSyntheticEventStream *)self activePoints][v10];
      ++v9;
      v10 += 80;
    }
    while (v9 < [(RCPSyntheticEventStream *)self activePointCount]);
  }
  [(RCPSyntheticEventStream *)self _currentMachTime];
  DigitizerEvent = (__IOHIDEvent *)IOHIDEventCreateDigitizerEvent();
  unint64_t v12 = [(RCPSyntheticEventStream *)self senderProperties];

  v31 = DigitizerEvent;
  if (v12)
  {
    unint64_t v13 = [(RCPSyntheticEventStream *)self senderProperties];
    v14 = [v13 properties];
    v15 = [v14 objectForKeyedSubscript:@"DisplayIntegrated"];
    [v15 BOOLValue];

    IOHIDEventSetIntegerValue();
    double v16 = [(RCPSyntheticEventStream *)self senderProperties];
    double v17 = [v16 properties];
    double v18 = [v17 objectForKeyedSubscript:@"Built-In"];
    [v18 BOOLValue];

    DigitizerEvent = v31;
  }
  else
  {
    IOHIDEventSetIntegerValue();
  }
  IOHIDEventSetIntegerValue();
  if ([(RCPSyntheticEventStream *)self activePointCount])
  {
    uint64_t v19 = 0;
    unint64_t v20 = 0;
    do
    {
      uint64_t v21 = [(RCPSyntheticEventStream *)self activePoints];
      v22 = v21;
      if (a3 == 1)
      {
        v23 = &v21[v19];
        if (v21[v19].var5 == 0.0)
        {
          [(RCPSyntheticEventStream *)self defaultRadius];
          v23->var5 = v24;
        }
        if (v23->var6 == 0.0)
        {
          [(RCPSyntheticEventStream *)self defaultPressure];
          v23->var6 = v25;
        }
        if (!v22[v19].var7) {
          v22[v19].var7 = 3;
        }
      }
      else
      {
        v26 = &v21[v19];
        if (!v21[v19].var9)
        {
          v26->var5 = 0.0;
          v26->var6 = 0.0;
          v26->var7 = 0;
        }
      }
      -[RCPSyntheticEventStream _normalizePoint:](self, "_normalizePoint:", v22[v19].var4.x, v22[v19].var4.y);
      if (self->_transducerType)
      {
        DigitizerFingerEvent = (const void *)IOHIDEventCreateDigitizerFingerEvent();
      }
      else
      {
        LODWORD(v30) = 64;
        DigitizerFingerEvent = (const void *)IOHIDEventCreateDigitizerStylusEventWithPolarOrientation();
        IOHIDEventSetFloatValue();
        IOHIDEventSetFloatValue();
        IOHIDEventSetFloatValue();
        DigitizerEvent = v31;
        IOHIDEventSetIntegerValue();
        ++self->_generationCount;
        IOHIDEventSetIntegerValue();
        IOHIDEventSetFloatValue();
        IOHIDEventSetFloatValue();
        IOHIDEventSetIntegerValue();
        IOHIDEventSetIntegerValue();
      }
      v28 = &v22[v19];
      IOHIDEventSetFloatValue();
      IOHIDEventAppendEvent();
      if (a3 == 1 && !v28->var9) {
        v28->var9 = 1;
      }
      CFRelease(DigitizerFingerEvent);
      ++v20;
      ++v19;
    }
    while (v20 < [(RCPSyntheticEventStream *)self activePointCount]);
  }
  return DigitizerEvent;
}

- ($47924B278A36D4A2860F70134BF18786)activePoints
{
  return self->_activePoints;
}

- (unint64_t)activePointCount
{
  return self->_activePointCount;
}

- (CGPoint)_normalizePoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(RCPSyntheticEventStream *)self gsScreenPointSize];
  [(RCPSyntheticEventStream *)self gsScreenPointSize];
  [(RCPSyntheticEventStream *)self gsScreenPointSize];
  if (v6 == 0.0 || ([(RCPSyntheticEventStream *)self gsScreenPointSize], v7 == 0.0))
  {
    double v17 = [NSString stringWithFormat:@"Normalization failed due to the screen width and height was unexpectedly 0 or NaN."];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[RCPSyntheticEventStream _normalizePoint:]((uint64_t)v17);
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    [(RCPSyntheticEventStream *)self gsScreenPointSize];
    double v9 = x / v8;
    [(RCPSyntheticEventStream *)self gsScreenPointSize];
    double v11 = y / v10;
    [(RCPSyntheticEventStream *)self gsScreenScaleFactor];
    double v13 = v9 * v12;
    [(RCPSyntheticEventStream *)self gsScreenScaleFactor];
    double v15 = v11 * v14;
    double v16 = v13;
  }
  result.double y = v15;
  result.double x = v16;
  return result;
}

- (CGSize)gsScreenPointSize
{
  double width = self->_gsScreenPointSize.width;
  double height = self->_gsScreenPointSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)gsScreenScaleFactor
{
  return self->_gsScreenScaleFactor;
}

- (RCPEventSenderProperties)senderProperties
{
  return self->_senderProperties;
}

- (void)_addIOHIDEventToProcessingBuffer:(__IOHIDEvent *)a3
{
  id v4 = +[RCPEvent eventWithHIDEvent:a3 deliveryTimeStamp:[(RCPSyntheticEventStream *)self _currentMachTime] senderProperties:self->_senderProperties preActions:0];
  [(NSMutableArray *)self->_processingEventBuffer addObject:v4];
}

- (RCPSyntheticEventStream)init
{
  v12.receiver = self;
  v12.super_class = (Class)RCPSyntheticEventStream;
  v2 = [(RCPEventStream *)&v12 init];
  v3 = v2;
  if (v2)
  {
    [(RCPSyntheticEventStream *)v2 _initScreenProperties];
    v3->_activePoints = ($47924B278A36D4A2860F70134BF18786 *)malloc_type_calloc(5uLL, 0x50uLL, 0x10000404A7914ACuLL);
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    processingEventBuffer = v3->_processingEventBuffer;
    v3->_processingEventBuffer = (NSMutableArray *)v4;

    v3->_transducerType = 2;
    v3->_scalePointerPhaseScrollToPixels = 0;
    [(RCPSyntheticEventStream *)v3 setActivePointCount:0];
    double v6 = [RCPPointerTrackingChildEventStream alloc];
    double v7 = -[RCPPointerTrackingChildEventStream initWithCurrentPointerLocation:](v6, "initWithCurrentPointerLocation:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    [(RCPSyntheticEventStream *)v3 setPointerChildEventStream:v7];

    [(RCPSyntheticEventStream *)v3 pointerFrequency];
    double v9 = v8;
    double v10 = [(RCPSyntheticEventStream *)v3 pointerChildEventStream];
    [v10 setFrequency:v9];
  }
  return v3;
}

- (void)setActivePointCount:(unint64_t)a3
{
  self->_activePointCount = a3;
}

- (void)setPointerChildEventStream:(id)a3
{
}

- (double)pointerFrequency
{
  return self->_pointerFrequency;
}

- (RCPPointerTrackingChildEventStream)pointerChildEventStream
{
  return self->_pointerChildEventStream;
}

- (BOOL)_isEdgePoint:(CGPoint)a3 getMask:(unsigned int *)a4
{
  if (self->_transducerType != 2) {
    goto LABEL_14;
  }
  if (a3.y >= 0.01) {
    int v5 = (a3.x < 0.01) << 27;
  }
  else {
    int v5 = ((a3.x < 0.01) << 27) | 0x2000000;
  }
  if (a3.x > 0.99) {
    v5 |= 0x4000000u;
  }
  int v6 = a3.y <= 0.99 ? v5 : v5 | 0x1000000;
  if (v6)
  {
    double v7 = [(RCPEventStream *)self environment];
    uint64_t v8 = [v7 homeButtonHardware];

    unsigned int v9 = v6 | 0x40000;
    if (v8 == 2) {
      unsigned int v9 = 2048;
    }
  }
  else
  {
LABEL_14:
    unsigned int v9 = 0;
  }
  *a4 = v9;
  return v9 != 0;
}

- (void)_initScreenProperties
{
  v3 = [(RCPEventStream *)self environment];
  uint64_t v4 = [v3 screens];
  id v5 = [v4 firstObject];

  [(RCPSyntheticEventStream *)self _initScreenPropertiesForScreen:v5];
}

- (void)_initScreenPropertiesForScreen:(id)a3
{
  p_screenSize = &self->_screenSize;
  id v5 = a3;
  [v5 pointSize];
  p_screenSize->double width = v6;
  p_screenSize->double height = v7;
  uint64_t v8 = [(RCPEventStream *)self environment];
  self->_touchFrequencdouble y = (int)[v8 touchScanRate];

  unsigned int v9 = [(RCPEventStream *)self environment];
  self->_pointerFrequencdouble y = (double)(int)[v9 pointerScanRate];

  self->_gsScreenPointSize = *p_screenSize;
  [v5 scale];
  double v11 = v10;

  self->_gsScreenScaleFactor = v11;
  double width = self->_gsScreenPointSize.width;
  self->_gsScreenPointSize.double height = v11 * self->_gsScreenPointSize.height;
  self->_gsScreenPointSize.double width = self->_gsScreenScaleFactor * width;
}

- (void)_finalizeHomeButtonEvents
{
  v2 = self;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __52__RCPSyntheticEventStream__finalizeHomeButtonEvents__block_invoke_2;
  v28[3] = &unk_1E5D773E8;
  v28[4] = self;
  v3 = (uint64_t (**)(void, void, void, void, void, void))MEMORY[0x1AD0ECCD0](v28, a2);
  uint64_t v4 = [(RCPEventStream *)v2 environment];
  uint64_t v19 = [v4 machAbsoluteTimeForTimeInterval:0.25];

  id v5 = [(RCPEventStream *)v2 environment];
  uint64_t v23 = [v5 machAbsoluteTimeForTimeInterval:0.38];

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __52__RCPSyntheticEventStream__finalizeHomeButtonEvents__block_invoke_3;
  v27[3] = &unk_1E5D773E8;
  v27[4] = v2;
  CGFloat v6 = (uint64_t (**)(void *, NSMutableArray *, unint64_t, unint64_t, void, uint64_t))MEMORY[0x1AD0ECCD0](v27);
  if (![(NSMutableArray *)v2->_processingEventBuffer count]) {
    goto LABEL_39;
  }
  int v25 = 0;
  unint64_t v26 = 0;
  int v7 = 0;
  unint64_t v8 = 0;
  char v24 = 0;
  unint64_t v9 = 0;
  uint64_t v21 = v3;
  v22 = v6;
  unint64_t v20 = v2;
  char v10 = 1;
  do
  {
    double v11 = [(NSMutableArray *)v2->_processingEventBuffer objectAtIndexedSubscript:v8];
    [v11 hidEvent];
    unint64_t TimeStamp = IOHIDEventGetTimeStamp();
    unint64_t v13 = TimeStamp;
    unint64_t v14 = v26;
    if (v26)
    {
      if ((v10 & (v9 == 0)) != 0) {
        goto LABEL_18;
      }
      if (TimeStamp > v26) {
        goto LABEL_10;
      }
    }
    else if (!v9)
    {
      goto LABEL_18;
    }
    if (v9 && TimeStamp > v9)
    {
LABEL_10:
      if ((v10 & 1) == 0)
      {
        if (v26 >= v9) {
          unint64_t v15 = v9;
        }
        else {
          unint64_t v15 = v26;
        }
        unint64_t v8 = ((uint64_t (**)(void, NSMutableArray *, unint64_t, unint64_t, void, void))v3)[2](v3, v2->_processingEventBuffer, v8, v15, v7, v24 & 1);
        int v7 = 0;
        unint64_t v14 = 0;
      }
      char v10 = 1;
      unint64_t v26 = v14;
      if (v9 && v13 > v9)
      {
        unint64_t v8 = v22[2](v22, v2->_processingEventBuffer, v8, v9, v25, 1);
        unint64_t v9 = 0;
      }
      goto LABEL_34;
    }
LABEL_18:
    if (!__52__RCPSyntheticEventStream__finalizeHomeButtonEvents__block_invoke()) {
      goto LABEL_33;
    }
    if (!IOHIDEventGetIntegerValue())
    {
      IOHIDEventSetIntegerValue();
      unint64_t v9 = 0;
      char v24 = 0;
      BOOL v16 = v7 <= 2;
      if (v7 > 2) {
        int v7 = 0;
      }
      unint64_t v17 = v26;
      if (v16) {
        unint64_t v17 = v13 + v19;
      }
      unint64_t v26 = v17;
      goto LABEL_33;
    }
    if (!v7)
    {
      IOHIDEventSetPhase();
      char v10 = 0;
    }
    unint64_t v9 = v13 + v23;
    IOHIDEventSetIntegerValue();
    int v25 = v7 + 1;
    if (v7 < 2)
    {
      char v24 = 1;
      ++v7;
      goto LABEL_32;
    }
    if (v10)
    {
      char v24 = 1;
      char v10 = 1;
      ++v7;
LABEL_32:
      v2 = v20;
      v3 = v21;
LABEL_33:
      ++v8;
      goto LABEL_34;
    }
    v2 = v20;
    char v24 = 1;
    v3 = v21;
    unint64_t v8 = ((uint64_t (**)(void, NSMutableArray *, unint64_t, unint64_t, void, uint64_t))v21)[2](v21, v20->_processingEventBuffer, v8 + 1, v13, v7 + 1, 1);
    unint64_t v26 = 0;
    char v10 = 1;
    ++v7;
LABEL_34:
  }
  while (v8 < [(NSMutableArray *)v2->_processingEventBuffer count]);
  char v18 = (v26 == 0) | v10;
  CGFloat v6 = v22;
  if ((v18 & 1) == 0) {
    ((void (*)(uint64_t (**)(void, void, void, void, void, void), NSMutableArray *, unint64_t))v3[2])(v3, v2->_processingEventBuffer, v8);
  }
LABEL_39:
}

- (unint64_t)_currentMachTime
{
  v3 = [(RCPEventStream *)self environment];
  unint64_t v4 = [v3 machAbsoluteTimeForTimeInterval:self->_currentTimeOffset];

  return v4;
}

BOOL __52__RCPSyntheticEventStream__finalizeHomeButtonEvents__block_invoke()
{
  BOOL result = 0;
  if (IOHIDEventGetType() == 3)
  {
    uint64_t IntegerValue = IOHIDEventGetIntegerValue();
    uint64_t v1 = IOHIDEventGetIntegerValue();
    if (IntegerValue == 12 && v1 == 64) {
      return 1;
    }
  }
  return result;
}

- (void)_finalizePointerButtonMasks
{
  v2 = self;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = 24;
  if ([(NSMutableArray *)self->_processingEventBuffer count])
  {
    unint64_t v4 = 0;
    int v5 = 0;
    uint64_t v17 = 24;
    char v18 = v2;
    do
    {
      CGFloat v6 = objc_msgSend(*(id *)((char *)&v2->super.super.isa + v3), "objectAtIndexedSubscript:", v4, v17, v18);
      [v6 hidEvent];
      if (IOHIDEventGetType() == 17)
      {
        uint64_t v19 = v6;
        int v7 = IOHIDEventGetChildren();
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v21;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v21 != v10) {
                objc_enumerationMutation(v7);
              }
              if (IOHIDEventGetType() == 2)
              {
                char IntegerValue = IOHIDEventGetIntegerValue();
                uint64_t v13 = IOHIDEventGetIntegerValue();
                int v14 = 1 << (IntegerValue - 1);
                int v15 = v14 | v5;
                int v16 = v5 & ~v14;
                if (v13 <= 0) {
                  int v5 = v16;
                }
                else {
                  int v5 = v15;
                }
                IOHIDEventSetIntegerValue();
              }
              ++v11;
            }
            while (v9 != v11);
            uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
          }
          while (v9);
        }
        IOHIDEventSetIntegerValue();

        uint64_t v3 = v17;
        v2 = v18;
        CGFloat v6 = v19;
      }
      ++v4;
    }
    while (v4 < [*(id *)((char *)&v2->super.super.isa + v3) count]);
  }
}

- (void)tap:(CGPoint)a3
{
}

+ (id)eventStreamWithEventActions:(id)a3
{
  uint64_t v3 = (void (**)(id, void *))a3;
  unint64_t v4 = objc_opt_new();
  v3[2](v3, v4);

  [v4 _finalizeProcessingEventBuffer];
  [v4 setEvents:v4[3]];
  int v5 = (void *)v4[3];
  v4[3] = 0;

  return v4;
}

- (void)_finalizeProcessingEventBuffer
{
  [(RCPSyntheticEventStream *)self _finalizeHomeButtonEvents];
  [(RCPSyntheticEventStream *)self _finalizePointerButtonMasks];
}

- (void)taps:(unint64_t)a3 location:(CGPoint)a4 withNumberOfTouches:(unint64_t)a5
{
  double y = a4.y;
  double x = a4.x;
  [(RCPSyntheticEventStream *)self defaultPressure];
  double v11 = v10;
  [(RCPSyntheticEventStream *)self defaultRadius];
  -[RCPSyntheticEventStream taps:location:withNumberOfTouches:pressure:radius:](self, "taps:location:withNumberOfTouches:pressure:radius:", a3, a5, x, y, v11, v12);
}

- (double)defaultRadius
{
  double result = 0.027;
  if (!self->_transducerType) {
    return 0.0;
  }
  return result;
}

- (double)defaultPressure
{
  if (self->_transducerType) {
    return (double)60;
  }
  else {
    return (double)120;
  }
}

- (void)dealloc
{
  free(self->_activePoints);
  v3.receiver = self;
  v3.super_class = (Class)RCPSyntheticEventStream;
  [(RCPSyntheticEventStream *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerChildEventStream, 0);
  objc_storeStrong((id *)&self->_senderProperties, 0);
  objc_storeStrong((id *)&self->_pointerCurveFunction, 0);
  objc_storeStrong((id *)&self->_touchCurveFunction, 0);
  objc_storeStrong((id *)&self->_processingEventBuffer, 0);
}

- (CAMediaTimingFunction)touchCurveFunction
{
  touchCurveFunction = self->_touchCurveFunction;
  if (!touchCurveFunction)
  {
    RCPMediaTimingFunctionForInputType(0, 0, v2, v3, v4, v5);
    uint64_t v8 = (CAMediaTimingFunction *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = self->_touchCurveFunction;
    self->_touchCurveFunction = v8;

    touchCurveFunction = self->_touchCurveFunction;
  }
  return touchCurveFunction;
}

- (CAMediaTimingFunction)pointerCurveFunction
{
  pointerCurveFunction = self->_pointerCurveFunction;
  if (!pointerCurveFunction)
  {
    uint64_t v8 = RCPMediaTimingFunctionForInputType(0, 1, v2, v3, v4, v5);
    [(RCPSyntheticEventStream *)self setPointerCurveFunction:v8];

    pointerCurveFunction = self->_pointerCurveFunction;
  }
  return pointerCurveFunction;
}

- (void)setPointerCurveFunction:(id)a3
{
  objc_storeStrong((id *)&self->_pointerCurveFunction, a3);
  id v5 = a3;
  id v6 = [(RCPSyntheticEventStream *)self pointerChildEventStream];
  [v6 setPointerCurveFunction:v5];
}

- (void)composeDockGestureInMotion:(unsigned __int16)a3 frequency:(unint64_t)a4 actionBlock:(id)a5
{
}

- (void)composeDockGestureOfFlavor:(unsigned __int16)a3 motion:(unsigned __int16)a4 frequency:(unint64_t)a5 actionBlock:(id)a6
{
  uint64_t v7 = a4;
  uint64_t v8 = a3;
  double v10 = (void (**)(id, RCPSyntheticFluidSwipeEventStream *))a6;
  int v16 = [[RCPSyntheticFluidSwipeEventStream alloc] initWithEventType:23 flavor:v8 motion:v7];
  double v11 = [(RCPEventStream *)self environment];
  [(RCPSyntheticFluidSwipeEventStream *)v16 setEnvironment:v11];

  double v12 = [(RCPSyntheticEventStream *)self senderProperties];
  [(RCPSyntheticFluidSwipeEventStream *)v16 setSenderProperties:v12];

  [(RCPSyntheticFluidSwipeEventStream *)v16 setCurrentTimeOffset:self->_currentTimeOffset];
  [(RCPSyntheticFluidSwipeEventStream *)v16 setFrequency:(double)a5];
  v10[2](v10, v16);

  processingEventBuffer = self->_processingEventBuffer;
  int v14 = [(RCPSyntheticFluidSwipeEventStream *)v16 finalizeEventStream];
  [(NSMutableArray *)processingEventBuffer addObjectsFromArray:v14];

  [(RCPSyntheticFluidSwipeEventStream *)v16 currentTimeOffset];
  self->_currentTimeOffset = v15;
}

- (void)composeNavigationGestureInMotion:(unsigned __int16)a3 frequency:(unint64_t)a4 actionBlock:(id)a5
{
  uint64_t v6 = a3;
  id v8 = a5;
  uint64_t v9 = [[RCPSyntheticFluidSwipeEventStream alloc] initWithEventType:16 flavor:5 motion:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__RCPSyntheticEventStream_composeNavigationGestureInMotion_frequency_actionBlock___block_invoke;
  v12[3] = &unk_1E5D77398;
  id v14 = v8;
  unint64_t v15 = a4;
  uint64_t v13 = v9;
  id v10 = v8;
  double v11 = v9;
  [(RCPSyntheticEventStream *)self withExclusiveChildStream:v11 perform:v12];
}

uint64_t __82__RCPSyntheticEventStream_composeNavigationGestureInMotion_frequency_actionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setFrequency:(double)*(unint64_t *)(a1 + 48)];
  double v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)withExclusiveChildStream:(id)a3 perform:(id)a4
{
  uint64_t v6 = (void (**)(void))a4;
  id v7 = a3;
  id v8 = [(RCPEventStream *)self environment];
  [v7 setEnvironment:v8];

  uint64_t v9 = [(RCPSyntheticEventStream *)self senderProperties];
  [v7 setSenderProperties:v9];

  [v7 setCurrentTimeOffset:self->_currentTimeOffset];
  v6[2](v6);

  processingEventBuffer = self->_processingEventBuffer;
  double v11 = [v7 finalizeEventStream];
  [(NSMutableArray *)processingEventBuffer addObjectsFromArray:v11];

  [v7 currentTimeOffset];
  double v13 = v12;

  self->_currentTimeOffset = v13;
}

+ (id)eventStreamWithCLIArguments:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  unint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__RCPSyntheticEventStream_eventStreamWithCLIArguments___block_invoke;
  v11[3] = &unk_1E5D773C0;
  id v5 = v4;
  id v12 = v5;
  double v13 = &v14;
  uint64_t v6 = [a1 eventStreamWithEventActions:v11];
  id v7 = (void *)v6;
  if (*((unsigned char *)v15 + 24)) {
    id v8 = 0;
  }
  else {
    id v8 = (void *)v6;
  }
  id v9 = v8;

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __55__RCPSyntheticEventStream_eventStreamWithCLIArguments___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = *(id *)(a1 + 32);
  while ([v3 count])
  {
    uint64_t v4 = parseCommandFromCLIArguments(v3, v5);

    id v3 = (id)v4;
    if (!v4)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      goto LABEL_6;
    }
  }

LABEL_6:
}

- (__IOHIDEvent)_createIOSButtonHIDEventWithPage:(unsigned int)a3 usage:(unsigned int)a4 down:(BOOL)a5
{
  [(RCPSyntheticEventStream *)self _currentMachTime];
  KeyboardEvent = (__IOHIDEvent *)IOHIDEventCreateKeyboardEvent();
  IOHIDEventSetIntegerValue();
  return KeyboardEvent;
}

- (__IOHIDEvent)_createIOSButtonHIDEventWithButtonType:(int64_t)a3 down:(BOOL)a4
{
  BOOL v4 = a4;
  int64_t v5 = a3 - 1;
  if ((unint64_t)(a3 - 1) > 7)
  {
    uint64_t v7 = 64;
    uint64_t v6 = 12;
  }
  else
  {
    uint64_t v6 = dword_1A9077CDC[v5];
    uint64_t v7 = dword_1A9077CFC[v5];
  }
  return [(RCPSyntheticEventStream *)self _createIOSButtonHIDEventWithPage:v6 usage:v7 down:v4];
}

- (__IOHIDEvent)_createIOHIDGameControllerEventForDpadButton:(int64_t)a3
{
  return (__IOHIDEvent *)IOHIDEventCreateGameControllerEvent();
}

uint64_t __52__RCPSyntheticEventStream__finalizeHomeButtonEvents__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v9 = *(void **)(a1 + 32);
  id v10 = a2;
  double v11 = (const void *)[v9 _createIOSButtonHIDEventWithButtonType:0 down:a6];
  IOHIDEventSetPhase();
  IOHIDEventSetIntegerValue();
  IOHIDEventSetTimeStamp();
  id v12 = +[RCPEvent eventWithHIDEvent:v11 deliveryTimeStamp:a4];
  CFRelease(v11);
  [v10 insertObject:v12 atIndex:a3];

  return a3 + 1;
}

uint64_t __52__RCPSyntheticEventStream__finalizeHomeButtonEvents__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v9 = *(void **)(a1 + 32);
  id v10 = a2;
  double v11 = (const void *)[v9 _createIOSButtonHIDEventWithButtonType:0 down:a6];
  IOHIDEventSetIntegerValue();
  IOHIDEventSetIntegerValue();
  IOHIDEventSetTimeStamp();
  id v12 = +[RCPEvent eventWithHIDEvent:v11 deliveryTimeStamp:a4];
  CFRelease(v11);
  [v10 insertObject:v12 atIndex:a3];

  return a3 + 1;
}

- (void)_updateTouchPoints:(CGPoint *)a3 count:(unint64_t)a4
{
  if ([(RCPSyntheticEventStream *)self activePointCount])
  {
    if (!a4)
    {
      [(RCPSyntheticEventStream *)self setActivePointCount:0];
      uint64_t v7 = 6;
      goto LABEL_12;
    }
    if ([(RCPSyntheticEventStream *)self activePointCount] == a4) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 5;
    }
    [(RCPSyntheticEventStream *)self setActivePointCount:a4];
  }
  else
  {
    [(RCPSyntheticEventStream *)self setActivePointCount:a4];
    uint64_t v7 = 1;
    if (!a4) {
      goto LABEL_12;
    }
  }
  uint64_t v8 = 32;
  do
  {
    id v9 = [(RCPSyntheticEventStream *)self activePoints];
    long long v10 = (__int128)*a3++;
    *(_OWORD *)((char *)&v9->var0 + v8) = v10;
    v8 += 80;
    --a4;
  }
  while (a4);
LABEL_12:
  double v11 = [(RCPSyntheticEventStream *)self _createIOHIDWithEventType:v7];
  [(RCPSyntheticEventStream *)self _addIOHIDEventToProcessingBuffer:v11];
  CFRelease(v11);
}

- (void)_delayBetweenMove:(int)a3 elapsedTime:(double)a4
{
  double v6 = (double)a3;
  [(RCPSyntheticEventStream *)self touchMoveInterval];
  double v8 = -(a4 - v6 * v7);
  [(RCPSyntheticEventStream *)self advanceTime:v8];
}

- (double)_nextTouchLocationFrom:(double)a3 to:(double)a4 at:(double)a5
{
  if (!a1) {
    return 0.0;
  }
  double v11 = [a1 touchCurveFunction];
  *(float *)&double v12 = a6;
  objc_msgSend(v11, "rcp_solveForStart:end:at:", a2, a3, a4, a5, v12);
  double v14 = v13;

  return v14;
}

- (void)composeWithSender:(id)a3 actionBlock:(id)a4
{
  double v6 = (void (**)(id, RCPSyntheticEventStream *))a4;
  id v7 = a3;
  id v8 = [(RCPSyntheticEventStream *)self senderProperties];
  [(RCPSyntheticEventStream *)self setSenderProperties:v7];

  v6[2](v6, self);
  [(RCPSyntheticEventStream *)self setSenderProperties:v8];
}

- (double)touchMoveInterval
{
  return 1.0 / (double)self->_touchFrequency;
}

- (void)setSenderProperties:(id)a3
{
  int64_t v5 = (RCPEventSenderProperties *)a3;
  if (self->_senderProperties != v5)
  {
    objc_storeStrong((id *)&self->_senderProperties, a3);
    double v6 = [(RCPEventSenderProperties *)self->_senderProperties properties];
    id v7 = [v6 objectForKeyedSubscript:@"displayUUID"];
    if (v7)
    {
      id v8 = [(RCPEventStream *)self environment];
      id v9 = [v8 screens];
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      uint64_t v16 = __47__RCPSyntheticEventStream_setSenderProperties___block_invoke;
      char v17 = &unk_1E5D77410;
      id v18 = v7;
      uint64_t v19 = self;
      [v9 enumerateObjectsUsingBlock:&v14];
    }
    else
    {
      [(RCPSyntheticEventStream *)self _initScreenProperties];
    }
    long long v10 = objc_msgSend(v6, "objectForKeyedSubscript:", @"PrimaryUsagePage", v14, v15, v16, v17);
    if ([v10 intValue] == 13)
    {
      double v11 = [v6 objectForKeyedSubscript:@"PrimaryUsage"];
      int v12 = [v11 intValue];

      if (v12 == 32)
      {
        unsigned int v13 = 0;
LABEL_10:
        self->_transducerType = v13;

        goto LABEL_11;
      }
    }
    else
    {
    }
    unsigned int v13 = 2;
    goto LABEL_10;
  }
LABEL_11:
}

void __47__RCPSyntheticEventStream_setSenderProperties___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  double v6 = [v8 displayUUID];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    [*(id *)(a1 + 40) _initScreenPropertiesForScreen:v8];
    *a4 = 1;
  }
}

- (void)touchDownAtPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 pressure:(double)a5 radius:(double)a6
{
}

- (void)touchDownAtPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 radius:(double)a5
{
  [(RCPSyntheticEventStream *)self defaultPressure];
  -[RCPSyntheticEventStream _touchDownAtPoints:touchCount:pressure:radius:edgeMaskOptions:](self, "_touchDownAtPoints:touchCount:pressure:radius:edgeMaskOptions:", a3, a4, 0);
}

- (void)touchDownAtPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 pressure:(double)a5
{
  [(RCPSyntheticEventStream *)self defaultRadius];
  [(RCPSyntheticEventStream *)self _touchDownAtPoints:a3 touchCount:a4 pressure:0 radius:a5 edgeMaskOptions:v9];
}

- (void)touchDownAtPoints:(CGPoint *)a3 touchCount:(unint64_t)a4
{
  [(RCPSyntheticEventStream *)self defaultPressure];
  double v8 = v7;
  [(RCPSyntheticEventStream *)self defaultRadius];
  [(RCPSyntheticEventStream *)self _touchDownAtPoints:a3 touchCount:a4 pressure:0 radius:v8 edgeMaskOptions:v9];
}

- (void)touchDown:(CGPoint)a3 touchCount:(unint64_t)a4 radius:(double)a5
{
  double y = a3.y;
  double x = a3.x;
  [(RCPSyntheticEventStream *)self defaultPressure];
  -[RCPSyntheticEventStream touchDown:touchCount:pressure:radius:](self, "touchDown:touchCount:pressure:radius:", a4, x, y, v10, a5);
}

- (void)touchDown:(CGPoint)a3 touchCount:(unint64_t)a4 pressure:(double)a5
{
  double y = a3.y;
  double x = a3.x;
  [(RCPSyntheticEventStream *)self defaultRadius];
  -[RCPSyntheticEventStream touchDown:touchCount:pressure:radius:](self, "touchDown:touchCount:pressure:radius:", a4, x, y, a5, v10);
}

- (void)touchDown:(CGPoint)a3 touchCount:(unint64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  [(RCPSyntheticEventStream *)self defaultPressure];
  double v9 = v8;
  [(RCPSyntheticEventStream *)self defaultRadius];
  -[RCPSyntheticEventStream touchDown:touchCount:pressure:radius:](self, "touchDown:touchCount:pressure:radius:", a4, x, y, v9, v10);
}

- (void)touchDown:(CGPoint)a3
{
  [(RCPSyntheticEventStream *)self defaultPressure];
  double v5 = v4;
  [(RCPSyntheticEventStream *)self defaultRadius];
  [(RCPSyntheticEventStream *)self _touchDownAtPoints:&v7 touchCount:1 pressure:0 radius:v5 edgeMaskOptions:v6];
}

- (void)touchTapDown:(CGPoint)a3
{
  CGPoint v9 = a3;
  unsigned int v8 = 0;
  -[RCPSyntheticEventStream _isEdgePoint:getMask:](self, "_isEdgePoint:getMask:", &v8);
  v8 |= 0x20000u;
  [(RCPSyntheticEventStream *)self defaultPressure];
  double v5 = v4;
  [(RCPSyntheticEventStream *)self defaultRadius];
  [(RCPSyntheticEventStream *)self _touchDownAtPoints:&v9 touchCount:1 pressure:&v7 radius:v5 edgeMaskOptions:v6];
}

- (void)edgeOrb:(CGPoint)a3
{
  CGPoint v9 = a3;
  unsigned int v8 = 0;
  -[RCPSyntheticEventStream _isEdgePoint:getMask:](self, "_isEdgePoint:getMask:", &v8);
  v8 |= 0x8000u;
  [(RCPSyntheticEventStream *)self defaultPressure];
  double v5 = v4;
  [(RCPSyntheticEventStream *)self defaultRadius];
  [(RCPSyntheticEventStream *)self _touchDownAtPoints:&v9 touchCount:1 pressure:&v7 radius:v5 edgeMaskOptions:v6];
  [(RCPSyntheticEventStream *)self moveToPoints:&v9 touchCount:1 pressure:300.0 duration:0.5];
  [(RCPSyntheticEventStream *)self moveToPoints:&v9 touchCount:1 pressure:150.0 duration:0.2];
  [(RCPSyntheticEventStream *)self moveToPoints:&v9 touchCount:1 pressure:700.0 duration:1.3];
  [(RCPSyntheticEventStream *)self liftUpAtPoints:&v9 touchCount:1];
}

- (void)edgeOrbSwipe:(CGPoint)a3 withEndLocation:(CGPoint)a4 withDuration:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  CGPoint v19 = a3;
  unsigned int v18 = 0;
  -[RCPSyntheticEventStream _isEdgePoint:getMask:](self, "_isEdgePoint:getMask:", &v18);
  v18 |= 0x8000u;
  [(RCPSyntheticEventStream *)self defaultPressure];
  double v10 = v9;
  [(RCPSyntheticEventStream *)self defaultRadius];
  [(RCPSyntheticEventStream *)self _touchDownAtPoints:&v19 touchCount:1 pressure:&v17 radius:v10 edgeMaskOptions:v11];
  [(RCPSyntheticEventStream *)self moveToPoints:&v19 touchCount:1 pressure:300.0 duration:0.5];
  double currentTimeOffset = self->_currentTimeOffset;
  [(RCPSyntheticEventStream *)self touchMoveInterval];
  if (a5 - v13 > 0.0)
  {
    uint64_t v14 = 0;
    do
    {
      double v15 = self->_currentTimeOffset - currentTimeOffset;
      -[RCPSyntheticEventStream _moveLastTouchPoint:eventMask:](self, "_moveLastTouchPoint:eventMask:", 0, -[RCPSyntheticEventStream _nextTouchLocationFrom:to:at:](self, v19.x, v19.y, x, y, v15 / a5 * (v15 / a5)));
      [(RCPSyntheticEventStream *)self _delayBetweenMove:v14 elapsedTime:v15];
      [(RCPSyntheticEventStream *)self touchMoveInterval];
      uint64_t v14 = (v14 + 1);
    }
    while (v15 < a5 - v16);
  }
  [(RCPSyntheticEventStream *)self liftUpAtAllActivePoints];
}

- (void)liftUpActivePointsByIndex:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v4);
        }
        unint64_t v10 = [*(id *)(*((void *)&v22 + 1) + 8 * i) integerValue];
        if (v10 < [(RCPSyntheticEventStream *)self activePointCount])
        {
          *(unsigned char *)([(RCPSyntheticEventStream *)self activePoints] + 80 * v10 + 72) = 0;
          ++v7;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  double v11 = [(RCPSyntheticEventStream *)self _createIOHIDWithEventType:6];
  [(RCPSyntheticEventStream *)self _addIOHIDEventToProcessingBuffer:v11];
  CFRelease(v11);
  unint64_t v12 = [(RCPSyntheticEventStream *)self activePointCount];
  if (v12)
  {
    unint64_t v13 = v12;
    unint64_t v14 = 0;
    do
    {
      if ((_BYTE)([(RCPSyntheticEventStream *)self activePoints] + 80 * v14)[72])
      {
        ++v14;
      }
      else if (v14 <= 3)
      {
        uint64_t v15 = 80 * v14;
        for (uint64_t j = 4; j != v14; --j)
        {
          uint64_t v17 = [(RCPSyntheticEventStream *)self activePoints] + v15;
          unsigned int v18 = [(RCPSyntheticEventStream *)self activePoints] + v15;
          *(_OWORD *)&v17->unsigned int var0 = *(_OWORD *)&v18[1].var0;
          long long v19 = *(_OWORD *)&v18[1].var7;
          long long v21 = *(_OWORD *)&v18[1].var2;
          CGPoint var4 = v18[1].var4;
          *(_OWORD *)&v17->var5 = *(_OWORD *)&v18[1].var5;
          *(_OWORD *)&v17->var7 = v19;
          *(_OWORD *)&v17->var2 = v21;
          v17->CGPoint var4 = var4;
          v15 += 80;
        }
      }
      --v13;
    }
    while (v13);
  }
  [(RCPSyntheticEventStream *)self setActivePointCount:[(RCPSyntheticEventStream *)self activePointCount] - v7];
}

- (void)liftUpAtAllActivePointsWithEventType:(int64_t)a3
{
  if ([(RCPSyntheticEventStream *)self activePointCount])
  {
    unint64_t v5 = 0;
    uint64_t v6 = 72;
    do
    {
      *(unsigned char *)([(RCPSyntheticEventStream *)self activePoints] + v6) = 0;
      ++v5;
      v6 += 80;
    }
    while (v5 < [(RCPSyntheticEventStream *)self activePointCount]);
  }
  uint64_t v7 = [(RCPSyntheticEventStream *)self _createIOHIDWithEventType:a3];
  [(RCPSyntheticEventStream *)self _addIOHIDEventToProcessingBuffer:v7];
  CFRelease(v7);
  [(RCPSyntheticEventStream *)self setActivePointCount:0];
}

- (void)liftUpAtAllActivePoints
{
  if ([(RCPSyntheticEventStream *)self activePointCount])
  {
    unint64_t v3 = 0;
    uint64_t v4 = 72;
    do
    {
      *(unsigned char *)([(RCPSyntheticEventStream *)self activePoints] + v4) = 0;
      ++v3;
      v4 += 80;
    }
    while (v3 < [(RCPSyntheticEventStream *)self activePointCount]);
  }
  unint64_t v5 = [(RCPSyntheticEventStream *)self _createIOHIDWithEventType:6];
  [(RCPSyntheticEventStream *)self _addIOHIDEventToProcessingBuffer:v5];
  CFRelease(v5);
  [(RCPSyntheticEventStream *)self setActivePointCount:0];
}

- (void)liftUp:(CGPoint)a3
{
}

- (void)_moveLastTouchPoint:(CGPoint)a3 eventMask:(unint64_t)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v8 = [(RCPSyntheticEventStream *)self activePoints];
  double v9 = &v8[[(RCPSyntheticEventStream *)self activePointCount]];
  v9[-1].var4.CGFloat x = x;
  v9[-1].var4.CGFloat y = y;
  if (a4)
  {
    unint64_t v10 = [(RCPSyntheticEventStream *)self activePoints];
    v10[[(RCPSyntheticEventStream *)self activePointCount] - 1].var8 = a4;
  }
  double v11 = [(RCPSyntheticEventStream *)self _createIOHIDWithEventType:2];
  [(RCPSyntheticEventStream *)self _addIOHIDEventToProcessingBuffer:v11];
  CFRelease(v11);
}

- (void)moveToPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 pressure:(double)a5 duration:(double)a6 radius:(double)a7
{
  v31 = a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (a4 >= 5) {
    unint64_t v11 = 5;
  }
  else {
    unint64_t v11 = a4;
  }
  v34 = (double *)((char *)&v30 - (16 * v11));
  unint64_t v12 = (char *)v34;
  [(RCPSyntheticEventStream *)self defaultPressure];
  double v14 = v13;
  double currentTimeOffset = self->_currentTimeOffset;
  [(RCPSyntheticEventStream *)self touchMoveInterval];
  if (a6 - v16 > 0.0)
  {
    uint64_t v17 = 0;
    double v18 = a5 - v14;
    v32 = (double *)(v12 + 8);
    p_CGFloat y = &v31->y;
    do
    {
      double v19 = self->_currentTimeOffset - currentTimeOffset;
      double v20 = v19 / a6;
      if (v19 / a6 > 1.0) {
        double v20 = 1.0;
      }
      double v21 = fmax(v20, 0.0);
      if (v11)
      {
        uint64_t v22 = 0;
        long long v24 = v32;
        long long v23 = p_y;
        long long v25 = v34;
        do
        {
          if (!v17) {
            *(_OWORD *)long long v25 = (_OWORD)([(RCPSyntheticEventStream *)self activePoints] + v22)[32];
          }
          double v26 = *v25;
          double v27 = v25[1];
          v25 += 2;
          *(v24 - 1) = -[RCPSyntheticEventStream _nextTouchLocationFrom:to:at:](self, v26, v27, *(v23 - 1), *v23, v21);
          *(void *)long long v24 = v28;
          v22 += 80;
          v23 += 2;
          v24 += 2;
        }
        while (80 * v11 != v22);
      }
      [(RCPSyntheticEventStream *)self _setPressureForAllPoints:v14 + v18 * v21];
      [(RCPSyntheticEventStream *)self _setMajorRadiusForAllPoints:a7];
      [(RCPSyntheticEventStream *)self _updateTouchPoints:v12 count:v11];
      [(RCPSyntheticEventStream *)self _delayBetweenMove:v17 elapsedTime:v19];
      [(RCPSyntheticEventStream *)self touchMoveInterval];
      uint64_t v17 = (v17 + 1);
    }
    while (v19 < a6 - v29);
  }
  [(RCPSyntheticEventStream *)self _updateTouchPoints:v31 count:v11];
}

- (void)moveToPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 pressure:(double)a5 duration:(double)a6
{
  [(RCPSyntheticEventStream *)self defaultRadius];
  [(RCPSyntheticEventStream *)self moveToPoints:a3 touchCount:a4 pressure:a5 duration:a6 radius:v11];
}

- (void)moveToPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 duration:(double)a5
{
  [(RCPSyntheticEventStream *)self defaultPressure];
  -[RCPSyntheticEventStream moveToPoints:touchCount:pressure:duration:](self, "moveToPoints:touchCount:pressure:duration:", a3, a4);
}

- (void)moveToPoint:(CGPoint)a3 duration:(double)a4
{
  CGPoint v4 = a3;
  [(RCPSyntheticEventStream *)self moveToPoints:&v4 touchCount:1 duration:a4];
}

- (void)_setPressureForAllPoints:(double)a3
{
  uint64_t v5 = 5;
  do
  {
    *(double *)([(RCPSyntheticEventStream *)self activePoints] + 56) = a3;
    --v5;
  }
  while (v5);
}

- (void)_setMajorRadiusForAllPoints:(double)a3
{
  uint64_t v5 = 5;
  do
  {
    *(double *)([(RCPSyntheticEventStream *)self activePoints] + 48) = a3;
    --v5;
  }
  while (v5);
}

- (void)tap:(CGPoint)a3 radius:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  [(RCPSyntheticEventStream *)self defaultPressure];
  -[RCPSyntheticEventStream taps:location:withNumberOfTouches:pressure:radius:](self, "taps:location:withNumberOfTouches:pressure:radius:", 1, 1, x, y, v8, a4);
}

- (void)tap:(CGPoint)a3 pressure:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  [(RCPSyntheticEventStream *)self defaultRadius];
  -[RCPSyntheticEventStream taps:location:withNumberOfTouches:pressure:radius:](self, "taps:location:withNumberOfTouches:pressure:radius:", 1, 1, x, y, a4, v8);
}

- (void)tap:(CGPoint)a3 withPressure:(double)a4 radius:(double)a5
{
}

- (void)tapToWakeAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[RCPSyntheticEventStream touchTapDown:](self, "touchTapDown:");
  [(RCPSyntheticEventStream *)self advanceTime:0.05];
  -[RCPSyntheticEventStream liftUp:touchCount:](self, "liftUp:touchCount:", 1, x, y);
}

- (void)_tap:(CGPoint)a3 withPressure:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  *(void *)([(RCPSyntheticEventStream *)self activePoints] + 56) = 0x3FF0000000000000;
  -[RCPSyntheticEventStream tap:](self, "tap:", x, y);
}

- (void)doubleTap:(CGPoint)a3
{
}

- (void)doubleFingerTap:(CGPoint)a3
{
}

- (void)tapsNoLift:(unint64_t)a3 location:(CGPoint)a4 withNumberOfTouches:(unint64_t)a5
{
  if (a3)
  {
    double y = a4.y;
    double x = a4.x;
    for (unint64_t i = a3 - 1; ; --i)
    {
      -[RCPSyntheticEventStream touchDown:touchCount:](self, "touchDown:touchCount:", a5, x, y);
      [(RCPSyntheticEventStream *)self advanceTime:0.05];
      if (!i) {
        break;
      }
      [(RCPSyntheticEventStream *)self advanceTime:0.15];
    }
  }
}

- (void)pressButtonsWithPages:(id)a3 usages:(id)a4 duration:(double)a5
{
  id v21 = a3;
  id v8 = a4;
  uint64_t v9 = [v21 count];
  if (v9 < 1)
  {
    [(RCPSyntheticEventStream *)self advanceTime:a5];
  }
  else
  {
    uint64_t v10 = v9;
    for (uint64_t i = 0; i != v10; ++i)
    {
      unint64_t v12 = [v21 objectAtIndexedSubscript:i];
      uint64_t v13 = [v12 unsignedIntValue];
      double v14 = [v8 objectAtIndexedSubscript:i];
      uint64_t v15 = -[RCPSyntheticEventStream _createIOSButtonHIDEventWithPage:usage:down:](self, "_createIOSButtonHIDEventWithPage:usage:down:", v13, [v14 unsignedIntValue], 1);

      [(RCPSyntheticEventStream *)self advanceTime:0.0001];
      [(RCPSyntheticEventStream *)self _addIOHIDEventToProcessingBuffer:v15];
      CFRelease(v15);
    }
    [(RCPSyntheticEventStream *)self advanceTime:a5];
    for (uint64_t j = 0; j != v10; ++j)
    {
      uint64_t v17 = [v21 objectAtIndexedSubscript:j];
      uint64_t v18 = [v17 unsignedIntValue];
      double v19 = [v8 objectAtIndexedSubscript:j];
      double v20 = -[RCPSyntheticEventStream _createIOSButtonHIDEventWithPage:usage:down:](self, "_createIOSButtonHIDEventWithPage:usage:down:", v18, [v19 unsignedIntValue], 0);

      [(RCPSyntheticEventStream *)self advanceTime:0.0001];
      [(RCPSyntheticEventStream *)self _addIOHIDEventToProcessingBuffer:v20];
      CFRelease(v20);
    }
  }
}

- (void)pressButtons:(id)a3 duration:(double)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = -[RCPSyntheticEventStream _createIOSButtonHIDEventWithButtonType:down:](self, "_createIOSButtonHIDEventWithButtonType:down:", [*(id *)(*((void *)&v22 + 1) + 8 * v10) integerValue], 1);
        [(RCPSyntheticEventStream *)self advanceTime:0.0001];
        [(RCPSyntheticEventStream *)self _addIOHIDEventToProcessingBuffer:v11];
        CFRelease(v11);
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v8);
  }
  [(RCPSyntheticEventStream *)self advanceTime:a4];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = -[RCPSyntheticEventStream _createIOSButtonHIDEventWithButtonType:down:](self, "_createIOSButtonHIDEventWithButtonType:down:", objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v16), "integerValue", (void)v18), 0);
        [(RCPSyntheticEventStream *)self _addIOHIDEventToProcessingBuffer:v17];
        CFRelease(v17);
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }
}

- (void)beginButtonPressForButtonType:(int64_t)a3
{
  CGPoint v4 = [(RCPSyntheticEventStream *)self _createIOSButtonHIDEventWithButtonType:a3 down:1];
  [(RCPSyntheticEventStream *)self _addIOHIDEventToProcessingBuffer:v4];
  CFRelease(v4);
}

- (void)endButtonPressForButtonType:(int64_t)a3
{
  CGPoint v4 = [(RCPSyntheticEventStream *)self _createIOSButtonHIDEventWithButtonType:a3 down:0];
  [(RCPSyntheticEventStream *)self _addIOHIDEventToProcessingBuffer:v4];
  CFRelease(v4);
}

- (void)beginButtonPressWithPage:(unint64_t)a3 usage:(unint64_t)a4
{
  uint64_t v5 = [(RCPSyntheticEventStream *)self _createIOSButtonHIDEventWithPage:a3 usage:a4 down:1];
  [(RCPSyntheticEventStream *)self _addIOHIDEventToProcessingBuffer:v5];
  CFRelease(v5);
}

- (void)endButtonPressWithPage:(unint64_t)a3 usage:(unint64_t)a4
{
  uint64_t v5 = [(RCPSyntheticEventStream *)self _createIOSButtonHIDEventWithPage:a3 usage:a4 down:0];
  [(RCPSyntheticEventStream *)self _addIOHIDEventToProcessingBuffer:v5];
  CFRelease(v5);
}

- (void)flipRingerSwitchToValue:(BOOL)a3
{
  CGPoint v4 = [(RCPSyntheticEventStream *)self _createIOSButtonHIDEventWithPage:11 usage:46 down:a3];
  [(RCPSyntheticEventStream *)self _addIOHIDEventToProcessingBuffer:v4];
  CFRelease(v4);
}

- (void)rotateCrown:(double)a3 direction:(int64_t)a4 duration:(double)a5
{
  [(RCPSyntheticEventStream *)self touchMoveInterval];
  double v9 = v8;
  int v10 = llround(a5 / v8);
  if (v10 >= 2)
  {
    double currentTimeOffset = self->_currentTimeOffset;
    double v12 = (double)(int)llround(a3 * 164.0 / 360.0);
    double v14 = *MEMORY[0x1E4F1DAD8];
    double v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    int v15 = v10 - 1;
    do
    {
      [(RCPSyntheticEventStream *)self advanceTime:v9];
      -[RCPSyntheticEventStream _nextTouchLocationFrom:to:at:](self, v14, v13, 0.0, v12, (self->_currentTimeOffset - currentTimeOffset) / a5);
      [(RCPSyntheticEventStream *)self _currentMachTime];
      ScrollEvent = (const void *)IOHIDEventCreateScrollEvent();
      IOHIDEventSetIntegerValue();
      [(RCPSyntheticEventStream *)self _addIOHIDEventToProcessingBuffer:ScrollEvent];
      CFRelease(ScrollEvent);
      --v15;
    }
    while (v15);
  }
}

- (void)_knobEventForOffset:(CGVector)a3 buttonMask:(unsigned int)a4 oldButtonMask:(unsigned int)a5
{
  [(RCPSyntheticEventStream *)self _currentMachTime];
  RelativePointerEvent = (const void *)IOHIDEventCreateRelativePointerEvent();
  [(RCPSyntheticEventStream *)self _currentMachTime];
  uint64_t v7 = (const void *)IOHIDEventCreate();
  IOHIDEventSetFloatValue();
  IOHIDEventSetFloatValue();
  if (v7)
  {
    IOHIDEventAppendEvent();
    CFRelease(v7);
  }
  [(RCPSyntheticEventStream *)self _addIOHIDEventToProcessingBuffer:RelativePointerEvent];
  CFRelease(RelativePointerEvent);
}

- (void)knobNudge:(CGVector)a3 buttonMask:(unsigned int)a4 duration:(double)a5
{
  uint64_t v6 = *(void *)&a4;
  -[RCPSyntheticEventStream _knobEventForOffset:buttonMask:oldButtonMask:](self, "_knobEventForOffset:buttonMask:oldButtonMask:", *(void *)&a4, 0, a3.dx, a3.dy);
  [(RCPSyntheticEventStream *)self advanceTime:a5];
  -[RCPSyntheticEventStream _knobEventForOffset:buttonMask:oldButtonMask:](self, "_knobEventForOffset:buttonMask:oldButtonMask:", 0, v6, 0.0, 0.0);
}

- (void)sendUnicodeString:(id)a3
{
  CGPoint v4 = [a3 dataUsingEncoding:4];
  [(RCPSyntheticEventStream *)self _currentMachTime];
  id v6 = v4;
  [v6 bytes];
  [v6 length];
  UnicodeEvent = (const void *)IOHIDEventCreateUnicodeEvent();
  [(RCPSyntheticEventStream *)self _addIOHIDEventToProcessingBuffer:UnicodeEvent];
  CFRelease(UnicodeEvent);
}

- (void)sendUnicodeStringByCharacters:(id)a3 durationBetweenEvents:(double)a4
{
  id v8 = a3;
  if ([v8 count])
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = [v8 objectAtIndexedSubscript:v6];
      [(RCPSyntheticEventStream *)self sendUnicodeString:v7];

      if (v6 != [v8 count] - 1) {
        [(RCPSyntheticEventStream *)self advanceTime:a4];
      }
      ++v6;
    }
    while ([v8 count] > v6);
  }
}

- (void)sendUnicodeString:(id)a3 synthesizePerCharacterEvents:(BOOL)a4 durationBetweenEvents:(double)a5
{
  if (a4)
  {
    id v7 = [(RCPSyntheticEventStream *)self _splitStringIntoArrayOfCharacters:a3];
    [(RCPSyntheticEventStream *)self sendUnicodeStringByCharacters:v7 durationBetweenEvents:a5];
  }
  else
  {
    -[RCPSyntheticEventStream sendUnicodeString:](self, "sendUnicodeString:", a3, a5);
  }
}

- (id)_splitStringIntoArrayOfCharacters:(id)a3
{
  unint64_t v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  uint64_t v5 = objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "length"));
  uint64_t v6 = [v4 length];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__RCPSyntheticEventStream__splitStringIntoArrayOfCharacters___block_invoke;
  v10[3] = &unk_1E5D77080;
  id v11 = v5;
  id v7 = v5;
  objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v6, 2, v10);

  id v8 = (void *)[v7 copy];
  return v8;
}

uint64_t __61__RCPSyntheticEventStream__splitStringIntoArrayOfCharacters___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

- (void)pressDiscreteGameControllerButton:(int64_t)a3 duration:(double)a4
{
  uint64_t v6 = [(RCPSyntheticEventStream *)self _createIOHIDGameControllerEventForDpadButton:a3];
  [(RCPSyntheticEventStream *)self advanceTime:0.0001];
  [(RCPSyntheticEventStream *)self _addIOHIDEventToProcessingBuffer:v6];
  CFRelease(v6);
  [(RCPSyntheticEventStream *)self advanceTime:a4];
  id v7 = [(RCPSyntheticEventStream *)self _createIOHIDGameControllerEventForDpadButton:0];
  [(RCPSyntheticEventStream *)self advanceTime:0.0001];
  [(RCPSyntheticEventStream *)self _addIOHIDEventToProcessingBuffer:v7];
  CFRelease(v7);
}

- (void)dragWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  double v8 = a3.y;
  double v9 = a3.x;
  [(RCPSyntheticEventStream *)self defaultPressure];
  double v12 = v11;
  [(RCPSyntheticEventStream *)self defaultRadius];
  -[RCPSyntheticEventStream dragWithStartPoint:endPoint:duration:pressure:radius:](self, "dragWithStartPoint:endPoint:duration:pressure:radius:", v9, v8, x, y, a5, v12, v13);
}

- (void)dragWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 radius:(double)a6
{
  double y = a4.y;
  double x = a4.x;
  double v10 = a3.y;
  double v11 = a3.x;
  [(RCPSyntheticEventStream *)self defaultPressure];
  -[RCPSyntheticEventStream dragWithStartPoint:endPoint:duration:pressure:radius:](self, "dragWithStartPoint:endPoint:duration:pressure:radius:", v11, v10, x, y, a5, v13, a6);
}

- (void)dragWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 pressure:(double)a6
{
  double y = a4.y;
  double x = a4.x;
  double v10 = a3.y;
  double v11 = a3.x;
  [(RCPSyntheticEventStream *)self defaultRadius];
  -[RCPSyntheticEventStream dragWithStartPoint:endPoint:duration:pressure:radius:](self, "dragWithStartPoint:endPoint:duration:pressure:radius:", v11, v10, x, y, a5, a6, v13);
}

- (void)dragWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 pressure:(double)a6 radius:(double)a7
{
}

- (void)dragWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 tapAndWait:(double)a6 lift:(BOOL)a7
{
  BOOL v7 = a7;
  double y = a4.y;
  double x = a4.x;
  double v12 = a3.y;
  double v13 = a3.x;
  [(RCPSyntheticEventStream *)self defaultPressure];
  double v16 = v15;
  [(RCPSyntheticEventStream *)self defaultRadius];
  -[RCPSyntheticEventStream dragWithStartPoint:endPoint:duration:tapAndWait:lift:pressure:radius:](self, "dragWithStartPoint:endPoint:duration:tapAndWait:lift:pressure:radius:", v7, v13, v12, x, y, a5, a6, v16, v17);
}

- (void)dragWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 tapAndWait:(double)a6 lift:(BOOL)a7 radius:(double)a8
{
  BOOL v9 = a7;
  double y = a4.y;
  double x = a4.x;
  double v14 = a3.y;
  double v15 = a3.x;
  [(RCPSyntheticEventStream *)self defaultPressure];
  -[RCPSyntheticEventStream dragWithStartPoint:endPoint:duration:tapAndWait:lift:pressure:radius:](self, "dragWithStartPoint:endPoint:duration:tapAndWait:lift:pressure:radius:", v9, v15, v14, x, y, a5, a6, v17, a8);
}

- (void)dragWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 tapAndWait:(double)a6 lift:(BOOL)a7 pressure:(double)a8
{
  BOOL v9 = a7;
  double y = a4.y;
  double x = a4.x;
  double v14 = a3.y;
  double v15 = a3.x;
  [(RCPSyntheticEventStream *)self defaultRadius];
  -[RCPSyntheticEventStream dragWithStartPoint:endPoint:duration:tapAndWait:lift:pressure:radius:](self, "dragWithStartPoint:endPoint:duration:tapAndWait:lift:pressure:radius:", v9, v15, v14, x, y, a5, a6, a8, v17);
}

- (void)dragWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 tapAndWait:(double)a6 lift:(BOOL)a7 pressure:(double)a8 radius:(double)a9
{
}

- (void)dragWithStartPoint:(CGPoint)a3 mask:(unint64_t)a4 endPoint:(CGPoint)a5 mask:(unint64_t)a6 duration:(double)a7
{
  double y = a5.y;
  double x = a5.x;
  double v12 = a3.y;
  double v13 = a3.x;
  [(RCPSyntheticEventStream *)self defaultPressure];
  double v16 = v15;
  [(RCPSyntheticEventStream *)self defaultRadius];
  -[RCPSyntheticEventStream _dragWithStartPoint:mask:endPoint:mask:duration:tapAndWait:lift:pressure:radius:](self, "_dragWithStartPoint:mask:endPoint:mask:duration:tapAndWait:lift:pressure:radius:", a4, a6, 1, v13, v12, x, y, a7, 0.0, v16, v17);
}

- (void)sendFlickWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  double v8 = a3.y;
  double v9 = a3.x;
  [(RCPSyntheticEventStream *)self defaultPressure];
  double v12 = v11;
  [(RCPSyntheticEventStream *)self defaultRadius];
  -[RCPSyntheticEventStream _flickWithStartPoint:endPoint:duration:pressure:radius:](self, "_flickWithStartPoint:endPoint:duration:pressure:radius:", v9, v8, x, y, a5, v12, v13);
}

- (void)sendFlickWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 pressure:(double)a6
{
  double y = a4.y;
  double x = a4.x;
  double v10 = a3.y;
  double v11 = a3.x;
  [(RCPSyntheticEventStream *)self defaultRadius];
  -[RCPSyntheticEventStream _flickWithStartPoint:endPoint:duration:pressure:radius:](self, "_flickWithStartPoint:endPoint:duration:pressure:radius:", v11, v10, x, y, a5, a6, v13);
}

- (void)sendFlickWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 radius:(double)a6
{
  double y = a4.y;
  double x = a4.x;
  double v10 = a3.y;
  double v11 = a3.x;
  [(RCPSyntheticEventStream *)self defaultPressure];
  -[RCPSyntheticEventStream _flickWithStartPoint:endPoint:duration:pressure:radius:](self, "_flickWithStartPoint:endPoint:duration:pressure:radius:", v11, v10, x, y, a5, v13, a6);
}

- (void)multifingerDragWithPointArray:(CGPoint *)a3 numPoints:(unint64_t)a4 duration:(double)a5 numFingers:(unint64_t)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (a3 && a4 >= 2)
  {
    v36[1] = v36;
    if (a6 >= 5) {
      unint64_t v9 = 5;
    }
    else {
      unint64_t v9 = a6;
    }
    double v10 = ((double (*)(RCPSyntheticEventStream *, SEL, __n128))MEMORY[0x1F4188790])(self, a2, *(__n128 *)&a5)
        / (double)(a4 - 1);
    double v11 = (double)(v9 >> 1);
    double v37 = (double)v9;
    uint64_t v12 = 1;
    do
    {
      double currentTimeOffset = self->_currentTimeOffset;
      double v14 = &a3[v12];
      double x = v14[-1].x;
      double v41 = currentTimeOffset;
      CGFloat y = v14[-1].y;
      double v16 = v14->y;
      double v38 = v14->x;
      double v39 = y;
      [(RCPSyntheticEventStream *)self touchMoveInterval];
      if (v10 - v17 > 0.0)
      {
        uint64_t v18 = 0;
        do
        {
          double v19 = self->_currentTimeOffset - v41;
          double v20 = -[RCPSyntheticEventStream _nextTouchLocationFrom:to:at:](self, x, v39, v38, v16, v19 / v10);
          double v22 = v21;
          double v23 = v20 - v11;
          double v24 = 0.0;
          double v25 = 0.0;
          if (v20 - v11 >= 0.0)
          {
            double v26 = v23 + v37;
            [(RCPSyntheticEventStream *)self screenSize];
            BOOL v28 = v26 <= v27;
            double v25 = v23;
            if (!v28)
            {
              [(RCPSyntheticEventStream *)self screenSize];
              double v25 = v29;
            }
          }
          if (v22 - v11 >= 0.0)
          {
            double v30 = v22 - v11 + v37;
            [(RCPSyntheticEventStream *)self screenSize];
            BOOL v28 = v30 <= v31;
            double v24 = v22 - v11;
            if (!v28)
            {
              [(RCPSyntheticEventStream *)self screenSize];
              double v24 = v32;
            }
          }
          if (v9)
          {
            uint64_t v33 = 0;
            v34 = (double *)&v36[-2 * v9 + 1];
            do
            {
              *(v34 - 1) = v25 + (double)(int)v33;
              double *v34 = v24 + (double)(int)v33++;
              v34 += 2;
            }
            while (v9 != v33);
          }
          [(RCPSyntheticEventStream *)self _updateTouchPoints:&v36[-2 * v9] count:v9];
          [(RCPSyntheticEventStream *)self _delayBetweenMove:v18 elapsedTime:v19];
          [(RCPSyntheticEventStream *)self touchMoveInterval];
          uint64_t v18 = (v18 + 1);
        }
        while (v19 < v10 - v35);
      }
      ++v12;
    }
    while (v12 != a4);
    [(RCPSyntheticEventStream *)self liftUpAtPoints:&v36[-2 * v9] touchCount:v9];
    [(RCPSyntheticEventStream *)self setActivePointCount:0];
  }
}

- (void)rotate:(CGPoint)a3 withRadius:(double)a4 rotation:(double)a5 duration:(double)a6 touchCount:(unint64_t)a7
{
  double v27 = a5;
  double y = a3.y;
  double x = a3.x;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a7 >= 5) {
    unint64_t v12 = 5;
  }
  else {
    unint64_t v12 = a7;
  }
  double v13 = MEMORY[0x1F4188790](self, a2, (__n128)a3, *(__n128 *)&a3.y, *(__n128 *)&a4, *(__n128 *)&a5);
  double v15 = v14[4];
  objc_msgSend(v14, "touchMoveInterval", v13);
  double v17 = v16;
  [(RCPSyntheticEventStream *)self touchMoveInterval];
  if (a6 - v18 > 0.0)
  {
    uint64_t v19 = 0;
    double v20 = (double)(int)llround(a6 / v17);
    do
    {
      if (v12)
      {
        uint64_t v21 = 0;
        double v22 = (double)(int)v19 / v20 * v27;
        double v23 = &v27 - 2 * v12 + 1;
        do
        {
          __double2 v24 = __sincos_stret(v22 + 6.28318531 / (double)v12 * (double)(int)v21);
          *(v23 - 1) = x + a4 * v24.__cosval;
          double *v23 = y + a4 * v24.__sinval;
          ++v21;
          v23 += 2;
        }
        while (v12 != v21);
      }
      -[RCPSyntheticEventStream _updateTouchPoints:count:](self, "_updateTouchPoints:count:", &v27 - 2 * v12, v12, *(void *)&v27, v28);
      double v25 = self->_currentTimeOffset - v15;
      [(RCPSyntheticEventStream *)self _delayBetweenMove:v19 elapsedTime:v25];
      [(RCPSyntheticEventStream *)self touchMoveInterval];
      uint64_t v19 = (v19 + 1);
    }
    while (v25 < a6 - v26);
  }
  -[RCPSyntheticEventStream liftUpAtPoints:touchCount:](self, "liftUpAtPoints:touchCount:", &v27 - 2 * v12, v12, *(void *)&v27);
  [(RCPSyntheticEventStream *)self setActivePointCount:0];
}

- (void)_dragWithStartPoint:(CGPoint)a3 mask:(unint64_t)a4 endPoint:(CGPoint)a5 mask:(unint64_t)a6 duration:(double)a7 tapAndWait:(double)a8 lift:(BOOL)a9 pressure:(double)a10 radius:(double)a11
{
  double y = a5.y;
  double x = a5.x;
  CGPoint v30 = a3;
  [(RCPSyntheticEventStream *)self touchMoveInterval];
  double v22 = v21;
  uint64_t v29 = a4;
  [(RCPSyntheticEventStream *)self _touchDownAtPoints:&v30 touchCount:1 pressure:&v29 radius:a10 edgeMaskOptions:a11];
  if (a8 > 0.0) {
    [(RCPSyntheticEventStream *)self advanceTime:a8];
  }
  int v23 = llround(a7 / v22);
  if (v23 >= 2)
  {
    unsigned int v24 = 0;
    double currentTimeOffset = self->_currentTimeOffset;
    unsigned int v26 = v23 - 1;
    do
    {
      [(RCPSyntheticEventStream *)self advanceTime:v22];
      double v27 = -[RCPSyntheticEventStream _nextTouchLocationFrom:to:at:](self, v30.x, v30.y, x, y, (self->_currentTimeOffset - currentTimeOffset) / a7);
      if (v24 >= v26 / 3) {
        unint64_t v28 = a6;
      }
      else {
        unint64_t v28 = a4;
      }
      [(RCPSyntheticEventStream *)self _moveLastTouchPoint:v28 eventMask:v27];
      ++v24;
    }
    while (v26 != v24);
  }
  [(RCPSyntheticEventStream *)self advanceTime:v22];
  if (a9) {
    -[RCPSyntheticEventStream liftUp:](self, "liftUp:", x, y);
  }
}

- (void)_flickWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 pressure:(double)a6 radius:(double)a7
{
  double y = a4.y;
  double x = a4.x;
  double v10 = a3.y;
  double v11 = a3.x;
  double currentTimeOffset = self->_currentTimeOffset;
  -[RCPSyntheticEventStream touchDown:touchCount:pressure:radius:](self, "touchDown:touchCount:pressure:radius:", 1, a3.x, a3.y, a6, a7);
  [(RCPSyntheticEventStream *)self touchMoveInterval];
  if (a5 - v14 > 0.0)
  {
    uint64_t v15 = 0;
    double v16 = 0.0;
    do
    {
      [(RCPSyntheticEventStream *)self _delayBetweenMove:v15 elapsedTime:v16];
      double v16 = self->_currentTimeOffset - currentTimeOffset;
      -[RCPSyntheticEventStream _moveLastTouchPoint:eventMask:](self, "_moveLastTouchPoint:eventMask:", 0, -[RCPSyntheticEventStream _nextTouchLocationFrom:to:at:](self, v11, v10, x, y, v16 / a5 * (v16 / a5)));
      uint64_t v15 = (v15 + 1);
      [(RCPSyntheticEventStream *)self touchMoveInterval];
    }
    while (v16 < a5 - v17);
  }
  -[RCPSyntheticEventStream liftUp:](self, "liftUp:", x, y);
}

- (void)pinchOpenWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  double v8 = a3.y;
  double v9 = a3.x;
  [(RCPSyntheticEventStream *)self defaultPressure];
  double v12 = v11;
  [(RCPSyntheticEventStream *)self defaultRadius];
  -[RCPSyntheticEventStream pinchOpenWithStartPoint:endPoint:duration:pressure:radius:](self, "pinchOpenWithStartPoint:endPoint:duration:pressure:radius:", v9, v8, x, y, a5, v12, v13);
}

- (void)pinchOpenWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 radius:(double)a6
{
  double y = a4.y;
  double x = a4.x;
  double v10 = a3.y;
  double v11 = a3.x;
  [(RCPSyntheticEventStream *)self defaultPressure];
  -[RCPSyntheticEventStream pinchOpenWithStartPoint:endPoint:duration:pressure:radius:](self, "pinchOpenWithStartPoint:endPoint:duration:pressure:radius:", v11, v10, x, y, a5, v13, a6);
}

- (void)pinchOpenWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 pressure:(double)a6
{
  double y = a4.y;
  double x = a4.x;
  double v10 = a3.y;
  double v11 = a3.x;
  [(RCPSyntheticEventStream *)self defaultRadius];
  -[RCPSyntheticEventStream pinchOpenWithStartPoint:endPoint:duration:pressure:radius:](self, "pinchOpenWithStartPoint:endPoint:duration:pressure:radius:", v11, v10, x, y, a5, a6, v13);
}

- (void)pinchOpenWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 pressure:(double)a6 radius:(double)a7
{
  double y = a4.y;
  double x = a4.x;
  double v10 = a3.y;
  double v11 = a3.x;
  double currentTimeOffset = self->_currentTimeOffset;
  -[RCPSyntheticEventStream touchDown:touchCount:pressure:radius:](self, "touchDown:touchCount:pressure:radius:", 1, a3.x, a3.y, a6, a7);
  double v14 = -[RCPSyntheticEventStream _nextTouchLocationFrom:to:at:](self, v11, v10, x, y, 0.1);
  double v16 = v15;
  -[RCPSyntheticEventStream touchDown:touchCount:pressure:radius:](self, "touchDown:touchCount:pressure:radius:", 1);
  [(RCPSyntheticEventStream *)self touchMoveInterval];
  if (a5 - v17 > 0.0)
  {
    uint64_t v18 = 0;
    do
    {
      double v19 = self->_currentTimeOffset - currentTimeOffset;
      -[RCPSyntheticEventStream _moveLastTouchPoint:eventMask:](self, "_moveLastTouchPoint:eventMask:", 0, -[RCPSyntheticEventStream _nextTouchLocationFrom:to:at:](self, v14, v16, x, y, v19 / a5));
      [(RCPSyntheticEventStream *)self _delayBetweenMove:v18 elapsedTime:v19];
      [(RCPSyntheticEventStream *)self touchMoveInterval];
      uint64_t v18 = (v18 + 1);
    }
    while (v19 < a5 - v20);
  }
  -[RCPSyntheticEventStream _moveLastTouchPoint:eventMask:](self, "_moveLastTouchPoint:eventMask:", 0, x, y);
  [(RCPSyntheticEventStream *)self advanceTime:0.05];
  -[RCPSyntheticEventStream liftUp:](self, "liftUp:", x, y);
  -[RCPSyntheticEventStream liftUp:](self, "liftUp:", v14, v16);
}

- (void)pinchCloseWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  double v8 = a3.y;
  double v9 = a3.x;
  [(RCPSyntheticEventStream *)self defaultPressure];
  double v12 = v11;
  [(RCPSyntheticEventStream *)self defaultRadius];
  -[RCPSyntheticEventStream pinchCloseWithStartPoint:endPoint:duration:pressure:radius:](self, "pinchCloseWithStartPoint:endPoint:duration:pressure:radius:", v9, v8, x, y, a5, v12, v13);
}

- (void)pinchCloseWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 pressure:(double)a6
{
  double y = a4.y;
  double x = a4.x;
  double v10 = a3.y;
  double v11 = a3.x;
  [(RCPSyntheticEventStream *)self defaultRadius];
  -[RCPSyntheticEventStream pinchCloseWithStartPoint:endPoint:duration:pressure:radius:](self, "pinchCloseWithStartPoint:endPoint:duration:pressure:radius:", v11, v10, x, y, a5, a6, v13);
}

- (void)pinchCloseWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 radius:(double)a6
{
  double y = a4.y;
  double x = a4.x;
  double v10 = a3.y;
  double v11 = a3.x;
  [(RCPSyntheticEventStream *)self defaultPressure];
  -[RCPSyntheticEventStream pinchCloseWithStartPoint:endPoint:duration:pressure:radius:](self, "pinchCloseWithStartPoint:endPoint:duration:pressure:radius:", v11, v10, x, y, a5, v13, a6);
}

- (void)pinchCloseWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 duration:(double)a5 pressure:(double)a6 radius:(double)a7
{
  double y = a4.y;
  double x = a4.x;
  double v10 = a3.y;
  double v11 = a3.x;
  double currentTimeOffset = self->_currentTimeOffset;
  -[RCPSyntheticEventStream touchDown:](self, "touchDown:", a4.x, a4.y);
  -[RCPSyntheticEventStream touchDown:](self, "touchDown:", v11, v10);
  [(RCPSyntheticEventStream *)self touchMoveInterval];
  if (a5 - v14 > 0.0)
  {
    uint64_t v15 = 0;
    do
    {
      double v16 = self->_currentTimeOffset - currentTimeOffset;
      -[RCPSyntheticEventStream _moveLastTouchPoint:eventMask:](self, "_moveLastTouchPoint:eventMask:", 0, -[RCPSyntheticEventStream _nextTouchLocationFrom:to:at:](self, v11, v10, x, y, v16 / a5));
      [(RCPSyntheticEventStream *)self _delayBetweenMove:v15 elapsedTime:v16];
      [(RCPSyntheticEventStream *)self touchMoveInterval];
      uint64_t v15 = (v15 + 1);
    }
    while (v16 < a5 - v17);
  }
  double v18 = -[RCPSyntheticEventStream _nextTouchLocationFrom:to:at:](self, v11, v10, x, y, 0.9);
  double v20 = v19;
  -[RCPSyntheticEventStream _moveLastTouchPoint:eventMask:](self, "_moveLastTouchPoint:eventMask:", 0);
  -[RCPSyntheticEventStream liftUp:](self, "liftUp:", v18, v20);
  [(RCPSyntheticEventStream *)self advanceTime:0.05];
  -[RCPSyntheticEventStream liftUp:](self, "liftUp:", x, y);
}

- (void)peekAndPop:(CGPoint)a3 commit:(BOOL)a4 duration:(double)a5
{
  BOOL v6 = a4;
  double y = a3.y;
  double x = a3.x;
  [(RCPSyntheticEventStream *)self defaultPressure];
  double v11 = v10;
  [(RCPSyntheticEventStream *)self defaultRadius];
  -[RCPSyntheticEventStream peekAndPop:commit:duration:pressure:radius:](self, "peekAndPop:commit:duration:pressure:radius:", v6, x, y, a5, v11, v12);
}

- (void)peekAndPop:(CGPoint)a3 commit:(BOOL)a4 duration:(double)a5 presure:(double)a6
{
  BOOL v8 = a4;
  double y = a3.y;
  double x = a3.x;
  [(RCPSyntheticEventStream *)self defaultRadius];
  -[RCPSyntheticEventStream peekAndPop:commit:duration:pressure:radius:](self, "peekAndPop:commit:duration:pressure:radius:", v8, x, y, a5, a6, v12);
}

- (void)peekAndPop:(CGPoint)a3 commit:(BOOL)a4 duration:(double)a5 radius:(double)a6
{
  BOOL v8 = a4;
  double y = a3.y;
  double x = a3.x;
  [(RCPSyntheticEventStream *)self defaultPressure];
  -[RCPSyntheticEventStream peekAndPop:commit:duration:pressure:radius:](self, "peekAndPop:commit:duration:pressure:radius:", v8, x, y, a5, v12, a6);
}

- (void)peekAndPop:(CGPoint)a3 commit:(BOOL)a4 duration:(double)a5 pressure:(double)a6 radius:(double)a7
{
  BOOL v9 = a4;
  CGPoint v11 = a3;
  [(RCPSyntheticEventStream *)self _touchDownAtPoints:&v11 touchCount:1 pressure:0 radius:a6 edgeMaskOptions:a7];
  [(RCPSyntheticEventStream *)self moveToPoints:&v11 touchCount:1 pressure:300.0 duration:0.5 radius:a7];
  [(RCPSyntheticEventStream *)self moveToPoints:&v11 touchCount:1 pressure:150.0 duration:0.2 radius:a7];
  [(RCPSyntheticEventStream *)self advanceTime:a5];
  if (v9) {
    [(RCPSyntheticEventStream *)self moveToPoints:&v11 touchCount:1 pressure:700.0 duration:0.8 radius:a7];
  }
  [(RCPSyntheticEventStream *)self liftUpAtPoints:&v11 touchCount:1];
}

- (__IOHIDEvent)_parentZeroPointerEvent
{
  [(RCPSyntheticEventStream *)self _currentMachTime];
  RelativePointerEvent = (const void *)IOHIDEventCreateRelativePointerEvent();
  return (__IOHIDEvent *)CFAutorelease(RelativePointerEvent);
}

- (void)_wrapInPointerParentAndAddToProcessingBuffer:(__IOHIDEvent *)a3
{
  [(RCPSyntheticEventStream *)self _currentMachTime];
  RelativePointerEvent = (const void *)IOHIDEventCreateRelativePointerEvent();
  IOHIDEventAppendEvent();
  [(RCPSyntheticEventStream *)self _addIOHIDEventToProcessingBuffer:RelativePointerEvent];
  CFRelease(RelativePointerEvent);
}

- (void)pointerSetAbsolutePosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(RCPSyntheticEventStream *)self _currentMachTime];
  BOOL v6 = (const void *)IOHIDEventCreate();
  BOOL v7 = [(RCPSyntheticEventStream *)self pointerChildEventStream];
  objc_msgSend(v7, "setCurrentPointerLocation:", x, y);

  -[RCPSyntheticEventStream _normalizePoint:](self, "_normalizePoint:", x, y);
  double v9 = v8;
  double v11 = v10;
  double v12 = [(RCPSyntheticEventStream *)self pointerChildEventStream];
  objc_msgSend(v12, "orientedNormalPoint:", v9, v11);

  IOHIDEventSetFloatValue();
  IOHIDEventSetFloatValue();
  [(RCPSyntheticEventStream *)self _addIOHIDEventToProcessingBuffer:v6];
  CFRelease(v6);
}

- (void)pointerMoveDelta:(CGPoint)a3 duration:(double)a4 frequency:(int64_t)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__RCPSyntheticEventStream_pointerMoveDelta_duration_frequency___block_invoke;
  v5[3] = &unk_1E5D77370;
  v5[4] = self;
  CGPoint v6 = a3;
  double v7 = a4;
  [(RCPSyntheticEventStream *)self _withPointerEventStreamAtFrequency:a5 perform:v5];
}

uint64_t __63__RCPSyntheticEventStream_pointerMoveDelta_duration_frequency___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pointerMoveByDelta:duration:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)pointerMoveByDelta:(CGVector)a3 duration:(double)a4
{
  ddouble y = a3.dy;
  ddouble x = a3.dx;
  double v8 = [(RCPSyntheticEventStream *)self pointerChildEventStream];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__RCPSyntheticEventStream_pointerMoveByDelta_duration___block_invoke;
  v9[3] = &unk_1E5D77370;
  v9[4] = self;
  *(CGFloat *)&v9[5] = dx;
  *(CGFloat *)&v9[6] = dy;
  *(double *)&v9[7] = a4;
  [(RCPSyntheticEventStream *)self withExclusiveChildStream:v8 perform:v9];
}

void __55__RCPSyntheticEventStream_pointerMoveByDelta_duration___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pointerChildEventStream];
  objc_msgSend(v2, "moveByDelta:duration:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)pointerMoveToPoint:(CGPoint)a3 duration:(double)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  double v8 = [(RCPSyntheticEventStream *)self pointerChildEventStream];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__RCPSyntheticEventStream_pointerMoveToPoint_duration___block_invoke;
  v9[3] = &unk_1E5D77370;
  v9[4] = self;
  *(CGFloat *)&v9[5] = x;
  *(CGFloat *)&v9[6] = y;
  *(double *)&v9[7] = a4;
  [(RCPSyntheticEventStream *)self withExclusiveChildStream:v8 perform:v9];
}

void __55__RCPSyntheticEventStream_pointerMoveToPoint_duration___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pointerChildEventStream];
  objc_msgSend(v2, "moveToPoint:duration:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)pointerMoveFromOriginPoint:(CGPoint)a3 toDestinationPoint:(CGPoint)a4 duration:(double)a5 frequency:(int64_t)a6
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __92__RCPSyntheticEventStream_pointerMoveFromOriginPoint_toDestinationPoint_duration_frequency___block_invoke;
  v6[3] = &unk_1E5D77438;
  v6[4] = self;
  CGPoint v7 = a3;
  CGPoint v8 = a4;
  double v9 = a5;
  [(RCPSyntheticEventStream *)self _withPointerEventStreamAtFrequency:a6 perform:v6];
}

uint64_t __92__RCPSyntheticEventStream_pointerMoveFromOriginPoint_toDestinationPoint_duration_frequency___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "pointerMoveToPoint:duration:", *(double *)(a1 + 40), *(double *)(a1 + 48), 0.1);
  id v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 64);
  double v4 = *(double *)(a1 + 72);
  double v5 = *(double *)(a1 + 56);
  return objc_msgSend(v2, "pointerMoveToPoint:duration:", v5, v3, v4);
}

- (double)_nextPointerDeltaFrom:(uint64_t)a3 to:(double)a4 step:(double)a5 steps:(double)a6
{
  if (!a1) {
    return 0.0;
  }
  double v13 = [a1 pointerCurveFunction];
  objc_msgSend(v13, "rcp_solveForDelta:withSteps:step:", a3, a2, a6 - a4, a7 - a5);
  double v15 = v14;

  return v15;
}

- (void)pointerDiscreteScroll:(CGPoint)a3 duration:(double)a4 frequency:(int64_t)a5
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v7 = vcvtpd_s64_f64((double)a5 * a4);
  if (v7 >= 1)
  {
    uint64_t v9 = 0;
    double v10 = *MEMORY[0x1E4F1DAD8];
    double v11 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v12 = 1.0 / (double)a5;
    do
    {
      -[RCPSyntheticEventStream _nextPointerDeltaFrom:to:step:steps:](self, v9, v7, v10, v11, x, y);
      [(RCPSyntheticEventStream *)self _currentMachTime];
      ScrollEvent = (const void *)IOHIDEventCreateScrollEvent();
      [(RCPSyntheticEventStream *)self _addIOHIDEventToProcessingBuffer:ScrollEvent];
      CFRelease(ScrollEvent);
      [(RCPSyntheticEventStream *)self advanceTime:v12];
      ++v9;
    }
    while (v7 != v9);
  }
}

- (void)pointerDiscreteScroll:(CGPoint)a3 duration:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  [(RCPSyntheticEventStream *)self pointerFrequency];
  -[RCPSyntheticEventStream pointerDiscreteScroll:duration:frequency:](self, "pointerDiscreteScroll:duration:frequency:", (uint64_t)v8, x, y, a4);
}

- (void)pointerPhasedScroll:(CGPoint)a3 duration:(double)a4 frequency:(int64_t)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  double v10 = objc_alloc_init(RCPScrollEventStream);
  [(RCPScrollEventStream *)v10 setFrequency:(double)a5];
  if (self->_scalePointerPhaseScrollToPixels)
  {
    [(RCPSyntheticEventStream *)self gsScreenScaleFactor];
    -[RCPScrollEventStream setDeltaToPixelsScaleFactor:](v10, "setDeltaToPixelsScaleFactor:");
  }
  double v11 = [(RCPSyntheticEventStream *)self pointerCurveFunction];
  [(RCPScrollEventStream *)v10 setPointerCurveFunction:v11];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__RCPSyntheticEventStream_pointerPhasedScroll_duration_frequency___block_invoke;
  v13[3] = &unk_1E5D77370;
  double v14 = v10;
  CGFloat v15 = x;
  CGFloat v16 = y;
  double v17 = a4;
  double v12 = v10;
  [(RCPSyntheticEventStream *)self withExclusiveChildStream:v12 perform:v13];
}

uint64_t __66__RCPSyntheticEventStream_pointerPhasedScroll_duration_frequency___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "advanceByDelta:duration:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)pointerPhasedScroll:(CGPoint)a3 duration:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  [(RCPSyntheticEventStream *)self pointerFrequency];
  -[RCPSyntheticEventStream pointerPhasedScroll:duration:frequency:](self, "pointerPhasedScroll:duration:frequency:", (uint64_t)v8, x, y, a4);
}

- (void)pointerPhasedFlick:(CGPoint)a3 duration:(double)a4 frequency:(int64_t)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  double v10 = objc_alloc_init(RCPScrollEventStream);
  [(RCPScrollEventStream *)v10 setFrequency:(double)a5];
  if (self->_scalePointerPhaseScrollToPixels)
  {
    [(RCPSyntheticEventStream *)self gsScreenScaleFactor];
    -[RCPScrollEventStream setDeltaToPixelsScaleFactor:](v10, "setDeltaToPixelsScaleFactor:");
  }
  double v11 = [(RCPSyntheticEventStream *)self pointerCurveFunction];
  double v12 = objc_msgSend(v11, "rcp_functionWithLinearEnd");
  [(RCPScrollEventStream *)v10 setPointerCurveFunction:v12];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __65__RCPSyntheticEventStream_pointerPhasedFlick_duration_frequency___block_invoke;
  v14[3] = &unk_1E5D77370;
  CGFloat v15 = v10;
  CGFloat v16 = x;
  CGFloat v17 = y;
  double v18 = a4;
  double v13 = v10;
  [(RCPSyntheticEventStream *)self withExclusiveChildStream:v13 perform:v14];
}

uint64_t __65__RCPSyntheticEventStream_pointerPhasedFlick_duration_frequency___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "advanceByDelta:duration:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)pointerPhasedFlick:(CGPoint)a3 duration:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  [(RCPSyntheticEventStream *)self pointerFrequency];
  -[RCPSyntheticEventStream pointerPhasedFlick:duration:frequency:](self, "pointerPhasedFlick:duration:frequency:", (uint64_t)v8, x, y, a4);
}

- (void)pointerDiscreteGesture:(id)a3 duration:(double)a4 frequency:(int64_t)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  double v8 = (double)a5;
  uint64_t v9 = vcvtpd_s64_f64((double)a5 * a4);
  if (v9 >= 1)
  {
    uint64_t v10 = 0;
    double v11 = *MEMORY[0x1E4F1DAD8];
    double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v35 = 1.0 / v8;
    do
    {
      double v13 = [(RCPSyntheticEventStream *)self _parentZeroPointerEvent];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      obuint64_t j = v36;
      uint64_t v14 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (!v14) {
        goto LABEL_18;
      }
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v39;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v39 != v16) {
            objc_enumerationMutation(obj);
          }
          double v18 = *(void **)(*((void *)&v38 + 1) + 8 * v17);
          if ([v18 isScale])
          {
            LODWORD(v19) = 1056437569;
            LODWORD(v20) = 1026291025;
            LODWORD(v21) = 1057228128;
            LODWORD(v22) = 1064648875;
            int v23 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v19 :v20 :v21 :v22];
            [v18 z];
            objc_msgSend(v23, "rcp_solveForDelta:withSteps:step:", v9, v10);
            [(RCPSyntheticEventStream *)self _currentMachTime];
            uint64_t ScaleEvent = IOHIDEventCreateScaleEvent();
LABEL_12:
            uint64_t v29 = (const void *)ScaleEvent;
            IOHIDEventAppendEvent();
            CFRelease(v29);

            goto LABEL_13;
          }
          if ([v18 isRotation])
          {
            LODWORD(v25) = 1056437569;
            LODWORD(v26) = 1026291025;
            LODWORD(v27) = 1057228128;
            LODWORD(v28) = 1064648875;
            int v23 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v25 :v26 :v27 :v28];
            [v18 z];
            objc_msgSend(v23, "rcp_solveForDelta:withSteps:step:", v9, v10);
            [(RCPSyntheticEventStream *)self _currentMachTime];
            uint64_t ScaleEvent = IOHIDEventCreateRotationEvent();
            goto LABEL_12;
          }
          if ([v18 isTranslation])
          {
            [v18 x];
            double v31 = v30;
            [v18 y];
            -[RCPSyntheticEventStream _nextPointerDeltaFrom:to:step:steps:](self, v9, v10, v11, v12, v31, v32);
            [(RCPSyntheticEventStream *)self _currentMachTime];
            TranslationEvent = (const void *)IOHIDEventCreateTranslationEvent();
            IOHIDEventAppendEvent();
            CFRelease(TranslationEvent);
          }
LABEL_13:
          ++v17;
        }
        while (v15 != v17);
        uint64_t v34 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
        uint64_t v15 = v34;
      }
      while (v34);
LABEL_18:

      [(RCPSyntheticEventStream *)self _addIOHIDEventToProcessingBuffer:v13];
      [(RCPSyntheticEventStream *)self advanceTime:v35];
      ++v10;
    }
    while (v10 != v9);
  }
}

- (void)pointerScale:(double)a3 duration:(double)a4 frequency:(int64_t)a5
{
  double v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v10 = +[RCPDiscreteGestureSpec scaleZ:a3];
  uint64_t v9 = [v8 setWithObject:v10];
  [(RCPSyntheticEventStream *)self pointerDiscreteGesture:v9 duration:a5 frequency:a4];
}

- (void)pointerRotation:(double)a3 duration:(double)a4 frequency:(int64_t)a5
{
  double v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v10 = +[RCPDiscreteGestureSpec rotationZ:a3];
  uint64_t v9 = [v8 setWithObject:v10];
  [(RCPSyntheticEventStream *)self pointerDiscreteGesture:v9 duration:a5 frequency:a4];
}

- (void)pointerTranslatation:(CGPoint)a3 duration:(double)a4 frequency:(int64_t)a5
{
  double v8 = (void *)MEMORY[0x1E4F1CAD0];
  +[RCPDiscreteGestureSpec translation:](RCPDiscreteGestureSpec, "translation:", a3.x, a3.y);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 setWithObject:v10];
  [(RCPSyntheticEventStream *)self pointerDiscreteGesture:v9 duration:a5 frequency:a4];
}

- (void)_pressButtonEventForIndex:(int64_t)a3 down:(BOOL)a4
{
  [(RCPSyntheticEventStream *)self _currentMachTime];
  double v5 = (const void *)IOHIDEventCreate();
  IOHIDEventSetIntegerValue();
  IOHIDEventSetIntegerValue();
  IOHIDEventSetIntegerValue();
  [(RCPSyntheticEventStream *)self _wrapInPointerParentAndAddToProcessingBuffer:v5];
  CFRelease(v5);
}

- (void)pointerBeginPressingButton:(int64_t)a3
{
}

- (void)pointerEndPressingButton:(int64_t)a3
{
}

- (void)_withPointerEventStreamAtFrequency:(int64_t)a3 perform:(id)a4
{
  CGPoint v6 = (void (**)(void))a4;
  uint64_t v7 = [(RCPSyntheticEventStream *)self pointerChildEventStream];
  [v7 frequency];
  double v9 = v8;

  double v10 = (double)a3;
  double v11 = [(RCPSyntheticEventStream *)self pointerChildEventStream];
  [v11 setFrequency:v10];

  v6[2](v6);
  id v12 = [(RCPSyntheticEventStream *)self pointerChildEventStream];
  [v12 setFrequency:(double)(uint64_t)v9];
}

- (void)_hoverAtPoints:(CGPoint *)a3 touchCount:(unint64_t)a4 pressure:(double)a5 radius:(double)a6 edgeMaskOptions:(id *)a7 withEventType:(int64_t)a8 withZPosition:(double)a9 withAzimuthAngle:(double)a10 withRollAngle:(double)a11 withAltitudeAngle:(double)a12
{
  if (a4)
  {
    unint64_t v21 = a4;
    do
    {
      unint64_t v23 = [(RCPSyntheticEventStream *)self activePointCount];
      double x = a3->x;
      double y = a3->y;
      *(CGPoint *)([(RCPSyntheticEventStream *)self activePoints] + 80 * v23 + 32) = *a3;
      *(double *)([(RCPSyntheticEventStream *)self activePoints] + 80 * v23 + 56) = a5;
      *(double *)([(RCPSyntheticEventStream *)self activePoints] + 80 * v23) = a9;
      *(double *)([(RCPSyntheticEventStream *)self activePoints] + 80 * v23 + 16) = a10;
      *(double *)([(RCPSyntheticEventStream *)self activePoints] + 80 * v23 + 8) = a11;
      *(double *)([(RCPSyntheticEventStream *)self activePoints] + 80 * v23 + 24) = a12;
      if (a7 && !a7->var1)
      {
        unsigned int var0 = a7->var0;
        *(_DWORD *)([(RCPSyntheticEventStream *)self activePoints] + 80 * v23 + 68) = var0;
      }
      else
      {
        -[RCPSyntheticEventStream _normalizePoint:](self, "_normalizePoint:", x, y);
        double v27 = v26;
        double v29 = v28;
        *(_DWORD *)([(RCPSyntheticEventStream *)self activePoints] + 80 * v23 + 68) = 0;
        -[RCPSyntheticEventStream _isEdgePoint:getMask:](self, "_isEdgePoint:getMask:", [(RCPSyntheticEventStream *)self activePoints] + 80 * v23 + 68, v27, v29);
      }
      uint64_t v31 = 5 * v23;
      *(unsigned char *)([(RCPSyntheticEventStream *)self activePoints] + 16 * v31 + 72) = 0;
      *(double *)([(RCPSyntheticEventStream *)self activePoints] + 16 * v31 + 48) = a6;
      [(RCPSyntheticEventStream *)self setActivePointCount:[(RCPSyntheticEventStream *)self activePointCount] + 1];
      ++a3;
      --v21;
    }
    while (v21);
  }
  double v32 = -[RCPSyntheticEventStream _createIOHIDWithEventType:](self, "_createIOHIDWithEventType:", a8, a5, a6, a9, a10, a11, a12);
  [(RCPSyntheticEventStream *)self _addIOHIDEventToProcessingBuffer:v32];
  CFRelease(v32);
}

- (void)hoverAtLocation:(CGPoint)a3 withDuration:(double)a4
{
  CGPoint v6 = a3;
  [(RCPSyntheticEventStream *)self _hoverAtPoints:&v6 touchCount:1 pressure:0 radius:9 edgeMaskOptions:0.0 withEventType:0.0 withZPosition:5.0 withAzimuthAngle:0.0 withRollAngle:0.0 withAltitudeAngle:0.785398163];
  [(RCPSyntheticEventStream *)self advanceTime:a4];
  [(RCPSyntheticEventStream *)self liftUpAtAllActivePointsWithEventType:9];
}

- (void)hoverToTapAtLocation:(CGPoint)a3 withDuration:(double)a4
{
  CGPoint v6 = a3;
  [(RCPSyntheticEventStream *)self _hoverAtPoints:&v6 touchCount:1 pressure:0 radius:12 edgeMaskOptions:0.0 withEventType:0.0 withZPosition:5.0 withAzimuthAngle:0.0 withRollAngle:0.0 withAltitudeAngle:0.785398163];
  [(RCPSyntheticEventStream *)self advanceTime:a4];
  [(RCPSyntheticEventStream *)self liftUpAtAllActivePointsWithEventType:10];
}

- (void)hoverAtLocation:(CGPoint)a3 withDuration:(double)a4 withZPosition:(double)a5
{
  CGPoint v7 = a3;
  [(RCPSyntheticEventStream *)self _hoverAtPoints:&v7 touchCount:1 pressure:0 radius:9 edgeMaskOptions:0.0 withEventType:0.0 withZPosition:a5 withAzimuthAngle:0.0 withRollAngle:0.0 withAltitudeAngle:0.785398163];
  [(RCPSyntheticEventStream *)self advanceTime:a4];
  [(RCPSyntheticEventStream *)self liftUpAtAllActivePointsWithEventType:10];
}

- (void)hoverAtLocation:(CGPoint)a3 withDuration:(double)a4 withZPosition:(double)a5 withAltitudeAngle:(double)a6 withAzimuthAngle:(double)a7 withRollAngle:(double)a8
{
  CGPoint v10 = a3;
  [(RCPSyntheticEventStream *)self _hoverAtPoints:&v10 touchCount:1 pressure:0 radius:9 edgeMaskOptions:0.0 withEventType:0.0 withZPosition:a5 withAzimuthAngle:a7 withRollAngle:a8 withAltitudeAngle:a6];
  [(RCPSyntheticEventStream *)self advanceTime:a4];
  [(RCPSyntheticEventStream *)self liftUpAtAllActivePointsWithEventType:10];
}

- (void)hover:(CGPoint)a3 withZPosition:(double)a4 withAltitudeAngle:(double)a5 withAzimuthAngle:(double)a6 withRollAngle:(double)a7
{
  CGPoint v7 = a3;
  [(RCPSyntheticEventStream *)self _hoverAtPoints:&v7 touchCount:1 pressure:0 radius:9 edgeMaskOptions:0.0 withEventType:0.0 withZPosition:a4 withAzimuthAngle:a6 withRollAngle:a7 withAltitudeAngle:a5];
}

- (void)hoverToTapAtLocation:(CGPoint)a3 withDuration:(double)a4 withZPosition:(double)a5
{
  CGPoint v7 = a3;
  [(RCPSyntheticEventStream *)self _hoverAtPoints:&v7 touchCount:1 pressure:0 radius:12 edgeMaskOptions:0.0 withEventType:0.0 withZPosition:a5 withAzimuthAngle:0.0 withRollAngle:0.0 withAltitudeAngle:0.785398163];
  [(RCPSyntheticEventStream *)self advanceTime:a4];
  [(RCPSyntheticEventStream *)self liftUpAtAllActivePointsWithEventType:10];
}

- (void)hover:(CGPoint)a3 withZPosition:(double)a4
{
  CGPoint v4 = a3;
  [(RCPSyntheticEventStream *)self _hoverAtPoints:&v4 touchCount:1 pressure:0 radius:9 edgeMaskOptions:0.0 withEventType:0.0 withZPosition:a4 withAzimuthAngle:0.0 withRollAngle:0.0 withAltitudeAngle:0.785398163];
}

- (void)hoverToTap:(CGPoint)a3 withZPosition:(double)a4
{
  CGPoint v4 = a3;
  [(RCPSyntheticEventStream *)self _hoverAtPoints:&v4 touchCount:1 pressure:0 radius:12 edgeMaskOptions:0.0 withEventType:0.0 withZPosition:a4 withAzimuthAngle:0.0 withRollAngle:0.0 withAltitudeAngle:0.785398163];
}

- (void)stylusBarrelDoubleTap
{
  [(RCPSyntheticEventStream *)self _currentMachTime];
  GenericGestureEvent = (const void *)IOHIDEventCreateGenericGestureEvent();
  IOHIDEventSetIntegerValue();
  IOHIDEventSetPhase();
  [(RCPSyntheticEventStream *)self _addIOHIDEventToProcessingBuffer:GenericGestureEvent];
  CFRelease(GenericGestureEvent);
}

- (void)barrelRollAtLocation:(CGPoint)a3 withZPosition:(double)a4 withAltitudeAngle:(double)a5 withAzimuthAngle:(double)a6 withRollAngle:(double)a7
{
  CGPoint v9 = a3;
  [(RCPSyntheticEventStream *)self _hoverAtPoints:&v9 touchCount:1 pressure:0 radius:9 edgeMaskOptions:0.0 withEventType:0.0 withZPosition:a4 withAzimuthAngle:0.0 withRollAngle:0.0 withAltitudeAngle:0.785398163];
  [(RCPSyntheticEventStream *)self _currentMachTime];
  GenericGestureEvent = (const void *)IOHIDEventCreateGenericGestureEvent();
  IOHIDEventSetFloatValue();
  IOHIDEventSetFloatValue();
  IOHIDEventSetFloatValue();
  IOHIDEventSetPhase();
  [(RCPSyntheticEventStream *)self _addIOHIDEventToProcessingBuffer:GenericGestureEvent];
  CFRelease(GenericGestureEvent);
}

- (void)_squeezeWithPhase:(unsigned __int16)a3 withPage:(id)a4 withUsage:(id)a5 withVersion:(unsigned __int8)a6 withStage:(unsigned int)a7 withTransition:(unsigned int)a8 withNextThreshold:(double)a9 withPressedThreshold:(double)a10 withReleasedThreshold:(double)a11 withNormalizedForce:(double)a12 withNormalizedForceVelocity:(double)a13
{
  unint64_t v20 = __PAIR64__(a8, a7);
  double v21 = a9;
  double v22 = a11;
  double v23 = a12;
  double v24 = a13;
  id v15 = a5;
  id v16 = a4;
  [(RCPSyntheticEventStream *)self _currentMachTime];
  GenericGestureEvent = (const void *)IOHIDEventCreateGenericGestureEvent();
  double v18 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v20 length:48];
  [(RCPSyntheticEventStream *)self _currentMachTime];
  [v16 unsignedIntValue];

  [v15 unsignedIntValue];
  id v19 = v18;
  [v19 bytes];
  [v19 length];
  IOHIDEventCreateVendorDefinedEvent();
  IOHIDEventAppendEvent();
  IOHIDEventSetPhase();
  [(RCPSyntheticEventStream *)self _addIOHIDEventToProcessingBuffer:GenericGestureEvent];
  CFRelease(GenericGestureEvent);
}

- (void)squeeze
{
  [(RCPSyntheticEventStream *)self _squeezeWithPhase:1 withPage:&unk_1EFF9AA88 withUsage:&unk_1EFF9AAA0 withVersion:0 withStage:1 withTransition:1 withNextThreshold:1.0 withPressedThreshold:5.0 withReleasedThreshold:4.0 withNormalizedForce:5.01 withNormalizedForceVelocity:4.5];
  [(RCPSyntheticEventStream *)self _squeezeWithPhase:2 withPage:&unk_1EFF9AA88 withUsage:&unk_1EFF9AAA0 withVersion:0 withStage:1 withTransition:0 withNextThreshold:1.0 withPressedThreshold:5.0 withReleasedThreshold:5.0 withNormalizedForce:0.8 withNormalizedForceVelocity:4.5];
  [(RCPSyntheticEventStream *)self _squeezeWithPhase:4 withPage:&unk_1EFF9AA88 withUsage:&unk_1EFF9AAA0 withVersion:0 withStage:1 withTransition:2 withNextThreshold:1.0 withPressedThreshold:5.0 withReleasedThreshold:4.0 withNormalizedForce:3.99 withNormalizedForceVelocity:4.5];
}

- (void)squeezeAtLocation:(CGPoint)a3
{
  CGPoint v4 = a3;
  [(RCPSyntheticEventStream *)self _hoverAtPoints:&v4 touchCount:1 pressure:0 radius:9 edgeMaskOptions:0.0 withEventType:0.0 withZPosition:5.0 withAzimuthAngle:0.0 withRollAngle:0.0 withAltitudeAngle:0.785398163];
  [(RCPSyntheticEventStream *)self squeeze];
}

- (void)_touchSensitiveButtonEventWithPhase:(unsigned __int16)a3 withPage:(id)a4 withUsage:(id)a5 withStage:(unsigned int)a6 withTransition:(unsigned int)a7 withNormalizedForce:(double)a8 withNormalizedForceVelocity:(double)a9 withNormalizedPositionX:(double)a10 withNormalizedPositionDeltaX:(double)a11 withNormalizedPositionY:(double)a12 withNormalizedPositionDeltaY:(double)a13 withMajorRadius:(double)a14 withMinorRadius:(double)a15 withMask:(unsigned int)a16 withTouch:(int)a17 withNextThreshold:(double)a18 withPressedThreshold:(double)a19 withReleasedThreshold:(double)a20
{
  id v22 = a5;
  id v23 = a4;
  [(RCPSyntheticEventStream *)self _currentMachTime];
  [v22 unsignedIntValue];

  [v23 unsignedIntValue];
  TouchSensitiveButtonEventWithRadius = (const void *)IOHIDEventCreateTouchSensitiveButtonEventWithRadius();
  [(RCPSyntheticEventStream *)self _currentMachTime];
  IOHIDEventCreateForceStageEvent();
  IOHIDEventAppendEvent();
  IOHIDEventSetPhase();
  [(RCPSyntheticEventStream *)self _addIOHIDEventToProcessingBuffer:TouchSensitiveButtonEventWithRadius];
  CFRelease(TouchSensitiveButtonEventWithRadius);
}

- (void)touchSensitiveButtonClickWithPage:(id)a3 withUsage:(id)a4 withTouch:(int)a5 withNormalizedPositionY:(double)a6 withNormalizedPositionDeltaY:(double)a7
{
  id v12 = a4;
  id v15 = a3;
  LODWORD(v13) = a5;
  -[RCPSyntheticEventStream _touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:](self, "_touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:", 1, v15, v12, 4, 1, 8, 0.002, 0.0, NAN, NAN, a6, a7, 0.0, 0.0, v13,
    0x7FF8000000000000,
    0x7FF8000000000000,
    0x7FF8000000000000);
  LODWORD(v14) = a5;
  -[RCPSyntheticEventStream _touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:](self, "_touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:", 4, v15, v12, 4, 2, 8, 0.002, 0.0, NAN, NAN, a6, a7, 0.0, 0.0, v14,
    0x7FF8000000000000,
    0x7FF8000000000000,
    0x7FF8000000000000);
}

- (void)touchSensitiveButtonHoldWithPage:(id)a3 withUsage:(id)a4 withTouch:(int)a5 withNormalizedPositionY:(double)a6 withNormalizedPositionDeltaY:(double)a7
{
  id v12 = a4;
  id v15 = a3;
  LODWORD(v13) = a5;
  -[RCPSyntheticEventStream _touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:](self, "_touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:", 1, v15, v12, 4, 1, 8, 0.002, 0.0, NAN, NAN, a6, a7, 0.0, 0.0, v13,
    0x7FF8000000000000,
    0x7FF8000000000000,
    0x7FF8000000000000);
  LODWORD(v14) = a5;
  -[RCPSyntheticEventStream _touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:](self, "_touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:", 2, v15, v12, 4, 0, 8, 0.002, 0.0, NAN, NAN, a6, a7, 0.0, 0.0, v14,
    0x7FF8000000000000,
    0x7FF8000000000000,
    0x7FF8000000000000);
}

- (void)touchSensitiveButtonHoldWithDuration:(double)a3 withPage:(id)a4 withUsage:(id)a5 withTouch:(int)a6 withNormalizedPositionY:(double)a7 withNormalizedPositionDeltaY:(double)a8
{
  [(RCPSyntheticEventStream *)self touchSensitiveButtonHoldWithPage:a4 withUsage:a5 withTouch:*(void *)&a6 withNormalizedPositionY:a7 withNormalizedPositionDeltaY:a8];
  [(RCPSyntheticEventStream *)self advanceTime:a3];
}

- (void)touchSensitiveButtonReleaseHoldWithPage:(id)a3 withUsage:(id)a4 withTouch:(int)a5 withNormalizedPositionY:(double)a6 withNormalizedPositionDeltaY:(double)a7
{
  id v12 = a4;
  id v14 = a3;
  LODWORD(v13) = a5;
  -[RCPSyntheticEventStream _touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:](self, "_touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:", 2, v14, v12, 4, 2, 4, 0.002, 0.0, NAN, NAN, a6, a7, 0.0, 0.0, v13,
    0x7FF8000000000000,
    0x7FF8000000000000,
    0x7FF8000000000000);
  [(RCPSyntheticEventStream *)self touchSensitiveButtonLiftWithPage:v14 withUsage:v12];
}

- (void)touchSensitiveButtonIntermediatePressWithPage:(id)a3 withUsage:(id)a4 withTouch:(int)a5 withNormalizedPositionY:(double)a6 withNormalizedPositionDeltaY:(double)a7
{
  id v12 = a4;
  id v16 = a3;
  LODWORD(v13) = a5;
  -[RCPSyntheticEventStream _touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:](self, "_touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:", 1, v16, v12, 1, 1, 0, 0.009602, 0.0, NAN, NAN, a6, a7, 3.3405, 0.0, v13,
    0x3FC0000000000000,
    0x3FA999999999999ALL,
    0x3FA999999999999ALL);
  LODWORD(v14) = a5;
  -[RCPSyntheticEventStream _touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:](self, "_touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:", 2, v16, v12, 2, 1, 0, 0.12584, 0.0, NAN, NAN, a6, a7, 10.314577, 0.0, v14,
    0x3FC03C4B09E98DCELL,
    0x3FC0000000000000,
    0x3FB999999999999ALL);
  LODWORD(v15) = a5;
  -[RCPSyntheticEventStream _touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:](self, "_touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:", 2, v16, v12, 3, 1, 0, 0.169056, 0.0, NAN, NAN, a6, a7, 9.957315, 0.0, v15,
    0x7FF8000000000000,
    0x3FC0000000000000,
    0x3FB999999999999ALL);
}

- (void)touchSensitiveButtonIntermediatePressWithDuration:(double)a3 withPage:(id)a4 withUsage:(id)a5 withTouch:(int)a6 withNormalizedPositionY:(double)a7 withNormalizedPositionDeltaY:(double)a8
{
  uint64_t v10 = *(void *)&a6;
  id v14 = a5;
  id v15 = a4;
  [(RCPSyntheticEventStream *)self touchSensitiveButtonIntermediatePressWithPage:v15 withUsage:v14 withTouch:v10 withNormalizedPositionY:a7 withNormalizedPositionDeltaY:a8];
  [(RCPSyntheticEventStream *)self advanceTime:a3];
  [(RCPSyntheticEventStream *)self touchSensitiveButtonLiftWithPage:v15 withUsage:v14];
}

- (void)touchSensitiveButtonLiftWithPage:(id)a3 withUsage:(id)a4
{
  id v6 = a4;
  id v10 = a3;
  LODWORD(v7) = 0;
  -[RCPSyntheticEventStream _touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:](self, "_touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:", 2, v10, v6, 3, 2, 0, 0.002767, 0.0, NAN, NAN, 0.0, 0.0, 0.0, 0.0, v7,
    0x7FF8000000000000,
    0x3FC0000000000000,
    0x3FB999999999999ALL);
  LODWORD(v8) = 0;
  -[RCPSyntheticEventStream _touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:](self, "_touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:", 2, v10, v6, 2, 2, 0, 0.002767, 0.0, NAN, NAN, 0.0, 0.0, 0.0, 0.0, v8,
    0x3F6EDBF8B9BAA151,
    0x3FC0000000000000,
    0x3FB999999999999ALL);
  LODWORD(v9) = 0;
  -[RCPSyntheticEventStream _touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:](self, "_touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:", 4, v10, v6, 1, 2, 0, 0.002767, 0.0, NAN, NAN, 0.0, 0.0, 0.0, 0.0, v9,
    0x3FC0000000000000,
    0x3FA999999999999ALL,
    0x3FA999999999999ALL);
}

- (void)touchSensitiveButtonEngagedWithPage:(id)a3 withUsage:(id)a4 withTouch:(int)a5 withNormalizedPositionY:(double)a6 withNormalizedPositionDeltaY:(double)a7
{
  id v12 = a4;
  id v16 = a3;
  LODWORD(v13) = a5;
  -[RCPSyntheticEventStream _touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:](self, "_touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:", 1, v16, v12, 1, 1, 1, 0.005953, 0.0, NAN, NAN, a6, a7, 3.964151, 0.0, v13,
    0x3FC0000000000000,
    0x3FA999999999999ALL,
    0x3FA999999999999ALL);
  LODWORD(v14) = a5;
  -[RCPSyntheticEventStream _touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:](self, "_touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:", 2, v16, v12, 1, 0, 1, 0.023871, 0.0, NAN, NAN, a6, a7, 1.715379, 0.0, v14,
    0x3FC0000000000000,
    0x3FA999999999999ALL,
    0x3FA999999999999ALL);
  LODWORD(v15) = a5;
  -[RCPSyntheticEventStream _touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:](self, "_touchSensitiveButtonEventWithPhase:withPage:withUsage:withStage:withTransition:withNormalizedForce:withNormalizedForceVelocity:withNormalizedPositionX:withNormalizedPositionDeltaX:withNormalizedPositionY:withNormalizedPositionDeltaY:withMajorRadius:withMinorRadius:withMask:withTouch:withNextThreshold:withPressedThreshold:withReleasedThreshold:", 4, v16, v12, 1, 2, 1, 0.006992, 0.0, NAN, NAN, a6, a7, 0.0, 0.0, v15,
    0x3FC0000000000000,
    0x3FA999999999999ALL,
    0x3FA999999999999ALL);
}

- (void)touchSensitiveButtonEngagedWithDuration:(double)a3 withPage:(id)a4 withUsage:(id)a5 withTouch:(int)a6 withNormalizedPositionY:(double)a7 withNormalizedPositionDeltaY:(double)a8
{
  uint64_t v10 = *(void *)&a6;
  id v14 = a5;
  id v15 = a4;
  [(RCPSyntheticEventStream *)self advanceTime:a3];
  [(RCPSyntheticEventStream *)self touchSensitiveButtonEngagedWithPage:v15 withUsage:v14 withTouch:v10 withNormalizedPositionY:a7 withNormalizedPositionDeltaY:a8];
}

- (void)touchSensitiveButtonEngagedWithLiftWithDuration:(double)a3 withPage:(id)a4 withUsage:(id)a5 withTouch:(int)a6 withNormalizedPositionY:(double)a7 withNormalizedPositionDeltaY:(double)a8
{
  uint64_t v10 = *(void *)&a6;
  id v14 = a5;
  id v15 = a4;
  [(RCPSyntheticEventStream *)self advanceTime:a3];
  [(RCPSyntheticEventStream *)self touchSensitiveButtonEngagedWithPage:v15 withUsage:v14 withTouch:v10 withNormalizedPositionY:a7 withNormalizedPositionDeltaY:a8];
  [(RCPSyntheticEventStream *)self touchSensitiveButtonLiftWithPage:v15 withUsage:v14];
}

- (void)vendorEventWithPage:(id)a3 withUsage:(id)a4 withVersion:(unsigned __int8)a5
{
}

- (void)vendorEventWithPage:(id)a3 withUsage:(id)a4 withVersion:(unsigned __int8)a5 withData:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  [(RCPSyntheticEventStream *)self _currentMachTime];
  [v11 unsignedIntValue];

  [v10 unsignedIntValue];
  id v12 = v9;
  [v12 bytes];
  [v12 length];

  VendorDefinedEvent = (const void *)IOHIDEventCreateVendorDefinedEvent();
  [(RCPSyntheticEventStream *)self _addIOHIDEventToProcessingBuffer:VendorDefinedEvent];
  CFRelease(VendorDefinedEvent);
}

- (int64_t)touchFrequency
{
  return self->_touchFrequency;
}

- (void)setTouchFrequency:(int64_t)a3
{
  self->_touchFrequencdouble y = a3;
}

- (void)setTouchCurveFunction:(id)a3
{
}

- (void)setPointerFrequency:(double)a3
{
  self->_pointerFrequencdouble y = a3;
}

- (BOOL)scalePointerPhaseScrollToPixels
{
  return self->_scalePointerPhaseScrollToPixels;
}

- (void)setScalePointerPhaseScrollToPixels:(BOOL)a3
{
  self->_scalePointerPhaseScrollToPixels = a3;
}

- (CGSize)screenSize
{
  double width = self->_screenSize.width;
  double height = self->_screenSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setGsScreenPointSize:(CGSize)a3
{
  self->_gsScreenPointSize = a3;
}

- (void)setGsScreenScaleFactor:(double)a3
{
  self->_gsScreenScaleFactor = a3;
}

- (unsigned)transducerType
{
  return self->_transducerType;
}

- (void)setTransducerType:(unsigned int)a3
{
  self->_transducerType = a3;
}

- (void)_normalizePoint:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = [NSString stringWithUTF8String:"-[RCPSyntheticEventStream _normalizePoint:]"];
  int v3 = 138544130;
  CGPoint v4 = v2;
  __int16 v5 = 2114;
  id v6 = @"RCPSyntheticEventStream.m";
  __int16 v7 = 1024;
  int v8 = 1980;
  __int16 v9 = 2114;
  uint64_t v10 = a1;
  _os_log_error_impl(&dword_1A9051000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v3, 0x26u);
}

@end