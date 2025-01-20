@interface Experience
+ (BOOL)supportsSecureCoding;
- (_TtC21SiriInformationSearch10Experience)init;
- (_TtC21SiriInformationSearch10Experience)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation Experience

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC21SiriInformationSearch10Experience)initWithCoder:(id)a3
{
  return (_TtC21SiriInformationSearch10Experience *)Experience.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  Experience.encode(with:)((NSCoder)v4);
}

- (_TtC21SiriInformationSearch10Experience)init
{
  result = (_TtC21SiriInformationSearch10Experience *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC21SiriInformationSearch10Experience_userDialogAct;
  uint64_t v4 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC21SiriInformationSearch10Experience_intent;
  uint64_t v6 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end