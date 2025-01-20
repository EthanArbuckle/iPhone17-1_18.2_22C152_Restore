@interface CRLBoardPreviewImageCache.LookupKey
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtCC8Freeform25CRLBoardPreviewImageCache9LookupKey)init;
- (int64_t)hash;
@end

@implementation CRLBoardPreviewImageCache.LookupKey

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = sub_100611FB8((uint64_t)v8);

  sub_100522F00((uint64_t)v8, &qword_101672BF0);
  return v6;
}

- (int64_t)hash
{
  v2 = self;
  Swift::Int v3 = sub_100612170();

  return v3;
}

- (NSString)description
{
  v2 = self;
  sub_100612640();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtCC8Freeform25CRLBoardPreviewImageCache9LookupKey)init
{
  result = (_TtCC8Freeform25CRLBoardPreviewImageCache9LookupKey *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end