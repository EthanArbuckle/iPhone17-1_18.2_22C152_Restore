@interface HVSpotlightDeletionRequest
+ (BOOL)supportsSecureCoding;
+ (id)_hashArrayForBundleIdentifier:(void *)a3 xIdentifier:(unsigned __int8)a4 typeOfX:(void *)a5 inBloomFilter:(void *)a6 hashArrayForReuse:;
+ (void)addDeletableContentWithBundleIdentifier:(id)a3 domainIdentifier:(id)a4 uniqueIdentifier:(id)a5 toBloomFilter:(id)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesBloomFilter:(id)a3;
- (HVSpotlightDeletionRequest)initWithBundleIdentifier:(id)a3;
- (HVSpotlightDeletionRequest)initWithBundleIdentifier:(id)a3 domainSelection:(id)a4;
- (HVSpotlightDeletionRequest)initWithBundleIdentifier:(id)a3 purgedUniqueIdentifiers:(id)a4;
- (HVSpotlightDeletionRequest)initWithBundleIdentifier:(id)a3 uniqueIdentifiers:(id)a4;
- (HVSpotlightDeletionRequest)initWithCoder:(id)a3;
- (NSString)bundleIdentifier;
- (id)copyWithBundleIdentifier:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)accessCriteriaUsingBundleIdentifierBlock:(id)a3 domainSelectionBlock:(id)a4 incontrovertiblyDeletedUniqueIdentifiersBlock:(id)a5 purgedUniqueIdentifiersBlock:(id)a6;
- (void)accessCriteriaUsingBundleIdentifierBlock:(id)a3 domainSelectionBlock:(id)a4 uniqueIdentifiersBlock:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HVSpotlightDeletionRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_domainSelection, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)accessCriteriaUsingBundleIdentifierBlock:(id)a3 domainSelectionBlock:(id)a4 incontrovertiblyDeletedUniqueIdentifiersBlock:(id)a5 purgedUniqueIdentifiersBlock:(id)a6
{
  v15 = (void (**)(id, NSString *))a3;
  v10 = (void (**)(id, NSString *))a4;
  id v11 = a5;
  id v12 = a6;
  v13 = v12;
  if (self->_domainSelection)
  {
    v10[2](v10, self->_bundleIdentifier);
  }
  else if (self->_uniqueIdentifiers)
  {
    if (!self->_isPurge) {
      id v12 = v11;
    }
    v14 = (void (**)(void, void, void))MEMORY[0x22A6669E0](v12);
    ((void (**)(void, NSString *, NSSet *))v14)[2](v14, self->_bundleIdentifier, self->_uniqueIdentifiers);
  }
  else
  {
    v15[2](v15, self->_bundleIdentifier);
  }
}

- (void)accessCriteriaUsingBundleIdentifierBlock:(id)a3 domainSelectionBlock:(id)a4 uniqueIdentifiersBlock:(id)a5
{
}

- (HVSpotlightDeletionRequest)initWithBundleIdentifier:(id)a3 domainSelection:(id)a4
{
  id v7 = a4;
  v8 = [(HVSpotlightDeletionRequest *)self initWithBundleIdentifier:a3];
  if (v8)
  {
    if (!v7)
    {
      id v12 = [MEMORY[0x263F08690] currentHandler];
      [v12 handleFailureInMethod:a2, v8, @"HVSpotlightDeletionRequest.m", 45, @"Invalid parameter not satisfying: %@", @"domainSelection" object file lineNumber description];
    }
    uint64_t v9 = [v7 copy];
    domainSelection = v8->_domainSelection;
    v8->_domainSelection = (_PASDomainSelection *)v9;
  }
  return v8;
}

