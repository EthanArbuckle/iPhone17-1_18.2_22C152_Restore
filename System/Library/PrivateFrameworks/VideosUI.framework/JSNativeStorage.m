@interface JSNativeStorage
- (_TtC8VideosUI15JSNativeStorage)init;
- (_TtC8VideosUI15JSNativeStorage)initWithAppContext:(id)a3;
- (void)readData:(id)a3 :(id)a4;
- (void)storeData:(id)a3 :(id)a4 :(id)a5;
@end

@implementation JSNativeStorage

- (_TtC8VideosUI15JSNativeStorage)initWithAppContext:(id)a3
{
  id v4 = a3;
  return (_TtC8VideosUI15JSNativeStorage *)sub_1E2CB63E4(a3);
}

- (void)storeData:(id)a3 :(id)a4 :(id)a5
{
  uint64_t v7 = sub_1E387C928();
  uint64_t v9 = v8;
  swift_unknownObjectRetain();
  id v10 = a5;
  v11 = self;
  sub_1E387DB08();
  swift_unknownObjectRelease();
  sub_1E330FE88(v7, v9, (uint64_t)v12, v10);

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

- (void)readData:(id)a3 :(id)a4
{
  uint64_t v6 = sub_1E387C928();
  uint64_t v8 = v7;
  id v9 = a4;
  id v10 = self;
  sub_1E3310900(v6, v8, v9);

  swift_bridgeObjectRelease();
}

- (_TtC8VideosUI15JSNativeStorage)init
{
  return (_TtC8VideosUI15JSNativeStorage *)sub_1E305F08C();
}

@end