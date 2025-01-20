@interface UniversalMetricsDictionary
- (NSDictionary)dictionary;
- (_TtC8ShelfKit26UniversalMetricsDictionary)init;
@end

@implementation UniversalMetricsDictionary

- (NSDictionary)dictionary
{
  v2 = self;
  UniversalMetricsDictionary.dictionary.getter();

  v3.super.isa = sub_3D7BA0().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v3.super.isa;
}

- (_TtC8ShelfKit26UniversalMetricsDictionary)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  double v5 = sub_1C3C44();
  uint64_t v7 = v6;
  v9 = v8;
  v10 = [self ams_sharedAccountStore];
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC8ShelfKit26UniversalMetricsDictionary_accountStore) = v10;
  v11 = (double *)((char *)v4 + OBJC_IVAR____TtC8ShelfKit26UniversalMetricsDictionary_screenSize);
  double *v11 = v5;
  *((void *)v11 + 1) = v7;
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC8ShelfKit26UniversalMetricsDictionary_screenScale) = v9;

  v13.receiver = v4;
  v13.super_class = ObjectType;
  return [(UniversalMetricsDictionary *)&v13 init];
}

- (void).cxx_destruct
{
}

@end