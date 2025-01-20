@interface TTSVBBoxedError
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)description;
- (_TtC31TextToSpeechVoiceBankingSupport15TTSVBBoxedError)init;
- (_TtC31TextToSpeechVoiceBankingSupport15TTSVBBoxedError)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TTSVBBoxedError

+ (BOOL)supportsSecureCoding
{
  return byte_26A78C8F0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_26A78C8F0 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25F3084BC(v4);
}

- (_TtC31TextToSpeechVoiceBankingSupport15TTSVBBoxedError)initWithCoder:(id)a3
{
  return (_TtC31TextToSpeechVoiceBankingSupport15TTSVBBoxedError *)TTSVBBoxedError.init(coder:)(a3);
}

- (NSString)description
{
  v2 = self;
  TTSVBError.description.getter();

  v3 = (void *)sub_25F3F6100();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC31TextToSpeechVoiceBankingSupport15TTSVBBoxedError)init
{
  result = (_TtC31TextToSpeechVoiceBankingSupport15TTSVBBoxedError *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end