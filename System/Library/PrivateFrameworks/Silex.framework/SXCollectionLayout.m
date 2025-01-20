@interface SXCollectionLayout
- (NSArray)rowsLayouts;
- (double)spaceBetweenRows;
- (id)description;
- (void)setRowsLayouts:(id)a3;
- (void)setSpaceBetweenRows:(double)a3;
@end

@implementation SXCollectionLayout

- (id)description
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [(SXCollectionLayout *)self spaceBetweenRows];
  objc_msgSend(v3, "appendFormat:", @"spaceBetweenRows: %f; ", v4);
  v5 = [(SXCollectionLayout *)self rowsLayouts];
  objc_msgSend(v3, "appendFormat:", @"rowLayouts (%lu)", objc_msgSend(v5, "count"));

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = [(SXCollectionLayout *)self rowsLayouts];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v3 appendString:@"\n"];
        v12 = [v11 description];
        [v3 appendFormat:@"%@", v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v13 = [(SXCollectionLayout *)self rowsLayouts];
  uint64_t v14 = [v13 count];

  if (v14) {
    [v3 appendString:@"\n"];
  }
  [v3 appendFormat:@">"];
  return v3;
}

- (double)spaceBetweenRows
{
  return self->_spaceBetweenRows;
}

- (void)setSpaceBetweenRows:(double)a3
{
  self->_spaceBetweenRows = a3;
}

- (NSArray)rowsLayouts
{
  return self->_rowsLayouts;
}

- (void)setRowsLayouts:(id)a3
{
}

- (void).cxx_destruct
{
}

@end