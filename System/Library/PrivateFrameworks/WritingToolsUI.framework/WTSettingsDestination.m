@interface WTSettingsDestination
+ (NSURL)rootURL;
- (WTSettingsDestination)init;
@end

@implementation WTSettingsDestination

+ (NSURL)rootURL
{
  uint64_t v2 = sub_261C10B60();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_261C10A80();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F407C8], v2);
  sub_261C10B50();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v10 = (void *)sub_261C10A70();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return (NSURL *)v10;
}

- (WTSettingsDestination)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SettingsDestination();
  return [(WTSettingsDestination *)&v3 init];
}

@end