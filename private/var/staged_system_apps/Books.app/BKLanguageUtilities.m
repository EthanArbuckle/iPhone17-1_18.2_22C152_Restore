@interface BKLanguageUtilities
+ (id)dominantLanguageForString:(id)a3;
- (BKLanguageUtilities)init;
@end

@implementation BKLanguageUtilities

+ (id)dominantLanguageForString:(id)a3
{
  id v3 = a3;
  _s5Books17LanguageUtilitiesC08dominantB03forSSSgSo7JSValueC_tFZ_0(v3);
  uint64_t v5 = v4;

  if (v5)
  {
    NSString v6 = sub_1007FDC30();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }

  return v6;
}

- (BKLanguageUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LanguageUtilities();
  return [(BKLanguageUtilities *)&v3 init];
}

@end