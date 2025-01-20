@interface PKAccountBeneficiaryInfo
+ (BOOL)supportsSecureCoding;
- (NSArray)beneficiaries;
- (PKAccountBeneficiaryInfo)initWithCoder:(id)a3;
- (PKAccountBeneficiaryInfo)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBeneficiaries:(id)a3;
@end

@implementation PKAccountBeneficiaryInfo

- (PKAccountBeneficiaryInfo)initWithDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PKAccountBeneficiaryInfo;
  v5 = [(PKAccountBeneficiaryInfo *)&v24 init];
  if (v5)
  {
    id v6 = [v4 PKArrayForKey:@"beneficiaries"];
    if (![v6 count])
    {
LABEL_14:

      v18 = 0;
      goto LABEL_15;
    }
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = v6;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      while (2)
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * v11);
          v13 = [PKAccountBeneficiary alloc];
          uint64_t v14 = -[PKAccountBeneficiary initWithDictionary:](v13, "initWithDictionary:", v12, (void)v20);
          if (!v14)
          {

            goto LABEL_14;
          }
          v15 = (void *)v14;
          [v7 addObject:v14];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    uint64_t v16 = [v7 copy];
    beneficiaries = v5->_beneficiaries;
    v5->_beneficiaries = (NSArray *)v16;
  }
  v18 = v5;
LABEL_15:

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (PKAccountBeneficiaryInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKAccountBeneficiaryInfo;
  v5 = [(PKAccountBeneficiaryInfo *)&v12 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"beneficiaries"];
    beneficiaries = v5->_beneficiaries;
    v5->_beneficiaries = (NSArray *)v9;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = self->_beneficiaries;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "copy", (void)v15);
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [v5 copy];
  v13 = (void *)v4[1];
  v4[1] = v12;

  return v4;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = [(NSArray *)self->_beneficiaries description];
  [v3 appendFormat:@"%@: '%@'; ", @"beneficiaries", v4];

  [v3 appendFormat:@">"];
  id v5 = (void *)[v3 copy];

  return v5;
}

- (NSArray)beneficiaries
{
  return self->_beneficiaries;
}

- (void)setBeneficiaries:(id)a3
{
}

- (void).cxx_destruct
{
}

@end