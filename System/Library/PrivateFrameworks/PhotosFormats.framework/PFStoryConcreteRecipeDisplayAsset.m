@interface PFStoryConcreteRecipeDisplayAsset
+ (BOOL)decomposeURL:(id)a3 usingBlock:(id)a4;
+ (id)URLWithScheme:(id)a3 cloudIdentifier:(id)a4;
- (BOOL)isEqualToAsset:(id)a3;
- (NSString)cloudIdentifier;
- (NSString)scheme;
- (PFStoryConcreteRecipeDisplayAsset)initWithIdentifier:(id)a3 category:(int64_t)a4 scheme:(id)a5 cloudIdentifier:(id)a6;
- (PFStoryConcreteRecipeDisplayAsset)initWithIdentifier:(id)a3 kind:(int64_t)a4 url:(id)a5;
- (int64_t)category;
@end

@implementation PFStoryConcreteRecipeDisplayAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudIdentifier, 0);

  objc_storeStrong((id *)&self->_scheme, 0);
}

- (NSString)cloudIdentifier
{
  return self->_cloudIdentifier;
}

- (NSString)scheme
{
  return self->_scheme;
}

- (int64_t)category
{
  return self->_category;
}

- (BOOL)isEqualToAsset:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PFStoryConcreteRecipeDisplayAsset;
  if ([(PFStoryConcreteRecipeAsset *)&v13 isEqualToAsset:v4])
  {
    int64_t v5 = [(PFStoryConcreteRecipeDisplayAsset *)self category];
    if (v5 == [v4 category])
    {
      id v6 = [(PFStoryConcreteRecipeDisplayAsset *)self scheme];
      id v7 = [v4 scheme];
      if (v6 == v7)
      {
      }
      else
      {
        int v8 = [v6 isEqual:v7];

        if (!v8)
        {
          char v9 = 0;
LABEL_12:

          goto LABEL_13;
        }
      }
      v10 = [(PFStoryConcreteRecipeDisplayAsset *)self cloudIdentifier];
      v11 = [v4 cloudIdentifier];
      if (v10 == v11) {
        char v9 = 1;
      }
      else {
        char v9 = [v10 isEqual:v11];
      }

      goto LABEL_12;
    }
  }
  char v9 = 0;
LABEL_13:

  return v9;
}

- (PFStoryConcreteRecipeDisplayAsset)initWithIdentifier:(id)a3 kind:(int64_t)a4 url:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  int v8 = (PFStoryConcreteRecipeDisplayAsset *)_PFAssertFailHandler();
  return [(PFStoryConcreteRecipeDisplayAsset *)v8 initWithIdentifier:v10 category:v11 scheme:v12 cloudIdentifier:v13];
}

- (PFStoryConcreteRecipeDisplayAsset)initWithIdentifier:(id)a3 category:(int64_t)a4 scheme:(id)a5 cloudIdentifier:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a3;
  id v13 = +[PFStoryConcreteRecipeDisplayAsset URLWithScheme:v10 cloudIdentifier:v11];
  v20.receiver = self;
  v20.super_class = (Class)PFStoryConcreteRecipeDisplayAsset;
  v14 = [(PFStoryConcreteRecipeAsset *)&v20 initWithIdentifier:v12 kind:1 url:v13];

  if (v14)
  {
    v14->_category = a4;
    uint64_t v15 = [v10 copy];
    scheme = v14->_scheme;
    v14->_scheme = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    cloudIdentifier = v14->_cloudIdentifier;
    v14->_cloudIdentifier = (NSString *)v17;
  }
  return v14;
}

+ (BOOL)decomposeURL:(id)a3 usingBlock:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v5 resolvingAgainstBaseURL:1];
  int v8 = [v7 scheme];
  if (!v8) {
    goto LABEL_16;
  }
  SEL v9 = [v7 host];
  if (([v9 isEqualToString:@"asset"] & 1) == 0)
  {

    goto LABEL_16;
  }
  id v10 = [v7 queryItems];
  uint64_t v11 = [v10 count];

  if (v11 != 1)
  {
LABEL_16:
    BOOL v14 = 0;
    goto LABEL_17;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v12 = [v7 queryItems];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
  BOOL v14 = v13 != 0;
  if (v13)
  {
    uint64_t v15 = v13;
    BOOL v24 = v13 != 0;
    v25 = v8;
    id v26 = v6;
    id v27 = v5;
    v16 = 0;
    uint64_t v17 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v12);
        }
        v19 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        objc_super v20 = [v19 name];
        int v21 = [v20 isEqualToString:@"cloudIdentifier"];

        if (v21)
        {
          uint64_t v22 = [v19 value];

          v16 = (void *)v22;
        }
      }
      uint64_t v15 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v15);

    if (!v16)
    {
      BOOL v14 = 0;
      id v6 = v26;
      id v5 = v27;
      int v8 = v25;
      goto LABEL_17;
    }
    int v8 = v25;
    id v6 = v26;
    (*((void (**)(id, void *, void *))v26 + 2))(v26, v25, v16);
    id v5 = v27;
    BOOL v14 = v24;
  }
  else
  {
    v16 = v12;
  }

LABEL_17:
  return v14;
}

+ (id)URLWithScheme:(id)a3 cloudIdentifier:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)MEMORY[0x1E4F29088];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setScheme:v7];

  [v8 setHost:@"asset"];
  SEL v9 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"cloudIdentifier" value:v6];

  v13[0] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [v8 setQueryItems:v10];

  uint64_t v11 = [v8 URL];

  return v11;
}

@end