@interface PKPayLaterStackedLabelRow
- (BOOL)isEqual:(id)a3;
- (Class)cellClass;
- (NSCopying)identifier;
- (PKPayLaterStackedLabelRow)initWithSources:(id)a3;
- (double)paddingBetweenRows;
- (unint64_t)hash;
- (void)configureCell:(id)a3;
- (void)setPaddingBetweenRows:(double)a3;
@end

@implementation PKPayLaterStackedLabelRow

- (PKPayLaterStackedLabelRow)initWithSources:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterStackedLabelRow;
  v6 = [(PKPayLaterStackedLabelRow *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sources, a3);
  }

  return v7;
}

- (NSCopying)identifier
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_sources;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "identifier", (void)v12);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v3 appendString:v9];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = (void *)[v3 copy];

  return (NSCopying *)v10;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3
{
  id v6 = a3;
  [(PKPayLaterStackedLabelRow *)self cellClass];
  if (objc_opt_isKindOfClass())
  {
    sources = self->_sources;
    id v5 = v6;
    [v5 setSources:sources];
    [v5 setPaddingBetweenRows:self->_paddingBetweenRows];
  }
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_sources];
  PKCombinedHash();
  unint64_t v4 = PKIntegerHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKPayLaterStackedLabelRow *)a3;
  id v5 = v4;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    if (PKEqualObjects()) {
      BOOL v7 = self->_paddingBetweenRows == v6[2];
    }
    else {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (double)paddingBetweenRows
{
  return self->_paddingBetweenRows;
}

- (void)setPaddingBetweenRows:(double)a3
{
  self->_paddingBetweenRows = a3;
}

- (void).cxx_destruct
{
}

@end