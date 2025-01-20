@interface TPPolicyDocument
+ (BOOL)isEqualKeyViewMapping:(id)a3 other:(id)a4;
+ (id)categoriesByViewFromPb:(id)a3;
+ (id)introducersByCategoryFromPb:(id)a3;
+ (id)modelToCategoryFromPb:(id)a3;
+ (id)policyDocWithHash:(id)a3 data:(id)a4;
+ (id)redactionWithEncrypter:(id)a3 redactionName:(id)a4 encryptionKey:(id)a5 modelToCategory:(id)a6 categoriesByView:(id)a7 introducersByCategory:(id)a8 keyViewMapping:(id)a9 error:(id *)a10;
+ (id)redactionsFromPb:(id)a3;
+ (void)addCategoriesByView:(id)a3 toPB:(id)a4;
+ (void)addIntroducersByCategory:(id)a3 toPB:(id)a4;
+ (void)addKeyViewMapping:(id)a3 toPB:(id)a4;
+ (void)addModelToCategory:(id)a3 toPB:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPolicyDocument:(id)a3;
- (NSArray)keyViewMapping;
- (NSData)protobuf;
- (TPPolicyDocument)initWithHash:(id)a3 data:(id)a4;
- (TPPolicyDocument)initWithVersion:(unint64_t)a3 modelToCategory:(id)a4 categoriesByView:(id)a5 introducersByCategory:(id)a6 redactions:(id)a7 keyViewMapping:(id)a8 userControllableViewList:(id)a9 piggybackViews:(id)a10 priorityViews:(id)a11 inheritedExcludedViews:(id)a12 hashAlgo:(int64_t)a13;
- (TPPolicyVersion)version;
- (id)cloneWithVersionNumber:(unint64_t)a3;
- (id)cloneWithVersionNumber:(unint64_t)a3 prependingCategoriesByView:(id)a4 prependingKeyViewMapping:(id)a5;
- (id)cloneWithVersionNumber:(unint64_t)a3 prependingCategoriesByView:(id)a4 prependingKeyViewMapping:(id)a5 prependingRedactions:(id)a6;
- (id)description;
- (id)encodeProtobuf;
- (id)policyWithSecrets:(id)a3 decrypter:(id)a4 error:(id *)a5;
- (unint64_t)hash;
@end

@implementation TPPolicyDocument

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protobuf, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

- (NSData)protobuf
{
  return self->_protobuf;
}

- (TPPolicyVersion)version
{
  return self->_version;
}

- (unint64_t)hash
{
  v2 = [(TPPolicyDocument *)self version];
  v3 = [v2 policyHash];
  unint64_t v4 = [v3 hash];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (TPPolicyDocument *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TPPolicyDocument *)self isEqualToPolicyDocument:v4];
  }

  return v5;
}

