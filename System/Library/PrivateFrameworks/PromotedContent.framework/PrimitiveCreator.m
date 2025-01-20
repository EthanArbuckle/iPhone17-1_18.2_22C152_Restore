@interface PrimitiveCreator
- (_TtC15PromotedContent16PrimitiveCreator)init;
- (void)recordMetric:(int64_t)a3 forPurpose:(int64_t)a4 properties:(id)a5 internalProperties:(id)a6 order:(int64_t)a7 options:(int64_t)a8;
@end

@implementation PrimitiveCreator

- (_TtC15PromotedContent16PrimitiveCreator)init
{
  result = (_TtC15PromotedContent16PrimitiveCreator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC15PromotedContent16PrimitiveCreator_eventPipeline;
  sub_1B5BF6B4C((uint64_t)v3);
}

- (void)recordMetric:(int64_t)a3 forPurpose:(int64_t)a4 properties:(id)a5 internalProperties:(id)a6 order:(int64_t)a7 options:(int64_t)a8
{
  v11 = a5;
  if (a5)
  {
    sub_1B5BFE044((uint64_t *)&unk_1EB851720);
    v11 = (void *)sub_1B5CB3320();
  }
  if (a6)
  {
    sub_1B5BFE044(&qword_1EB8516E0);
    a6 = (id)sub_1B5CB3320();
  }
  v15 = self;
  sub_1B5C5C290(a3, a4, v11, (unint64_t)a6, a7, a8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end