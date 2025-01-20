@interface VocabularyField
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC21SiriInformationSearch15VocabularyField)init;
- (_TtC21SiriInformationSearch15VocabularyField)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VocabularyField

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC21SiriInformationSearch15VocabularyField)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtC21SiriInformationSearch15VocabularyField *)specialized VocabularyField.init(coder:)(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  VocabularyField.encode(with:)((NSCoder)v4);
}

- (NSString)description
{
  return (NSString *)@objc VocabularyField.description.getter(self, (uint64_t)a2, (uint64_t (*)(void))VocabularyField.description.getter);
}

- (_TtC21SiriInformationSearch15VocabularyField)init
{
  result = (_TtC21SiriInformationSearch15VocabularyField *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end