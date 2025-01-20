@interface PFStoryConcreteRecipeSongAsset
+ (BOOL)decomposeURL:(id)a3 usingBlock:(id)a4;
+ (id)URLWithCatalog:(id)a3 songID:(id)a4;
- (BOOL)isEqualToAsset:(id)a3;
- (NSString)catalog;
- (NSString)colorGradeCategory;
- (NSString)songID;
- (NSString)subtitle;
- (NSString)title;
- (PFStoryConcreteRecipeSongAsset)initWithIdentifier:(id)a3 category:(int64_t)a4 subcategory:(int64_t)a5 catalog:(id)a6 songID:(id)a7 title:(id)a8 subtitle:(id)a9;
- (PFStoryConcreteRecipeSongAsset)initWithIdentifier:(id)a3 kind:(int64_t)a4 url:(id)a5;
- (id)description;
- (int64_t)category;
- (int64_t)subcategory;
- (void)setColorGradeCategory:(id)a3;
@end

@implementation PFStoryConcreteRecipeSongAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorGradeCategory, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_catalog, 0);

  objc_storeStrong((id *)&self->_songID, 0);
}

- (void)setColorGradeCategory:(id)a3
{
}

- (NSString)colorGradeCategory
{
  return self->_colorGradeCategory;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)catalog
{
  return self->_catalog;
}

- (NSString)songID
{
  return self->_songID;
}

- (int64_t)subcategory
{
  return self->_subcategory;
}

- (int64_t)category
{
  return self->_category;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PFStoryConcreteRecipeSongAsset *)self catalog];
  v7 = [(PFStoryConcreteRecipeSongAsset *)self songID];
  v8 = [(PFStoryConcreteRecipeSongAsset *)self title];
  v9 = [(PFStoryConcreteRecipeSongAsset *)self subtitle];
  v10 = [(PFStoryConcreteRecipeSongAsset *)self colorGradeCategory];
  unint64_t v11 = [(PFStoryConcreteRecipeSongAsset *)self category];
  if (v11 > 2) {
    v12 = @"??";
  }
  else {
    v12 = off_1E5B2E8D0[v11];
  }
  unint64_t v13 = [(PFStoryConcreteRecipeSongAsset *)self subcategory];
  if (v13 > 5) {
    v14 = @"??";
  }
  else {
    v14 = off_1E5B2E8E8[v13];
  }
  v15 = objc_msgSend(v3, "initWithFormat:", @"<%@ %p; catalog: %@; identifier: %@; title: %@; subtitle: %@; colorGrade: %@; category: %@; subcategory: %@>",
                  v5,
                  self,
                  v6,
                  v7,
                  v8,
                  v9,
                  v10,
                  v12,
                  v14);

  return v15;
}

- (BOOL)isEqualToAsset:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PFStoryConcreteRecipeSongAsset;
  if ([(PFStoryConcreteRecipeAsset *)&v25 isEqualToAsset:v4])
  {
    int64_t v5 = [(PFStoryConcreteRecipeSongAsset *)self category];
    if (v5 == [v4 category])
    {
      int64_t v6 = [(PFStoryConcreteRecipeSongAsset *)self subcategory];
      if (v6 == [v4 subcategory])
      {
        id v7 = [(PFStoryConcreteRecipeSongAsset *)self songID];
        id v8 = [v4 songID];
        if (v7 == v8)
        {
        }
        else
        {
          int v9 = [v7 isEqual:v8];

          if (!v9)
          {
            char v10 = 0;
LABEL_29:

            goto LABEL_8;
          }
        }
        id v12 = [(PFStoryConcreteRecipeSongAsset *)self catalog];
        id v13 = [v4 catalog];
        if (v12 == v13)
        {
        }
        else
        {
          int v14 = [v12 isEqualToString:v13];

          if (!v14)
          {
            char v10 = 0;
LABEL_28:

            goto LABEL_29;
          }
        }
        id v15 = [(PFStoryConcreteRecipeSongAsset *)self title];
        id v16 = [v4 title];
        if (v15 == v16)
        {
        }
        else
        {
          int v17 = [v15 isEqual:v16];

          if (!v17)
          {
            char v10 = 0;
LABEL_27:

            goto LABEL_28;
          }
        }
        id v18 = [(PFStoryConcreteRecipeSongAsset *)self subtitle];
        id v19 = [v4 subtitle];
        v24 = v18;
        if (v18 == v19)
        {
        }
        else
        {
          int v20 = [v18 isEqual:v19];

          if (!v20)
          {
            char v10 = 0;
LABEL_26:

            goto LABEL_27;
          }
        }
        v21 = [(PFStoryConcreteRecipeSongAsset *)self colorGradeCategory];
        v22 = [v4 colorGradeCategory];
        if (v21 == v22) {
          char v10 = 1;
        }
        else {
          char v10 = [v21 isEqual:v22];
        }

        id v15 = v23;
        goto LABEL_26;
      }
    }
  }
  char v10 = 0;
