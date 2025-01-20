@interface DOCLocationChangePacer
- (_TtC5Files22DOCLocationChangePacer)init;
- (_TtC5Files22DOCLocationChangePacer)initWithHierarchyController:(id)a3;
- (void)performPendingLocationChange;
@end

@implementation DOCLocationChangePacer

- (_TtC5Files22DOCLocationChangePacer)initWithHierarchyController:(id)a3
{
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files22DOCLocationChangePacer_pendingLocationChange);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (objc_class *)a3;
  v6 = self;
  Date.init()();
  *(Class *)((char *)&v6->super.isa + OBJC_IVAR____TtC5Files22DOCLocationChangePacer_hierarchyController) = v5;
  v7 = v5;

  v10.receiver = v6;
  v10.super_class = (Class)type metadata accessor for DOCLocationChangePacer();
  v8 = [(DOCLocationChangePacer *)&v10 init];

  return v8;
}

- (void)performPendingLocationChange
{
  v2 = self;
  sub_10057E17C();
}

- (_TtC5Files22DOCLocationChangePacer)init
{
  result = (_TtC5Files22DOCLocationChangePacer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100180FC8(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC5Files22DOCLocationChangePacer_pendingLocationChange), *(void **)&self->hierarchyController[OBJC_IVAR____TtC5Files22DOCLocationChangePacer_pendingLocationChange]);
  v3 = (char *)self + OBJC_IVAR____TtC5Files22DOCLocationChangePacer_timestampOfLastLocationChangeAttempt;
  uint64_t v4 = type metadata accessor for Date();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end