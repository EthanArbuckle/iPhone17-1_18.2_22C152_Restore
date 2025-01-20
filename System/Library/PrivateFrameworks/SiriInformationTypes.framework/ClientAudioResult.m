@interface ClientAudioResult
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC21SiriInformationSearch17ClientAudioResult)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ClientAudioResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC21SiriInformationSearch17ClientAudioResult)initWithCoder:(id)a3
{
  return (_TtC21SiriInformationSearch17ClientAudioResult *)ClientAudioResult.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC21SiriInformationSearch17ClientAudioResult_vocabularyResult);
  id v5 = a3;
  v7 = self;
  v6 = (void *)MEMORY[0x261198B80](0xD000000000000010, 0x800000025C981A70);
  objc_msgSend(v5, sel_encodeObject_forKey_, v4, v6);

  PommesResult.encode(with:)((NSCoder)v5);
}

- (NSString)description
{
  v2 = self;
  uint64_t v3 = ClientAudioResult.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x261198B80](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC21SiriInformationSearch17ClientAudioResult_vocabularyResult));
}

@end