LABEL_8:

  return v10;
}

- (PFStoryConcreteRecipeSongAsset)initWithIdentifier:(id)a3 kind:(int64_t)a4 url:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  id v8 = (PFStoryConcreteRecipeSongAsset *)_PFAssertFailHandler();
  return [(PFStoryConcreteRecipeSongAsset *)v8 initWithIdentifier:v10 category:v11 subcategory:v12 catalog:v13 songID:v14 title:v15 subtitle:v17];
}

- (PFStoryConcreteRecipeSongAsset)initWithIdentifier:(id)a3 category:(int64_t)a4 subcategory:(int64_t)a5 catalog:(id)a6 songID:(id)a7 title:(id)a8 subtitle:(id)a9
{
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = a3;
  int v20 = +[PFStoryConcreteRecipeSongAsset URLWithCatalog:v15 songID:v16];
  if (v19) {
    id v21 = v19;
  }
  else {
    id v21 = v16;
  }
  v33.receiver = self;
  v33.super_class = (Class)PFStoryConcreteRecipeSongAsset;
  v22 = [(PFStoryConcreteRecipeAsset *)&v33 initWithIdentifier:v21 kind:2 url:v20];

  if (v22)
  {
    v22->_category = a4;
    v22->_subcategory = a5;
    uint64_t v23 = [v16 copy];
    songID = v22->_songID;
    v22->_songID = (NSString *)v23;

    uint64_t v25 = [v15 copy];
    catalog = v22->_catalog;
    v22->_catalog = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    title = v22->_title;
    v22->_title = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    subtitle = v22->_subtitle;
    v22->_subtitle = (NSString *)v29;

    colorGradeCategory = v22->_colorGradeCategory;
    v22->_colorGradeCategory = 0;
  }
  return v22;
}

+ (BOOL)decomposeURL:(id)a3 usingBlock:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(void, void *, void *))a4;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v5 resolvingAgainstBaseURL:1];
  id v8 = [v7 host];
  if (([v8 isEqualToString:@"song"] & 1) == 0)
  {

    goto LABEL_17;
  }
  SEL v9 = [v7 queryItems];
  uint64_t v10 = [v9 count];

  if (v10 != 1)
  {
LABEL_17:
    BOOL v24 = 0;
    goto LABEL_23;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  int64_t v11 = [v7 queryItems];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    v26 = v6;
    id v27 = v5;
    id v14 = 0;
    uint64_t v15 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v11);
        }
        id v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v18 = objc_msgSend(v17, "name", v26, v27);
        int v19 = [v18 isEqualToString:@"songID"];

        if (v19)
        {
          uint64_t v20 = [v17 value];

          id v14 = (void *)v20;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v13);

    if (!v14)
    {
      BOOL v24 = 0;
      id v6 = v26;
      id v5 = v27;
      goto LABEL_23;
    }
    id v21 = [v7 scheme];
    id v6 = v26;
    id v5 = v27;
    if (v21
      && (v32[0] = @"applemusic",
          v32[1] = @"flexmusic",
          v32[2] = @"mock",
          [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:3],
          v22 = objc_claimAutoreleasedReturnValue(),
          int v23 = [v22 containsObject:v21],
          v22,
          v23))
    {
      v26[2](v26, v21, v14);
      BOOL v24 = 1;
    }
    else
    {
      BOOL v24 = 0;
    }
  }
  else
  {
    BOOL v24 = 0;
    id v14 = v11;
  }

LABEL_23:
  return v24;
}

+ (id)URLWithCatalog:(id)a3 songID:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1CB10];
  id v6 = (objc_class *)NSString;
  id v7 = a4;
  id v8 = a3;
  SEL v9 = (void *)[[v6 alloc] initWithFormat:@"%@://song?songID=%@", v8, v7];

  uint64_t v10 = [v5 URLWithString:v9];

  return v10;
}

@end