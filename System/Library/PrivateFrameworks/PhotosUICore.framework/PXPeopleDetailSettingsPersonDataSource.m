@interface PXPeopleDetailSettingsPersonDataSource
- (BOOL)hasMoreDetails;
- (NSString)title;
- (PHFetchResult)persons;
- (PXPeopleDetailSettingsPersonDataSource)initWithTitle:(id)a3 persons:(id)a4;
- (id)modelObjectForIndex:(int64_t)a3;
- (id)personNameAtIndex:(int64_t)a3;
- (int64_t)action;
- (int64_t)verifyTypeAtIndex:(int64_t)a3;
- (unint64_t)faceCount:(int64_t)a3;
- (unint64_t)numberOfItems;
- (void)imageAtIndex:(unint64_t)a3 targetSize:(CGSize)a4 displayScale:(double)a5 resultHandler:(id)a6;
- (void)setPersons:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PXPeopleDetailSettingsPersonDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persons, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setPersons:(id)a3
{
}

- (PHFetchResult)persons
{
  return self->_persons;
}

- (void)setTitle:(id)a3
{
}

- (id)modelObjectForIndex:(int64_t)a3
{
  return [(PHFetchResult *)self->_persons objectAtIndex:a3];
}

- (int64_t)action
{
  return 1;
}

- (int64_t)verifyTypeAtIndex:(int64_t)a3
{
  v3 = [(PHFetchResult *)self->_persons objectAtIndex:a3];
  int64_t v4 = [v3 verifiedType];

  return v4;
}

- (unint64_t)faceCount:(int64_t)a3
{
  v3 = [(PHFetchResult *)self->_persons objectAtIndex:a3];
  unint64_t v4 = [v3 faceCount];

  return v4;
}

- (id)personNameAtIndex:(int64_t)a3
{
  v3 = [(PHFetchResult *)self->_persons objectAtIndex:a3];
  unint64_t v4 = [v3 name];
  if (![v4 length])
  {
    uint64_t v5 = [v3 localIdentifier];

    unint64_t v4 = (void *)v5;
  }

  return v4;
}

- (void)imageAtIndex:(unint64_t)a3 targetSize:(CGSize)a4 displayScale:(double)a5 resultHandler:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a6;
  v12 = [(PHFetchResult *)self->_persons objectAtIndex:a3];
  v13 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:]([PXPeopleFaceCropFetchOptions alloc], "initWithPerson:targetSize:displayScale:", v12, width, height, a5);
  [(PXPeopleFaceCropFetchOptions *)v13 setShouldCacheResult:0];
  v14 = +[PXPeopleFaceCropManager sharedManager];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __93__PXPeopleDetailSettingsPersonDataSource_imageAtIndex_targetSize_displayScale_resultHandler___block_invoke;
  v16[3] = &unk_1E5DD24E8;
  id v17 = v11;
  id v15 = v11;
  [v14 requestFaceCropForOptions:v13 resultHandler:v16];
}

void __93__PXPeopleDetailSettingsPersonDataSource_imageAtIndex_targetSize_displayScale_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return [(PHFetchResult *)self->_persons count];
}

- (BOOL)hasMoreDetails
{
  return 1;
}

- (PXPeopleDetailSettingsPersonDataSource)initWithTitle:(id)a3 persons:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXPeopleDetailSettingsPersonDataSource;
  v9 = [(PXPeopleDetailSettingsPersonDataSource *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_persons, a4);
  }

  return v10;
}

@end