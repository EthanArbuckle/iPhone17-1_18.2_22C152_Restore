@interface PKPaymentOfferDynamicContentCustomLayout
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)items;
- (PKPaymentOfferDynamicContentCustomLayout)initWithArray:(id)a3;
- (PKPaymentOfferDynamicContentCustomLayout)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPaymentOfferDynamicContentCustomLayout

- (PKPaymentOfferDynamicContentCustomLayout)initWithArray:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [[PKPaymentOfferDynamicContentCustomLayoutItem alloc] initWithDictionary:*(void *)(*((void *)&v18 + 1) + 8 * v10)];
          [v5 safelyAddObject:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }

    if ([v5 count])
    {
      v17.receiver = self;
      v17.super_class = (Class)PKPaymentOfferDynamicContentCustomLayout;
      v12 = [(PKPaymentOfferDynamicContentCustomLayout *)&v17 init];
      if (v12)
      {
        uint64_t v13 = [v5 copy];
        items = v12->_items;
        v12->_items = (NSArray *)v13;
      }
      self = v12;
      v15 = self;
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(NSArray *)self->_items pk_arrayBySafelyApplyingBlock:&__block_literal_global_322];
  [v3 setObject:v4 forKeyedSubscript:@"customLayout"];

  id v5 = (void *)[v3 copy];
  return v5;
}

uint64_t __68__PKPaymentOfferDynamicContentCustomLayout_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPaymentOfferDynamicContentCustomLayout *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    items = self->_items;
    uint64_t v7 = v5->_items;
    if (items && v7) {
      char v8 = -[NSArray isEqual:](items, "isEqual:");
    }
    else {
      char v8 = items == v7;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_items];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"items: '%@'; ", self->_items];
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferDynamicContentCustomLayout)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentOfferDynamicContentCustomLayout;
  id v5 = [(PKPaymentOfferDynamicContentCustomLayout *)&v12 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    char v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"customLayoutItem"];
    items = v5->_items;
    v5->_items = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPaymentOfferDynamicContentCustomLayout allocWithZone:](PKPaymentOfferDynamicContentCustomLayout, "allocWithZone:") init];
  uint64_t v6 = [(NSArray *)self->_items copyWithZone:a3];
  items = v5->_items;
  v5->_items = (NSArray *)v6;

  return v5;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
}

@end