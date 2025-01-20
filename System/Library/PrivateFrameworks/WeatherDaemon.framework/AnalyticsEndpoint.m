@interface AnalyticsEndpoint
- (NSString)name;
- (NSString)sharedContainerIdentifier;
- (NSURL)url;
@end

@implementation AnalyticsEndpoint

- (NSURL)url
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_10004D860();
  swift_release();
  URL._bridgeToObjectiveC()(v6);
  v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (NSURL *)v8;
}

- (NSString)name
{
  swift_retain();
  sub_10004D9A4();
  swift_release();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)sharedContainerIdentifier
{
  swift_retain();
  sub_10004DA44();
  uint64_t v3 = v2;
  swift_release();
  if (v3)
  {
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v4 = 0;
  }
  return (NSString *)v4;
}

@end