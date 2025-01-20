@interface LibraryBarItem
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtC8VideosUI14LibraryBarItem)init;
@end

@implementation LibraryBarItem

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1E387DB08();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = sub_1E345AE04((uint64_t)v8);

  sub_1E2C324CC((uint64_t)v8);
  return v6;
}

- (NSString)description
{
  v2 = self;
  sub_1E345B064();

  v3 = (void *)sub_1E387C8E8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC8VideosUI14LibraryBarItem)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end