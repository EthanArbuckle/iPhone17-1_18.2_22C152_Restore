@interface VUIMetricsLocalRecorder
- (VUIMetricsLocalRecorder)init;
- (VUIMetricsLocalRecorder)initWithStorageManager:(id)a3;
- (void)recordPagePerfRenderEventWithVuiDictionary:(id)a3;
@end

@implementation VUIMetricsLocalRecorder

- (VUIMetricsLocalRecorder)initWithStorageManager:(id)a3
{
  return (VUIMetricsLocalRecorder *)MetricsLocalRecorder.init(storageManager:)((uint64_t)a3);
}

- (void)recordPagePerfRenderEventWithVuiDictionary:(id)a3
{
  uint64_t v4 = sub_1E387C678();
  v5 = self;
  MetricsLocalRecorder.recordPagePerfRenderEvent(vuiDictionary:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (VUIMetricsLocalRecorder)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___VUIMetricsLocalRecorder_currentSession);
}

@end