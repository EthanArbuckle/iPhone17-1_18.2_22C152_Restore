@interface PKAddressSearchRequest
- (NSArray)keysToFetch;
- (NSPredicate)predicate;
- (NSString)fragment;
- (NSString)outputKey;
- (PKAddressSearchRequest)initWithEmailAddress:(id)a3;
- (PKAddressSearchRequest)initWithFullText:(id)a3;
- (PKAddressSearchRequest)initWithNameComponents:(id)a3;
- (PKAddressSearchRequest)initWithPhoneNumber:(id)a3;
- (PKAddressSearchRequest)initWithPostalAddress:(id)a3;
- (id)_contactPropertyFilterForKey:(id)a3 propertyName:(id)a4;
- (id)allKeys;
- (id)contactFilter;
- (id)contactKeys;
- (id)postalAddressKeys;
- (int64_t)type;
- (void)setContactFilter:(id)a3;
- (void)setFragment:(id)a3;
- (void)setKeysToFetch:(id)a3;
- (void)setOutputKey:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation PKAddressSearchRequest

- (PKAddressSearchRequest)initWithFullText:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKAddressSearchRequest;
  v5 = [(PKAddressSearchRequest *)&v17 init];
  v6 = v5;
  if (v5)
  {
    v5->_type = 0;
    uint64_t v7 = [v4 copy];
    fragment = v6->_fragment;
    v6->_fragment = (NSString *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingFullTextSearch:v4 containerIdentifiers:0 groupIdentifiers:0];
    predicate = v6->_predicate;
    v6->_predicate = (NSPredicate *)v9;

    uint64_t v11 = [(PKAddressSearchRequest *)v6 allKeys];
    keysToFetch = v6->_keysToFetch;
    v6->_keysToFetch = (NSArray *)v11;

    v13 = [(PKAddressSearchRequest *)v6 _contactPropertyFilterForKey:*MEMORY[0x1E4F1AF10] propertyName:@"postalAddresses"];
    uint64_t v14 = [v13 copy];
    id contactFilter = v6->_contactFilter;
    v6->_id contactFilter = (id)v14;
  }
  return v6;
}

- (PKAddressSearchRequest)initWithNameComponents:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKAddressSearchRequest;
  v5 = [(PKAddressSearchRequest *)&v17 init];
  v6 = v5;
  if (v5)
  {
    v5->_type = 1;
    uint64_t v7 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v4 style:2 options:0];
    fragment = v6->_fragment;
    v6->_fragment = (NSString *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingName:v6->_fragment options:3];
    predicate = v6->_predicate;
    v6->_predicate = (NSPredicate *)v9;

    uint64_t v11 = [(PKAddressSearchRequest *)v6 allKeys];
    keysToFetch = v6->_keysToFetch;
    v6->_keysToFetch = (NSArray *)v11;

    v13 = [(PKAddressSearchRequest *)v6 _contactPropertyFilterForKey:*MEMORY[0x1E4F1AF10] propertyName:@"postalAddresses"];
    uint64_t v14 = [v13 copy];
    id contactFilter = v6->_contactFilter;
    v6->_id contactFilter = (id)v14;
  }
  return v6;
}

- (PKAddressSearchRequest)initWithPostalAddress:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKAddressSearchRequest;
  v5 = [(PKAddressSearchRequest *)&v18 init];
  v6 = v5;
  if (v5)
  {
    v5->_type = 2;
    uint64_t v7 = [MEMORY[0x1E4F1BA88] singleLineStringFromPostalAddress:v4 addCountryName:0];
    fragment = v6->_fragment;
    v6->_fragment = (NSString *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingPostalAddress:v4];
    predicate = v6->_predicate;
    v6->_predicate = (NSPredicate *)v9;

    uint64_t v11 = [(PKAddressSearchRequest *)v6 postalAddressKeys];
    keysToFetch = v6->_keysToFetch;
    v6->_keysToFetch = (NSArray *)v11;

    v13 = (void *)*MEMORY[0x1E4F1AF10];
    uint64_t v14 = [(PKAddressSearchRequest *)v6 _contactPropertyFilterForKey:*MEMORY[0x1E4F1AF10] propertyName:@"postalAddresses"];
    uint64_t v15 = [v14 copy];
    id contactFilter = v6->_contactFilter;
    v6->_id contactFilter = (id)v15;

    objc_storeStrong((id *)&v6->_outputKey, v13);
  }

  return v6;
}

