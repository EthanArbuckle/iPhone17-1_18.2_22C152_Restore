@interface PXGTungstenRecordingEvent
- (NSString)eventName;
- (NSString)threadDescription;
- (PXGTungstenRecordingEvent)initWithComponent:(int64_t)a3 eventName:(id)a4;
- (double)timestamp;
- (id)serializable;
- (int64_t)component;
@end

@implementation PXGTungstenRecordingEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadDescription, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSString)threadDescription
{
  return self->_threadDescription;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (int64_t)component
{
  return self->_component;
}

- (id)serializable
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXGTungstenRecording.m", 100, @"Method %s is a responsibility of subclass %@", "-[PXGTungstenRecordingEvent serializable]", v6 object file lineNumber description];

  abort();
}

- (PXGTungstenRecordingEvent)initWithComponent:(int64_t)a3 eventName:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXGTungstenRecordingEvent;
  v8 = [(PXGTungstenRecordingEvent *)&v14 init];
  v9 = v8;
  if (v8)
  {
    v8->_component = a3;
    objc_storeStrong((id *)&v8->_eventName, a4);
    v10 = [MEMORY[0x1E4F29060] currentThread];
    uint64_t v11 = [v10 description];
    threadDescription = v9->_threadDescription;
    v9->_threadDescription = (NSString *)v11;

    v9->_timestamp = CFAbsoluteTimeGetCurrent();
  }

  return v9;
}

@end