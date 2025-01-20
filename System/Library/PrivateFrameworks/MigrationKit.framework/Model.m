@interface Model
+ (id)model;
- (_TtC12MigrationKit5Model)init;
@end

@implementation Model

+ (id)model
{
  swift_getObjCClassMetadata();
  static Model.model()();
  v2 = (void *)sub_22C01E498();
  swift_bridgeObjectRelease();
  return v2;
}

- (_TtC12MigrationKit5Model)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(Model *)&v3 init];
}

@end