@interface ReadingTimeTodayProvider
- (_TtC8BookCore24ReadingTimeTodayProvider)init;
- (id)dynamicProgressForKind:(id)a3 instance:(id)a4 parameters:(id)a5;
@end

@implementation ReadingTimeTodayProvider

- (id)dynamicProgressForKind:(id)a3 instance:(id)a4 parameters:(id)a5
{
  if (a4)
  {
    swift_unknownObjectRetain();
    v7 = self;
    swift_unknownObjectRetain();
    sub_1F2610();
    swift_unknownObjectRelease();
    if (a5)
    {
LABEL_3:
      sub_1F2610();
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    swift_unknownObjectRetain();
    v8 = self;
    if (a5) {
      goto LABEL_3;
    }
  }
  memset(v11, 0, sizeof(v11));
LABEL_6:
  v9 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8BookCore24ReadingTimeTodayProvider_dynamicProgress);
  swift_unknownObjectRetain();

  sub_19F808((uint64_t)v11, &qword_342C10);
  sub_19F808((uint64_t)v12, &qword_342C10);

  return v9;
}

- (_TtC8BookCore24ReadingTimeTodayProvider)init
{
  result = (_TtC8BookCore24ReadingTimeTodayProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end