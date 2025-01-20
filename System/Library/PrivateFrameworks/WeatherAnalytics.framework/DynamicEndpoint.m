@interface DynamicEndpoint
- (NSString)name;
- (NSString)sharedContainerIdentifier;
- (NSURL)url;
@end

@implementation DynamicEndpoint

- (NSString)name
{
  swift_retain();
  sub_20A0DC43C();
  swift_release();
  v2 = (void *)sub_20A188150();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSURL)url
{
  uint64_t v2 = sub_20A186DB0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_20A119BF4();
  swift_release();
  v6 = (void *)sub_20A186DA0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (NSURL *)v6;
}

- (NSString)sharedContainerIdentifier
{
  swift_retain();
  sub_20A119D44();
  uint64_t v3 = v2;
  swift_release();
  if (v3)
  {
    uint64_t v4 = (void *)sub_20A188150();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (NSString *)v4;
}

@end