@interface PKPaymentOfferCatalog
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFresh;
- (BOOL)isFreshForNow:(id)a3;
- (NSArray)catalog;
- (NSDate)lastUpdated;
- (PKPaymentOfferCatalog)initWithCoder:(id)a3;
- (PKPaymentOfferCatalog)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)criteriaWithType:(unint64_t)a3 passUniqueID:(id)a4;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCatalog:(id)a3;
- (void)setLastUpdated:(id)a3;
@end

@implementation PKPaymentOfferCatalog

- (PKPaymentOfferCatalog)initWithDictionary:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentOfferCatalog;
  v5 = [(PKPaymentOfferCatalog *)&v21 init];
  if (v5)
  {
    v6 = [v4 PKArrayContaining:objc_opt_class() forKey:@"paymentOfferCatalog"];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = +[PKPaymentOfferCriteria paymentOfferCritieraWithDictionary:](PKPaymentOfferCriteria, "paymentOfferCritieraWithDictionary:", *(void *)(*((void *)&v17 + 1) + 8 * v12), (void)v17);
          [v7 safelyAddObject:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v10);
    }

    if ([v7 count])
    {
      uint64_t v14 = [v7 copy];
      catalog = v5->_catalog;
      v5->_catalog = (NSArray *)v14;
    }
    else
    {
      catalog = v5->_catalog;
      v5->_catalog = 0;
    }
  }
  return v5;
}

- (id)criteriaWithType:(unint64_t)a3 passUniqueID:(id)a4
{
  id v6 = a4;
  catalog = self->_catalog;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__PKPaymentOfferCatalog_criteriaWithType_passUniqueID___block_invoke;
  v11[3] = &unk_1E56DDBC0;
  id v12 = v6;
  unint64_t v13 = a3;
  id v8 = v6;
  uint64_t v9 = [(NSArray *)catalog pk_firstObjectPassingTest:v11];

  return v9;
}

uint64_t __55__PKPaymentOfferCatalog_criteriaWithType_passUniqueID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == *(void *)(a1 + 40))
  {
    id v4 = [v3 associatedPassUniqueID];
    v5 = *(void **)(a1 + 32);
    id v6 = v4;
    id v7 = v5;
    id v8 = v7;
    if (v6 == v7)
    {
      uint64_t v9 = 1;
    }
    else
    {
      uint64_t v9 = 0;
      if (v6 && v7) {
        uint64_t v9 = [v6 isEqualToString:v7];
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(NSArray *)self->_catalog pk_createArrayBySafelyApplyingBlock:&__block_literal_global_29];
  [v3 setObject:v4 forKeyedSubscript:@"catalog"];

  v5 = (void *)[v3 copy];
  return v5;
}

uint64_t __49__PKPaymentOfferCatalog_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPaymentOfferCatalog *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v5;
        catalog = self->_catalog;
        id v8 = v6->_catalog;
        if (catalog && v8)
        {
          if (-[NSArray isEqual:](catalog, "isEqual:"))
          {
LABEL_7:
            lastUpdated = self->_lastUpdated;
            uint64_t v10 = v6->_lastUpdated;
            if (lastUpdated && v10) {
              char v11 = -[NSDate isEqual:](lastUpdated, "isEqual:");
            }
            else {
              char v11 = lastUpdated == v10;
            }
            goto LABEL_15;
          }
        }
        else if (catalog == v8)
        {
          goto LABEL_7;
        }
        char v11 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    char v11 = 0;
  }
LABEL_16:

  return v11;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_catalog];
  [v3 safelyAddObject:self->_lastUpdated];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"catalog: '%@'; ", self->_catalog];
  [v3 appendFormat:@"lastUpdated: '%@'; ", self->_lastUpdated];
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferCatalog)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentOfferCatalog;
  v5 = [(PKPaymentOfferCatalog *)&v15 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"catalog"];
    catalog = v5->_catalog;
    v5->_catalog = (NSArray *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdated"];
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSDate *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  catalog = self->_catalog;
  id v5 = a3;
  [v5 encodeObject:catalog forKey:@"catalog"];
  [v5 encodeObject:self->_lastUpdated forKey:@"lastUpdated"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSArray *)self->_catalog copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSDate *)self->_lastUpdated copyWithZone:a3];
  uint64_t v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isFresh
{
  id v3 = [MEMORY[0x1E4F1C9C8] now];
  LOBYTE(self) = [(PKPaymentOfferCatalog *)self isFreshForNow:v3];

  return (char)self;
}

- (BOOL)isFreshForNow:(id)a3
{
  lastUpdated = self->_lastUpdated;
  if (lastUpdated) {
    LOBYTE(lastUpdated) = (unint64_t)PKDateRangeNumberOfIntervalsForUnit(lastUpdated, a3, 16) < 2;
  }
  return (char)lastUpdated;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
}

- (NSArray)catalog
{
  return self->_catalog;
}

- (void)setCatalog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catalog, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
}

@end