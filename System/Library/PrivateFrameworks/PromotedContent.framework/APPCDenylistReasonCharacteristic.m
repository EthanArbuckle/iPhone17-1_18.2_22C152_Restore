@interface APPCDenylistReasonCharacteristic
- (APPCDenylistReasonCharacteristic)init;
- (APPCDenylistReasonCharacteristic)initWithGlobalCategories:(id)a3 globalKeywords:(id)a4 campaignCategories:(id)a5 campaignKeywords:(id)a6;
- (NSArray)campaignCategories;
- (NSArray)campaignKeywords;
- (NSArray)globalCategories;
- (NSArray)globalKeywords;
- (void)setCampaignCategories:(id)a3;
- (void)setCampaignKeywords:(id)a3;
- (void)setGlobalCategories:(id)a3;
- (void)setGlobalKeywords:(id)a3;
@end

@implementation APPCDenylistReasonCharacteristic

- (NSArray)globalCategories
{
  return (NSArray *)sub_1B5C3D0D0();
}

- (void)setGlobalCategories:(id)a3
{
}

- (NSArray)globalKeywords
{
  return (NSArray *)sub_1B5C3D0D0();
}

- (void)setGlobalKeywords:(id)a3
{
}

- (NSArray)campaignCategories
{
  return (NSArray *)sub_1B5C3D0D0();
}

- (void)setCampaignCategories:(id)a3
{
}

- (NSArray)campaignKeywords
{
  return (NSArray *)sub_1B5C3D0D0();
}

- (void)setCampaignKeywords:(id)a3
{
}

- (APPCDenylistReasonCharacteristic)initWithGlobalCategories:(id)a3 globalKeywords:(id)a4 campaignCategories:(id)a5 campaignKeywords:(id)a6
{
  uint64_t v6 = sub_1B5CB34C0();
  uint64_t v7 = sub_1B5CB34C0();
  uint64_t v8 = sub_1B5CB34C0();
  uint64_t v9 = sub_1B5CB34C0();
  return (APPCDenylistReasonCharacteristic *)DenylistReasonCharacteristic.init(globalCategories:globalKeywords:campaignCategories:campaignKeywords:)(v6, v7, v8, v9);
}

- (APPCDenylistReasonCharacteristic)init
{
  result = (APPCDenylistReasonCharacteristic *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end