- (id)cloneWithVersionNumber:(unint64_t)a3 prependingCategoriesByView:(id)a4 prependingKeyViewMapping:(id)a5 prependingRedactions:(id)a6
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [TPPBPolicyDocument alloc];
  v14 = [(TPPolicyDocument *)self protobuf];
  v15 = [(TPPBPolicyDocument *)v13 initWithData:v14];

  [(TPPBPolicyDocument *)v15 setPolicyVersion:a3];
  v48 = v10;
  if (v10)
  {
    v45 = self;
    id v46 = v12;
    id v47 = v11;
    v16 = [MEMORY[0x263EFF980] array];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v17 = [v10 allKeys];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v50 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v49 + 1) + 8 * i);
          v23 = objc_alloc_init(TPPBPolicyCategoriesByView);
          [(TPPBPolicyCategoriesByView *)v23 setView:v22];
          v24 = [v48 objectForKeyedSubscript:v22];
          v25 = [v24 allObjects];
          v26 = (void *)[v25 mutableCopy];
          [(TPPBPolicyCategoriesByView *)v23 setCategories:v26];

          [v16 addObject:v23];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v49 objects:v53 count:16];
      }
      while (v19);
    }

    v27 = [(TPPBPolicyDocument *)v15 categoriesByViews];
    v28 = [v16 arrayByAddingObjectsFromArray:v27];
    v29 = (void *)[v28 mutableCopy];
    [(TPPBPolicyDocument *)v15 setCategoriesByViews:v29];

    id v12 = v46;
    id v11 = v47;
    self = v45;
  }
  if (v11)
  {
    v30 = [(TPPBPolicyDocument *)v15 keyViewMappings];
    v31 = [v11 arrayByAddingObjectsFromArray:v30];
    v32 = (void *)[v31 mutableCopy];
    [(TPPBPolicyDocument *)v15 setKeyViewMappings:v32];
  }
  if (v12)
  {
    v33 = [(TPPBPolicyDocument *)v15 redactions];
    v34 = [v12 arrayByAddingObjectsFromArray:v33];
    v35 = (void *)[v34 mutableCopy];
    [(TPPBPolicyDocument *)v15 setRedactions:v35];
  }
  v36 = [(TPPolicyDocument *)self version];
  v37 = [v36 policyHash];
  int64_t v38 = +[TPHashBuilder algoOfHash:v37];
  v39 = [(TPPBPolicyDocument *)v15 data];
  v40 = +[TPHashBuilder hashWithAlgo:v38 ofData:v39];

  v41 = [TPPolicyDocument alloc];
  v42 = [(TPPBPolicyDocument *)v15 data];
  v43 = [(TPPolicyDocument *)v41 initWithHash:v40 data:v42];

  return v43;
}

- (id)cloneWithVersionNumber:(unint64_t)a3 prependingCategoriesByView:(id)a4 prependingKeyViewMapping:(id)a5
{
  return [(TPPolicyDocument *)self cloneWithVersionNumber:a3 prependingCategoriesByView:a4 prependingKeyViewMapping:a5 prependingRedactions:0];
}

- (id)cloneWithVersionNumber:(unint64_t)a3
{
  return [(TPPolicyDocument *)self cloneWithVersionNumber:a3 prependingCategoriesByView:0 prependingKeyViewMapping:0 prependingRedactions:0];
}

- (BOOL)isEqualToPolicyDocument:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  id v4 = a3;
  BOOL v5 = [(TPPolicyDocument *)self encodeProtobuf];
  v6 = [v4 encodeProtobuf];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (id)description
{
  v2 = NSString;
  v3 = [(TPPolicyDocument *)self version];
  id v4 = [v2 stringWithFormat:@"<TPPolicyDocument: %@>", v3];

  return v4;
}

- (NSArray)keyViewMapping
{
  v3 = (void *)MEMORY[0x210554CF0](self, a2);
  id v4 = [TPPBPolicyDocument alloc];
  BOOL v5 = [(TPPolicyDocument *)self protobuf];
  v6 = [(TPPBPolicyDocument *)v4 initWithData:v5];

  v7 = [(TPPBPolicyDocument *)v6 keyViewMappings];

  return (NSArray *)v7;
}

