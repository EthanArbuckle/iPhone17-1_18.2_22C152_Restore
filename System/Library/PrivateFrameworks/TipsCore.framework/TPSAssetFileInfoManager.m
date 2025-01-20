@interface TPSAssetFileInfoManager
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsFallBack;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)fileMap;
- (TPSAssetFileInfoManager)initWithCoder:(id)a3;
- (TPSAssetFileInfoManager)initWithDictionary:(id)a3 clientConditions:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)fileInfoIdentifierWithMainIdentifier:(id)a3 userInterfaceStyle:(int64_t)a4;
- (id)fileInfoWithMainIdentifier:(id)a3 userInterfaceStyle:(int64_t)a4 scale:(int64_t)a5;
- (id)filesFromDictionary:(id)a3;
- (unint64_t)hash;
- (void)addNewAssetInfoFromFileMap:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsFallBack:(BOOL)a3;
- (void)setFileMap:(id)a3;
@end

@implementation TPSAssetFileInfoManager

- (id)filesFromDictionary:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [a3 TPSSafeArrayForKey:@"files"];
  uint64_t v4 = [v3 count];
  if (v4 < 1)
  {
    v5 = 0;
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v4];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          v12 = [TPSAssetFileInfo alloc];
          v13 = -[TPSAssetFileInfo initWithDictionary:](v12, "initWithDictionary:", v11, (void)v16);
          if (v13) {
            [v5 addObject:v13];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }
  }
  if (objc_msgSend(v5, "count", (void)v16)) {
    v14 = (void *)[v5 copy];
  }
  else {
    v14 = 0;
  }

  return v14;
}

- (TPSAssetFileInfoManager)initWithDictionary:(id)a3 clientConditions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)TPSAssetFileInfoManager;
  uint64_t v8 = [(TPSSerializableObject *)&v20 initWithDictionary:v6];
  if (v8)
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __63__TPSAssetFileInfoManager_initWithDictionary_clientConditions___block_invoke;
    v16[3] = &unk_1E5907F78;
    id v17 = v7;
    v10 = v8;
    long long v18 = v10;
    id v11 = v9;
    id v19 = v11;
    [v6 enumerateKeysAndObjectsUsingBlock:v16];
    if (![v11 count])
    {

      v14 = 0;
      goto LABEL_6;
    }
    uint64_t v12 = [v11 copy];
    fileMap = v10->_fileMap;
    v10->_fileMap = (NSDictionary *)v12;
  }
  v14 = v8;
LABEL_6:

  return v14;
}

void __63__TPSAssetFileInfoManager_initWithDictionary_clientConditions___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a1[4];
  id v7 = a2;
  if (![v6 count]) {
    goto LABEL_3;
  }
  uint64_t v8 = [v5 TPSSafeArrayForKey:@"conditions"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__TPSAssetFileInfoManager_initWithDictionary_clientConditions___block_invoke_2;
  v11[3] = &unk_1E59074D0;
  id v12 = a1[4];
  objc_msgSend(v8, "na_firstObjectPassingTest:", v11);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9) {
LABEL_3:
  }
    id v9 = v5;
  v10 = [a1[5] filesFromDictionary:v9];
  [a1[6] setObject:v10 forKeyedSubscript:v7];
}

uint64_t __38__TPSAssetFileInfoManager_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 fileMap];
}

- (void).cxx_destruct
{
}

- (unint64_t)hash
{
  v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

id __38__TPSAssetFileInfoManager_na_identity__block_invoke()
{
  if (TPSAssetFileInfoManagerKey_block_invoke_na_once_token_0 != -1) {
    dispatch_once(&TPSAssetFileInfoManagerKey_block_invoke_na_once_token_0, &__block_literal_global_35_1);
  }
  v0 = (void *)TPSAssetFileInfoManagerKey_block_invoke_na_once_object_0;
  return v0;
}

- (TPSAssetFileInfoManager)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TPSAssetFileInfoManager;
  id v5 = [(TPSSerializableObject *)&v14 initWithCoder:v4];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"fileMap"];
    fileMap = v5->_fileMap;
    v5->_fileMap = (NSDictionary *)v11;
  }
  return v5;
}

- (id)fileInfoIdentifierWithMainIdentifier:(id)a3 userInterfaceStyle:(int64_t)a4
{
  id v4 = [(TPSAssetFileInfoManager *)self fileInfoWithMainIdentifier:a3 userInterfaceStyle:a4 scale:0x7FFFFFFFFFFFFFFFLL];
  id v5 = [v4 identifier];

  return v5;
}

