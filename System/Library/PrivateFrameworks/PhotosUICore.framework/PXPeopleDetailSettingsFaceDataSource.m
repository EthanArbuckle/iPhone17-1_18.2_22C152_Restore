@interface PXPeopleDetailSettingsFaceDataSource
- (BOOL)hasMoreDetails;
- (NSString)title;
- (PHFetchResult)faces;
- (PXPeopleDetailSettingsFaceDataSource)initWithTitle:(id)a3 faces:(id)a4;
- (id)modelObjectForIndex:(int64_t)a3;
- (int64_t)action;
- (unint64_t)numberOfItems;
- (void)imageAtIndex:(unint64_t)a3 targetSize:(CGSize)a4 displayScale:(double)a5 resultHandler:(id)a6;
- (void)setFaces:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PXPeopleDetailSettingsFaceDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faces, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setFaces:(id)a3
{
}

- (PHFetchResult)faces
{
  return self->_faces;
}

- (void)setTitle:(id)a3
{
}

- (id)modelObjectForIndex:(int64_t)a3
{
  return [(PHFetchResult *)self->_faces objectAtIndex:a3];
}

- (int64_t)action
{
  return 0;
}

- (void)imageAtIndex:(unint64_t)a3 targetSize:(CGSize)a4 displayScale:(double)a5 resultHandler:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  v24[1] = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  v12 = [(PHFetchResult *)self->_faces objectAtIndex:a3];
  v13 = [v12 photoLibrary];
  v14 = [v13 librarySpecificFetchOptions];

  v15 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v12, "detectionType"));
  v24[0] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  [v14 setIncludedDetectionTypes:v16];

  v17 = [MEMORY[0x1E4F391F0] fetchPersonWithFace:v12 options:v14];
  v18 = [v17 firstObject];

  v19 = -[PXPeopleFaceCropFetchOptions initWithPerson:face:targetSize:displayScale:]([PXPeopleFaceCropFetchOptions alloc], "initWithPerson:face:targetSize:displayScale:", v18, v12, width, height, a5);
  [(PXPeopleFaceCropFetchOptions *)v19 setShouldCacheResult:0];
  v20 = +[PXPeopleFaceCropManager sharedManager];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __91__PXPeopleDetailSettingsFaceDataSource_imageAtIndex_targetSize_displayScale_resultHandler___block_invoke;
  v22[3] = &unk_1E5DD24E8;
  id v23 = v11;
  id v21 = v11;
  [v20 requestFaceCropForOptions:v19 resultHandler:v22];
}

void __91__PXPeopleDetailSettingsFaceDataSource_imageAtIndex_targetSize_displayScale_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (*(void *)(a1 + 32))
  {
    id v5 = a2;
    id v7 = [a3 objectForKeyedSubscript:@"PXPeopleContentsRectKey"];
    uint64_t v6 = *(void *)(a1 + 32);
    [v7 CGRectValue];
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
  }
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)numberOfItems
{
  return [(PHFetchResult *)self->_faces count];
}

- (BOOL)hasMoreDetails
{
  return 0;
}

- (PXPeopleDetailSettingsFaceDataSource)initWithTitle:(id)a3 faces:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXPeopleDetailSettingsFaceDataSource;
  v9 = [(PXPeopleDetailSettingsFaceDataSource *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_faces, a4);
  }

  return v10;
}

@end