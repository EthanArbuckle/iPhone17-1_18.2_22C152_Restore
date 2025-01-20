@interface PUPickerGeneratedFilter
+ (id)_excludingLoopingVideosFilter;
+ (id)_excludingStreamedVideosFilter;
+ (id)_imagesFilter;
+ (id)_loopingVideosFilter;
+ (id)_pu_legacy_filterForUIImagePickerControllerMediaTypes:(id)a3;
+ (id)_videosFilter;
- (BOOL)allowsAlbums;
- (BOOL)containsStickersFilter;
- (BOOL)pu_legacy_mediaTypesIncludesLivePhoto;
- (NSPredicate)assetPredicate;
- (PUPickerGeneratedFilter)init;
- (PUPickerGeneratedFilter)initWithFilter:(id)a3;
- (PUPickerGeneratedFilter)initWithUIImagePickerControllerMediaTypes:(id)a3;
- (int64_t)displayAssetMediaType;
- (int64_t)displayAssetMediaTypeConsideringAssetObjectIDs:(id)a3 photoLibrary:(id)a4;
- (int64_t)noContentPlaceholderType;
- (unint64_t)genericAssetTypes;
- (unint64_t)possibleAssetTypes;
- (unint64_t)requiredAssetTypes;
@end

@implementation PUPickerGeneratedFilter

- (void).cxx_destruct
{
}

- (BOOL)pu_legacy_mediaTypesIncludesLivePhoto
{
  return self->_pu_legacy_mediaTypesIncludesLivePhoto;
}

- (unint64_t)requiredAssetTypes
{
  return self->_requiredAssetTypes;
}

- (unint64_t)possibleAssetTypes
{
  return self->_possibleAssetTypes;
}

- (NSPredicate)assetPredicate
{
  return self->_assetPredicate;
}

- (BOOL)containsStickersFilter
{
  return self->_containsStickersFilter;
}

- (BOOL)allowsAlbums
{
  return self->_allowsAlbums;
}

- (int64_t)displayAssetMediaTypeConsideringAssetObjectIDs:(id)a3 photoLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 count];
  if (v7 && v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F39150]);
    v10 = (void *)[v9 initWithOids:v6 photoLibrary:v7 fetchType:*MEMORY[0x1E4F39648] fetchPropertySets:0 identifier:0 registerIfNeeded:0];
    uint64_t v11 = [v10 countOfAssetsWithMediaType:1];
    uint64_t v12 = [v10 countOfAssetsWithMediaType:2];
    if (v12) {
      BOOL v13 = v11 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (v11) {
      int64_t v14 = v13;
    }
    else {
      int64_t v14 = 2 * (v12 != 0);
    }
  }
  else
  {
    int64_t v14 = [(PUPickerGeneratedFilter *)self displayAssetMediaType];
  }

  return v14;
}

- (int64_t)noContentPlaceholderType
{
  unint64_t v2 = [(PUPickerGeneratedFilter *)self possibleAssetTypes];
  int64_t v3 = 2 * ((v2 & 0x3FE) == 0);
  if ((v2 & 0x1FC00) == 0) {
    int64_t v3 = 1;
  }
  if (v2) {
    return v3;
  }
  else {
    return 0;
  }
}

- (int64_t)displayAssetMediaType
{
  unint64_t v2 = [(PUPickerGeneratedFilter *)self possibleAssetTypes];
  int64_t v3 = 2 * ((v2 & 0x3FE) == 0);
  if ((v2 & 0x1FC00) == 0) {
    int64_t v3 = 1;
  }
  if (v2) {
    return v3;
  }
  else {
    return 0;
  }
}

- (unint64_t)genericAssetTypes
{
  unint64_t v2 = [(PUPickerGeneratedFilter *)self possibleAssetTypes];
  unint64_t v3 = v2 & 4 | ((v2 & 0x3FA) != 0);
  if ((v2 & 0x1FC00) != 0) {
    v3 |= 2uLL;
  }
  if (v3 == 7) {
    return -1;
  }
  else {
    return v3;
  }
}

- (PUPickerGeneratedFilter)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerGeneratedFilter.m", 70, @"%s is not available as initializer", "-[PUPickerGeneratedFilter init]");

  abort();
}

- (PUPickerGeneratedFilter)initWithUIImagePickerControllerMediaTypes:(id)a3
{
  id v4 = a3;
  v5 = +[PUPickerGeneratedFilter _pu_legacy_filterForUIImagePickerControllerMediaTypes:v4];
  id v6 = [(PUPickerGeneratedFilter *)self initWithFilter:v5];

  id v7 = [(id)*MEMORY[0x1E4F44420] identifier];
  char v8 = [v4 containsObject:v7];

  v6->_pu_legacy_mediaTypesIncludesLivePhoto = v8;
  return v6;
}