- (id)fileInfoWithMainIdentifier:(id)a3 userInterfaceStyle:(int64_t)a4 scale:(int64_t)a5
{
  id v8 = a3;
  uint64_t v22 = 0;
  v23 = (id *)&v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__6;
  v26 = __Block_byref_object_dispose__6;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__6;
  objc_super v20 = __Block_byref_object_dispose__6;
  id v21 = 0;
  uint64_t v9 = [(TPSAssetFileInfoManager *)self fileMap];
  v10 = [v9 objectForKeyedSubscript:v8];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__TPSAssetFileInfoManager_fileInfoWithMainIdentifier_userInterfaceStyle_scale___block_invoke;
  v15[3] = &unk_1E5907FA0;
  v15[4] = &v22;
  v15[5] = &v16;
  v15[6] = a4;
  v15[7] = a5;
  [v10 enumerateObjectsUsingBlock:v15];
  if (!v23[5])
  {
    objc_storeStrong(v23 + 5, (id)v17[5]);
    if (!v23[5])
    {
      if ([(TPSAssetFileInfoManager *)self allowsFallBack])
      {
        uint64_t v11 = [v10 firstObject];
        id v12 = v23[5];
        v23[5] = (id)v11;
      }
    }
  }
  id v13 = v23[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TPSAssetFileInfoManager;
  id v4 = a3;
  [(TPSSerializableObject *)&v6 encodeWithCoder:v4];
  id v5 = [(TPSAssetFileInfoManager *)self fileMap];
  [v4 encodeObject:v5 forKey:@"fileMap"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TPSAssetFileInfoManager;
  id v4 = [(TPSSerializableObject *)&v7 copyWithZone:a3];
  id v5 = [(TPSAssetFileInfoManager *)self fileMap];
  [v4 setFileMap:v5];

  return v4;
}

- (NSDictionary)fileMap
{
  return self->_fileMap;
}

- (void)setFileMap:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __79__TPSAssetFileInfoManager_fileInfoWithMainIdentifier_userInterfaceStyle_scale___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  if ([v10 userInterface] == a1[6])
  {
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
    uint64_t v7 = a1[7];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL && v7 != [v10 scale])
    {
      uint64_t v8 = *(void *)(a1[4] + 8);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = 0;
    }
  }
  if (*(void *)(*(void *)(a1[4] + 8) + 40)) {
    *a4 = 1;
  }
}

uint64_t __38__TPSAssetFileInfoManager_na_identity__block_invoke_2()
{
  uint64_t v0 = __38__TPSAssetFileInfoManager_na_identity__block_invoke_3();
  uint64_t v1 = TPSAssetFileInfoManagerKey_block_invoke_na_once_object_0;
  TPSAssetFileInfoManagerKey_block_invoke_na_once_object_0 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __38__TPSAssetFileInfoManager_na_identity__block_invoke_3()
{
  uint64_t v0 = [MEMORY[0x1E4F7A0E0] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_42];
  v2 = [v0 build];

  return v2;
}

uint64_t __63__TPSAssetFileInfoManager_initWithDictionary_clientConditions___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 TPSSafeStringForKey:@"ruleId"];
  uint64_t v4 = [*(id *)(a1 + 32) containsObject:v3];

  return v4;
}

- (void)addNewAssetInfoFromFileMap:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(TPSAssetFileInfoManager *)self fileMap];
    objc_super v6 = (void *)[v5 mutableCopy];

    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    objc_super v14 = __54__TPSAssetFileInfoManager_addNewAssetInfoFromFileMap___block_invoke;
    v15 = &unk_1E5907FC8;
    uint64_t v16 = self;
    id v7 = v6;
    id v17 = v7;
    [v4 enumerateKeysAndObjectsUsingBlock:&v12];
    uint64_t v8 = [(TPSAssetFileInfoManager *)self fileMap];
    uint64_t v9 = [v8 count];
    uint64_t v10 = [v7 count];

    if (v9 != v10)
    {
      uint64_t v11 = (void *)[v7 copy];
      [(TPSAssetFileInfoManager *)self setFileMap:v11];
    }
  }
}

void __54__TPSAssetFileInfoManager_addNewAssetInfoFromFileMap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  objc_super v6 = [*(id *)(a1 + 32) fileMap];
  id v7 = [v6 objectForKeyedSubscript:v8];

  if (!v7) {
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v8];
  }
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v12.receiver = self;
  v12.super_class = (Class)TPSAssetFileInfoManager;
  id v4 = [(TPSSerializableObject *)&v12 debugDescription];
  id v5 = (void *)[v3 initWithString:v4];

  objc_super v6 = [(TPSAssetFileInfoManager *)self fileMap];
  id v7 = [v6 debugDescription];
  [v5 appendFormat:@"\n  %@ = %@", @"fileMap", v7];

  id v8 = [(TPSAssetFileInfoManager *)self fileMap];
  uint64_t v9 = [v8 allValues];
  uint64_t v10 = [v9 debugDescription];
  [v5 appendFormat:@"\n  %@ = %@", @"files", v10];

  [v5 appendFormat:@"\n  %@ = %d", @"allowsFallBack", -[TPSAssetFileInfoManager allowsFallBack](self, "allowsFallBack")];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (BOOL)allowsFallBack
{
  return self->_allowsFallBack;
}

- (void)setAllowsFallBack:(BOOL)a3
{
  self->_allowsFallBack = a3;
}

@end