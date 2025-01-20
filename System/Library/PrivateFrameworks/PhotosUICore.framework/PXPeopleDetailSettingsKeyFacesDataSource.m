@interface PXPeopleDetailSettingsKeyFacesDataSource
- (BOOL)hasMoreDetails;
- (NSArray)keyFaces;
- (NSString)qualityProperty;
- (NSString)title;
- (PHPhotoLibrary)photoLibrary;
- (PXPeopleDetailSettingsKeyFacesDataSource)initWithTitle:(id)a3 keyFaces:(id)a4 qualityProperty:(id)a5 photoLibrary:(id)a6;
- (id)modelObjectForIndex:(int64_t)a3;
- (id)personNameAtIndex:(int64_t)a3;
- (int64_t)action;
- (int64_t)verifyTypeAtIndex:(int64_t)a3;
- (unint64_t)faceCount:(int64_t)a3;
- (unint64_t)numberOfItems;
- (void)imageAtIndex:(unint64_t)a3 targetSize:(CGSize)a4 displayScale:(double)a5 resultHandler:(id)a6;
- (void)setTitle:(id)a3;
@end

@implementation PXPeopleDetailSettingsKeyFacesDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qualityProperty, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_keyFaces, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (NSString)qualityProperty
{
  return self->_qualityProperty;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (NSArray)keyFaces
{
  return self->_keyFaces;
}

- (void)setTitle:(id)a3
{
}

- (id)modelObjectForIndex:(int64_t)a3
{
  return [(NSArray *)self->_keyFaces objectAtIndex:a3];
}

- (int64_t)action
{
  return 0;
}

- (int64_t)verifyTypeAtIndex:(int64_t)a3
{
  return 0;
}

- (unint64_t)faceCount:(int64_t)a3
{
  v3 = [(NSArray *)self->_keyFaces objectAtIndex:a3];
  unint64_t v4 = [v3 count];

  return v4;
}

- (id)personNameAtIndex:(int64_t)a3
{
  unint64_t v4 = [(NSArray *)self->_keyFaces objectAtIndex:a3];
  if (v4)
  {
    v5 = NSString;
    v6 = [(PXPeopleDetailSettingsKeyFacesDataSource *)self qualityProperty];
    v7 = [v4 objectForKey:v6];
    v8 = [v5 stringWithFormat:@"Quality %@", v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)imageAtIndex:(unint64_t)a3 targetSize:(CGSize)a4 displayScale:(double)a5 resultHandler:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  v28[1] = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  v12 = [(NSArray *)self->_keyFaces objectAtIndex:a3];
  v13 = v12;
  if (v12)
  {
    v14 = [v12 objectForKey:@"localIdentifier"];
    v15 = [(PXPeopleDetailSettingsKeyFacesDataSource *)self photoLibrary];
    v16 = [v15 librarySpecificFetchOptions];

    v17 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
    [v16 setIncludedDetectionTypes:v17];

    v18 = (void *)MEMORY[0x1E4F39050];
    v28[0] = v14;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
    v20 = [v18 fetchFacesWithLocalIdentifiers:v19 options:v16];
    v21 = [v20 firstObject];

    v22 = [MEMORY[0x1E4F391F0] fetchPersonWithFace:v21 options:v16];
    v23 = [v22 firstObject];

    v24 = -[PXPeopleFaceCropFetchOptions initWithPerson:face:targetSize:displayScale:]([PXPeopleFaceCropFetchOptions alloc], "initWithPerson:face:targetSize:displayScale:", v23, v21, width, height, a5);
    [(PXPeopleFaceCropFetchOptions *)v24 setShouldCacheResult:0];
    v25 = +[PXPeopleFaceCropManager sharedManager];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __95__PXPeopleDetailSettingsKeyFacesDataSource_imageAtIndex_targetSize_displayScale_resultHandler___block_invoke;
    v26[3] = &unk_1E5DD24E8;
    id v27 = v11;
    [v25 requestFaceCropForOptions:v24 resultHandler:v26];
  }
}

void __95__PXPeopleDetailSettingsKeyFacesDataSource_imageAtIndex_targetSize_displayScale_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return [(NSArray *)self->_keyFaces count];
}

- (BOOL)hasMoreDetails
{
  return 1;
}

- (PXPeopleDetailSettingsKeyFacesDataSource)initWithTitle:(id)a3 keyFaces:(id)a4 qualityProperty:(id)a5 photoLibrary:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PXPeopleDetailSettingsKeyFacesDataSource;
  v15 = [(PXPeopleDetailSettingsKeyFacesDataSource *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_title, a3);
    objc_storeStrong((id *)&v16->_keyFaces, a4);
    objc_storeStrong((id *)&v16->_qualityProperty, a5);
    objc_storeStrong((id *)&v16->_photoLibrary, a6);
  }

  return v16;
}

@end