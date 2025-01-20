@interface GenericExperience
+ (BOOL)supportsSecureCoding;
- (_TtC21SiriInformationSearch17GenericExperience)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GenericExperience

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC21SiriInformationSearch17GenericExperience)initWithCoder:(id)a3
{
  return (_TtC21SiriInformationSearch17GenericExperience *)GenericExperience.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  GenericExperience.encode(with:)((NSCoder)v4);
}

- (void).cxx_destruct
{
}

@end