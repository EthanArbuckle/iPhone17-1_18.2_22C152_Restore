@interface PXSidebarItemChildInfo
- (PHCollection)collection;
- (PHFetchResult)fetchResult;
- (PXSidebarItemChildInfo)initWithListItem:(id)a3 dataSection:(id)a4 childIndex:(int64_t)a5;
- (int64_t)childIndexInFetchResult;
@end

@implementation PXSidebarItemChildInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

- (int64_t)childIndexInFetchResult
{
  return self->_childIndexInFetchResult;
}

- (PHFetchResult)fetchResult
{
  return self->_fetchResult;
}

- (PHCollection)collection
{
  return self->_collection;
}

- (PXSidebarItemChildInfo)initWithListItem:(id)a3 dataSection:(id)a4 childIndex:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v25.receiver = self;
  v25.super_class = (Class)PXSidebarItemChildInfo;
  v10 = [(PXSidebarItemChildInfo *)&v25 init];
  if (v10)
  {
    v11 = [v9 content];
    uint64_t v12 = [v8 collection];
    collection = v10->_collection;
    v10->_collection = (PHCollection *)v12;

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v14 = v11;
    }
    else {
      v14 = 0;
    }
    objc_storeStrong((id *)&v10->_fetchResult, v14);
    uint64_t v15 = [v9 count];
    if (a5 == -1 || (uint64_t v16 = v15, v15 < 1))
    {
      v10->_childIndexInFetchResult = -1;
    }
    else
    {
      v17 = [v9 objectAtIndex:a5 - (v15 == a5)];
      fetchResult = v10->_fetchResult;
      v19 = [v17 collection];
      uint64_t v20 = [(PHFetchResult *)fetchResult indexOfObject:v19];
      uint64_t v21 = v20;
      if (v16 == a5) {
        uint64_t v22 = v20 + 1;
      }
      else {
        uint64_t v22 = v20;
      }

      if (v21 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v23 = -1;
      }
      else {
        uint64_t v23 = v22;
      }
      v10->_childIndexInFetchResult = v23;
    }
  }

  return v10;
}

@end