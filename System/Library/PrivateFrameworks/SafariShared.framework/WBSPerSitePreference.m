@interface WBSPerSitePreference
+ (id)localizedStringForBinaryPreferenceValue:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (WBSPerSitePreference)initWithIdentifier:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation WBSPerSitePreference

- (WBSPerSitePreference)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSPerSitePreference;
  v5 = [(WBSPerSitePreference *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

+ (id)localizedStringForBinaryPreferenceValue:(id)a3
{
  [a3 BOOLValue];
  v3 = _WBSLocalizedString();
  return v3;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; identifier: %@>",
               objc_opt_class(),
               self,
               self->_identifier);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WBSPerSitePreference *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      identifier = self->_identifier;
      uint64_t v6 = [(WBSPerSitePreference *)v4 identifier];
      char v7 = [(NSString *)identifier isEqualToString:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end