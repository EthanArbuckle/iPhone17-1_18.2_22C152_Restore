@interface PXGViewRecordingFrameEndEvent
+ (id)event;
- (PXGViewRecordingFrameEndEvent)init;
- (id)serializable;
@end

@implementation PXGViewRecordingFrameEndEvent

- (void).cxx_destruct
{
}

- (id)serializable
{
  return self->_serializable;
}

- (PXGViewRecordingFrameEndEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXGViewRecordingFrameEndEvent;
  v2 = [(PXGTungstenRecordingEvent *)&v6 initWithComponent:2 eventName:@"frameEnd"];
  if (v2)
  {
    v3 = objc_alloc_init(PXGViewRecordingFrameEndEventSerializable);
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