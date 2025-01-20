@interface PXPeopleDetailSettingsPersonSuggestionDataSource
- (BOOL)hasMoreDetails;
- (NSArray)personSuggestions;
- (NSString)title;
- (PXPeopleDetailSettingsPersonSuggestionDataSource)initWithTitle:(id)a3 personSuggestions:(id)a4;
- (id)modelObjectForIndex:(int64_t)a3;
- (id)personNameAtIndex:(int64_t)a3;
- (int64_t)action;
- (int64_t)verifyTypeAtIndex:(int64_t)a3;
- (unint64_t)faceCount:(int64_t)a3;
- (unint64_t)numberOfItems;
- (void)imageAtIndex:(unint64_t)a3 targetSize:(CGSize)a4 displayScale:(double)a5 resultHandler:(id)a6;
- (void)setPersonSuggestions:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PXPeopleDetailSettingsPersonSuggestionDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personSuggestions, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setPersonSuggestions:(id)a3
{
}

- (NSArray)personSuggestions
{
  return self->_personSuggestions;
}

- (void)setTitle:(id)a3
{
}

- (id)modelObjectForIndex:(int64_t)a3
{
  return [(NSArray *)self->_personSuggestions objectAtIndex:a3];
}

- (int64_t)action
{
  return 2;
}

- (int64_t)verifyTypeAtIndex:(int64_t)a3
{
  return 0;
}

- (unint64_t)faceCount:(int64_t)a3
{
  v3 = [(NSArray *)self->_personSuggestions objectAtIndex:a3];
  v4 = [v3 person];
  unint64_t v5 = [v4 faceCount];

  return v5;
}

- (id)personNameAtIndex:(int64_t)a3
{
  v3 = [(NSArray *)self->_personSuggestions objectAtIndex:a3];
  v4 = [v3 name];

  return v4;
}

- (void)imageAtIndex:(unint64_t)a3 targetSize:(CGSize)a4 displayScale:(double)a5 resultHandler:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a6;
  v12 = [(NSArray *)self->_personSuggestions objectAtIndex:a3];
  v13 = [PXPeopleFaceCropFetchOptions alloc];
  v14 = [v12 person];
  v15 = [v12 keyFace];
  v16 = -[PXPeopleFaceCropFetchOptions initWithPerson:face:targetSize:displayScale:](v13, "initWithPerson:face:targetSize:displayScale:", v14, v15, width, height, a5);

  [(PXPeopleFaceCropFetchOptions *)v16 setCropFactor:0];
  [(PXPeopleFaceCropFetchOptions *)v16 setCornerStyle:0];
  [(PXPeopleFaceCropFetchOptions *)v16 setShouldCacheResult:0];
  v17 = +[PXPeopleFaceCropManager sharedManager];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __103__PXPeopleDetailSettingsPersonSuggestionDataSource_imageAtIndex_targetSize_displayScale_resultHandler___block_invoke;
  v19[3] = &unk_1E5DD24E8;
  id v20 = v11;
  id v18 = v11;
  [v17 requestFaceCropForOptions:v16 resultHandler:v19];
}

void __103__PXPeopleDetailSettingsPersonSuggestionDataSource_imageAtIndex_targetSize_displayScale_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8 && *(void *)(a1 + 32))
  {
    v6 = [v5 objectForKeyedSubscript:@"PXPeopleContentsRectKey"];
    uint64_t v7 = *(void *)(a1 + 32);
    [v6 CGRectValue];
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)numberOfItems
{
  return [(NSArray *)self->_personSuggestions count];
}

- (BOOL)hasMoreDetails
{
  return 1;
}

- (PXPeopleDetailSettingsPersonSuggestionDataSource)initWithTitle:(id)a3 personSuggestions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXPeopleDetailSettingsPersonSuggestionDataSource;
  v9 = [(PXPeopleDetailSettingsPersonSuggestionDataSource *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_personSuggestions, a4);
  }

  return v10;
}

@end