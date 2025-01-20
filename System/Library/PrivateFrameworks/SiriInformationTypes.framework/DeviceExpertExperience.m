@interface DeviceExpertExperience
+ (BOOL)supportsSecureCoding;
- (_TtC20SiriInformationTypes22DeviceExpertExperience)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DeviceExpertExperience

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC20SiriInformationTypes22DeviceExpertExperience)initWithCoder:(id)a3
{
  return (_TtC20SiriInformationTypes22DeviceExpertExperience *)DeviceExpertExperience.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  DeviceExpertExperience.encode(with:)((NSCoder)v4);
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC20SiriInformationTypes22DeviceExpertExperience_deviceExpertClientComponent;
  uint64_t v3 = type metadata accessor for Apple_Parsec_Siri_V2alpha_DeviceExpertClientComponent();
  id v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end