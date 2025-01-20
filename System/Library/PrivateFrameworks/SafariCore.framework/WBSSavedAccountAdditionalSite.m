@interface WBSSavedAccountAdditionalSite
- (BOOL)isEqual:(id)a3;
- (NSString)site;
- (WBSSavedAccountAdditionalSite)initWithDictionaryRepresentation:(id)a3;
- (WBSSavedAccountAdditionalSite)initWithSite:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
@end

@implementation WBSSavedAccountAdditionalSite

- (WBSSavedAccountAdditionalSite)initWithSite:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSSavedAccountAdditionalSite;
  v6 = [(WBSSavedAccountAdditionalSite *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_site, a3);
    v8 = v7;
  }

  return v7;
}

- (WBSSavedAccountAdditionalSite)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSSavedAccountAdditionalSite;
  id v5 = [(WBSSavedAccountAdditionalSite *)&v10 init];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"s"];
    site = v5->_site;
    v5->_site = (NSString *)v6;

    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  site = self->_site;
  if (site) {
    [v3 setObject:site forKeyedSubscript:@"s"];
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WBSSavedAccountAdditionalSite *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      site = self->_site;
      uint64_t v6 = [(WBSSavedAccountAdditionalSite *)v4 site];
      char v7 = WBSIsEqual(site, v6);
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
  return [(NSString *)self->_site hash];
}

- (NSString)site
{
  return self->_site;
}

- (void).cxx_destruct
{
}

@end