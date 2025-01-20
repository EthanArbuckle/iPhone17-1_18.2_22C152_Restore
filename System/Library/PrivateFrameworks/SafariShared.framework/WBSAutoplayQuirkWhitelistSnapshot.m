@interface WBSAutoplayQuirkWhitelistSnapshot
- (BOOL)isEqual:(id)a3;
- (WBSAutoplayQuirkWhitelistSnapshot)init;
- (WBSAutoplayQuirkWhitelistSnapshot)initWithSnapshotData:(id)a3 error:(id *)a4;
- (id)snapshotData;
- (unint64_t)hash;
- (unint64_t)quirkTypeForDomain:(id)a3;
@end

@implementation WBSAutoplayQuirkWhitelistSnapshot

- (WBSAutoplayQuirkWhitelistSnapshot)init
{
  return 0;
}

- (WBSAutoplayQuirkWhitelistSnapshot)initWithSnapshotData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)WBSAutoplayQuirkWhitelistSnapshot;
  v7 = [(WBSAutoplayQuirkWhitelistSnapshot *)&v24 init];
  if (v7)
  {
    v8 = objc_msgSend(MEMORY[0x1E4F1C9E8], "safari_dictionaryWithPropertyListData:options:", v6, 0);
    v9 = v8;
    if (v8)
    {
      uint64_t v20 = 0;
      v21 = &v20;
      uint64_t v22 = 0x2020000000;
      char v23 = 1;
      uint64_t v14 = 0;
      v15 = &v14;
      uint64_t v16 = 0x3032000000;
      v17 = __Block_byref_object_copy_;
      v18 = __Block_byref_object_dispose_;
      id v19 = 0;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __64__WBSAutoplayQuirkWhitelistSnapshot_initWithSnapshotData_error___block_invoke;
      v13[3] = &unk_1E5C8C810;
      v13[4] = &v14;
      v13[5] = &v20;
      [v8 enumerateKeysAndObjectsUsingBlock:v13];
      if (a4)
      {
        v10 = (void *)v15[5];
        if (v10) {
          *a4 = v10;
        }
      }
      if (*((unsigned char *)v21 + 24))
      {
        objc_storeStrong((id *)&v7->_domainsToQuirkTypes, v9);
        v11 = v7;
      }
      else
      {
        v11 = 0;
      }
      _Block_object_dispose(&v14, 8);

      _Block_object_dispose(&v20, 8);
    }
    else if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:0];
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __64__WBSAutoplayQuirkWhitelistSnapshot_initWithSnapshotData_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (unint64_t)[v9 unsignedIntegerValue] >= 8)
  {
    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:0];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (unint64_t)quirkTypeForDomain:(id)a3
{
  v3 = [(NSDictionary *)self->_domainsToQuirkTypes objectForKeyedSubscript:a3];
  unint64_t v4 = [v3 integerValue];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (WBSAutoplayQuirkWhitelistSnapshot *)a3;
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
}

@end