- (id)policyWithSecrets:(id)a3 decrypter:(id)a4 error:(id *)a5
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v55 = a4;
  v9 = [TPPBPolicyDocument alloc];
  long long v49 = self;
  id v10 = [(TPPolicyDocument *)self protobuf];
  id v11 = [(TPPBPolicyDocument *)v9 initWithData:v10];

  long long v51 = v11;
  id v12 = [(TPPBPolicyDocument *)v11 redactions];
  v13 = +[TPPolicyDocument redactionsFromPb:v12];

  uint64_t v54 = objc_opt_new();
  v14 = (void *)MEMORY[0x263EFF9C0];
  v15 = [v13 allKeys];
  v53 = [v14 setWithArray:v15];

  v56 = v8;
  v16 = [v8 allKeys];
  v17 = [v16 sortedArrayUsingSelector:sel_compare_];

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v17;
  uint64_t v18 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v58;
    while (2)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v58 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void *)(*((void *)&v57 + 1) + 8 * i);
        v23 = [v56 objectForKeyedSubscript:v22];
        uint64_t v24 = [v13 objectForKeyedSubscript:v22];
        if (v24)
        {
          v25 = (void *)v24;
          uint64_t v26 = [v55 decryptData:v24 withKey:v23 error:a5];
          if (!v26)
          {
            v37 = 0;
            long long v50 = obj;
            goto LABEL_16;
          }
          v27 = (void *)v26;
          v28 = [[TPPBPolicyDocument alloc] initWithData:v26];
          if (!v28)
          {
            v37 = 0;
            long long v50 = obj;
            goto LABEL_15;
          }
          v29 = v28;
          [v53 removeObject:v22];
          [v54 mergeFrom:v29];
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }

  [v54 mergeFrom:v51];
  long long v50 = [v54 modelToCategorys];
  v23 = +[TPPolicyDocument modelToCategoryFromPb:v50];
  v25 = [v54 categoriesByViews];
  v27 = +[TPPolicyDocument categoriesByViewFromPb:v25];
  id v47 = [v54 introducersByCategorys];
  v48 = +[TPPolicyDocument introducersByCategoryFromPb:v47];
  v44 = [v54 keyViewMappings];
  BOOL v43 = [v53 count] != 0;
  v30 = (void *)MEMORY[0x263EFFA08];
  id v46 = [v54 userControllableViews];
  v41 = [v30 setWithArray:v46];
  v31 = (void *)MEMORY[0x263EFFA08];
  v45 = [v54 piggybackViews];
  v40 = [v31 setWithArray:v45];
  v32 = (void *)MEMORY[0x263EFFA08];
  v42 = [v54 priorityViews];
  v39 = [v32 setWithArray:v42];
  v33 = (void *)MEMORY[0x263EFFA08];
  v34 = [v54 inheritedExcludedViews];
  v35 = [v33 setWithArray:v34];
  v36 = [(TPPolicyDocument *)v49 version];
  v37 = +[TPPolicy policyWithModelToCategory:v23 categoriesByView:v27 introducersByCategory:v48 keyViewMapping:v44 unknownRedactions:v43 userControllableViewList:v41 piggybackViews:v40 priorityViews:v39 inheritedExcludedViews:v35 version:v36];

LABEL_15:
LABEL_16:

  return v37;
}

- (id)encodeProtobuf
{
  v3 = [TPPBPolicyDocument alloc];
  id v4 = [(TPPolicyDocument *)self protobuf];
  BOOL v5 = [(TPPBPolicyDocument *)v3 initWithData:v4];

  return v5;
}

- (TPPolicyDocument)initWithVersion:(unint64_t)a3 modelToCategory:(id)a4 categoriesByView:(id)a5 introducersByCategory:(id)a6 redactions:(id)a7 keyViewMapping:(id)a8 userControllableViewList:(id)a9 piggybackViews:(id)a10 priorityViews:(id)a11 inheritedExcludedViews:(id)a12 hashAlgo:(int64_t)a13
{
  id v53 = a4;
  id v52 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  v55.receiver = self;
  v55.super_class = (Class)TPPolicyDocument;
  v25 = [(TPPolicyDocument *)&v55 init];
  if (v25)
  {
    uint64_t v26 = objc_alloc_init(TPPBPolicyDocument);
    [(TPPBPolicyDocument *)v26 setPolicyVersion:a3];
    uint64_t v54 = v25;
    v27 = (void *)[v53 mutableCopy];
    [(TPPBPolicyDocument *)v26 setModelToCategorys:v27];

    v28 = (void *)[v52 mutableCopy];
    [(TPPBPolicyDocument *)v26 setCategoriesByViews:v28];

    v29 = (void *)[v18 mutableCopy];
    [(TPPBPolicyDocument *)v26 setIntroducersByCategorys:v29];

    v30 = (void *)[v19 mutableCopy];
    [(TPPBPolicyDocument *)v26 setRedactions:v30];

    v31 = (void *)[v20 mutableCopy];
    [(TPPBPolicyDocument *)v26 setKeyViewMappings:v31];

    v32 = (void *)[v21 mutableCopy];
    [(TPPBPolicyDocument *)v26 setUserControllableViews:v32];

    v33 = (void *)[v22 mutableCopy];
    [(TPPBPolicyDocument *)v26 setPiggybackViews:v33];

    v34 = (void *)[v23 mutableCopy];
    [(TPPBPolicyDocument *)v26 setPriorityViews:v34];

    v35 = (void *)[v24 mutableCopy];
    [(TPPBPolicyDocument *)v26 setInheritedExcludedViews:v35];

    uint64_t v36 = [(TPPBPolicyDocument *)v26 data];
    protobuf = v54->_protobuf;
    v54->_protobuf = (NSData *)v36;

    int64_t v38 = [TPPolicyVersion alloc];
    +[TPHashBuilder hashWithAlgo:a13 ofData:v54->_protobuf];
    id v39 = v24;
    id v40 = v23;
    id v41 = v22;
    id v42 = v21;
    id v43 = v20;
    id v44 = v19;
    id v46 = v45 = v18;
    id v47 = v38;
    v25 = v54;
    uint64_t v48 = [(TPPolicyVersion *)v47 initWithVersion:a3 hash:v46];
    version = v54->_version;
    v54->_version = (TPPolicyVersion *)v48;

    id v18 = v45;
    id v19 = v44;
    id v20 = v43;
    id v21 = v42;
    id v22 = v41;
    id v23 = v40;
    id v24 = v39;
  }
  return v25;
}

