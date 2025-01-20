@interface BAAppAnalyticsAdditionalData
+ (NSString)editionKindKey;
+ (NSString)supportsUnifiedProductPageKey;
+ (id)dataWithDictionary:(id)a3;
- (BAAppAnalyticsAdditionalData)init;
- (BAAppAnalyticsAdditionalData)initWithSupportsUnifiedProductPage:(BOOL)a3 editionKind:(id)a4;
- (BOOL)supportsUnifiedProductPage;
- (NSString)editionKind;
- (id)dictionary;
@end

@implementation BAAppAnalyticsAdditionalData

- (BOOL)supportsUnifiedProductPage
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___BAAppAnalyticsAdditionalData_supportsUnifiedProductPage);
}

- (NSString)editionKind
{
  if (*(void *)&self->supportsUnifiedProductPage[OBJC_IVAR___BAAppAnalyticsAdditionalData_editionKind])
  {
    swift_bridgeObjectRetain();
    NSString v2 = sub_27DDA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

+ (NSString)supportsUnifiedProductPageKey
{
  NSString v2 = sub_27DDA0();

  return (NSString *)v2;
}

+ (NSString)editionKindKey
{
  NSString v2 = sub_27DDA0();

  return (NSString *)v2;
}

- (BAAppAnalyticsAdditionalData)initWithSupportsUnifiedProductPage:(BOOL)a3 editionKind:(id)a4
{
  if (a4)
  {
    uint64_t v6 = sub_27DDB0();
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }
  *((unsigned char *)&self->super.isa + OBJC_IVAR___BAAppAnalyticsAdditionalData_supportsUnifiedProductPage) = a3;
  v8 = (uint64_t *)((char *)self + OBJC_IVAR___BAAppAnalyticsAdditionalData_editionKind);
  uint64_t *v8 = v6;
  v8[1] = v7;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for AppAnalyticsAdditionalData();
  return [(BAAppAnalyticsAdditionalData *)&v10 init];
}

+ (id)dataWithDictionary:(id)a3
{
  uint64_t v3 = sub_27DD70();
  id v4 = _s13BookAnalytics03AppB14AdditionalDataC4data10dictionaryACSgSDySSypG_tFZ_0(v3);
  swift_bridgeObjectRelease();

  return v4;
}

- (id)dictionary
{
  NSString v2 = self;
  sub_465B0();

  v3.super.isa = sub_27DD60().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

- (BAAppAnalyticsAdditionalData)init
{
  result = (BAAppAnalyticsAdditionalData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end