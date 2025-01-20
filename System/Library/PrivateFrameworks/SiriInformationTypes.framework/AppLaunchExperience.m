@interface AppLaunchExperience
+ (BOOL)supportsSecureCoding;
- (_TtC20SiriInformationTypes19AppLaunchExperience)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AppLaunchExperience

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC20SiriInformationTypes19AppLaunchExperience)initWithCoder:(id)a3
{
  return (_TtC20SiriInformationTypes19AppLaunchExperience *)AppLaunchExperience.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  AppLaunchExperience.encode(with:)((NSCoder)v4);
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC20SiriInformationTypes19AppLaunchExperience_appsClientComponent;
  uint64_t v3 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AppsClientComponent();
  id v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end