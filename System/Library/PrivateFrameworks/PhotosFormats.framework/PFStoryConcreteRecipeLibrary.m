@interface PFStoryConcreteRecipeLibrary
- (BOOL)isEqualToLibrary:(id)a3;
- (NSString)diagnosticDescription;
- (NSURL)url;
- (PFStoryConcreteRecipeLibrary)init;
- (PFStoryConcreteRecipeLibrary)initWithKind:(int64_t)a3 url:(id)a4;
- (int64_t)kind;
@end

@implementation PFStoryConcreteRecipeLibrary

- (void).cxx_destruct
{
}

- (NSURL)url
{
  return self->_url;
}

- (int64_t)kind
{
  return self->_kind;
}

- (BOOL)isEqualToLibrary:(id)a3
{
  v4 = (PFStoryConcreteRecipeLibrary *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    int64_t v5 = [(PFStoryConcreteRecipeLibrary *)self kind];
    if (v5 == [(PFStoryConcreteRecipeLibrary *)v4 kind])
    {
      v6 = [(PFStoryConcreteRecipeLibrary *)self url];
      v7 = [(PFStoryConcreteRecipeLibrary *)v4 url];
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
  v4 = [(PFStoryRecipeArchiver *)v3 archivedJSONObjectWithLibrary:self];
  int64_t v5 = [v4 description];

  return (NSString *)v5;
}

- (PFStoryConcreteRecipeLibrary)initWithKind:(int64_t)a3 url:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PFStoryConcreteRecipeLibrary;
  v7 = [(PFStoryConcreteRecipeLibrary *)&v12 init];
  char v8 = v7;
  if (v7)
  {
    v7->_kind = a3;
    uint64_t v9 = [v6 copy];
    url = v8->_url;
    v8->_url = (NSURL *)v9;
  }
  return v8;
}

- (PFStoryConcreteRecipeLibrary)init
{
  v2 = (void *)_PFAssertFailHandler();
  return (PFStoryConcreteRecipeLibrary *)+[PFStoryRecipeLibraryFactory createLibraryWithKind:v4 url:v5];
}

@end