- (HVSpotlightDeletionRequest)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  if (self
    && (v12.receiver = self,
        v12.super_class = (Class)HVSpotlightDeletionRequest,
        (v6 = [(HVSpotlightDeletionRequest *)&v12 init]) != 0))
  {
    id v7 = v6;
    v6->_isPurge = 0;
    if (!v5)
    {
      id v11 = [MEMORY[0x263F08690] currentHandler];
      [v11 handleFailureInMethod:a2, v7, @"HVSpotlightDeletionRequest.m", 36, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
    }
    uint64_t v8 = [v5 copy];
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = (NSString *)v8;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)copyWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __55__HVSpotlightDeletionRequest_copyWithBundleIdentifier___block_invoke;
  v17[3] = &unk_2647D5408;
  v19 = &v20;
  id v18 = v4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __55__HVSpotlightDeletionRequest_copyWithBundleIdentifier___block_invoke_2;
  v14[3] = &unk_2647D5430;
  v16 = &v20;
  id v15 = v18;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__HVSpotlightDeletionRequest_copyWithBundleIdentifier___block_invoke_3;
  v11[3] = &unk_2647D5480;
  v13 = &v20;
  id v12 = v15;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__HVSpotlightDeletionRequest_copyWithBundleIdentifier___block_invoke_4;
  v8[3] = &unk_2647D5480;
  v10 = &v20;
  id v5 = v12;
  id v9 = v5;
  [(HVSpotlightDeletionRequest *)self accessCriteriaUsingBundleIdentifierBlock:v17 domainSelectionBlock:v14 incontrovertiblyDeletedUniqueIdentifiersBlock:v11 purgedUniqueIdentifiersBlock:v8];
  id v6 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v6;
}

uint64_t __55__HVSpotlightDeletionRequest_copyWithBundleIdentifier___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [[HVSpotlightDeletionRequest alloc] initWithBundleIdentifier:*(void *)(a1 + 32)];

  return MEMORY[0x270F9A758]();
}

void __55__HVSpotlightDeletionRequest_copyWithBundleIdentifier___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [[HVSpotlightDeletionRequest alloc] initWithBundleIdentifier:*(void *)(a1 + 32) domainSelection:v4];

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __55__HVSpotlightDeletionRequest_copyWithBundleIdentifier___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [[HVSpotlightDeletionRequest alloc] initWithBundleIdentifier:*(void *)(a1 + 32) uniqueIdentifiers:v4];

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __55__HVSpotlightDeletionRequest_copyWithBundleIdentifier___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [[HVSpotlightDeletionRequest alloc] initWithBundleIdentifier:*(void *)(a1 + 32) purgedUniqueIdentifiers:v4];

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (HVSpotlightDeletionRequest)initWithCoder:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"b"];
  if (!v6)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HVSpotlightDeletionRequest.m", 273, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
  }
  id v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"d"];
  if (v7)
  {
    uint64_t v8 = [(HVSpotlightDeletionRequest *)self initWithBundleIdentifier:v6 domainSelection:v7];
  }
  else
  {
    id v9 = [v5 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"u"];
    if (v9)
    {
      v10 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v9];
      if ([v5 decodeBoolForKey:@"p"]) {
        id v11 = [(HVSpotlightDeletionRequest *)self initWithBundleIdentifier:v6 purgedUniqueIdentifiers:v10];
      }
      else {
        id v11 = [(HVSpotlightDeletionRequest *)self initWithBundleIdentifier:v6 uniqueIdentifiers:v10];
      }
      uint64_t v8 = v11;
    }
    else
    {
      uint64_t v8 = [(HVSpotlightDeletionRequest *)self initWithBundleIdentifier:v6];
    }
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  bundleIdentifier = self->_bundleIdentifier;
  id v6 = a3;
  [v6 encodeObject:bundleIdentifier forKey:@"b"];
  [v6 encodeObject:self->_domainSelection forKey:@"d"];
  id v5 = [(NSSet *)self->_uniqueIdentifiers allObjects];
  [v6 encodeObject:v5 forKey:@"u"];

  [v6 encodeBool:self->_isPurge forKey:@"p"];
}

- (id)description
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __41__HVSpotlightDeletionRequest_description__block_invoke;
  v10[3] = &unk_2647D4B10;
  v10[4] = &v11;
  void v8[4] = &v11;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __41__HVSpotlightDeletionRequest_description__block_invoke_2;
  v9[3] = &unk_2647D4B88;
  v9[4] = &v11;
  v7[4] = &v11;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__HVSpotlightDeletionRequest_description__block_invoke_3;
  v8[3] = &unk_2647D4BB0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__HVSpotlightDeletionRequest_description__block_invoke_4;
  v7[3] = &unk_2647D4BB0;
  [(HVSpotlightDeletionRequest *)self accessCriteriaUsingBundleIdentifierBlock:v10 domainSelectionBlock:v9 incontrovertiblyDeletedUniqueIdentifiersBlock:v8 purgedUniqueIdentifiersBlock:v7];
  id v2 = [NSString alloc];
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = (void *)[v2 initWithFormat:@"<%@ %@>", v4, v12[5]];

  _Block_object_dispose(&v11, 8);

  return v5;
}

