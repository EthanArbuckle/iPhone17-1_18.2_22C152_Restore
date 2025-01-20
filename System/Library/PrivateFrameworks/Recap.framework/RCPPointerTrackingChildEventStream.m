@interface RCPPointerTrackingChildEventStream
- (CAMediaTimingFunction)pointerCurveFunction;
- (CGPoint)currentPointerLocation;
- (CGPoint)orientedDestinationPoint:(CGPoint)a3;
- (CGPoint)orientedNormalPoint:(CGPoint)a3;
- (CGVector)_deltaToPoint:(CGPoint)a3;
- (RCPEventEnvironment)environment;
- (RCPEventSenderProperties)senderProperties;
- (RCPPointerTrackingChildEventStream)initWithCurrentPointerLocation:(CGPoint)a3;
- (double)currentTimeOffset;
- (double)frequency;
- (id)finalizeEventStream;
- (int64_t)currentInterfaceOrientation;
- (unint64_t)_currentMachTime;
- (void)_addIOHIDEventToProcessingBuffer:(__IOHIDEvent *)a3;
- (void)advanceTime:(double)a3;
- (void)moveByDelta:(CGVector)a3 duration:(double)a4;
- (void)movePointerByDelta:(CGVector)a3;
- (void)moveToPoint:(CGPoint)a3 duration:(double)a4;
- (void)setCurrentPointerLocation:(CGPoint)a3;
- (void)setCurrentTimeOffset:(double)a3;
- (void)setEnvironment:(id)a3;
- (void)setFrequency:(double)a3;
- (void)setPointerCurveFunction:(id)a3;
- (void)setSenderProperties:(id)a3;
@end

@implementation RCPPointerTrackingChildEventStream

- (void)setFrequency:(double)a3
{
  self->_frequency = a3;
}

- (RCPPointerTrackingChildEventStream)initWithCurrentPointerLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)RCPPointerTrackingChildEventStream;
  v5 = [(RCPPointerTrackingChildEventStream *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    processingEventBuffer = v5->_processingEventBuffer;
    v5->_processingEventBuffer = (NSMutableArray *)v6;

    v5->_currentTimeOffset = 0.0;
    v5->_frequencCGFloat y = 60.0;
    v5->_currentPointerLocation.CGFloat x = x;
    v5->_currentPointerLocation.CGFloat y = y;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerCurveFunction, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_senderProperties, 0);
  objc_storeStrong((id *)&self->_processingEventBuffer, 0);
}

- (CAMediaTimingFunction)pointerCurveFunction
{
  pointerCurveFunction = self->_pointerCurveFunction;
  if (!pointerCurveFunction)
  {
    RCPMediaTimingFunctionForInputType(0, 1, v2, v3, v4, v5);
    v8 = (CAMediaTimingFunction *)objc_claimAutoreleasedReturnValue();
    objc_super v9 = self->_pointerCurveFunction;
    self->_pointerCurveFunction = v8;

    pointerCurveFunction = self->_pointerCurveFunction;
  }
  return pointerCurveFunction;
}

- (id)finalizeEventStream
{
  double v3 = (void *)[(NSMutableArray *)self->_processingEventBuffer copy];
  [(NSMutableArray *)self->_processingEventBuffer removeAllObjects];
  return v3;
}

- (void)advanceTime:(double)a3
{
  self->_currentTimeOffset = self->_currentTimeOffset + a3;
}

- (void)moveToPoint:(CGPoint)a3 duration:(double)a4
{
  -[RCPPointerTrackingChildEventStream _deltaToPoint:](self, "_deltaToPoint:", a3.x, a3.y);
  -[RCPPointerTrackingChildEventStream moveByDelta:duration:](self, "moveByDelta:duration:");
}

- (void)moveByDelta:(CGVector)a3 duration:(double)a4
{
  dCGFloat y = a3.dy;
  dCGFloat x = a3.dx;
  frequencCGFloat y = self->_frequency;
  uint64_t v8 = vcvtpd_s64_f64(frequency * a4);
  objc_super v9 = [(RCPPointerTrackingChildEventStream *)self pointerCurveFunction];
  if (v8 >= 1)
  {
    uint64_t v10 = 0;
    double v11 = 1.0 / frequency;
    id v12 = v9;
    do
    {
      objc_msgSend(v12, "rcp_solveForDelta:withSteps:step:", v8, v10, dx, dy);
      -[RCPPointerTrackingChildEventStream movePointerByDelta:](self, "movePointerByDelta:");
      [(RCPPointerTrackingChildEventStream *)self advanceTime:v11];
      objc_super v9 = v12;
      ++v10;
    }
    while (v8 != v10);
  }
}

