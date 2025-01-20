@interface PXStoryMusicCurationProviderOptions
- (BOOL)isEqual:(id)a3;
- (NSSet)categories;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)logContext;
- (void)addCategory:(id)a3;
- (void)setCategories:(id)a3;
- (void)setLogContext:(unint64_t)a3;
@end

@implementation PXStoryMusicCurationProviderOptions

- (void).cxx_destruct
{
}

- (void)setLogContext:(unint64_t)a3
{
  self->_logContext = a3;
}

- (unint64_t)logContext
{
  return self->_logContext;
}

- (void)setCategories:(id)a3
{
}

- (NSSet)categories
{
  return self->_categories;
}

- (void)addCategory:(id)a3
{
  id v4 = a3;
  v5 = [(PXStoryMusicCurationProviderOptions *)self categories];
  v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }
  id v9 = v7;

  v8 = [v9 setByAddingObject:v4];

  [(PXStoryMusicCurationProviderOptions *)self setCategories:v8];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(PXStoryMusicCurationProviderOptions);
  v5 = [(PXStoryMusicCurationProviderOptions *)self categories];
  v6 = (void *)[v5 copy];
  [(PXStoryMusicCurationProviderOptions *)v4 setCategories:v6];

  [(PXStoryMusicCurationProviderOptions *)v4 setLogContext:[(PXStoryMusicCurationProviderOptions *)self logContext]];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 categories];
    v6 = [(PXStoryMusicCurationProviderOptions *)self categories];
    if (v5 == v6) {
      char v7 = 1;
    }
    else {
      char v7 = [v5 isEqual:v6];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(PXStoryMusicCurationProviderOptions *)self categories];
  unint64_t v3 = [v2 hash];

  return v3;
}

@end