- (TPPolicyDocument)initWithHash:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    id v10 = +[TPHashBuilder hashWithAlgo:ofData:](TPHashBuilder, "hashWithAlgo:ofData:", +[TPHashBuilder algoOfHash:v6], v7);
    if ([v6 isEqualToString:v10])
    {
      v18.receiver = self;
      v18.super_class = (Class)TPPolicyDocument;
      id v11 = [(TPPolicyDocument *)&v18 init];
      id v12 = v11;
      if (v11)
      {
        objc_storeStrong((id *)&v11->_protobuf, a4);
        v13 = (void *)MEMORY[0x210554CF0]();
        v14 = [[TPPBPolicyDocument alloc] initWithData:v8];
        v15 = [[TPPolicyVersion alloc] initWithVersion:[(TPPBPolicyDocument *)v14 policyVersion] hash:v10];
        version = v12->_version;
        v12->_version = v15;
      }
      self = v12;
      v9 = self;
    }
    else
    {
      v9 = 0;
    }
  }
  return v9;
}

+ (BOOL)isEqualKeyViewMapping:(id)a3 other:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count] || objc_msgSend(v6, "count")) {
    char v7 = [v5 isEqual:v6];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

+ (id)redactionWithEncrypter:(id)a3 redactionName:(id)a4 encryptionKey:(id)a5 modelToCategory:(id)a6 categoriesByView:(id)a7 introducersByCategory:(id)a8 keyViewMapping:(id)a9 error:(id *)a10
{
  id v27 = a4;
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a3;
  id v21 = objc_opt_new();
  +[TPPolicyDocument addModelToCategory:v18 toPB:v21];

  +[TPPolicyDocument addCategoriesByView:v17 toPB:v21];
  +[TPPolicyDocument addIntroducersByCategory:v16 toPB:v21];

  +[TPPolicyDocument addKeyViewMapping:v15 toPB:v21];
  id v22 = [v21 data];
  id v23 = [v20 encryptData:v22 withKey:v19 error:a10];

  if (v23)
  {
    id v24 = objc_alloc_init(TPPBPolicyRedaction);
    v25 = v27;
    [(TPPBPolicyRedaction *)v24 setName:v27];
    [(TPPBPolicyRedaction *)v24 setCiphertext:v23];
  }
  else
  {
    id v24 = 0;
    v25 = v27;
  }

  return v24;
}

+ (id)policyDocWithHash:(id)a3 data:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  char v7 = [[TPPolicyDocument alloc] initWithHash:v6 data:v5];

  return v7;
}

+ (void)addKeyViewMapping:(id)a3 toPB:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v5);
          }
          [v6 addKeyViewMapping:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
        }
        while (v8 != v10);
        uint64_t v8 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

