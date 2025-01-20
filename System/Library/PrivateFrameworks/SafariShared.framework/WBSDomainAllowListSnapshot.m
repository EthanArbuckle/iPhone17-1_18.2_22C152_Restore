@interface WBSDomainAllowListSnapshot
- (BOOL)isDomainAllowed:(id)a3;
- (BOOL)isEqual:(id)a3;
- (WBSDomainAllowListSnapshot)init;
- (WBSDomainAllowListSnapshot)initWithDomains:(id)a3;
- (WBSDomainAllowListSnapshot)initWithSnapshotData:(id)a3 error:(id *)a4;
- (id)snapshotData;
@end

@implementation WBSDomainAllowListSnapshot

- (WBSDomainAllowListSnapshot)init
{
  return 0;
}

- (WBSDomainAllowListSnapshot)initWithSnapshotData:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v6 = objc_msgSend(MEMORY[0x1E4F1C978], "safari_arrayWithPropertyListData:options:", a3, 0);
  if (v6)
  {
    v7 = [MEMORY[0x1E4F1CA80] set];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a4)
            {
              objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 259, 0, (void)v16);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }

            v14 = 0;
            goto LABEL_14;
          }
          objc_msgSend(v7, "addObject:", v13, (void)v16);
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    self = [(WBSDomainAllowListSnapshot *)self initWithDomains:v7];
    v14 = self;
LABEL_14:
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:0];
    v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (WBSDomainAllowListSnapshot)initWithDomains:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSDomainAllowListSnapshot;
  v5 = [(WBSDomainAllowListSnapshot *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    allowedDomains = v5->_allowedDomains;
    v5->_allowedDomains = (NSSet *)v6;

    id v8 = v5;
  }

  return v5;
}

- (BOOL)isDomainAllowed:(id)a3
{
  return [(NSSet *)self->_allowedDomains containsObject:a3];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(NSSet *)self->_allowedDomains isEqualToSet:v4[1]];

  return v5;
}

- (id)snapshotData
{
  v2 = (void *)MEMORY[0x1E4F28F98];
  v3 = [(NSSet *)self->_allowedDomains allObjects];
  id v4 = [v3 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];
  BOOL v5 = [v2 dataWithPropertyList:v4 format:200 options:0 error:0];

  return v5;
}

- (void).cxx_destruct
{
}

@end