@interface VocabularyResult
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC21SiriInformationSearch16VocabularyResult)init;
- (_TtC21SiriInformationSearch16VocabularyResult)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VocabularyResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC21SiriInformationSearch16VocabularyResult)initWithCoder:(id)a3
{
  return (_TtC21SiriInformationSearch16VocabularyResult *)VocabularyResult.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  VocabularyResult.encode(with:)((NSCoder)v4);
}

- (NSString)description
{
  return (NSString *)@objc VocabularyField.description.getter(self, (uint64_t)a2, VocabularyResult.description.getter);
}

- (_TtC21SiriInformationSearch16VocabularyResult)init
{
  result = (_TtC21SiriInformationSearch16VocabularyResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end