void __41__HVSpotlightDeletionRequest_description__block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)NSString;
  id v4 = a2;
  uint64_t v5 = [[v3 alloc] initWithFormat:@"bundleIdentifier: %@", v4];

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __41__HVSpotlightDeletionRequest_description__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (objc_class *)NSString;
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [[v5 alloc] initWithFormat:@"bundleIdentifier: %@, domainSelection: %@", v7, v6];

  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void __41__HVSpotlightDeletionRequest_description__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (objc_class *)NSString;
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [[v5 alloc] initWithFormat:@"bundleIdentifier: %@, incontrovertiblyDeletedUniqueIdentifiers: %@", v7, v6];

  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void __41__HVSpotlightDeletionRequest_description__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (objc_class *)NSString;
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [[v5 alloc] initWithFormat:@"bundleIdentifier: %@, purgedUniqueIdentifiers: %@", v7, v6];

  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleIdentifier hash];
  uint64_t v4 = [(_PASDomainSelection *)self->_domainSelection hash] - v3 + 32 * v3;
  uint64_t v5 = [(NSSet *)self->_uniqueIdentifiers hash];
  return self->_isPurge - (v5 - v4 + 32 * v4) + 32 * (v5 - v4 + 32 * v4);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HVSpotlightDeletionRequest *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v5;
        id v7 = v6;
        if (!self)
        {
LABEL_20:

          goto LABEL_21;
        }
        bundleIdentifier = self->_bundleIdentifier;
        uint64_t v9 = (NSString *)v6[1];
        if (bundleIdentifier == v9)
        {
        }
        else
        {
          v10 = v9;
          uint64_t v11 = bundleIdentifier;
          char v12 = [(NSString *)v11 isEqual:v10];

          if ((v12 & 1) == 0) {
            goto LABEL_17;
          }
        }
        domainSelection = self->_domainSelection;
        v14 = (_PASDomainSelection *)v7[2];
        if (domainSelection == v14)
        {
        }
        else
        {
          id v15 = v14;
          id v16 = domainSelection;
          char v17 = [(_PASDomainSelection *)v16 isEqual:v15];

          if ((v17 & 1) == 0) {
            goto LABEL_17;
          }
        }
        uniqueIdentifiers = self->_uniqueIdentifiers;
        v19 = (NSSet *)v7[3];
        if (uniqueIdentifiers == v19)
        {
        }
        else
        {
          uint64_t v20 = v19;
          v21 = uniqueIdentifiers;
          char v22 = [(NSSet *)v21 isEqual:v20];

          if ((v22 & 1) == 0)
          {
LABEL_17:
            LOBYTE(self) = 0;
            goto LABEL_20;
          }
        }
        LOBYTE(self) = self->_isPurge == *((unsigned __int8 *)v7 + 32);
        goto LABEL_20;
      }
    }
    LOBYTE(self) = 0;
  }
LABEL_21:

  return (char)self;
}

- (BOOL)matchesBloomFilter:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x22A6667F0]();
  id v6 = [(HVSpotlightDeletionRequest *)self bundleIdentifier];
  id v7 = +[HVSpotlightDeletionRequest _hashArrayForBundleIdentifier:xIdentifier:typeOfX:inBloomFilter:hashArrayForReuse:]((uint64_t)HVSpotlightDeletionRequest, v6, &stru_26DAC8728, 0x62u, v4, 0);

  if ([v4 getWithHashes:v7])
  {
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __49__HVSpotlightDeletionRequest_matchesBloomFilter___block_invoke;
    v18[3] = &unk_2647D4B10;
    v18[4] = &v19;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __49__HVSpotlightDeletionRequest_matchesBloomFilter___block_invoke_2;
    v14[3] = &unk_2647D4B38;
    char v17 = &v19;
    id v15 = v4;
    id v16 = v7;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __49__HVSpotlightDeletionRequest_matchesBloomFilter___block_invoke_3;
    v10[3] = &unk_2647D4B60;
    uint64_t v13 = &v19;
    id v11 = v15;
    id v12 = v16;
    [(HVSpotlightDeletionRequest *)self accessCriteriaUsingBundleIdentifierBlock:v18 domainSelectionBlock:v14 uniqueIdentifiersBlock:v10];
    BOOL v8 = *((unsigned char *)v20 + 24) != 0;

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (id)_hashArrayForBundleIdentifier:(void *)a3 xIdentifier:(unsigned __int8)a4 typeOfX:(void *)a5 inBloomFilter:(void *)a6 hashArrayForReuse:
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a3;
  id v13 = a2;
  uint64_t v14 = self;
  id v15 = (void *)MEMORY[0x22A6667F0](v14);
  id v16 = _PASRepairString();

  char v17 = _PASRepairString();

  id v18 = (void *)[[NSString alloc] initWithFormat:@"%@\n%c\n%@", v16, a4, v17];
  uint64_t v19 = _PASRepairString();

  uint64_t v20 = [v10 computeHashesForString:v19 reuse:v11];

  return v20;
}

