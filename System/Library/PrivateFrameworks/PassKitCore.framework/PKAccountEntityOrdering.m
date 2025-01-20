@interface PKAccountEntityOrdering
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAccountEntityOrdering:(id)a3;
- (NSArray)ordering;
- (PKAccountEntityOrdering)initWithCoder:(id)a3;
- (PKAccountEntityOrdering)initWithType:(unint64_t)a3 dictionary:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)orderingAsJSONString;
- (unint64_t)context;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setContext:(unint64_t)a3;
- (void)setOrdering:(id)a3;
- (void)setOrderingFromJSONString:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKAccountEntityOrdering

- (PKAccountEntityOrdering)initWithType:(unint64_t)a3 dictionary:(id)a4
{
  id v6 = a4;
  v7 = v6;
  v8 = 0;
  if (a3 && v6)
  {
    v15.receiver = self;
    v15.super_class = (Class)PKAccountEntityOrdering;
    v9 = [(PKAccountEntityOrdering *)&v15 init];
    v10 = v9;
    if (v9)
    {
      v9->_type = a3;
      v11 = [v7 PKStringForKey:@"key"];
      v10->_context = PKAccountEntityOrderingContextFromString(v11, a3);

      v12 = [v7 objectForKey:@"ordering"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_storeStrong((id *)&v10->_ordering, v12);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(PKAccountEntityOrdering *)v10 setOrderingFromJSONString:v12];
        }
        else
        {
          ordering = v10->_ordering;
          v10->_ordering = 0;
        }
      }
    }
    self = v10;
    v8 = self;
  }

  return v8;
}

- (void)setOrderingFromJSONString:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v4 = (void *)MEMORY[0x1E4F28D90];
    v5 = [a3 dataUsingEncoding:4];
    id v14 = 0;
    id v6 = [v4 JSONObjectWithData:v5 options:0 error:&v14];
    id v7 = v14;

    if (v7) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = v6 == 0;
    }
    if (v8)
    {
      v9 = PKLogFacilityTypeGetObject(0xEuLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v7;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Error parsing JSON: %@", buf, 0xCu);
      }
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass)
      {
        v12 = v6;
        ordering = self->_ordering;
        self->_ordering = v12;
LABEL_16:

        return;
      }
    }
    ordering = self->_ordering;
    self->_ordering = 0;
    goto LABEL_16;
  }
  v10 = self->_ordering;
  self->_ordering = 0;
}

- (id)orderingAsJSONString
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  ordering = self->_ordering;
  if (ordering)
  {
    id v9 = 0;
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:ordering options:0 error:&v9];
    id v4 = v9;
    if (v4) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = v3 == 0;
    }
    if (v5)
    {
      id v6 = PKLogFacilityTypeGetObject(0xEuLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v4;
        _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Error serializing to JSON: %@", buf, 0xCu);
      }

      id v7 = 0;
    }
    else
    {
      id v7 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (id)description
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"<%@: %p; ",
                 objc_opt_class(),
                 self);
  id v4 = v3;
  unint64_t type = self->_type;
  if (type > 2) {
    id v6 = @"unknown";
  }
  else {
    id v6 = off_1E56EB7D0[type];
  }
  [v3 appendFormat:@"type: '%@'; ", v6];
  int64_t context = self->_context;
  if (context <= 1)
  {
    if (context == 1)
    {
      BOOL v8 = @"carousel";
      goto LABEL_12;
    }
LABEL_10:
    BOOL v8 = @"unknown";
    goto LABEL_12;
  }
  if (context != 100)
  {
    if (context == 2)
    {
      BOOL v8 = @"detailList";
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  BOOL v8 = @"rewardsHubList";
LABEL_12:
  [v4 appendFormat:@"context: '%@'; ", v8];
  [v4 appendFormat:@"ordering: '%@'; ", self->_ordering];
  [v4 appendFormat:@">"];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKAccountEntityOrdering *)a3;
  BOOL v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKAccountEntityOrdering *)self isEqualToAccountEntityOrdering:v5];

  return v6;
}

- (BOOL)isEqualToAccountEntityOrdering:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4 && self->_context == v4[2] && self->_type == v4[1])
  {
    ordering = self->_ordering;
    id v7 = (NSArray *)v5[3];
    if (ordering && v7) {
      char v8 = -[NSArray isEqual:](ordering, "isEqual:");
    }
    else {
      char v8 = ordering == v7;
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
  [v3 safelyAddObject:self->_ordering];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_context - v4 + 32 * v4;
  unint64_t v6 = self->_type - v5 + 32 * v5;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountEntityOrdering)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKAccountEntityOrdering;
  unint64_t v5 = [(PKAccountEntityOrdering *)&v21 init];
  if (v5)
  {
    unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    id v7 = v6;
    if (v6 != @"promotions")
    {
      if (v6)
      {
        char v8 = [@"promotions" isEqualToString:v6];

        if (v8) {
          goto LABEL_5;
        }
        v10 = v7;
        if (v10 == @"enhancedMerchants"
          || (id v11 = v10, v12 = [@"enhancedMerchants" isEqualToString:v10], v11, v12))
        {
          uint64_t v9 = 1;
          goto LABEL_10;
        }
      }
      uint64_t v9 = 0;
      goto LABEL_10;
    }
LABEL_5:
    uint64_t v9 = 2;
LABEL_10:

    v5->_unint64_t type = v9;
    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
    v5->_int64_t context = PKAccountEntityOrderingContextFromString(v13, v5->_type);

    id v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"ordering"];
    ordering = v5->_ordering;
    v5->_ordering = (NSArray *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  if (type > 2) {
    unint64_t v5 = @"unknown";
  }
  else {
    unint64_t v5 = off_1E56EB7D0[type];
  }
  id v8 = a3;
  [v8 encodeObject:v5 forKey:@"type"];
  int64_t context = self->_context;
  if (context <= 1)
  {
    if (context == 1)
    {
      id v7 = @"carousel";
      goto LABEL_12;
    }
LABEL_10:
    id v7 = @"unknown";
    goto LABEL_12;
  }
  if (context != 100)
  {
    if (context == 2)
    {
      id v7 = @"detailList";
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  id v7 = @"rewardsHubList";
LABEL_12:
  [v8 encodeObject:v7 forKey:@"key"];
  [v8 encodeObject:self->_ordering forKey:@"ordering"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = self->_type;
  v5[2] = self->_context;
  ordering = self->_ordering;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__PKAccountEntityOrdering_copyWithZone___block_invoke;
  v10[3] = &__block_descriptor_40_e8__16__0_8l;
  v10[4] = a3;
  uint64_t v7 = [(NSArray *)ordering pk_arrayBySafelyApplyingBlock:v10];
  id v8 = (void *)v5[3];
  v5[3] = v7;

  return v5;
}

id __40__PKAccountEntityOrdering_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 copyWithZone:*(void *)(a1 + 32)];
  return v2;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_int64_t context = a3;
}

- (NSArray)ordering
{
  return self->_ordering;
}

- (void)setOrdering:(id)a3
{
}

- (void).cxx_destruct
{
}

@end