@interface WBSAppIDsToDomainsAssociationManager
- (NSDictionary)appIDsToDomains;
- (WBSAppIDsToDomainsAssociationManager)initWithAppIDsToDomains:(id)a3;
- (id)description;
- (id)domainsWithAssociatedCredentialsForAppID:(id)a3;
- (void)setAppIDsToDomains:(id)a3;
@end

@implementation WBSAppIDsToDomainsAssociationManager

- (WBSAppIDsToDomainsAssociationManager)initWithAppIDsToDomains:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSAppIDsToDomainsAssociationManager;
  v5 = [(WBSAppIDsToDomainsAssociationManager *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    appIDsToDomains = v5->_appIDsToDomains;
    v5->_appIDsToDomains = (NSDictionary *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)domainsWithAssociatedCredentialsForAppID:(id)a3
{
  return [(NSDictionary *)self->_appIDsToDomains objectForKeyedSubscript:a3];
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; appIDsToDomains: %@>",
               objc_opt_class(),
               self,
               self->_appIDsToDomains);
}

- (NSDictionary)appIDsToDomains
{
  return self->_appIDsToDomains;
}

- (void)setAppIDsToDomains:(id)a3
{
}

- (void).cxx_destruct
{
}

@end