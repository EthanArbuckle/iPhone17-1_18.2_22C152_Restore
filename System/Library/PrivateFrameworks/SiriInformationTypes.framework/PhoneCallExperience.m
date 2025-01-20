@interface PhoneCallExperience
+ (BOOL)supportsSecureCoding;
- (_TtC21SiriInformationSearch19PhoneCallExperience)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PhoneCallExperience

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC21SiriInformationSearch19PhoneCallExperience)initWithCoder:(id)a3
{
  return (_TtC21SiriInformationSearch19PhoneCallExperience *)PhoneCallExperience.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  PhoneCallExperience.encode(with:)((NSCoder)v4);
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC21SiriInformationSearch19PhoneCallExperience_phoneCall;
  uint64_t v3 = type metadata accessor for Apple_Parsec_Siri_V2alpha_PhoneCallBuilderParams();
  id v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end