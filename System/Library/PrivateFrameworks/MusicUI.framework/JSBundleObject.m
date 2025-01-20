@interface JSBundleObject
- (NSDictionary)manifest;
- (_TtC7MusicUI14JSBundleObject)init;
- (id)loadResource:(id)a3;
@end

@implementation JSBundleObject

- (NSDictionary)manifest
{
  sub_229D7E454();
  v2 = (void *)sub_22A170630();
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2;
}

- (id)loadResource:(id)a3
{
  sub_22A1707E0();
  v4 = self;
  v5 = (void *)sub_229D7E464();

  swift_bridgeObjectRelease();

  return v5;
}

- (_TtC7MusicUI14JSBundleObject)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
}

@end