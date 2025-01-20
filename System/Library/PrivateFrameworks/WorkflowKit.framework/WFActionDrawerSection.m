@interface WFActionDrawerSection
- (BOOL)isLoading;
- (NSArray)donations;
- (NSString)bundleIdentifier;
- (NSString)localizedTitle;
- (WFActionDrawerSection)initWithLocalizedTitle:(id)a3 donations:(id)a4 bundleIdentifier:(id)a5 sectionType:(int64_t)a6;
- (int64_t)sectionType;
- (void)setDonations:(id)a3;
@end

@implementation WFActionDrawerSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_donations, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (int64_t)sectionType
{
  return self->_sectionType;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setDonations:(id)a3
{
}

- (NSArray)donations
{
  return self->_donations;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (WFActionDrawerSection)initWithLocalizedTitle:(id)a3 donations:(id)a4 bundleIdentifier:(id)a5 sectionType:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v22.receiver = self;
  v22.super_class = (Class)WFActionDrawerSection;
  v14 = [(WFActionDrawerSection *)&v22 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_localizedTitle, a3);
    uint64_t v16 = [v12 copy];
    donations = v15->_donations;
    v15->_donations = (NSArray *)v16;

    uint64_t v18 = [v13 copy];
    bundleIdentifier = v15->_bundleIdentifier;
    v15->_bundleIdentifier = (NSString *)v18;

    v15->_sectionType = a6;
    v20 = v15;
  }

  return v15;
}

@end