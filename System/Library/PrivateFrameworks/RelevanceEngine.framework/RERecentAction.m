@interface RERecentAction
+ (RERecentAction)actionWithBundleIdentifier:(id)a3 actionIdentifier:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)bundleIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)actionIdentifier;
- (unint64_t)hash;
- (void)setActionIdentifier:(unint64_t)a3;
- (void)setBundleIdentifier:(id)a3;
@end

@implementation RERecentAction

+ (RERecentAction)actionWithBundleIdentifier:(id)a3 actionIdentifier:(unint64_t)a4
{
  if (a3)
  {
    id v5 = a3;
    v6 = objc_opt_new();
    uint64_t v7 = [v5 copy];

    v8 = (void *)v6[1];
    v6[1] = v7;

    v6[2] = a4;
  }
  else
  {
    v6 = 0;
  }
  return (RERecentAction *)v6;
}

- (unint64_t)hash
{
  return self->_actionIdentifier ^ [(NSString *)self->_bundleIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RERecentAction *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      bundleIdentifier = self->_bundleIdentifier;
      uint64_t v7 = v5->_bundleIdentifier;
      if (bundleIdentifier == v7)
      {
      }
      else
      {
        v8 = v7;
        v9 = bundleIdentifier;
        int v10 = [(NSString *)v9 isEqual:v8];

        if (!v10)
        {
          BOOL v11 = 0;
LABEL_10:

          goto LABEL_11;
        }
      }
      BOOL v11 = self->_actionIdentifier == v5->_actionIdentifier;
      goto LABEL_10;
    }
    BOOL v11 = 0;
  }
LABEL_11:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (unint64_t)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)setActionIdentifier:(unint64_t)a3
{
  self->_actionIdentifier = a3;
}

- (void).cxx_destruct
{
}

@end