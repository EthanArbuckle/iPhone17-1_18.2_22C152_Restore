@interface GeoExperience
+ (BOOL)supportsSecureCoding;
- (_TtC21SiriInformationSearch13GeoExperience)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GeoExperience

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC21SiriInformationSearch13GeoExperience)initWithCoder:(id)a3
{
  return (_TtC21SiriInformationSearch13GeoExperience *)GeoExperience.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  GeoExperience.encode(with:)((NSCoder)v4);
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC21SiriInformationSearch13GeoExperience_geoClientComponent;
  uint64_t v3 = type metadata accessor for Apple_Parsec_Siri_V2alpha_GeoClientComponent();
  id v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end