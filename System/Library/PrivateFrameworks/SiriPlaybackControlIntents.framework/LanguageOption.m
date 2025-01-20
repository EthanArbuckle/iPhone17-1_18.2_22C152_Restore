@interface LanguageOption
+ (BOOL)supportsSecureCoding;
- (LanguageOption)initWithCoder:(id)a3;
- (LanguageOption)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
- (NSString)description;
@end

@implementation LanguageOption

- (NSString)description
{
  v2 = self;
  LanguageOption.description.getter();

  v3 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LanguageOption)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    sub_232A68588();
  }
  sub_232A68588();
  if (a5) {
    sub_232A68588();
  }
  return (LanguageOption *)LanguageOption.init(identifier:display:pronunciationHint:)();
}

- (LanguageOption)initWithCoder:(id)a3
{
  return (LanguageOption *)LanguageOption.init(coder:)(a3);
}

@end