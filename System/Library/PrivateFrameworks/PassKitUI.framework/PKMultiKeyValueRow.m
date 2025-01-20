@interface PKMultiKeyValueRow
- (BOOL)isEqual:(id)a3;
- (Class)cellClass;
- (NSCopying)identifier;
- (NSString)axID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initKeyValueSources:(id)a3;
- (unint64_t)hash;
- (void)configureCell:(id)a3;
- (void)setAxID:(id)a3;
@end

@implementation PKMultiKeyValueRow

- (id)initKeyValueSources:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKMultiKeyValueRow;
  v6 = [(PKMultiKeyValueRow *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sources, a3);
  }

  return v7;
}

- (NSCopying)identifier
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 appendString:v5];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v6 = self->_sources;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "identifier", (void)v14);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v3 appendString:v11];
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = (void *)[v3 copy];

  return (NSCopying *)v12;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3
{
  id v6 = a3;
  [(PKMultiKeyValueRow *)self cellClass];
  if (objc_opt_isKindOfClass())
  {
    axID = self->_axID;
    id v5 = v6;
    [v5 setAccessibilityIdentifier:axID];
    [v5 setSources:self->_sources];
  }
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_sources];
  unint64_t v4 = PKCombinedHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKMultiKeyValueRow *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v6 = PKEqualObjects();
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = +[PKMultiKeyValueRow allocWithZone:](PKMultiKeyValueRow, "allocWithZone:");
  uint64_t v6 = [(NSArray *)self->_sources copyWithZone:a3];
  sources = v5->_sources;
  v5->_sources = (NSArray *)v6;

  return v5;
}

- (NSString)axID
{
  return self->_axID;
}

- (void)setAxID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axID, 0);

  objc_storeStrong((id *)&self->_sources, 0);
}

@end