@interface AnyVIAEvent
- (BOOL)shouldReportDirectly;
- (NSString)originatingApplication;
- (_TtC18VisualIntelligence11AnyVIAEvent)init;
- (id)feedback;
- (unint64_t)queryID;
@end

@implementation AnyVIAEvent

- (NSString)originatingApplication
{
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18VisualIntelligence11AnyVIAEvent_event);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 32);
  v7 = self;
  v6(v4, v5);

  v8 = (void *)sub_1DD0483D8();
  swift_bridgeObjectRelease();
  return (NSString *)v8;
}

- (unint64_t)queryID
{
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18VisualIntelligence11AnyVIAEvent_event);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 16);
  v7 = self;
  unint64_t v8 = v6(v4, v5);

  return v8;
}

- (id)feedback
{
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18VisualIntelligence11AnyVIAEvent_event);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
  v7 = self;
  unint64_t v8 = (void *)v6(v4, v5);

  return v8;
}

- (BOOL)shouldReportDirectly
{
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18VisualIntelligence11AnyVIAEvent_event);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 40);
  v7 = self;
  char v8 = v6(v4, v5);

  return v8 & 1;
}

- (_TtC18VisualIntelligence11AnyVIAEvent)init
{
  result = (_TtC18VisualIntelligence11AnyVIAEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end