- (PKAddressSearchRequest)initWithEmailAddress:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKAddressSearchRequest;
  v5 = [(PKAddressSearchRequest *)&v18 init];
  v6 = v5;
  if (v5)
  {
    v5->_type = 3;
    uint64_t v7 = [v4 copy];
    fragment = v6->_fragment;
    v6->_fragment = (NSString *)v7;

    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1B8F8], "pk_predicateForContactsMatchingEmailAddress:", v4);
    predicate = v6->_predicate;
    v6->_predicate = (NSPredicate *)v9;

    uint64_t v11 = [(PKAddressSearchRequest *)v6 contactKeys];
    keysToFetch = v6->_keysToFetch;
    v6->_keysToFetch = (NSArray *)v11;

    v13 = (void *)*MEMORY[0x1E4F1ADC8];
    uint64_t v14 = [(PKAddressSearchRequest *)v6 _contactPropertyFilterForKey:*MEMORY[0x1E4F1ADC8] propertyName:@"emailAddresses"];
    uint64_t v15 = [v14 copy];
    id contactFilter = v6->_contactFilter;
    v6->_id contactFilter = (id)v15;

    objc_storeStrong((id *)&v6->_outputKey, v13);
  }

  return v6;
}

- (PKAddressSearchRequest)initWithPhoneNumber:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKAddressSearchRequest;
  v5 = [(PKAddressSearchRequest *)&v18 init];
  v6 = v5;
  if (v5)
  {
    v5->_type = 4;
    uint64_t v7 = [v4 stringValue];
    fragment = v6->_fragment;
    v6->_fragment = (NSString *)v7;

    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1B8F8], "pk_predicateForContactsMatchingPhoneNumber:", v4);
    predicate = v6->_predicate;
    v6->_predicate = (NSPredicate *)v9;

    uint64_t v11 = [(PKAddressSearchRequest *)v6 contactKeys];
    keysToFetch = v6->_keysToFetch;
    v6->_keysToFetch = (NSArray *)v11;

    v13 = (void *)*MEMORY[0x1E4F1AEE0];
    uint64_t v14 = [(PKAddressSearchRequest *)v6 _contactPropertyFilterForKey:*MEMORY[0x1E4F1AEE0] propertyName:@"phoneNumbers"];
    uint64_t v15 = [v14 copy];
    id contactFilter = v6->_contactFilter;
    v6->_id contactFilter = (id)v15;

    objc_storeStrong((id *)&v6->_outputKey, v13);
  }

  return v6;
}

- (id)allKeys
{
  v8[8] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F1AEE0];
  v8[0] = *MEMORY[0x1E4F1ADC8];
  v8[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1AED8];
  v8[2] = *MEMORY[0x1E4F1AF10];
  v8[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1ADF0];
  v8[4] = *MEMORY[0x1E4F1ADE0];
  v8[5] = v4;
  uint64_t v5 = *MEMORY[0x1E4F1AEF8];
  v8[6] = *MEMORY[0x1E4F1AEF0];
  v8[7] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:8];
  return v6;
}

- (id)postalAddressKeys
{
  v7[6] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F1ADE0];
  v7[0] = *MEMORY[0x1E4F1AF10];
  v7[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1AED8];
  v7[2] = *MEMORY[0x1E4F1ADF0];
  v7[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1AEF8];
  v7[4] = *MEMORY[0x1E4F1AEF0];
  v7[5] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:6];
  return v5;
}

- (id)contactKeys
{
  void v7[7] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F1AEE0];
  v7[0] = *MEMORY[0x1E4F1ADC8];
  v7[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1ADF0];
  v7[2] = *MEMORY[0x1E4F1ADE0];
  v7[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1AEF0];
  v7[4] = *MEMORY[0x1E4F1AED8];
  v7[5] = v4;
  v7[6] = *MEMORY[0x1E4F1AEF8];
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:7];
  return v5;
}

- (id)_contactPropertyFilterForKey:(id)a3 propertyName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__PKAddressSearchRequest__contactPropertyFilterForKey_propertyName___block_invoke;
  v11[3] = &unk_1E56E88F0;
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  uint64_t v9 = _Block_copy(v11);

  return v9;
}

BOOL __68__PKAddressSearchRequest__contactPropertyFilterForKey_propertyName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isKeyAvailable:*(void *)(a1 + 32)])
  {
    uint64_t v4 = [v3 valueForKey:*(void *)(a1 + 40)];
    objc_opt_class();
    BOOL v5 = ((objc_opt_isKindOfClass() & 1) != 0
       || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
       || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      && [v4 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSArray)keysToFetch
{
  return self->_keysToFetch;
}

- (void)setKeysToFetch:(id)a3
{
}

- (id)contactFilter
{
  return self->_contactFilter;
}

- (void)setContactFilter:(id)a3
{
}

- (NSString)outputKey
{
  return self->_outputKey;
}

- (void)setOutputKey:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)fragment
{
  return self->_fragment;
}

- (void)setFragment:(id)a3
{
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_fragment, 0);
  objc_storeStrong((id *)&self->_outputKey, 0);
  objc_storeStrong(&self->_contactFilter, 0);
  objc_storeStrong((id *)&self->_keysToFetch, 0);
}

@end