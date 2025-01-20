@interface NDAnalyticsTelemetryUploader
- (NDAnalyticsTelemetryUploader)init;
- (void)uploadEnvelopes:(id)a3 completion:(id)a4;
@end

@implementation NDAnalyticsTelemetryUploader

- (void)uploadEnvelopes:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  sub_21FDF264C(0, &qword_267EFCFE0);
  unint64_t v6 = sub_21FDF62E8();
  if (v5)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v5;
    v8 = sub_21FDF191C;
  }
  else
  {
    v8 = 0;
    uint64_t v7 = 0;
  }
  v9 = self;
  TelemetryUploader.uploadEnvelopes(_:completion:)(v6, (uint64_t)v8, v7);
  sub_21FDF18D4((uint64_t)v8);

  swift_bridgeObjectRelease();
}

- (NDAnalyticsTelemetryUploader)init
{
  result = (NDAnalyticsTelemetryUploader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end