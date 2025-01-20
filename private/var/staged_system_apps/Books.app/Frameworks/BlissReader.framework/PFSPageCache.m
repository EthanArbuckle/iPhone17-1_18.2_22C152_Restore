@interface PFSPageCache
- (PFSPageCache)init;
- (id)addMasterPageWithName:(id)a3;
- (id)addPage;
- (id)findMasterSlotWithId:(id)a3;
- (id)findSlotWithId:(id)a3 pageIndex:(unint64_t *)a4;
- (id)latestPage;
- (id)masterPageWithName:(id)a3;
- (id)pageWithIndex:(unint64_t)a3;
- (unint64_t)pageCount;
- (void)dealloc;
@end

@implementation PFSPageCache

- (PFSPageCache)init
{
  v4.receiver = self;
  v4.super_class = (Class)PFSPageCache;
  v2 = [(PFSPageCache *)&v4 init];
  if (v2)
  {
    v2->mMasterPages = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->mPages = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFSPageCache;
  [(PFSPageCache *)&v3 dealloc];
}

- (id)addMasterPageWithName:(id)a3
{
  v5 = objc_alloc_init(PFSPage);
  [(NSMutableDictionary *)self->mMasterPages setObject:v5 forKey:a3];

  return v5;
}

- (id)masterPageWithName:(id)a3
{
  return [(NSMutableDictionary *)self->mMasterPages objectForKey:a3];
}

- (id)findMasterSlotWithId:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  mMasterPages = self->mMasterPages;
  id result = [(NSMutableDictionary *)mMasterPages countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    id v7 = result;
    uint64_t v8 = *(void *)v11;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(mMasterPages);
      }
      id result = [[self->mMasterPages objectForKey:v10] slotWithId:a3];
      if (result) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id result = [(NSMutableDictionary *)mMasterPages countByEnumeratingWithState:&v10 objects:v14 count:16];
        id v7 = result;
        if (result) {
          goto LABEL_3;
        }
        return result;
      }
    }
  }
  return result;
}

- (id)addPage
{
  objc_super v3 = objc_alloc_init(PFSPage);
  [(NSMutableArray *)self->mPages addObject:v3];

  return v3;
}

- (id)pageWithIndex:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->mPages count] <= a3) {
    return 0;
  }
  mPages = self->mPages;

  return [(NSMutableArray *)mPages objectAtIndex:a3];
}

- (unint64_t)pageCount
{
  return (unint64_t)[(NSMutableArray *)self->mPages count];
}

- (id)latestPage
{
  return [(NSMutableArray *)self->mPages lastObject];
}

- (id)findSlotWithId:(id)a3 pageIndex:(unint64_t *)a4
{
  v6 = self;
  unint64_t v7 = *a4;
  while (v7 < [(PFSPageCache *)self pageCount])
  {
    id result = [v6 pageWithIndex:*a4].slotWithId:a3];
    if (result) {
      return result;
    }
    unint64_t v7 = *a4 + 1;
    *a4 = v7;
    self = v6;
  }
  return 0;
}

@end