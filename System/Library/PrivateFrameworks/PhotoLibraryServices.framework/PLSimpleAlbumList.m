@interface PLSimpleAlbumList
- (BOOL)canEditContainers;
- (BOOL)isEmpty;
- (NSOrderedSet)containers;
- (PLSimpleAlbumList)initWithAssetContainer:(id)a3;
- (PLSimpleAlbumList)initWithAssetContainers:(id)a3;
- (id)containersRelationshipName;
- (id)managedObjectContext;
- (id)photoLibrary;
- (unint64_t)containersCount;
- (void)setContainers:(id)a3;
@end

@implementation PLSimpleAlbumList

- (void).cxx_destruct
{
}

- (void)setContainers:(id)a3
{
}

- (NSOrderedSet)containers
{
  return self->_containers;
}

- (id)containersRelationshipName
{
  return @"albums";
}

- (id)photoLibrary
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(PLSimpleAlbumList *)self containers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v9 = [v8 photoLibrary];

          v5 = (void *)v9;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)managedObjectContext
{
  return 0;
}

- (BOOL)canEditContainers
{
  return 0;
}

- (BOOL)isEmpty
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(PLSimpleAlbumList *)self containers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*((void *)&v9 + 1) + 8 * i) isEmpty])
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (unint64_t)containersCount
{
  return [(NSOrderedSet *)self->_containers count];
}

- (PLSimpleAlbumList)initWithAssetContainers:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLSimpleAlbumList;
  uint64_t v6 = [(PLSimpleAlbumList *)&v9 init];
  BOOL v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_containers, a3);
  }

  return v7;
}

- (PLSimpleAlbumList)initWithAssetContainer:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4F1CAA0] orderedSetWithObject:a3];
  id v5 = [(PLSimpleAlbumList *)self initWithAssetContainers:v4];

  return v5;
}

@end