@interface VUIPlistShowMediaCollection
- (VUIPlistMediaDatabaseShow)databaseShow;
- (VUIPlistShowMediaCollection)initWithMediaLibrary:(id)a3 databaseShow:(id)a4 requestedProperties:(id)a5;
- (VUIPlistShowMediaCollection)initWithMediaLibrary:(id)a3 identifier:(id)a4 requestedProperties:(id)a5 kind:(id)a6;
- (id)_valueForPropertyDescriptor:(id)a3;
- (id)coverArtImageIdentifier;
- (id)imageLoadParamsWithImageType:(unint64_t)a3;
- (id)mediaItemCount;
- (id)playedState;
- (void)setDatabaseShow:(id)a3;
@end

@implementation VUIPlistShowMediaCollection

- (VUIPlistShowMediaCollection)initWithMediaLibrary:(id)a3 databaseShow:(id)a4 requestedProperties:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  v12 = [VUIPlistMediaEntityIdentifier alloc];
  v13 = [v9 identifier];
  v14 = [(VUIPlistMediaEntityIdentifier *)v12 initWithIdentifier:v13 type:4];

  v15 = VUIPlistShowMediaKind();
  v18.receiver = self;
  v18.super_class = (Class)VUIPlistShowMediaCollection;
  v16 = [(VUIMediaEntity *)&v18 initWithMediaLibrary:v11 identifier:v14 requestedProperties:v10 kind:v15];

  if (v16) {
    objc_storeStrong((id *)&v16->_databaseShow, a4);
  }

  return v16;
}

- (VUIPlistShowMediaCollection)initWithMediaLibrary:(id)a3 identifier:(id)a4 requestedProperties:(id)a5 kind:(id)a6
{
  v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3C8];
  id v9 = NSStringFromSelector(a2);
  [v7 raise:v8, @"The %@ initializer is not available.", v9 format];

  return 0;
}

- (id)coverArtImageIdentifier
{
  v2 = [(VUIPlistShowMediaCollection *)self databaseShow];
  v3 = [v2 coverArtURL];
  v4 = [v3 absoluteString];

  return v4;
}

- (id)playedState
{
  return &unk_1F3F3C908;
}

- (id)_valueForPropertyDescriptor:(id)a3
{
  v4 = [a3 sourcePropertyNames];
  v5 = [v4 allObjects];

  if ([v5 count] == 1)
  {
    v6 = [v5 firstObject];
    v7 = [(VUIPlistShowMediaCollection *)self databaseShow];
    NSSelectorFromString(v6);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = [v7 valueForKey:v6];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)mediaItemCount
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = [(VUIPlistShowMediaCollection *)self databaseShow];
  v3 = [v2 seasons];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) episodes];
        v6 += [v9 count];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  id v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v6];
  return v10;
}

- (id)imageLoadParamsWithImageType:(unint64_t)a3
{
  if (a3)
  {
    v3 = 0;
  }
  else
  {
    uint64_t v5 = [(VUIPlistShowMediaCollection *)self databaseShow];
    uint64_t v6 = [v5 coverArtURL];

    uint64_t v7 = [(VUIPlistShowMediaCollection *)self coverArtImageIdentifier];
    v3 = [[VUIPlistMediaEntityImageLoadParams alloc] initWithImageURL:v6 baseImageIdentifier:v7 imageType:0];
  }
  return v3;
}

- (VUIPlistMediaDatabaseShow)databaseShow
{
  return self->_databaseShow;
}

- (void)setDatabaseShow:(id)a3
{
}

- (void).cxx_destruct
{
}

@end