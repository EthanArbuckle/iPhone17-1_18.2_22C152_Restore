@interface PXPeopleDetailSettingsFaceCropDataSource
- (NSMutableDictionary)images;
- (OS_dispatch_queue)imagesIsolationQueue;
- (PHFetchResult)fetchResult;
- (PXPeopleDetailSettingsFaceCropDataSource)init;
- (id)imageAtIndexPath:(id)a3;
- (id)nameAtIndexPath:(id)a3;
- (unint64_t)numberOfAssets;
- (void)setFetchResult:(id)a3;
- (void)setImages:(id)a3;
- (void)setImagesIsolationQueue:(id)a3;
@end

@implementation PXPeopleDetailSettingsFaceCropDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imagesIsolationQueue, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_fetchResult, 0);
}

- (void)setImagesIsolationQueue:(id)a3
{
}

- (OS_dispatch_queue)imagesIsolationQueue
{
  return self->_imagesIsolationQueue;
}

- (void)setImages:(id)a3
{
}

- (NSMutableDictionary)images
{
  return self->_images;
}

- (void)setFetchResult:(id)a3
{
}

- (PHFetchResult)fetchResult
{
  return self->_fetchResult;
}

- (id)nameAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(PXPeopleDetailSettingsFaceCropDataSource *)self fetchResult];
  uint64_t v6 = [v4 row];

  v7 = [v5 objectAtIndex:v6];

  v8 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v9 = [v8 librarySpecificFetchOptions];

  v10 = [MEMORY[0x1E4F39050] fetchFacesForFaceCrop:v7 options:v9];
  if ([v10 count])
  {
    v11 = [v10 objectAtIndex:0];
    v12 = [MEMORY[0x1E4F391F0] fetchPersonWithFace:v11 options:v9];
    if ([v12 count])
    {
      v13 = [v12 objectAtIndex:0];
      v14 = [v13 name];
      uint64_t v15 = [v14 length];

      if (v15)
      {
        v16 = [v13 name];
      }
      else
      {
        v16 = @"unnamed";
      }
    }
    else
    {
      v16 = @"unnamed";
    }
  }
  else
  {
    v16 = @"unnamed";
  }

  return v16;
}

- (unint64_t)numberOfAssets
{
  v2 = [(PXPeopleDetailSettingsFaceCropDataSource *)self fetchResult];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)imageAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__96774;
  v27 = __Block_byref_object_dispose__96775;
  id v28 = 0;
  v5 = [(PXPeopleDetailSettingsFaceCropDataSource *)self imagesIsolationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__PXPeopleDetailSettingsFaceCropDataSource_imageAtIndexPath___block_invoke;
  block[3] = &unk_1E5DCCA20;
  v22 = &v23;
  block[4] = self;
  id v6 = v4;
  id v21 = v6;
  dispatch_sync(v5, block);

  v7 = (void *)v24[5];
  if (!v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4FB1818]);
    v9 = [(PXPeopleDetailSettingsFaceCropDataSource *)self fetchResult];
    v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v6, "row"));
    v11 = [v10 resourceData];
    uint64_t v12 = [v8 initWithData:v11];
    v13 = (void *)v24[5];
    v24[5] = v12;

    v14 = [(PXPeopleDetailSettingsFaceCropDataSource *)self imagesIsolationQueue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __61__PXPeopleDetailSettingsFaceCropDataSource_imageAtIndexPath___block_invoke_2;
    v17[3] = &unk_1E5DCCA20;
    v17[4] = self;
    v19 = &v23;
    id v18 = v6;
    dispatch_sync(v14, v17);

    v7 = (void *)v24[5];
  }
  id v15 = v7;

  _Block_object_dispose(&v23, 8);
  return v15;
}

void __61__PXPeopleDetailSettingsFaceCropDataSource_imageAtIndexPath___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) images];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __61__PXPeopleDetailSettingsFaceCropDataSource_imageAtIndexPath___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) images];
  [v2 setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:*(void *)(a1 + 40)];
}

- (PXPeopleDetailSettingsFaceCropDataSource)init
{
  v13.receiver = self;
  v13.super_class = (Class)PXPeopleDetailSettingsFaceCropDataSource;
  id v2 = [(PXPeopleDetailSettingsFaceCropDataSource *)&v13 init];
  if (v2)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F39060];
    id v4 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    id v5 = [v4 librarySpecificFetchOptions];
    uint64_t v6 = [v3 fetchFaceCropsWithOptions:v5];
    fetchResult = v2->_fetchResult;
    v2->_fetchResult = (PHFetchResult *)v6;

    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    images = v2->_images;
    v2->_images = v8;

    dispatch_queue_t v10 = dispatch_queue_create("PXPeopleDetailSettingsFaceCropDataSource.images", 0);
    imagesIsolationQueue = v2->_imagesIsolationQueue;
    v2->_imagesIsolationQueue = (OS_dispatch_queue *)v10;
  }
  return v2;
}

@end