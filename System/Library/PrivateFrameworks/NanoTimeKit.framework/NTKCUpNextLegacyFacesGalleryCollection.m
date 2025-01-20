@interface NTKCUpNextLegacyFacesGalleryCollection
- (id)defaultFaceForDevice:(id)a3;
- (id)facesForDevice:(id)a3;
- (id)title;
@end

@implementation NTKCUpNextLegacyFacesGalleryCollection

- (id)title
{
  if (_os_feature_enabled_impl())
  {
    v3 = NSString;
    v7.receiver = self;
    v7.super_class = (Class)NTKCUpNextLegacyFacesGalleryCollection;
    v4 = [(NTKCUpNextFacesGalleryCollection *)&v7 title];
    v5 = [v3 stringWithFormat:@"%@ (Legacy)", v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)defaultFaceForDevice:(id)a3
{
  return +[NTKFace defaultFaceOfStyle:16 forDevice:a3];
}

- (id)facesForDevice:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = +[NTKFace defaultFaceOfStyle:21 forDevice:a3];
  v4 = +[NTKCUpNextFacesGalleryCollection complicationTypesBySlot];
  [v3 _setFaceGalleryComplicationTypesForSlots:v4];

  v7[0] = v3;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

  return v5;
}

@end