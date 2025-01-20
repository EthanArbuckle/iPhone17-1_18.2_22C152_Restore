@interface PKRewardsTierEducationSection
+ (BOOL)supportsSecureCoding;
- (NSString)localizedSubtitle;
- (NSString)localizedTitle;
- (PKRewardsTierEducationSection)initWithCoder:(id)a3;
- (PKRewardsTierEducationSection)initWithTier:(unint64_t)a3 localizedTitle:(id)a4 localizedSubtitle:(id)a5;
- (unint64_t)tier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKRewardsTierEducationSection

- (PKRewardsTierEducationSection)initWithTier:(unint64_t)a3 localizedTitle:(id)a4 localizedSubtitle:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKRewardsTierEducationSection;
  v11 = [(PKRewardsTierEducationSection *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_tier = a3;
    objc_storeStrong((id *)&v11->_localizedTitle, a4);
    objc_storeStrong((id *)&v12->_localizedSubtitle, a5);
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKRewardsTierEducationSection)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKRewardsTierEducationSection;
  v5 = [(PKRewardsTierEducationSection *)&v11 init];
  if (v5)
  {
    v5->_tier = [v4 decodeIntegerForKey:@"tier"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedTitle"];
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedSubtitle"];
    localizedSubtitle = v5->_localizedSubtitle;
    v5->_localizedSubtitle = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t tier = self->_tier;
  id v5 = a3;
  [v5 encodeInteger:tier forKey:@"tier"];
  [v5 encodeObject:self->_localizedTitle forKey:@"localizedTitle"];
  [v5 encodeObject:self->_localizedSubtitle forKey:@"localizedSubtitle"];
}

- (unint64_t)tier
{
  return self->_tier;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end