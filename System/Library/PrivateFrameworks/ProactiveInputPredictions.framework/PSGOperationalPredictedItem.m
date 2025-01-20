@interface PSGOperationalPredictedItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToItem:(id)a3;
- (NSDictionary)operationData;
- (NSString)bundleIdentifier;
- (NSString)itemIdentifier;
- (NSString)value;
- (PSGOperationalPredictedItem)initWithCoder:(id)a3;
- (PSGOperationalPredictedItem)initWithItemIdentifier:(id)a3 value:(id)a4 bundleIdentifier:(id)a5 operationData:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PSGOperationalPredictedItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationData, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

- (NSDictionary)operationData
{
  return self->_operationData;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)value
{
  return self->_value;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<PSGOperationalPredictedItem iid:%@ val:%@ bid:%@ opd:%@>", self->_itemIdentifier, self->_value, self->_bundleIdentifier, self->_operationData];
  return v2;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_itemIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_value hash] - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_bundleIdentifier hash] - v4 + 32 * v4;
  return [(NSDictionary *)self->_operationData hash] - v5 + 32 * v5;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (PSGOperationalPredictedItem *)a3;
  NSUInteger v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PSGOperationalPredictedItem *)self isEqualToItem:v5];

  return v6;
}

- (BOOL)isEqualToItem:(id)a3
{
  NSUInteger v4 = (id *)a3;
  NSUInteger v5 = v4;
  if (!v4) {
    goto LABEL_12;
  }
  itemIdentifier = self->_itemIdentifier;
  v7 = (NSString *)v4[1];
  if (itemIdentifier == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = itemIdentifier;
    char v10 = [(NSString *)v9 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_12;
    }
  }
  value = self->_value;
  v12 = (NSString *)v5[2];
  if (value == v12)
  {
  }
  else
  {
    v13 = v12;
    v14 = value;
    char v15 = [(NSString *)v14 isEqual:v13];

    if ((v15 & 1) == 0) {
      goto LABEL_12;
    }
  }
  bundleIdentifier = self->_bundleIdentifier;
  v17 = (NSString *)v5[3];
  if (bundleIdentifier == v17)
  {
  }
  else
  {
    v18 = v17;
    v19 = bundleIdentifier;
    char v20 = [(NSString *)v19 isEqual:v18];

    if ((v20 & 1) == 0)
    {
LABEL_12:
      char v21 = 0;
      goto LABEL_18;
    }
  }
  v22 = self->_operationData;
  v23 = v22;
  if (v22 == v5[4]) {
    char v21 = 1;
  }
  else {
    char v21 = -[NSDictionary isEqual:](v22, "isEqual:");
  }

LABEL_18:
  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  NSUInteger v5 = objc_opt_new();
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_itemIdentifier copyWithZone:a3];
    v7 = (void *)v5[1];
    v5[1] = v6;

    uint64_t v8 = [(NSString *)self->_value copyWithZone:a3];
    v9 = (void *)v5[2];
    v5[2] = v8;

    uint64_t v10 = [(NSString *)self->_bundleIdentifier copyWithZone:a3];
    v11 = (void *)v5[3];
    v5[3] = v10;

    uint64_t v12 = [(NSDictionary *)self->_operationData copyWithZone:a3];
    v13 = (void *)v5[4];
    v5[4] = v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  itemIdentifier = self->_itemIdentifier;
  id v5 = a3;
  [v5 encodeObject:itemIdentifier forKey:@"iid"];
  [v5 encodeObject:self->_value forKey:@"val"];
  [v5 encodeObject:self->_bundleIdentifier forKey:@"bid"];
  [v5 encodeObject:self->_operationData forKey:@"opd"];
}

- (PSGOperationalPredictedItem)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [v4 decodeObjectOfClass:v5 forKey:@"iid"];
  v7 = [v4 decodeObjectOfClass:v5 forKey:@"val"];
  uint64_t v8 = (void *)MEMORY[0x2105116B0]();
  id v9 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_msgSend(v9, "initWithObjects:", v5, v10, v11, objc_opt_class(), 0);
  v13 = [v4 decodeObjectOfClasses:v12 forKey:@"opd"];

  v14 = 0;
  if (v6 && v7 && v13)
  {
    char v15 = [v4 decodeObjectOfClass:v5 forKey:@"bid"];
    self = [(PSGOperationalPredictedItem *)self initWithItemIdentifier:v6 value:v7 bundleIdentifier:v15 operationData:v13];

    v14 = self;
  }

  return v14;
}

- (PSGOperationalPredictedItem)initWithItemIdentifier:(id)a3 value:(id)a4 bundleIdentifier:(id)a5 operationData:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PSGOperationalPredictedItem;
  char v15 = [(PSGOperationalPredictedItem *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_itemIdentifier, a3);
    objc_storeStrong((id *)&v16->_value, a4);
    objc_storeStrong((id *)&v16->_bundleIdentifier, a5);
    objc_storeStrong((id *)&v16->_operationData, a6);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end