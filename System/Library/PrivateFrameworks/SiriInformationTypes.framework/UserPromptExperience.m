@interface UserPromptExperience
+ (BOOL)supportsSecureCoding;
- (_TtC20SiriInformationTypes20UserPromptExperience)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UserPromptExperience

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  UserPromptExperience.encode(with:)((NSCoder)v4);
}

- (_TtC20SiriInformationTypes20UserPromptExperience)initWithCoder:(id)a3
{
  return (_TtC20SiriInformationTypes20UserPromptExperience *)UserPromptExperience.init(coder:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

@end