@interface PXPhotosIntelligenceBridge
+ (id)fetchFeaturedPhotoAssetsWithPhotoLibrary:(id)a3 sharingFilter:(unsigned __int16)a4 currentlyFeaturedOnly:(BOOL)a5;
+ (id)fetchFeaturedPhotoSuggestionsWithPhotoLibrary:(id)a3 sharingFilter:(unsigned __int16)a4 fetchLimit:(int64_t)a5 currentlyFeaturedOnly:(BOOL)a6;
- (PXPhotosIntelligenceBridge)init;
@end

@implementation PXPhotosIntelligenceBridge

+ (id)fetchFeaturedPhotoSuggestionsWithPhotoLibrary:(id)a3 sharingFilter:(unsigned __int16)a4 fetchLimit:(int64_t)a5 currentlyFeaturedOnly:(BOOL)a6
{
  id v9 = a3;
  v10 = (void *)sub_1AA4BFA8C(v9, a4, a5, a6);

  return v10;
}

+ (id)fetchFeaturedPhotoAssetsWithPhotoLibrary:(id)a3 sharingFilter:(unsigned __int16)a4 currentlyFeaturedOnly:(BOOL)a5
{
  uint64_t v6 = a4;
  id v7 = a3;
  v8 = (void *)sub_1AA4BFA8C(v7, v6, 0, a5);
  id v9 = objc_msgSend(v7, sel_librarySpecificFetchOptions);
  objc_msgSend(v9, sel_setSharingFilter_, v6);
  objc_msgSend(v9, sel_setIncludeGuestAssets_, 1);
  id result = objc_msgSend(self, sel_fetchKeyAssetForEachSuggestion_options_, v8, v9);
  if (result)
  {
    id v11 = result;

    return v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (PXPhotosIntelligenceBridge)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PhotosIntelligenceFetcher();
  return [(PXPhotosIntelligenceBridge *)&v3 init];
}

@end