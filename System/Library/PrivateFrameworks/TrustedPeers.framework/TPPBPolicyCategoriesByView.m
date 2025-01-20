@interface TPPBPolicyCategoriesByView
+ (Class)categoriesType;
+ (id)TPPBPolicyCategoriesByViewWithView:(id)a3 categories:(id)a4;
- (BOOL)hasView;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)categories;
- (NSString)view;
- (id)categoriesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)categoriesCount;
- (unint64_t)hash;
- (void)addCategories:(id)a3;
- (void)clearCategories;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCategories:(id)a3;
- (void)setView:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBPolicyCategoriesByView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_categories, 0);
}

- (void)setCategories:(id)a3
{
}

- (NSMutableArray)categories
{
  return self->_categories;
}

- (void)setView:(id)a3
{
}

- (NSString)view
{
  return self->_view;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[TPPBPolicyCategoriesByView setView:](self, "setView:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 1);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[TPPBPolicyCategoriesByView addCategories:](self, "addCategories:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_view hash];
  return [(NSMutableArray *)self->_categories hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((view = self->_view, !((unint64_t)view | v4[2])) || -[NSString isEqual:](view, "isEqual:")))
  {
    categories = self->_categories;
    if ((unint64_t)categories | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](categories, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_view copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_categories;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [v5 addCategories:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_view) {
    objc_msgSend(v8, "setView:");
  }
  if ([(TPPBPolicyCategoriesByView *)self categoriesCount])
  {
    [v8 clearCategories];
    unint64_t v4 = [(TPPBPolicyCategoriesByView *)self categoriesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        char v7 = [(TPPBPolicyCategoriesByView *)self categoriesAtIndex:i];
        [v8 addCategories:v7];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_view) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_categories;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)readFrom:(id)a3
{
  return TPPBPolicyCategoriesByViewReadFrom(self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  view = self->_view;
  if (view) {
    [v3 setObject:view forKey:@"view"];
  }
  categories = self->_categories;
  if (categories) {
    [v4 setObject:categories forKey:@"categories"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TPPBPolicyCategoriesByView;
  id v4 = [(TPPBPolicyCategoriesByView *)&v8 description];
  unint64_t v5 = [(TPPBPolicyCategoriesByView *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)categoriesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_categories objectAtIndex:a3];
}

- (unint64_t)categoriesCount
{
  return [(NSMutableArray *)self->_categories count];
}

- (void)addCategories:(id)a3
{
  id v4 = a3;
  categories = self->_categories;
  id v8 = v4;
  if (!categories)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_categories;
    self->_categories = v6;

    id v4 = v8;
    categories = self->_categories;
  }
  [(NSMutableArray *)categories addObject:v4];
}

- (void)clearCategories
{
}

- (BOOL)hasView
{
  return self->_view != 0;
}

+ (Class)categoriesType
{
  return (Class)objc_opt_class();
}

+ (id)TPPBPolicyCategoriesByViewWithView:(id)a3 categories:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(TPPBPolicyCategoriesByView);
  [(TPPBPolicyCategoriesByView *)v7 setView:v6];

  id v8 = (void *)[v5 mutableCopy];
  [(TPPBPolicyCategoriesByView *)v7 setCategories:v8];

  return v7;
}

@end