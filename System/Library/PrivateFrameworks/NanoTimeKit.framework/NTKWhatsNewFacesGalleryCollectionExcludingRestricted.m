@interface NTKWhatsNewFacesGalleryCollectionExcludingRestricted
- (id)facesForDevice:(id)a3;
@end

@implementation NTKWhatsNewFacesGalleryCollectionExcludingRestricted

- (id)facesForDevice:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NTKWhatsNewFacesGalleryCollectionExcludingRestricted;
  v3 = [(NTKWhatsNewFacesGalleryCollection *)&v7 facesForDevice:a3];
  v4 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_57_0];
  v5 = [v3 filteredArrayUsingPredicate:v4];

  return v5;
}

uint64_t __71__NTKWhatsNewFacesGalleryCollectionExcludingRestricted_facesForDevice___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _faceGalleryIsRestricted] ^ 1;
}

@end