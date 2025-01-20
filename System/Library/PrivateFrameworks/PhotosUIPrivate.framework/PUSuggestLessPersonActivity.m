@interface PUSuggestLessPersonActivity
+ (int64_t)_activityStyle;
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (id)_facesInCurrentAsset;
- (id)_personFromFace:(id)a3;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (void)performActivity;
@end

@implementation PUSuggestLessPersonActivity

+ (int64_t)_activityStyle
{
  return 1;
}

+ (int64_t)activityCategory
{
  return 0;
}

- (void).cxx_destruct
{
}

- (id)_personFromFace:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v4 = [(PXActivity *)self itemSourceController];
  v5 = [v4 assets];
  v6 = [v5 firstObject];

  v7 = [MEMORY[0x1E4F390A0] fetchOptionsWithPhotoLibrary:0 orObject:v6];
  [v7 setFetchLimit:1];
  v14[0] = *MEMORY[0x1E4F397E0];
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v7 setFetchPropertySets:v8];

  v9 = (void *)MEMORY[0x1E4F391F0];
  v10 = [(PUSuggestLessPersonActivity *)self _facesInCurrentAsset];
  v11 = [v10 firstObject];
  v12 = [v9 fetchPersonWithFace:v11 options:v7];

  return v12;
}

- (id)_facesInCurrentAsset
{
  v2 = [(PXActivity *)self itemSourceController];
  v3 = [v2 assets];
  v4 = [v3 firstObject];

  v5 = [MEMORY[0x1E4F390A0] fetchOptionsWithPhotoLibrary:0 orObject:v4];
  [v5 setFetchLimit:2];
  [v5 setPersonContext:5];
  v6 = [MEMORY[0x1E4F39050] fetchFacesInAsset:v4 options:v5];

  return v6;
}

- (void)performActivity
{
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  BOOL v13 = 0;
  BOOL v13 = [v4 count] != 0;
  if (*((unsigned char *)v11 + 24))
  {
    v5 = [(PXActivity *)self itemSourceController];
    v6 = [v5 assets];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__PUSuggestLessPersonActivity_canPerformWithActivityItems___block_invoke;
    v9[3] = &unk_1E5F298E0;
    v9[4] = &v10;
    [v6 enumerateObjectsUsingBlock:v9];

    BOOL v7 = *((unsigned char *)v11 + 24) != 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __59__PUSuggestLessPersonActivity_canPerformWithActivityItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend(a2, "px_isSyndicatedAsset");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result ^ 1;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) ^ 1;
  return result;
}

- (id)_systemImageName
{
  cachedImageName = self->_cachedImageName;
  if (cachedImageName)
  {
    v3 = cachedImageName;
  }
  else
  {
    v5 = [(PUSuggestLessPersonActivity *)self _facesInCurrentAsset];
    if ([v5 count] == 1)
    {
      v6 = [v5 firstObject];
      BOOL v7 = [(PUSuggestLessPersonActivity *)self _personFromFace:v6];

      v8 = [v7 firstObject];
      v9 = [v8 userFeedbackProperties];
      uint64_t v10 = [v9 userFeedback];

      if (v10) {
        v3 = @"person.crop.circle.badge.plus";
      }
      else {
        v3 = @"person.crop.circle.badge.minus";
      }
    }
    else
    {
      v3 = @"minus.circle";
    }
    v11 = self->_cachedImageName;
    self->_cachedImageName = &v3->isa;
  }
  return v3;
}

- (id)activityTitle
{
  v3 = [(PUSuggestLessPersonActivity *)self _facesInCurrentAsset];
  if ([v3 count] == 1)
  {
    id v4 = [v3 firstObject];
    v5 = [(PUSuggestLessPersonActivity *)self _personFromFace:v4];

    v6 = [v5 firstObject];
    BOOL v7 = objc_msgSend(v6, "px_localizedName");
    v8 = [v6 userFeedbackProperties];
    v9 = [v8 userFeedback];

    if (v9)
    {
      if ([v7 length])
      {
        uint64_t v10 = PXLocalizedStringForPersonOrPetAndVisibility();
        v11 = PXStringWithValidatedFormat();
      }
      else
      {
        v11 = PXLocalizedStringForPersonOrPetAndVisibility();
      }
      cachedImageName = self->_cachedImageName;
      BOOL v13 = @"person.crop.circle.badge.plus";
    }
    else
    {
      v11 = PXLocalizedStringForPersonOrPetAndVisibility();
      cachedImageName = self->_cachedImageName;
      BOOL v13 = @"person.crop.circle.badge.minus";
    }
    self->_cachedImageName = &v13->isa;
  }
  else
  {
    v11 = PXLocalizedString();
    v5 = self->_cachedImageName;
    self->_cachedImageName = (NSString *)@"minus.circle";
  }

  return v11;
}

- (id)activityType
{
  return (id)*MEMORY[0x1E4F90B10];
}

@end