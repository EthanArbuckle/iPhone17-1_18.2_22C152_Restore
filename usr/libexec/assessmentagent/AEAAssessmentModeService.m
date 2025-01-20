@interface AEAAssessmentModeService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC15assessmentagent24AEAAssessmentModeService)init;
- (void)dealloc;
- (void)registerPublisherWithLifetimeEndpoint:(id)a3 completion:(id)a4;
@end

@implementation AEAAssessmentModeService

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15assessmentagent24AEAAssessmentModeService_XPCListener);
  v3 = self;
  [v2 invalidate];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for AEAAssessmentModeService();
  [(AEAAssessmentModeService *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_100021E40((uint64_t)self + OBJC_IVAR____TtC15assessmentagent24AEAAssessmentModeService_taskSource);
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15assessmentagent24AEAAssessmentModeService_clientConnection));

  swift_release();
}

- (_TtC15assessmentagent24AEAAssessmentModeService)init
{
  result = (_TtC15assessmentagent24AEAAssessmentModeService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  unsigned __int8 v9 = sub_100060564(v7);

  return v9 & 1;
}

- (void)registerPublisherWithLifetimeEndpoint:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  unsigned __int8 v9 = self;
  sub_10005EBB8(v8, (uint64_t)sub_100046914, v7);

  swift_release();
}

@end