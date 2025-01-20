@interface PFStoryConcreteRecipeAsset
- (BOOL)isEqualToAsset:(id)a3;
- (NSString)diagnosticDescription;
- (NSString)identifier;
- (NSURL)url;
- (PFStoryConcreteRecipeAsset)init;
- (PFStoryConcreteRecipeAsset)initWithIdentifier:(id)a3 kind:(int64_t)a4 url:(id)a5;
- (int64_t)kind;
@end

@implementation PFStoryConcreteRecipeAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSURL)url
{
  return self->_url;
}

- (int64_t)kind
{
  return self->_kind;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isEqualToAsset:(id)a3
{
  v4 = (PFStoryConcreteRecipeAsset *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    int64_t v5 = [(PFStoryConcreteRecipeAsset *)self kind];
    if (v5 == [(PFStoryConcreteRecipeAsset *)v4 kind])
    {
      v6 = [(PFStoryConcreteRecipeAsset *)self url];
      v7 = [(PFStoryConcreteRecipeAsset *)v4 url];
      if (v6 == v7) {
        char v8 = 1;
      }
      else {
        char v8 = [v6 isEqual:v7];
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (NSString)diagnosticDescription
{
  v3 = objc_alloc_init(PFStoryRecipeArchiver);
  v4 = [(PFStoryRecipeArchiver *)v3 archivedJSONObjectWithAsset:self];
  int64_t v5 = [v4 description];

  return (NSString *)v5;
}

- (PFStoryConcreteRecipeAsset)initWithIdentifier:(id)a3 kind:(int64_t)a4 url:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PFStoryConcreteRecipeAsset;
  v10 = [(PFStoryConcreteRecipeAsset *)&v20 init];
  if (v10)
  {
    v11 = (void *)[v8 copy];
    v12 = v11;
    if (v11)
    {
      v13 = v11;
      identifier = v10->_identifier;
      v10->_identifier = v13;
    }
    else
    {
      identifier = [MEMORY[0x1E4F29128] UUID];
      uint64_t v15 = [identifier UUIDString];
      v16 = v10->_identifier;
      v10->_identifier = (NSString *)v15;
    }
    v10->_kind = a4;
    uint64_t v17 = [v9 copy];
    url = v10->_url;
    v10->_url = (NSURL *)v17;
  }
  return v10;
}

- (PFStoryConcreteRecipeAsset)init
{
  v2 = (PFClientSideEncryptionManager *)_PFAssertFailHandler();
  [(PFClientSideEncryptionManager *)v2 .cxx_destruct];
  return result;
}

@end