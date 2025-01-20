@interface WBSSavedAccountMatchResult
- (NSArray)associatedDomainMatches;
- (NSArray)exactMatches;
- (NSArray)potentialMatches;
- (WBSPasskeyAutoFillFromNearbyDeviceOptions)nearbyDeviceOptions;
- (WBSSavedAccountMatchResult)initWithExactMatches:(id)a3 potentialMatches:(id)a4 associatedDomainMatches:(id)a5 nearbyDeviceOptions:(id)a6;
- (id)debugDescription;
- (id)matchesForPasswordAutoFill;
- (id)orderedMatches;
- (void)addUniqueHostUserToMatches;
@end

@implementation WBSSavedAccountMatchResult

- (WBSSavedAccountMatchResult)initWithExactMatches:(id)a3 potentialMatches:(id)a4 associatedDomainMatches:(id)a5 nearbyDeviceOptions:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)WBSSavedAccountMatchResult;
  v14 = [(WBSSavedAccountMatchResult *)&v27 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    v16 = (void *)v15;
    v17 = (void *)MEMORY[0x1E4F1CBF0];
    if (v15) {
      v18 = (void *)v15;
    }
    else {
      v18 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v14->_exactMatches, v18);

    uint64_t v19 = [v11 copy];
    v20 = (void *)v19;
    if (v19) {
      v21 = (void *)v19;
    }
    else {
      v21 = v17;
    }
    objc_storeStrong((id *)&v14->_potentialMatches, v21);

    uint64_t v22 = [v12 copy];
    v23 = (void *)v22;
    if (v22) {
      v24 = (void *)v22;
    }
    else {
      v24 = v17;
    }
    objc_storeStrong((id *)&v14->_associatedDomainMatches, v24);

    objc_storeStrong((id *)&v14->_nearbyDeviceOptions, a6);
    v25 = v14;
  }

  return v14;
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; exactMatches = %@; potentialMatches = %@; associatedDomainMatches = %@; nearbyDevice = %@ >",
    v5,
    self,
    self->_exactMatches,
    self->_potentialMatches,
    self->_associatedDomainMatches,
  v6 = self->_nearbyDeviceOptions);

  return v6;
}

- (id)matchesForPasswordAutoFill
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 addObjectsFromArray:self->_exactMatches];
  [v3 addObjectsFromArray:self->_potentialMatches];
  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v5 = objc_msgSend(v3, "safari_mapObjectsUsingBlock:", &__block_literal_global_58);
  v6 = (void *)[v4 initWithArray:v5];

  associatedDomainMatches = self->_associatedDomainMatches;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__WBSSavedAccountMatchResult_matchesForPasswordAutoFill__block_invoke_2;
  v12[3] = &unk_1E615D120;
  id v13 = v6;
  id v8 = v6;
  v9 = [(NSArray *)associatedDomainMatches safari_filterObjectsUsingBlock:v12];
  [v3 addObjectsFromArray:v9];

  id v10 = (void *)[v3 copy];
  return v10;
}

WBSPair *__56__WBSSavedAccountMatchResult_matchesForPasswordAutoFill__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [WBSPair alloc];
  id v4 = [v2 user];
  v5 = [v2 password];

  v6 = [(WBSPair *)v3 initWithFirst:v4 second:v5];
  return v6;
}

uint64_t __56__WBSSavedAccountMatchResult_matchesForPasswordAutoFill__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [WBSPair alloc];
  v5 = [v3 user];
  v6 = [v3 password];

  v7 = [(WBSPair *)v4 initWithFirst:v5 second:v6];
  uint64_t v8 = [v2 containsObject:v7] ^ 1;

  return v8;
}

- (id)orderedMatches
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 addObjectsFromArray:self->_exactMatches];
  [v3 addObjectsFromArray:self->_potentialMatches];
  [v3 addObjectsFromArray:self->_associatedDomainMatches];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (void)addUniqueHostUserToMatches
{
  id v3 = (void *)MEMORY[0x1E4F28BD0];
  id v4 = [(WBSSavedAccountMatchResult *)self orderedMatches];
  v5 = objc_msgSend(v4, "safari_mapObjectsUsingBlock:", &__block_literal_global_8_0);
  v6 = [v3 setWithArray:v5];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__WBSSavedAccountMatchResult_addUniqueHostUserToMatches__block_invoke_2;
  aBlock[3] = &unk_1E615D148;
  id v16 = v6;
  id v7 = v6;
  uint64_t v8 = _Block_copy(aBlock);
  v9 = [(NSArray *)self->_exactMatches safari_mapObjectsUsingBlock:v8];
  exactMatches = self->_exactMatches;
  self->_exactMatches = v9;

  id v11 = [(NSArray *)self->_potentialMatches safari_mapObjectsUsingBlock:v8];
  potentialMatches = self->_potentialMatches;
  self->_potentialMatches = v11;

  id v13 = [(NSArray *)self->_associatedDomainMatches safari_mapObjectsUsingBlock:v8];
  associatedDomainMatches = self->_associatedDomainMatches;
  self->_associatedDomainMatches = v13;
}

WBSPair *__56__WBSSavedAccountMatchResult_addUniqueHostUserToMatches__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [WBSPair alloc];
  id v4 = [v2 user];
  v5 = [v2 host];

  v6 = [(WBSPair *)v3 initWithFirst:v4 second:v5];
  return v6;
}

id __56__WBSSavedAccountMatchResult_addUniqueHostUserToMatches__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v5 = [WBSPair alloc];
  v6 = [v3 user];
  id v7 = [v3 host];
  uint64_t v8 = [(WBSPair *)v5 initWithFirst:v6 second:v7];
  objc_msgSend(v3, "setHasUniqueHostAndUser:", (unint64_t)objc_msgSend(v4, "countForObject:", v8) < 2);

  return v3;
}

- (NSArray)exactMatches
{
  return self->_exactMatches;
}

- (NSArray)potentialMatches
{
  return self->_potentialMatches;
}

- (NSArray)associatedDomainMatches
{
  return self->_associatedDomainMatches;
}

- (WBSPasskeyAutoFillFromNearbyDeviceOptions)nearbyDeviceOptions
{
  return self->_nearbyDeviceOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyDeviceOptions, 0);
  objc_storeStrong((id *)&self->_associatedDomainMatches, 0);
  objc_storeStrong((id *)&self->_potentialMatches, 0);
  objc_storeStrong((id *)&self->_exactMatches, 0);
}

@end