- (void)movePointerByDelta:(CGVector)a3
{
  dCGFloat y = a3.dy;
  dCGFloat x = a3.dx;
  [(RCPPointerTrackingChildEventStream *)self _currentMachTime];
  RelativePointerEvent = (const void *)IOHIDEventCreateRelativePointerEvent();
  [(RCPPointerTrackingChildEventStream *)self _addIOHIDEventToProcessingBuffer:RelativePointerEvent];
  CFRelease(RelativePointerEvent);
  double v7 = dx + self->_currentPointerLocation.x;
  double v8 = dy + self->_currentPointerLocation.y;
  -[RCPPointerTrackingChildEventStream setCurrentPointerLocation:](self, "setCurrentPointerLocation:", v7, v8);
}

- (CGVector)_deltaToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(RCPPointerTrackingChildEventStream *)self currentPointerLocation];
  double v7 = x - v6;
  [(RCPPointerTrackingChildEventStream *)self currentPointerLocation];
  double v9 = y - v8;
  -[RCPPointerTrackingChildEventStream orientedDestinationPoint:](self, "orientedDestinationPoint:", v7, v9);
  result.ddouble y = v11;
  result.ddouble x = v10;
  return result;
}

- (unint64_t)_currentMachTime
{
  double v3 = [(RCPPointerTrackingChildEventStream *)self environment];
  unint64_t v4 = [v3 machAbsoluteTimeForTimeInterval:self->_currentTimeOffset];

  return v4;
}

- (void)_addIOHIDEventToProcessingBuffer:(__IOHIDEvent *)a3
{
  id v4 = +[RCPEvent eventWithHIDEvent:a3 deliveryTimeStamp:[(RCPPointerTrackingChildEventStream *)self _currentMachTime] senderProperties:self->_senderProperties preActions:0];
  [(NSMutableArray *)self->_processingEventBuffer addObject:v4];
}

- (int64_t)currentInterfaceOrientation
{
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x2050000000;
  double v2 = (void *)getFBSOrientationObserverClass_softClass;
  uint64_t v11 = getFBSOrientationObserverClass_softClass;
  if (!getFBSOrientationObserverClass_softClass)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getFBSOrientationObserverClass_block_invoke;
    v7[3] = &unk_1E5D76FF8;
    v7[4] = &v8;
    __getFBSOrientationObserverClass_block_invoke((uint64_t)v7);
    double v2 = (void *)v9[3];
  }
  double v3 = v2;
  _Block_object_dispose(&v8, 8);
  id v4 = objc_alloc_init(v3);
  int64_t v5 = [v4 activeInterfaceOrientation];
  [v4 invalidate];

  return v5;
}

- (CGPoint)orientedDestinationPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = RCPLogPlayback();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[RCPPointerTrackingChildEventStream orientedDestinationPoint:](v6);
  }

  int64_t v7 = [(RCPPointerTrackingChildEventStream *)self currentInterfaceOrientation];
  double v8 = -y;
  double v9 = -x;
  if (v7 == 2) {
    double v10 = -x;
  }
  else {
    double v10 = x;
  }
  if (v7 == 2) {
    double v11 = -y;
  }
  else {
    double v11 = y;
  }
  if (v7 == 3) {
    double v10 = y;
  }
  else {
    double v9 = v11;
  }
  if (v7 == 4) {
    double v9 = x;
  }
  else {
    double v8 = v10;
  }
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (CGPoint)orientedNormalPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = RCPLogPlayback();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[RCPPointerTrackingChildEventStream orientedNormalPoint:](v6);
  }

  int64_t v7 = [(RCPPointerTrackingChildEventStream *)self currentInterfaceOrientation];
  if (v7 == 2) {
    double v8 = 1.0 - x;
  }
  else {
    double v8 = x;
  }
  if (v7 == 2) {
    double v9 = 1.0 - y;
  }
  else {
    double v9 = y;
  }
  if (v7 == 3)
  {
    double v8 = y;
    double v9 = 1.0 - x;
  }
  if (v7 == 4) {
    double v10 = 1.0 - y;
  }
  else {
    double v10 = v8;
  }
  if (v7 == 4) {
    double v11 = x;
  }
  else {
    double v11 = v9;
  }
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (RCPEventSenderProperties)senderProperties
{
  return self->_senderProperties;
}

- (void)setSenderProperties:(id)a3
{
}

- (RCPEventEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (double)frequency
{
  return self->_frequency;
}

- (void)setPointerCurveFunction:(id)a3
{
}

- (double)currentTimeOffset
{
  return self->_currentTimeOffset;
}

- (void)setCurrentTimeOffset:(double)a3
{
  self->_currentTimeOffset = a3;
}

- (CGPoint)currentPointerLocation
{
  double x = self->_currentPointerLocation.x;
  double y = self->_currentPointerLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCurrentPointerLocation:(CGPoint)a3
{
  self->_currentPointerLocation = a3;
}

- (void)orientedDestinationPoint:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A9051000, log, OS_LOG_TYPE_DEBUG, "Converting destination point for supplied orientation.", v1, 2u);
}

- (void)orientedNormalPoint:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A9051000, log, OS_LOG_TYPE_DEBUG, "Converting normal point for supplied orientation.", v1, 2u);
}

@end