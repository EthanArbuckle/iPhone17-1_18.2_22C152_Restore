@interface PRMutablePosterConfiguration
- (NSString)pu_displayNameLocalizationKey;
- (void)setPu_displayNameLocalizationKey:(id)a3;
@end

@implementation PRMutablePosterConfiguration

- (NSString)pu_displayNameLocalizationKey
{
  v2 = self;
  PRMutablePosterConfiguration.pu_displayNameLocalizationKey.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = sub_100028CB0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setPu_displayNameLocalizationKey:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_100028CE0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  PRMutablePosterConfiguration.pu_displayNameLocalizationKey.setter(v4, v6);
}

@end