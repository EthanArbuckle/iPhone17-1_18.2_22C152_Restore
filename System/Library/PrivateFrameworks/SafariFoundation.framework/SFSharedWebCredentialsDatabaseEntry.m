@interface SFSharedWebCredentialsDatabaseEntry
- (BOOL)isApproved;
- (NSString)appID;
- (NSString)domain;
- (SFSharedWebCredentialsDatabaseEntry)initWithServiceDetails:(id)a3;
- (id)_initWithDomain:(id)a3 appID:(id)a4 service:(int64_t)a5 isApproved:(BOOL)a6;
- (id)description;
- (int64_t)service;
@end

@implementation SFSharedWebCredentialsDatabaseEntry

- (SFSharedWebCredentialsDatabaseEntry)initWithServiceDetails:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SFSharedWebCredentialsDatabaseEntry;
  v5 = [(SFSharedWebCredentialsDatabaseEntry *)&v22 init];
  if (v5)
  {
    v6 = [v4 serviceSpecifier];
    v7 = [v6 domain];
    v8 = v7;
    if (v7)
    {
      v9 = (void *)[v7 copy];
      uint64_t v10 = +[SFDomainAssociationUtilities domainByStrippingSubdomainWildcardPrefixIfNecessary:v9];
      domain = v5->_domain;
      v5->_domain = (NSString *)v10;

      v12 = [v6 applicationIdentifier];
      v13 = v12;
      if (v12)
      {
        uint64_t v14 = [v12 copy];
        appID = v5->_appID;
        v5->_appID = (NSString *)v14;

        v16 = [v6 serviceType];
        v17 = v16;
        if (v16)
        {
          id v18 = v16;
          if ([v18 isEqualToString:*MEMORY[0x263F6BD80]])
          {
            uint64_t v19 = 4;
          }
          else if ([v18 isEqualToString:*MEMORY[0x263F6BD90]])
          {
            uint64_t v19 = 5;
          }
          else if ([v18 isEqualToString:*MEMORY[0x263F6BDB0]])
          {
            uint64_t v19 = 7;
          }
          else if ([v18 isEqualToString:*MEMORY[0x263F6BDA0]])
          {
            uint64_t v19 = 1;
          }
          else if ([v18 isEqualToString:*MEMORY[0x263F6BDA8]])
          {
            uint64_t v19 = 2;
          }
          else if ([v18 isEqualToString:*MEMORY[0x263F6BD98]])
          {
            uint64_t v19 = 3;
          }
          else if ([v18 isEqualToString:*MEMORY[0x263F6BD88]])
          {
            uint64_t v19 = 6;
          }
          else
          {
            uint64_t v19 = 0;
          }

          v5->_service = v19;
          v5->_approved = [v4 isApproved];
          v20 = v5;
        }
        else
        {
          v20 = 0;
        }
      }
      else
      {
        v20 = 0;
      }
    }
    else
    {
      v20 = 0;
    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)_initWithDomain:(id)a3 appID:(id)a4 service:(int64_t)a5 isApproved:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SFSharedWebCredentialsDatabaseEntry;
  v12 = [(SFSharedWebCredentialsDatabaseEntry *)&v20 init];
  if (v12)
  {
    v13 = (void *)[v10 copy];
    uint64_t v14 = +[SFDomainAssociationUtilities domainByStrippingSubdomainWildcardPrefixIfNecessary:v13];
    domain = v12->_domain;
    v12->_domain = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    appID = v12->_appID;
    v12->_appID = (NSString *)v16;

    v12->_service = a5;
    v12->_approved = a6;
    id v18 = v12;
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  domain = self->_domain;
  appID = self->_appID;
  unint64_t v7 = self->_service - 1;
  if (v7 > 6) {
    v8 = @"Unknown";
  }
  else {
    v8 = (__CFString *)**((id **)&unk_2643914F8 + v7);
  }
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; domain = %@; appID = %@; service = %@; isApproved = %d",
    v4,
    self,
    domain,
    appID,
    v8,
  v9 = self->_approved);

  return v9;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)appID
{
  return self->_appID;
}

- (int64_t)service
{
  return self->_service;
}

- (BOOL)isApproved
{
  return self->_approved;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end