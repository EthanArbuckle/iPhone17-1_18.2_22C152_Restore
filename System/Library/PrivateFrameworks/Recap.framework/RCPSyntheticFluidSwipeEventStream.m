@interface RCPSyntheticFluidSwipeEventStream
- (RCPEventEnvironment)environment;
- (RCPEventSenderProperties)senderProperties;
- (RCPSyntheticFluidSwipeEventStream)initWithEventType:(unsigned int)a3 flavor:(unsigned __int16)a4 motion:(unsigned __int16)a5;
- (double)currentTimeOffset;
- (double)frequency;
- (double)progress;
- (id)finalizeEventStream;
- (unint64_t)_currentMachTime;
- (void)addToBuffer:(__IOHIDEvent *)a3;
- (void)advanceProgressByDelta:(double)a3 duration:(double)a4;
- (void)advanceTime:(double)a3;
- (void)setCurrentTimeOffset:(double)a3;
- (void)setEnvironment:(id)a3;
- (void)setFrequency:(double)a3;
- (void)setProgress:(double)a3;
- (void)setSenderProperties:(id)a3;
- (void)updateProgressTo:(double)a3;
- (void)updateProgressTo:(double)a3 duration:(double)a4;
@end

@implementation RCPSyntheticFluidSwipeEventStream

- (RCPSyntheticFluidSwipeEventStream)initWithEventType:(unsigned int)a3 flavor:(unsigned __int16)a4 motion:(unsigned __int16)a5
{
  v12.receiver = self;
  v12.super_class = (Class)RCPSyntheticFluidSwipeEventStream;
  v8 = [(RCPSyntheticFluidSwipeEventStream *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    processingEventBuffer = v8->_processingEventBuffer;
    v8->_processingEventBuffer = (NSMutableArray *)v9;

    v8->_currentTimeOffset = 0.0;
    v8->_eventType = a3;
    v8->_flavor = a4;
    v8->_motion = a5;
    v8->_frequency = 60.0;
    v8->_hasCreatedFirstEvent = 0;
  }
  return v8;
}

- (id)finalizeEventStream
{
  v3 = [(NSMutableArray *)self->_processingEventBuffer lastObject];
  v4 = v3;
  if (v3)
  {
    [v3 hidEvent];
    IOHIDEventSetPhase();
  }
  v5 = (void *)[(NSMutableArray *)self->_processingEventBuffer copy];
  [(NSMutableArray *)self->_processingEventBuffer removeAllObjects];

  return v5;
}

- (void)advanceTime:(double)a3
{
  self->_currentTimeOffset = self->_currentTimeOffset + a3;
}

- (void)advanceProgressByDelta:(double)a3 duration:(double)a4
{
  double frequency = self->_frequency;
  double v5 = frequency * a4;
  uint64_t v6 = vcvtpd_s64_f64(v5);
  if (v6 >= 1)
  {
    double v8 = 1.0 / frequency;
    double v9 = a3 / (double)(uint64_t)ceil(v5);
    do
    {
      [(RCPSyntheticFluidSwipeEventStream *)self updateProgressTo:v9 + self->_progress];
      [(RCPSyntheticFluidSwipeEventStream *)self advanceTime:v8];
      --v6;
    }
    while (v6);
  }
}

- (void)updateProgressTo:(double)a3 duration:(double)a4
{
}

- (void)updateProgressTo:(double)a3
{
  [(RCPSyntheticFluidSwipeEventStream *)self setProgress:a3];
  [(RCPSyntheticFluidSwipeEventStream *)self _currentMachTime];
  unsigned int eventType = self->_eventType;
  [(RCPSyntheticFluidSwipeEventStream *)self progress];
  double v5 = (const void *)IOHIDEventCreate();
  if (v5 && (eventType == 27 || eventType == 23 || eventType == 16))
  {
    IOHIDEventSetIntegerValue();
    IOHIDEventSetIntegerValue();
    IOHIDEventSetIntegerValue();
    IOHIDEventSetDoubleValue();
    IOHIDEventSetDoubleValue();
    IOHIDEventSetDoubleValue();
  }
  [(RCPSyntheticFluidSwipeEventStream *)self addToBuffer:v5];
  CFRelease(v5);
}

- (void)addToBuffer:(__IOHIDEvent *)a3
{
  if (!self->_hasCreatedFirstEvent) {
    self->_hasCreatedFirstEvent = 1;
  }
  IOHIDEventSetPhase();
  unint64_t v5 = [(RCPSyntheticFluidSwipeEventStream *)self _currentMachTime];
  uint64_t v6 = [(RCPSyntheticFluidSwipeEventStream *)self senderProperties];
  id v7 = +[RCPEvent eventWithHIDEvent:a3 deliveryTimeStamp:v5 senderProperties:v6 preActions:0];

  [(NSMutableArray *)self->_processingEventBuffer addObject:v7];
}

- (unint64_t)_currentMachTime
{
  v3 = [(RCPSyntheticFluidSwipeEventStream *)self environment];
  unint64_t v4 = [v3 machAbsoluteTimeForTimeInterval:self->_currentTimeOffset];

  return v4;
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

- (void)setFrequency:(double)a3
{
  self->_double frequency = a3;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (double)currentTimeOffset
{
  return self->_currentTimeOffset;
}

- (void)setCurrentTimeOffset:(double)a3
{
  self->_currentTimeOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_senderProperties, 0);
  objc_storeStrong((id *)&self->_processingEventBuffer, 0);
}

@end