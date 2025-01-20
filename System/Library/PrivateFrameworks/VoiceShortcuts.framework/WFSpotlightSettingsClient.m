@interface WFSpotlightSettingsClient
+ (WFSpotlightSettingsClient)shared;
- (BOOL)isSpotlightEnabledForBundleIdentifier:(id)a3;
- (WFSpotlightSettingsClient)init;
@end

@implementation WFSpotlightSettingsClient

+ (WFSpotlightSettingsClient)shared
{
  id v2 = static SpotlightSettingsClient.shared.getter();
  return (WFSpotlightSettingsClient *)v2;
}

- (BOOL)isSpotlightEnabledForBundleIdentifier:(id)a3
{
  uint64_t v4 = sub_1C7E992D0();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  LOBYTE(v4) = SpotlightSettingsClient.isSpotlightEnabled(for:)(v8);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (WFSpotlightSettingsClient)init
{
  return (WFSpotlightSettingsClient *)SpotlightSettingsClient.init()();
}

@end