- (PUPickerGeneratedFilter)initWithFilter:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PUPickerGeneratedFilter;
  v5 = [(PUPickerGeneratedFilter *)&v18 init];
  if (v5)
  {
    if (v4)
    {
      char v6 = [v4 allowsAlbums];
      id v7 = [MEMORY[0x1E4F39938] _stickersFilter];
      char v8 = [v7 _puPickerFilter];
      char v9 = [v4 containsFilter:v8];

      uint64_t v10 = [v4 generatedPossibleAssetTypes];
      uint64_t v11 = [v4 generatedRequiredAssetTypes];
      uint64_t v12 = 131070;
      if (v11 == 131070)
      {
        uint64_t v13 = 0;
      }
      else
      {
        uint64_t v14 = v11;
        v15 = [v4 generatedAssetPredicate];
        uint64_t v13 = [v15 copy];

        uint64_t v12 = v14;
      }
    }
    else
    {
      char v9 = 0;
      uint64_t v13 = 0;
      char v6 = 1;
      uint64_t v10 = 131070;
      uint64_t v12 = 131070;
    }
    v5->_allowsAlbums = v6;
    v5->_containsStickersFilter = v9;
    v5->_possibleAssetTypes = v10;
    v5->_requiredAssetTypes = v12;
    assetPredicate = v5->_assetPredicate;
    v5->_assetPredicate = (NSPredicate *)v13;
  }
  return v5;
}

+ (id)_excludingStreamedVideosFilter
{
  v7[1] = *MEMORY[0x1E4F143B8];
  unint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F39978]) initWithFilterType:5];
  id v3 = objc_alloc(MEMORY[0x1E4F39990]);
  v7[0] = v2;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v5 = (void *)[v3 initWithFilterType:2 subfilters:v4];

  return v5;
}

+ (id)_excludingLoopingVideosFilter
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F39990]);
  id v4 = [a1 _loopingVideosFilter];
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  char v6 = (void *)[v3 initWithFilterType:2 subfilters:v5];

  return v6;
}

+ (id)_loopingVideosFilter
{
  unint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F39988]) initWithPlaybackStyle:5];
  return v2;
}

+ (id)_videosFilter
{
  unint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F39980]) initWithMediaType:2];
  return v2;
}

+ (id)_imagesFilter
{
  unint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F39980]) initWithMediaType:1];
  return v2;
}

+ (id)_pu_legacy_filterForUIImagePickerControllerMediaTypes:(id)a3
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  char v6 = (void *)[[v4 alloc] initWithArray:v5];

  id v7 = [(id)*MEMORY[0x1E4F44400] identifier];
  int v8 = [v6 containsObject:v7];

  char v9 = [(id)*MEMORY[0x1E4F44448] identifier];
  int v10 = [v6 containsObject:v9];

  if (v8) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F39990]);
    v17 = [a1 _imagesFilter];
    v35[0] = v17;
    objc_super v18 = [a1 _videosFilter];
    v35[1] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
    v20 = (void *)[v16 initWithFilterType:0 subfilters:v19];

    id v21 = objc_alloc(MEMORY[0x1E4F39990]);
    v34[0] = v20;
    v22 = [a1 _excludingStreamedVideosFilter];
    v34[1] = v22;
    v23 = (void *)MEMORY[0x1E4F1C978];
    v24 = v34;
LABEL_10:
    uint64_t v13 = [v23 arrayWithObjects:v24 count:2];
    uint64_t v14 = v21;
    v15 = v13;
    goto LABEL_11;
  }
  if (v8)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F39990]);
    v22 = [a1 _imagesFilter];
    v33[0] = v22;
    uint64_t v13 = [a1 _excludingLoopingVideosFilter];
    v33[1] = v13;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
    uint64_t v14 = v12;
    v15 = v20;
LABEL_11:
    v29 = (void *)[v14 initWithFilterType:1 subfilters:v15];

    goto LABEL_12;
  }
  if (v10)
  {
    id v25 = objc_alloc(MEMORY[0x1E4F39990]);
    v26 = [a1 _videosFilter];
    v32[0] = v26;
    v27 = [a1 _loopingVideosFilter];
    v32[1] = v27;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    v20 = (void *)[v25 initWithFilterType:0 subfilters:v28];

    id v21 = objc_alloc(MEMORY[0x1E4F39990]);
    v31[0] = v20;
    v22 = [a1 _excludingStreamedVideosFilter];
    v31[1] = v22;
    v23 = (void *)MEMORY[0x1E4F1C978];
    v24 = v31;
    goto LABEL_10;
  }
  v29 = 0;
LABEL_12:

  return v29;
}

@end