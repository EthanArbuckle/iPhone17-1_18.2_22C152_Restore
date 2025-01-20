@interface RCPEventStreamRecorder
+ (id)recorderWithConfiguration:(id)a3;
- (BOOL)isRecording;
- (RCPAnalyticsEventSender)analyticsEventSender;
- (RCPRecorderConfig)config;
- (__IOHIDEvent)startLocationEvent;
- (int64_t)state;
- (unint64_t)startTimestamp;
- (void)_finalizePointerEvents;
- (void)dealloc;
- (void)enqueueEvent:(id)a3;
- (void)setAnalyticsEventSender:(id)a3;
- (void)setStartLocationEvent:(__IOHIDEvent *)a3;
- (void)setStartTimestamp:(unint64_t)a3;
- (void)setState:(int64_t)a3;
- (void)startRecording;
- (void)stopRecording;
@end

@implementation RCPEventStreamRecorder

+ (id)recorderWithConfiguration:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = (void *)v4[4];
  v4[4] = v3;
  id v6 = v3;

  v7 = objc_alloc_init(RCPCoreAnalyticsBackedAnalyticsEventSender);
  [v4 setAnalyticsEventSender:v7];

  return v4;
}

- (void)dealloc
{
  startLocationEvent = self->_startLocationEvent;
  if (startLocationEvent) {
    CFRelease(startLocationEvent);
  }
  v4.receiver = self;
  v4.super_class = (Class)RCPEventStreamRecorder;
  [(RCPEventStreamRecorder *)&v4 dealloc];
}

- (void)setStartLocationEvent:(__IOHIDEvent *)a3
{
  startLocationEvent = self->_startLocationEvent;
  if (startLocationEvent) {
    CFRelease(startLocationEvent);
  }
  Copy = (__IOHIDEvent *)IOHIDEventCreateCopy();
  self->_startLocationEvent = Copy;
  CFRetain(Copy);
}

- (__IOHIDEvent)startLocationEvent
{
  return self->_startLocationEvent;
}

- (BOOL)isRecording
{
  return [(RCPEventStreamRecorder *)self state] == 1;
}

- (void)startRecording
{
  [(RCPEventStreamRecorder *)self setStartTimestamp:mach_absolute_time()];
  if (![(RCPEventStreamRecorder *)self state])
  {
    [(RCPEventStreamRecorder *)self setState:1];
    +[RCPRecorder registerEventStreamRecorder:self];
  }
}

- (void)stopRecording
{
  [(RCPEventStreamRecorder *)self finalizeEvents];
  [(RCPEventStreamRecorder *)self setState:2];
  id v3 = [(RCPEventStreamRecorder *)self analyticsEventSender];
  [v3 sendEvent:0];

  +[RCPRecorder unregisterEventStreamRecorder:self];
}

- (void)enqueueEvent:(id)a3
{
  id v21 = a3;
  objc_super v4 = [(RCPEventStream *)self rawEvents];
  [v4 addObject:v21];

  v5 = [(RCPEventStreamRecorder *)self config];
  [v5 maxStreamDuration];
  double v7 = v6;

  v8 = v21;
  if (v7 > 0.0)
  {
    uint64_t v9 = [v21 timestamp];
    v10 = [(RCPEventStream *)self rawEvents];
    uint64_t v11 = [v10 count];

    v12 = [(RCPEventStream *)self rawEvents];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      unint64_t v14 = 0;
      while (1)
      {
        v15 = [(RCPEventStream *)self rawEvents];
        v16 = [v15 objectAtIndexedSubscript:v14];
        double v17 = RCPTimeIntervalFromMachTimestamp(v9 - [v16 timestamp]);

        if (v17 < v7) {
          break;
        }
        ++v14;
        v18 = [(RCPEventStream *)self rawEvents];
        unint64_t v19 = [v18 count];

        if (v14 >= v19) {
          goto LABEL_8;
        }
      }
      uint64_t v11 = v14;
    }
LABEL_8:
    v20 = [(RCPEventStream *)self rawEvents];
    objc_msgSend(v20, "removeObjectsInRange:", 0, v11);

    v8 = v21;
  }
}

- (void)_finalizePointerEvents
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_startLocationEvent)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v3 = [(RCPEventStream *)self rawEvents];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v16;
LABEL_4:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v15 + 1) + 8 * v7);
        [v8 hidEvent];
        if (IOHIDEventGetType() == 17) {
          break;
        }
        if (v5 == ++v7)
        {
          uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v5) {
            goto LABEL_4;
          }
          goto LABEL_13;
        }
      }
      id v9 = v8;

      if (!v9) {
        return;
      }
      [v9 hidEvent];
      IOHIDEventGetSenderID();
      IOHIDEventSetSenderID();
      IOHIDEventGetTimeStamp();
      IOHIDEventSetTimeStamp();
      startLocationEvent = self->_startLocationEvent;
      uint64_t v11 = [v9 deliveryTimestamp];
      v12 = [v9 senderProperties];
      uint64_t v13 = +[RCPEvent eventWithHIDEvent:startLocationEvent deliveryTimeStamp:v11 senderProperties:v12 preActions:0];

      unint64_t v14 = [(RCPEventStream *)self rawEvents];
      [v14 insertObject:v13 atIndex:0];

      id v3 = v9;
    }
LABEL_13:
  }
}

- (RCPRecorderConfig)config
{
  return self->_config;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (unint64_t)startTimestamp
{
  return self->_startTimestamp;
}

- (void)setStartTimestamp:(unint64_t)a3
{
  self->_startTimestamp = a3;
}

- (RCPAnalyticsEventSender)analyticsEventSender
{
  return self->_analyticsEventSender;
}

- (void)setAnalyticsEventSender:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsEventSender, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end