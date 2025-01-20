@interface PXGMetalRecordingFrameEndEvent
+ (id)event;
- (PXGMetalRecordingFrameEndEvent)init;
- (id)serializable;
@end

@implementation PXGMetalRecordingFrameEndEvent

- (void).cxx_destruct
{
}

- (id)serializable
{
  return self->_serializable;
}

- (PXGMetalRecordingFrameEndEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXGMetalRecordingFrameEndEvent;
  v2 = [(PXGTungstenRecordingEvent *)&v6 initWithComponent:1 eventName:@"frameEnd"];
  if (v2)
  {
    v3 = objc_alloc_init(PXGMetalRecordingFrameEndEventSerializable);
    serializable = v2->_serializable;
    v2->_serializable = v3;
  }
  return v2;
}

+ (id)event
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end