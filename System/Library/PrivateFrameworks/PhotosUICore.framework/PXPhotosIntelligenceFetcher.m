@interface PXPhotosIntelligenceFetcher
+ (id)fetchFeaturedPhotoAssetsInPhotoLibrary:(id)a3 sharingFilter:(unsigned __int16)a4 currentlyFeaturedOnly:(BOOL)a5;
+ (id)fetchFeaturedPhotoSuggestionsInPhotoLibrary:(id)a3 sharingFilter:(unsigned __int16)a4 currentlyFeaturedOnly:(BOOL)a5;
@end

@implementation PXPhotosIntelligenceFetcher

+ (id)fetchFeaturedPhotoAssetsInPhotoLibrary:(id)a3 sharingFilter:(unsigned __int16)a4 currentlyFeaturedOnly:(BOOL)a5
{
  return +[PXPhotosIntelligenceBridge fetchFeaturedPhotoAssetsWithPhotoLibrary:a3 sharingFilter:a4 currentlyFeaturedOnly:a5];
}

+ (id)fetchFeaturedPhotoSuggestionsInPhotoLibrary:(id)a3 sharingFilter:(unsigned __int16)a4 currentlyFeaturedOnly:(BOOL)a5
{
  return +[PXPhotosIntelligenceBridge fetchFeaturedPhotoSuggestionsWithPhotoLibrary:a3 sharingFilter:a4 fetchLimit:0 currentlyFeaturedOnly:a5];
}

@end