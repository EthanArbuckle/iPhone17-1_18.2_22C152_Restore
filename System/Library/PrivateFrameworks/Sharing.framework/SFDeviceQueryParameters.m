@interface SFDeviceQueryParameters
- (BOOL)fallback;
- (BOOL)imperfectMatch;
- (BOOL)installedOnly;
- (BOOL)isEqual:(id)a3;
- (MAAssetQuery)maQuery;
- (NSString)queryType;
- (SFDeviceQueryParameters)initWithDeviceAssetQuery:(id)a3 installedOnly:(BOOL)a4 imperfectMatch:(BOOL)a5 fallback:(BOOL)a6;
- (id)description;
- (id)maAssetQueryDescription;
- (unint64_t)hash;
@end

@implementation SFDeviceQueryParameters

- (SFDeviceQueryParameters)initWithDeviceAssetQuery:(id)a3 installedOnly:(BOOL)a4 imperfectMatch:(BOOL)a5 fallback:(BOOL)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SFDeviceQueryParameters;
  v11 = [(SFDeviceQueryParameters *)&v22 init];
  v12 = v11;
  if (v11)
  {
    v11->_installedOnly = v8;
    v11->_imperfectMatch = a5;
    v11->_fallback = a6;
    v13 = (Class (__cdecl *)())getMAAssetQueryClass[0];
    id v14 = v10;
    id v15 = objc_alloc(v13());
    v16 = [v14 assetType];
    v17 = (void *)[v15 initWithType:v16];

    if (v8) {
      uint64_t v18 = 1;
    }
    else {
      uint64_t v18 = 2;
    }
    [v17 returnTypes:v18];
    v19 = [v14 effectiveProductType];

    SFDeviceAssetAddKeyValuePair(@"ProductType", v19, v17);
    maQuery = v12->_maQuery;
    v12->_maQuery = (MAAssetQuery *)v17;
  }
  return v12;
}

- (id)maAssetQueryDescription
{
  v2 = [(SFDeviceQueryParameters *)self maQuery];
  uint64_t v17 = 0;
  uint64_t v10 = objc_opt_class();
  NSAppendPrintF();
  id v16 = 0;
  NSAppendPrintF();
  id v3 = v16;

  uint64_t v4 = objc_msgSend(v2, "returnTypes", v10, v2);
  if (v4 == 2)
  {
    id v13 = v3;
    v5 = &v13;
  }
  else if (v4 == 1)
  {
    id v14 = v3;
    v5 = &v14;
  }
  else if (v4)
  {
    id v12 = v3;
    v5 = &v12;
  }
  else
  {
    id v15 = v3;
    v5 = &v15;
  }
  NSAppendPrintF();
  id v6 = *v5;

  v11 = [v2 queryParams];
  NSAppendPrintF();
  id v7 = v6;

  NSAppendPrintF();
  id v8 = v7;

  return v8;
}

- (id)description
{
  uint64_t v9 = objc_opt_class();
  NSAppendPrintF();
  id v3 = 0;
  if ([(SFDeviceQueryParameters *)self installedOnly]) {
    uint64_t v4 = "yes";
  }
  else {
    uint64_t v4 = "no";
  }
  uint64_t v10 = v4;
  NSAppendPrintF();
  id v5 = v3;

  [(SFDeviceQueryParameters *)self fallback];
  NSAppendPrintF();
  id v6 = v5;

  NSAppendPrintF();
  id v7 = v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SFDeviceQueryParameters *)a3;
  if (v4 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(SFDeviceQueryParameters *)self maQuery];
      id v7 = [(SFDeviceQueryParameters *)v5 maQuery];
      id v8 = v6;
      id v9 = v7;
      uint64_t v10 = v9;
      if (v8 == v9)
      {
      }
      else
      {
        if ((v8 == 0) == (v9 != 0))
        {

          goto LABEL_13;
        }
        int v11 = [v8 isEqual:v9];

        if (!v11) {
          goto LABEL_13;
        }
      }
      BOOL v13 = [(SFDeviceQueryParameters *)self installedOnly];
      if (v13 == [(SFDeviceQueryParameters *)v5 installedOnly])
      {
        BOOL v14 = [(SFDeviceQueryParameters *)self fallback];
        BOOL v12 = v14 ^ [(SFDeviceQueryParameters *)v5 fallback] ^ 1;
LABEL_14:

        goto LABEL_15;
      }
LABEL_13:
      LOBYTE(v12) = 0;
      goto LABEL_14;
    }
    LOBYTE(v12) = 0;
  }
LABEL_15:

  return v12;
}

- (unint64_t)hash
{
  v2 = [(SFDeviceQueryParameters *)self maQuery];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)queryType
{
  if (self->_fallback)
  {
    v2 = @"fallback asset";
  }
  else
  {
    if (self->_imperfectMatch) {
      unint64_t v3 = @" (imperfect)";
    }
    else {
      unint64_t v3 = &stru_1EF9BDC68;
    }
    if (self->_installedOnly) {
      uint64_t v4 = @"installed asset%@";
    }
    else {
      uint64_t v4 = @"catalog asset%@";
    }
    objc_msgSend(NSString, "stringWithFormat:", v4, v3);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v2;
}

- (MAAssetQuery)maQuery
{
  return self->_maQuery;
}

- (BOOL)installedOnly
{
  return self->_installedOnly;
}

- (BOOL)imperfectMatch
{
  return self->_imperfectMatch;
}

- (BOOL)fallback
{
  return self->_fallback;
}

- (void).cxx_destruct
{
}

@end