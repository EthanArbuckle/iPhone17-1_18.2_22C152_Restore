@interface ECPrimitiveCreator
- (_TtC7Metrics18ECPrimitiveCreator)init;
- (void)recordMetric:(int64_t)a3 forPurpose:(int64_t)a4 properties:(id)a5 internalProperties:(id)a6 order:(int64_t)a7 options:(int64_t)a8;
@end

@implementation ECPrimitiveCreator

- (void)recordMetric:(int64_t)a3 forPurpose:(int64_t)a4 properties:(id)a5 internalProperties:(id)a6 order:(int64_t)a7 options:(int64_t)a8
{
  v11 = (objc_class *)a5;
  if (a5)
  {
    sub_10000C440(&qword_100285600);
    v11 = (objc_class *)sub_10019B040();
  }
  if (a6)
  {
    sub_10000C440((uint64_t *)&unk_100285B20);
    a6 = (id)sub_10019B040();
  }
  v15 = self;
  sub_1001331C8(a3, a4, v11, (uint64_t)a6, a7, a8);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC7Metrics18ECPrimitiveCreator)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ECPrimitiveCreator();
  return [(ECPrimitiveCreator *)&v3 init];
}

@end