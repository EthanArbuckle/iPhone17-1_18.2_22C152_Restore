@interface RCPScrollEventStream
- (CAMediaTimingFunction)pointerCurveFunction;
- (RCPEventEnvironment)environment;
- (RCPEventSenderProperties)senderProperties;
- (RCPScrollEventStream)init;
- (double)currentTimeOffset;
- (double)deltaToPixelsScaleFactor;
- (double)frequency;
- (id)_eventWithDelta:(CGVector)a3 phase:(unsigned __int16)a4;
- (id)finalizeEventStream;
- (void)_updateAmplitudeBy:(CGVector)a3;
- (void)advanceByDelta:(CGVector)a3 duration:(double)a4;
- (void)advanceTime:(double)a3;
- (void)setCurrentTimeOffset:(double)a3;
- (void)setDeltaToPixelsScaleFactor:(double)a3;
- (void)setEnvironment:(id)a3;
- (void)setFrequency:(double)a3;
- (void)setPointerCurveFunction:(id)a3;
- (void)setSenderProperties:(id)a3;
@end

@implementation RCPScrollEventStream

- (CAMediaTimingFunction)pointerCurveFunction
{
  pointerCurveFunction = self->_pointerCurveFunction;
  if (!pointerCurveFunction)
  {
    RCPMediaTimingFunctionForInputType(0, 1, v2, v3, v4, v5);
    v8 = (CAMediaTimingFunction *)objc_claimAutoreleasedReturnValue();
    v9 = self->_pointerCurveFunction;
    self->_pointerCurveFunction = v8;

    pointerCurveFunction = self->_pointerCurveFunction;
  }
  return pointerCurveFunction;
}

- (RCPScrollEventStream)init
{
  v6.receiver = self;
  v6.super_class = (Class)RCPScrollEventStream;
  double v2 = [(RCPScrollEventStream *)&v6 init];
  if (v2)
  {
    double v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    events = v2->_events;
    v2->_events = v3;

    v2->_currentTimeOffset = 0.0;
    *(_OWORD *)&v2->_frequency = xmmword_1A9077A50;
    v2->_scrollOptions = 69;
  }
  return v2;
}

- (id)finalizeEventStream
{
  double v3 = -[RCPScrollEventStream _eventWithDelta:phase:](self, "_eventWithDelta:phase:", 4, 0.0, 0.0);
  [(NSMutableArray *)self->_events insertObject:self->_cachedFirstEvent atIndex:0];
  [(NSMutableArray *)self->_events addObject:v3];
  double v4 = (void *)[(NSMutableArray *)self->_events copy];
  [(NSMutableArray *)self->_events removeAllObjects];

  return v4;
}

- (void)advanceTime:(double)a3
{
  self->_currentTimeOffset = self->_currentTimeOffset + a3;
}

- (void)advanceByDelta:(CGVector)a3 duration:(double)a4
{
  double dy = a3.dy;
  double dx = a3.dx;
  double frequency = self->_frequency;
  double v8 = 1.0 / frequency;
  uint64_t v9 = vcvtpd_s64_f64(frequency * a4);
  -[RCPScrollEventStream _eventWithDelta:phase:](self, "_eventWithDelta:phase:", 1, 0.0, 0.0);
  v10 = (RCPEvent *)objc_claimAutoreleasedReturnValue();
  cachedFirstEvent = self->_cachedFirstEvent;
  self->_cachedFirstEvent = v10;

  [(RCPScrollEventStream *)self advanceTime:v8];
  v12 = [(RCPScrollEventStream *)self pointerCurveFunction];
  if (v9 >= 1)
  {
    uint64_t v13 = 0;
    id v14 = v12;
    do
    {
      objc_msgSend(v14, "rcp_solveForDelta:withSteps:step:", v9, v13, dx, dy);
      -[RCPScrollEventStream _updateAmplitudeBy:](self, "_updateAmplitudeBy:");
      [(RCPScrollEventStream *)self advanceTime:v8];
      v12 = v14;
      ++v13;
    }
    while (v9 != v13);
  }
}

- (void)_updateAmplitudeBy:(CGVector)a3
{
  -[RCPScrollEventStream _eventWithDelta:phase:](self, "_eventWithDelta:phase:", 2, a3.dx, a3.dy);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableArray *)self->_events addObject:v4];
}

- (id)_eventWithDelta:(CGVector)a3 phase:(unsigned __int16)a4
{
  unint64_t v5 = [(RCPEventEnvironment *)self->_environment machAbsoluteTimeForTimeInterval:self->_currentTimeOffset];
  ScrollEvent = (const void *)IOHIDEventCreateScrollEvent();
  IOHIDEventSetPhase();
  uint64_t RelativePointerEvent = IOHIDEventCreateRelativePointerEvent();
  IOHIDEventAppendEvent();
  CFRelease(ScrollEvent);
  senderProperties = self->_senderProperties;
  return +[RCPEvent eventWithHIDEvent:RelativePointerEvent deliveryTimeStamp:v5 senderProperties:senderProperties preActions:0];
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

- (double)currentTimeOffset
{
  return self->_currentTimeOffset;
}

- (void)setCurrentTimeOffset:(double)a3
{
  self->_currentTimeOffset = a3;
}

- (void)setPointerCurveFunction:(id)a3
{
}

- (double)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(double)a3
{
  self->_double frequency = a3;
}

- (double)deltaToPixelsScaleFactor
{
  return self->_deltaToPixelsScaleFactor;
}

- (void)setDeltaToPixelsScaleFactor:(double)a3
{
  self->_deltaToPixelsScaleFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerCurveFunction, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_senderProperties, 0);
  objc_storeStrong((id *)&self->_cachedFirstEvent, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

@end