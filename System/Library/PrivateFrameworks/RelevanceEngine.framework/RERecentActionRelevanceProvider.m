@interface RERecentActionRelevanceProvider
- (BOOL)isEqual:(id)a3;
- (NSString)bundleIdentifier;
- (RERecentAction)recentAction;
- (RERecentActionRelevanceProvider)init;
- (RERecentActionRelevanceProvider)initWithBundleIdentifier:(id)a3 actionIdentifier:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)_hash;
- (unint64_t)actionIdentifier;
@end

@implementation RERecentActionRelevanceProvider

- (RERecentActionRelevanceProvider)init
{
  return [(RERecentActionRelevanceProvider *)self initWithBundleIdentifier:&stru_26CFA57D0 actionIdentifier:0];
}

- (RERecentActionRelevanceProvider)initWithBundleIdentifier:(id)a3 actionIdentifier:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RERecentActionRelevanceProvider;
  v7 = [(RERelevanceProvider *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = (NSString *)v8;

    v7->_actionIdentifier = a4;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RERecentActionRelevanceProvider;
  id v4 = [(RERelevanceProvider *)&v6 copyWithZone:a3];
  *((void *)v4 + 5) = self->_actionIdentifier;
  objc_storeStrong((id *)v4 + 4, self->_bundleIdentifier);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RERecentActionRelevanceProvider *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)RERecentActionRelevanceProvider;
    if ([(RERelevanceProvider *)&v13 isEqual:v4])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v5 = v4;
        bundleIdentifier = self->_bundleIdentifier;
        v7 = v5->_bundleIdentifier;
        if (bundleIdentifier == v7)
        {
        }
        else
        {
          uint64_t v8 = v7;
          v9 = bundleIdentifier;
          int v10 = [(NSString *)v9 isEqual:v8];

          if (!v10)
          {
            BOOL v11 = 0;
LABEL_11:

            goto LABEL_12;
          }
        }
        BOOL v11 = self->_actionIdentifier == v5->_actionIdentifier;
        goto LABEL_11;
      }
    }
    BOOL v11 = 0;
  }
LABEL_12:

  return v11;
}

- (unint64_t)_hash
{
  v5.receiver = self;
  v5.super_class = (Class)RERecentActionRelevanceProvider;
  unint64_t v3 = [(RERelevanceProvider *)&v5 _hash];
  return [(NSString *)self->_bundleIdentifier hash] ^ v3 ^ self->_actionIdentifier;
}

- (id)description
{
  unint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)RERecentActionRelevanceProvider;
  id v4 = [(RERecentActionRelevanceProvider *)&v7 description];
  objc_super v5 = [v3 stringWithFormat:@"%@ bundleIdentifier=%@, actionIdentifier=%llu", v4, self->_bundleIdentifier, self->_actionIdentifier];

  return v5;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (unint64_t)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void).cxx_destruct
{
}

- (RERecentAction)recentAction
{
  return +[RERecentAction actionWithBundleIdentifier:self->_bundleIdentifier actionIdentifier:self->_actionIdentifier];
}

@end