uint64_t __49__HVSpotlightDeletionRequest_matchesBloomFilter___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __49__HVSpotlightDeletionRequest_matchesBloomFilter___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = objc_msgSend(a3, "allDomains", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(a1 + 32);
        id v12 = +[HVSpotlightDeletionRequest _hashArrayForBundleIdentifier:xIdentifier:typeOfX:inBloomFilter:hashArrayForReuse:]((uint64_t)HVSpotlightDeletionRequest, v5, *(void **)(*((void *)&v13 + 1) + 8 * i), 0x64u, v11, *(void **)(a1 + 40));
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v11 getWithHashes:v12];

        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
        {

          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
LABEL_11:
}

void __49__HVSpotlightDeletionRequest_matchesBloomFilter___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(a1 + 32);
        id v12 = +[HVSpotlightDeletionRequest _hashArrayForBundleIdentifier:xIdentifier:typeOfX:inBloomFilter:hashArrayForReuse:]((uint64_t)HVSpotlightDeletionRequest, v5, *(void **)(*((void *)&v13 + 1) + 8 * i), 0x75u, v11, *(void **)(a1 + 40));
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(v11, "getWithHashes:", v12, (void)v13);

        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
        {

          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
LABEL_11:
}

- (HVSpotlightDeletionRequest)initWithBundleIdentifier:(id)a3 purgedUniqueIdentifiers:(id)a4
{
  result = [(HVSpotlightDeletionRequest *)self initWithBundleIdentifier:a3 uniqueIdentifiers:a4];
  if (result) {
    result->_isPurge = 1;
  }
  return result;
}

- (HVSpotlightDeletionRequest)initWithBundleIdentifier:(id)a3 uniqueIdentifiers:(id)a4
{
  id v7 = a4;
  uint64_t v8 = [(HVSpotlightDeletionRequest *)self initWithBundleIdentifier:a3];
  if (v8)
  {
    if (!v7)
    {
      id v12 = [MEMORY[0x263F08690] currentHandler];
      [v12 handleFailureInMethod:a2, v8, @"HVSpotlightDeletionRequest.m", 54, @"Invalid parameter not satisfying: %@", @"uniqueIdentifiers" object file lineNumber description];
    }
    uint64_t v9 = [v7 copy];
    uniqueIdentifiers = v8->_uniqueIdentifiers;
    v8->_uniqueIdentifiers = (NSSet *)v9;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)addDeletableContentWithBundleIdentifier:(id)a3 domainIdentifier:(id)a4 uniqueIdentifier:(id)a5 toBloomFilter:(id)a6
{
  id v21 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  long long v13 = (void *)MEMORY[0x22A6667F0]();
  long long v14 = +[HVSpotlightDeletionRequest _hashArrayForBundleIdentifier:xIdentifier:typeOfX:inBloomFilter:hashArrayForReuse:]((uint64_t)a1, v21, &stru_26DAC8728, 0x62u, v12, 0);
  [v12 setWithHashes:v14];
  long long v15 = +[HVSpotlightDeletionRequest _hashArrayForBundleIdentifier:xIdentifier:typeOfX:inBloomFilter:hashArrayForReuse:]((uint64_t)a1, v21, v11, 0x75u, v12, v14);

  uint64_t v16 = [v12 setWithHashes:v15];
  if (v10)
  {
    while (1)
    {
      char v17 = v15;
      uint64_t v18 = (void *)MEMORY[0x22A6667F0](v16);
      long long v15 = +[HVSpotlightDeletionRequest _hashArrayForBundleIdentifier:xIdentifier:typeOfX:inBloomFilter:hashArrayForReuse:]((uint64_t)a1, v21, v10, 0x64u, v12, v15);

      [v12 setWithHashes:v15];
      uint64_t v19 = [v10 rangeOfString:@"." options:6];
      if (v19 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v20 = [v10 substringToIndex:v19];

      id v10 = (id)v20;
      if (!v20) {
        goto LABEL_6;
      }
    }
  }
LABEL_6:
}

@end