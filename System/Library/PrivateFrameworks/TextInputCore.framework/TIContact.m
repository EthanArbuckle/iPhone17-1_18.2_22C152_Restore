@interface TIContact
- (BOOL)hasRelevancyScore;
- (NSArray)cities;
- (NSArray)relations;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)jobTitle;
- (NSString)middleName;
- (NSString)nickname;
- (NSString)organizationName;
- (NSString)phoneticFamilyName;
- (NSString)phoneticGivenName;
- (NSString)phoneticMiddleName;
- (float)relevancyScore;
- (id)flatten;
- (void)setCities:(id)a3;
- (void)setFamilyName:(id)a3;
- (void)setGivenName:(id)a3;
- (void)setHasRelevancyScore:(BOOL)a3;
- (void)setJobTitle:(id)a3;
- (void)setMiddleName:(id)a3;
- (void)setNickname:(id)a3;
- (void)setOrganizationName:(id)a3;
- (void)setPhoneticFamilyName:(id)a3;
- (void)setPhoneticGivenName:(id)a3;
- (void)setPhoneticMiddleName:(id)a3;
- (void)setRelations:(id)a3;
- (void)setRelevancyScore:(float)a3;
@end

@implementation TIContact

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cities, 0);
  objc_storeStrong((id *)&self->_relations, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_jobTitle, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_phoneticMiddleName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_phoneticGivenName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_phoneticFamilyName, 0);

  objc_storeStrong((id *)&self->_familyName, 0);
}

- (void)setRelevancyScore:(float)a3
{
  self->_relevancyScore = a3;
}

- (float)relevancyScore
{
  return self->_relevancyScore;
}

- (void)setHasRelevancyScore:(BOOL)a3
{
  self->_hasRelevancyScore = a3;
}

- (BOOL)hasRelevancyScore
{
  return self->_hasRelevancyScore;
}

- (void)setCities:(id)a3
{
}

- (NSArray)cities
{
  return self->_cities;
}

- (void)setRelations:(id)a3
{
}

- (NSArray)relations
{
  return self->_relations;
}

- (void)setNickname:(id)a3
{
}

- (NSString)nickname
{
  return self->_nickname;
}

- (void)setJobTitle:(id)a3
{
}

- (NSString)jobTitle
{
  return self->_jobTitle;
}

- (void)setOrganizationName:(id)a3
{
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setPhoneticMiddleName:(id)a3
{
}

- (NSString)phoneticMiddleName
{
  return self->_phoneticMiddleName;
}

- (void)setMiddleName:(id)a3
{
}

- (NSString)middleName
{
  return self->_middleName;
}

- (void)setPhoneticGivenName:(id)a3
{
}

- (NSString)phoneticGivenName
{
  return self->_phoneticGivenName;
}

- (void)setGivenName:(id)a3
{
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void)setPhoneticFamilyName:(id)a3
{
}

- (NSString)phoneticFamilyName
{
  return self->_phoneticFamilyName;
}

- (void)setFamilyName:(id)a3
{
}

- (NSString)familyName
{
  return self->_familyName;
}

- (id)flatten
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@" ,:;"];
  v4 = [MEMORY[0x1E4F1CA80] set];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __20__TIContact_flatten__block_invoke;
  aBlock[3] = &unk_1E6E2CCC0;
  id v5 = v3;
  id v39 = v5;
  id v6 = v4;
  id v40 = v6;
  v7 = (void (**)(void *, void *))_Block_copy(aBlock);
  v8 = [(TIContact *)self familyName];
  v7[2](v7, v8);

  v9 = [(TIContact *)self givenName];
  v7[2](v7, v9);

  v10 = [(TIContact *)self middleName];
  v7[2](v7, v10);

  v11 = [(TIContact *)self organizationName];
  v7[2](v7, v11);

  v12 = [(TIContact *)self jobTitle];
  v7[2](v7, v12);

  v13 = [(TIContact *)self nickname];
  v7[2](v7, v13);

  v14 = [(TIContact *)self relations];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v16 = [(TIContact *)self relations];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v35;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v35 != v19) {
            objc_enumerationMutation(v16);
          }
          v7[2](v7, *(void **)(*((void *)&v34 + 1) + 8 * v20++));
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v18);
    }
  }
  v21 = [(TIContact *)self cities];
  uint64_t v22 = [v21 count];

  if (v22)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v23 = [(TIContact *)self cities];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v30 objects:v41 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v31;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v31 != v26) {
            objc_enumerationMutation(v23);
          }
          v7[2](v7, *(void **)(*((void *)&v30 + 1) + 8 * v27++));
        }
        while (v25 != v27);
        uint64_t v25 = [v23 countByEnumeratingWithState:&v30 objects:v41 count:16];
      }
      while (v25);
    }
  }
  id v28 = v6;

  return v28;
}

void __20__TIContact_flatten__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 length])
  {
    if ([v5 rangeOfCharacterFromSet:*(void *)(a1 + 32)] == 0x7FFFFFFFFFFFFFFFLL)
    {
      [*(id *)(a1 + 40) addObject:v5];
    }
    else
    {
      v3 = [v5 componentsSeparatedByCharactersInSet:*(void *)(a1 + 32)];
      v4 = (void *)[v3 mutableCopy];

      [v4 removeObject:&stru_1F3F7A998];
      [*(id *)(a1 + 40) addObjectsFromArray:v4];
    }
  }
}

@end