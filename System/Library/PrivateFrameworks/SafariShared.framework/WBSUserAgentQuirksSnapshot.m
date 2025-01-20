@interface WBSUserAgentQuirksSnapshot
- (BOOL)isEqual:(id)a3;
- (WBSUserAgentQuirksSnapshot)initWithSnapshotData:(id)a3 error:(id *)a4;
- (id)quirkTypeForURLString:(id)a3 withDefaultUserAgent:(id)a4;
- (id)snapshotData;
- (unint64_t)hash;
@end

@implementation WBSUserAgentQuirksSnapshot

- (WBSUserAgentQuirksSnapshot)initWithSnapshotData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v37.receiver = self;
  v37.super_class = (Class)WBSUserAgentQuirksSnapshot;
  v7 = [(WBSUserAgentQuirksSnapshot *)&v37 init];
  if (v7)
  {
    v8 = objc_msgSend(MEMORY[0x1E4F1C9E8], "safari_dictionaryWithPropertyListData:options:", v6, 0);
    v9 = v8;
    if (v8)
    {
      v10 = [v8 objectForKeyedSubscript:@"UserAgentQuirks"];
      v11 = v10;
      if (v10 && [v10 count])
      {
        v12 = [v9 objectForKeyedSubscript:@"SitesRequiringUserAgentQuirks"];
        v13 = v12;
        if (v12 && [v12 count])
        {
          uint64_t v33 = 0;
          v34 = &v33;
          uint64_t v35 = 0x2020000000;
          char v36 = 1;
          uint64_t v27 = 0;
          v28 = &v27;
          uint64_t v29 = 0x3032000000;
          v30 = __Block_byref_object_copy__37;
          v31 = __Block_byref_object_dispose__37;
          id v32 = 0;
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __57__WBSUserAgentQuirksSnapshot_initWithSnapshotData_error___block_invoke;
          v23[3] = &unk_1E5CA08D0;
          v25 = &v27;
          v26 = &v33;
          id v24 = v11;
          [v13 enumerateKeysAndObjectsUsingBlock:v23];
          if (a4)
          {
            v14 = (void *)v28[5];
            if (v14) {
              *a4 = v14;
            }
          }
          if (*((unsigned char *)v34 + 24))
          {
            uint64_t v15 = [v9 copy];
            domainsToQuirkTypes = v7->_domainsToQuirkTypes;
            v7->_domainsToQuirkTypes = (NSDictionary *)v15;

            uint64_t v17 = [(NSDictionary *)v7->_domainsToQuirkTypes objectForKeyedSubscript:@"UserAgentQuirks"];
            userAgentQuirks = v7->_userAgentQuirks;
            v7->_userAgentQuirks = (NSDictionary *)v17;

            uint64_t v19 = [(NSDictionary *)v7->_domainsToQuirkTypes objectForKeyedSubscript:@"SitesRequiringUserAgentQuirks"];
            sitesRequiringUserAgentQuirks = v7->_sitesRequiringUserAgentQuirks;
            v7->_sitesRequiringUserAgentQuirks = (NSDictionary *)v19;

            v21 = v7;
          }
          else
          {
            v21 = 0;
          }

          _Block_object_dispose(&v27, 8);
          _Block_object_dispose(&v33, 8);
        }
        else if (a4)
        {
          [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:0];
          v21 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v21 = 0;
        }
      }
      else if (a4)
      {
        [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:0];
        v21 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = 0;
      }
    }
    else if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:0];
      v21 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

void __57__WBSUserAgentQuirksSnapshot_initWithSnapshotData_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([*(id *)(a1 + 32) objectForKey:v10],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:0];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (id)quirkTypeForURLString:(id)a3 withDefaultUserAgent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(v6, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 495, 0, 0);
  if ([v8 hasSuffix:@"/"])
  {
    uint64_t v9 = objc_msgSend(v8, "substringToIndex:", objc_msgSend(v8, "length") - 1);

    uint64_t v8 = (void *)v9;
  }
  id v10 = [(NSDictionary *)self->_sitesRequiringUserAgentQuirks objectForKeyedSubscript:v8];
  if (!v10)
  {
    v11 = objc_msgSend(v6, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 0, 0);
    id v10 = [(NSDictionary *)self->_sitesRequiringUserAgentQuirks objectForKeyedSubscript:v11];
    if (!v10)
    {
      v12 = objc_msgSend(v6, "safari_highLevelDomainFromHost");
      id v10 = [(NSDictionary *)self->_sitesRequiringUserAgentQuirks objectForKeyedSubscript:v12];
    }
  }
  uint64_t v13 = [(NSDictionary *)self->_userAgentQuirks objectForKeyedSubscript:v10];
  v14 = (void *)v13;
  if (v7 && !v13)
  {
    if ([v10 containsString:@"*"])
    {
      v14 = [v10 stringByReplacingOccurrencesOfString:@"*" withString:v7];
    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WBSUserAgentQuirksSnapshot *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(NSDictionary *)self->_domainsToQuirkTypes isEqualToDictionary:v4->_domainsToQuirkTypes];
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSDictionary *)self->_domainsToQuirkTypes hash];
}

- (id)snapshotData
{
  return (id)[MEMORY[0x1E4F28F98] dataWithPropertyList:self->_domainsToQuirkTypes format:200 options:0 error:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sitesRequiringUserAgentQuirks, 0);
  objc_storeStrong((id *)&self->_userAgentQuirks, 0);
  objc_storeStrong((id *)&self->_domainsToQuirkTypes, 0);
}

@end