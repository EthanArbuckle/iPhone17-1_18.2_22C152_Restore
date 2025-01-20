@interface BrowseCategory
- (BOOL)isEqual:(id)a3;
- (BrowseCategory)initWithCategory:(id)a3;
- (GEOSearchCategory)category;
- (NSArray)subCategories;
- (NSString)alternativeName;
- (NSString)name;
- (id)description;
- (unint64_t)hash;
- (void)imageWithResultHandler:(id)a3;
- (void)imageWithScale:(double)a3 isCarplay:(BOOL)a4 resultHandler:(id)a5;
- (void)setCategory:(id)a3;
@end

@implementation BrowseCategory

- (BrowseCategory)initWithCategory:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BrowseCategory;
  v6 = [(BrowseCategory *)&v22 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_category, a3);
    id v8 = [&__NSArray0__struct mutableCopy];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v9 = [(GEOSearchCategory *)v7->_category subcategories];
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [[BrowseCategory alloc] initWithCategory:*(void *)(*((void *)&v18 + 1) + 8 * (void)v13)];
          [v8 addObject:v14];

          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v11);
    }

    uint64_t v15 = +[NSArray arrayWithArray:v8];
    subCategories = v7->_subCategories;
    v7->_subCategories = (NSArray *)v15;
  }
  return v7;
}

- (void)imageWithResultHandler:(id)a3
{
}

- (void)imageWithScale:(double)a3 isCarplay:(BOOL)a4 resultHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = +[BrowseManager sharedManager];
  [v9 imageForCategory:self scale:v5 isCarplay:v8 resultHandler:a3];
}

- (NSString)name
{
  v2 = [(GEOSearchCategory *)self->_category displayString];
  v3 = v2;
  if (!v2) {
    v2 = &stru_101324E70;
  }
  v4 = v2;

  return v4;
}

- (NSString)alternativeName
{
  return (NSString *)[(GEOSearchCategory *)self->_category shortDisplayString];
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(BrowseCategory *)self name];
  BOOL v5 = [(BrowseCategory *)self subCategories];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ %p: name='%@' children=%d>", v3, self, v4, [v5 count]);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BrowseCategory *)a3;
  if (self == v4)
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = v4;
      v6 = [(BrowseCategory *)self category];
      v7 = [(BrowseCategory *)v5 category];

      unsigned __int8 v8 = [v6 isEqual:v7];
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(BrowseCategory *)self category];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (NSArray)subCategories
{
  return self->_subCategories;
}

- (GEOSearchCategory)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);

  objc_storeStrong((id *)&self->_subCategories, 0);
}

@end