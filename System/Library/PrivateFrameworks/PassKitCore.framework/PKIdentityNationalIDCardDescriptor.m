@interface PKIdentityNationalIDCardDescriptor
- (NSArray)elements;
- (NSString)description;
- (NSString)regionCode;
- (PKIdentityNationalIDCardDescriptor)init;
- (PKIdentityNationalIDCardDescriptor)initWithDIIdentityNationalIDCardDescriptor:(id)a3;
- (id)asDIIdentityNationalIDCardDescriptor;
- (id)intentToStoreForElement:(id)a3;
- (void)addElements:(id)a3 withIntentToStore:(id)a4;
- (void)setRegionCode:(id)a3;
@end

@implementation PKIdentityNationalIDCardDescriptor

- (PKIdentityNationalIDCardDescriptor)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F5C1C8]);
  v4 = [(PKIdentityNationalIDCardDescriptor *)self initWithDIIdentityNationalIDCardDescriptor:v3];

  return v4;
}

- (PKIdentityNationalIDCardDescriptor)initWithDIIdentityNationalIDCardDescriptor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKIdentityNationalIDCardDescriptor;
  v6 = [(PKIdentityNationalIDCardDescriptor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_wrapped, a3);
  }

  return v7;
}

- (NSString)description
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  v4 = [(PKIdentityNationalIDCardDescriptor *)self elements];
  if ([v4 count])
  {
    [v3 appendString:@"elements: ["];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v15 = v4;
    id obj = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      v7 = &stru_1EE0F5368;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          v11 = [(PKIdentityNationalIDCardDescriptor *)self intentToStoreForElement:v10];
          [v3 appendString:v7];
          v12 = [NSString stringWithFormat:@"%@: %@", v10, v11];
          [v3 appendString:v12];

          v7 = @", ";
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
        v7 = @", ";
      }
      while (v6);
    }

    [v3 appendString:@"] "];
    v4 = v15;
  }
  [v3 appendFormat:@">"];
  v13 = (void *)[v3 copy];

  return (NSString *)v13;
}

- (NSArray)elements
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(DIIdentityNationalIDCardDescriptor *)self->_wrapped elements];
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [PKIdentityElement alloc];
        v11 = -[PKIdentityElement initWithDIIdentityElement:](v10, "initWithDIIdentityElement:", v9, (void)v13);
        [v3 addObject:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)addElements:(id)a3 withIntentToStore:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v13), "asDIIdentityElement", (void)v16);
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  long long v15 = [v7 asDIIdentityIntentToStore];
  [(DIIdentityNationalIDCardDescriptor *)self->_wrapped addElements:v8 withIntentToStore:v15];
}

- (id)intentToStoreForElement:(id)a3
{
  id v4 = [a3 asDIIdentityElement];
  uint64_t v5 = [(DIIdentityNationalIDCardDescriptor *)self->_wrapped intentToStoreForElement:v4];
  id v6 = [[PKIdentityIntentToStore alloc] initWithDIIdentityIntentToStore:v5];

  return v6;
}

- (void)setRegionCode:(id)a3
{
}

- (NSString)regionCode
{
  return (NSString *)[(DIIdentityNationalIDCardDescriptor *)self->_wrapped regionCode];
}

- (id)asDIIdentityNationalIDCardDescriptor
{
  return self->_wrapped;
}

- (void).cxx_destruct
{
}

@end