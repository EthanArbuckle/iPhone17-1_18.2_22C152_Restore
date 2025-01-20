@interface PXGEngineRecordingUpdateEndEvent
+ (id)eventWithUpdated:(BOOL)a3;
- (PXGEngineRecordingUpdateEndEvent)initWithUpdated:(BOOL)a3;
- (id)serializable;
@end

@implementation PXGEngineRecordingUpdateEndEvent

- (void).cxx_destruct
{
}

- (id)serializable
{
  return self->_serializable;
}

- (PXGEngineRecordingUpdateEndEvent)initWithUpdated:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXGEngineRecordingUpdateEndEvent;
  v4 = [(PXGTungstenRecordingEvent *)&v8 initWithComponent:0 eventName:@"updateEnd"];
  if (v4)
  {
    v5 = objc_alloc_init(PXGEngineRecordingUpdateEndEventSerializable);
    serializable = v4->_serializable;
    v4->_serializable = v5;

    [(PXGEngineRecordingUpdateEndEventSerializable *)v4->_serializable setUpdated:v3];
  }
  return v4;
}

+ (id)eventWithUpdated:(BOOL)a3
{
  BOOL v3 = [[PXGEngineRecordingUpdateEndEvent alloc] initWithUpdated:a3];
  return v3;
}

@end