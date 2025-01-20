@interface DOCPinchZoomTestParameters
- (NSString)testName;
- (_TtC5Files26DOCPinchZoomTestParameters)init;
- (id)completionHandler;
- (id)composerBlock;
- (void)setCompletionHandler:(id)a3;
- (void)setTestName:(id)a3;
@end

@implementation DOCPinchZoomTestParameters

- (NSString)testName
{
  if (*(void *)&self->testName[OBJC_IVAR____TtC5Files26DOCPinchZoomTestParameters_testName])
  {
    swift_bridgeObjectRetain();
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setTestName:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5Files26DOCPinchZoomTestParameters_testName);
  uint64_t *v6 = v4;
  v6[1] = v5;

  swift_bridgeObjectRelease();
}

- (id)completionHandler
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files26DOCPinchZoomTestParameters_completionHandler))
  {
    uint64_t v2 = *(void *)&self->testName[OBJC_IVAR____TtC5Files26DOCPinchZoomTestParameters_completionHandler];
    v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files26DOCPinchZoomTestParameters_completionHandler);
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_1000666D8;
    v5[3] = &unk_1006B2610;
    v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setCompletionHandler:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_100110374;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC5Files26DOCPinchZoomTestParameters_completionHandler);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files26DOCPinchZoomTestParameters_completionHandler);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;

  sub_1000A7258(v8);
}

- (id)composerBlock
{
  CGFloat v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files26DOCPinchZoomTestParameters_bounds);
  CGFloat v3 = *(double *)&self->testName[OBJC_IVAR____TtC5Files26DOCPinchZoomTestParameters_bounds];
  CGFloat v4 = *(double *)&self->testName[OBJC_IVAR____TtC5Files26DOCPinchZoomTestParameters_bounds + 8];
  CGFloat v5 = *(double *)&self->bounds[OBJC_IVAR____TtC5Files26DOCPinchZoomTestParameters_bounds];
  v6 = self;
  v15.origin.x = v2;
  v15.origin.y = v3;
  v15.size.width = v4;
  v15.size.height = v5;
  double MidX = CGRectGetMidX(v15);
  v16.origin.x = v2;
  v16.origin.y = v3;
  v16.size.width = v4;
  v16.size.height = v5;
  CGFloat MidY = CGRectGetMidY(v16);
  v17.origin.x = v2;
  v17.origin.y = v3;
  v17.size.width = v4;
  v17.size.height = v5;
  double v9 = MidX + CGRectGetWidth(v17) / 10.0;
  uint64_t v10 = swift_allocObject();
  *(double *)(v10 + 16) = MidX;
  *(CGFloat *)(v10 + 24) = MidY;
  *(double *)(v10 + 32) = v9;
  *(CGFloat *)(v10 + 40) = MidY;

  v13[4] = sub_1004DE0D0;
  v13[5] = v10;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_100045AE0;
  v13[3] = &unk_1006B25C0;
  v11 = _Block_copy(v13);
  swift_release();

  return v11;
}

- (_TtC5Files26DOCPinchZoomTestParameters)init
{
  result = (_TtC5Files26DOCPinchZoomTestParameters *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files26DOCPinchZoomTestParameters_completionHandler);

  sub_1000A7258(v3);
}

@end