+ (void)addIntroducersByCategory:(id)a3 toPB:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [v5 allKeys];
  uint64_t v8 = [v7 sortedArrayUsingSelector:sel_compare_];

  id obj = v8;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * v12);
        long long v14 = objc_alloc_init(TPPBPolicyIntroducersByCategory);
        [(TPPBPolicyIntroducersByCategory *)v14 setCategory:v13];
        id v15 = [v5 objectForKeyedSubscript:v13];
        uint64_t v16 = [v15 allObjects];
        id v17 = (void *)[v16 mutableCopy];
        [(TPPBPolicyIntroducersByCategory *)v14 setIntroducers:v17];

        [v6 addIntroducersByCategory:v14];
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }
}

+ (void)addCategoriesByView:(id)a3 toPB:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [v5 allKeys];
  uint64_t v8 = [v7 sortedArrayUsingSelector:sel_compare_];

  id obj = v8;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * v12);
        long long v14 = objc_alloc_init(TPPBPolicyCategoriesByView);
        [(TPPBPolicyCategoriesByView *)v14 setView:v13];
        id v15 = [v5 objectForKeyedSubscript:v13];
        uint64_t v16 = [v15 allObjects];
        id v17 = (void *)[v16 mutableCopy];
        [(TPPBPolicyCategoriesByView *)v14 setCategories:v17];

        [v6 addCategoriesByView:v14];
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }
}

+ (void)addModelToCategory:(id)a3 toPB:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = objc_msgSend(MEMORY[0x263F08B30], "sortDescriptorWithKey:ascending:", @"prefix", 1, 0);
  long long v22 = v7;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
  uint64_t v9 = [v5 sortedArrayUsingDescriptors:v8];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
        id v15 = objc_alloc_init(TPPBPolicyModelToCategory);
        uint64_t v16 = [v14 prefix];
        [(TPPBPolicyModelToCategory *)v15 setPrefix:v16];

        id v17 = [v14 category];
        [(TPPBPolicyModelToCategory *)v15 setCategory:v17];

        [v6 addModelToCategory:v15];
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v11);
  }
}

+ (id)redactionsFromPb:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "ciphertext", (void)v14);
        uint64_t v12 = [v10 name];
        [v4 setObject:v11 forKeyedSubscript:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)introducersByCategoryFromPb:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "category", (void)v20);
        uint64_t v12 = [v4 objectForKeyedSubscript:v11];
        uint64_t v13 = (void *)[v12 mutableCopy];

        if (v13)
        {
          long long v14 = [v10 introducers];
          [v13 addObjectsFromArray:v14];

          long long v15 = (void *)[v13 copy];
          long long v16 = [v10 category];
          [v4 setObject:v15 forKeyedSubscript:v16];
        }
        else
        {
          long long v17 = (void *)MEMORY[0x263EFFA08];
          long long v15 = [v10 introducers];
          long long v16 = [v17 setWithArray:v15];
          long long v18 = [v10 category];
          [v4 setObject:v16 forKeyedSubscript:v18];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)categoriesByViewFromPb:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "view", (void)v20);
        uint64_t v12 = [v4 objectForKeyedSubscript:v11];
        uint64_t v13 = (void *)[v12 mutableCopy];

        if (v13)
        {
          long long v14 = [v10 categories];
          [v13 addObjectsFromArray:v14];

          long long v15 = (void *)[v13 copy];
          long long v16 = [v10 view];
          [v4 setObject:v15 forKeyedSubscript:v16];
        }
        else
        {
          long long v17 = (void *)MEMORY[0x263EFFA08];
          long long v15 = [v10 categories];
          long long v16 = [v17 setWithArray:v15];
          long long v18 = [v10 view];
          [v4 setObject:v16 forKeyedSubscript:v18];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)modelToCategoryFromPb:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "prefix", (void)v15);
        uint64_t v12 = [v10 category];
        uint64_t v13 = +[TPCategoryRule ruleWithPrefix:v11 category:v12];
        [v4 addObject:v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

@end