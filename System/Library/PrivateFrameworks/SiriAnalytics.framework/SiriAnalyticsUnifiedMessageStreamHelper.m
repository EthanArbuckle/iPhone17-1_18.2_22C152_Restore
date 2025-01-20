@interface SiriAnalyticsUnifiedMessageStreamHelper
+ (id)fileURL;
+ (id)identifier;
+ (void)ensureDirectoryExistsAt:(id)a3;
- (SiriAnalyticsUnifiedMessageStreamHelper)init;
@end

@implementation SiriAnalyticsUnifiedMessageStreamHelper

+ (id)identifier
{
  static UnifiedMessageStreamHelper.identifier()();
  v2 = (void *)sub_1A2C0D470();
  swift_bridgeObjectRelease();
  return v2;
}

+ (void)ensureDirectoryExistsAt:(id)a3
{
  uint64_t v3 = sub_1A2C0CCF0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A2C0CCC0();
  static UnifiedMessageStreamHelper.ensureDirectoryExists(at:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

+ (id)fileURL
{
  uint64_t v2 = sub_1A2C0CCF0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UnifiedMessageStreamHelper.fileURL()();
  v6 = (void *)sub_1A2C0CC80();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v6;
}

- (SiriAnalyticsUnifiedMessageStreamHelper)init
{
  return (SiriAnalyticsUnifiedMessageStreamHelper *)UnifiedMessageStreamHelper.init()();
}

@end