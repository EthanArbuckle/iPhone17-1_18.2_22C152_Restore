@interface NTKCAstronomyFacesGalleryCollection
+ (id)_gloryDefaultFacesForDevice:(id)a3;
+ (id)_legacyDefaultFacesForDevice:(id)a3;
+ (id)complicationTypesBySlot;
- (id)descriptionText;
- (id)facesForDevice:(id)a3;
- (id)title;
@end

@implementation NTKCAstronomyFacesGalleryCollection

- (id)title
{
  return NTKClockFaceLocalizedString(@"FACE_STYLE_9_IN_TITLE_CASE", @"Astronomy");
}

- (id)descriptionText
{
  return NTKCCustomizationLocalizedString(@"GALLERY_ASTRONOMY_DESCRIPTION", @"description", v2);
}

- (id)facesForDevice:(id)a3
{
  id v3 = a3;
  int v4 = [v3 isRunningGloryGMOrLater];
  v5 = objc_opt_class();
  if (v4) {
    [v5 _gloryDefaultFacesForDevice:v3];
  }
  else {
  v6 = [v5 _legacyDefaultFacesForDevice:v3];
  }

  return v6;
}

+ (id)_legacyDefaultFacesForDevice:(id)a3
{
  id v3 = a3;
  int v4 = objc_opt_new();
  v5 = +[NTKFace defaultFaceOfStyle:9 forDevice:v3];

  [v4 addObject:v5];
  return v4;
}

+ (id)_gloryDefaultFacesForDevice:(id)a3
{
  id v3 = a3;
  int v4 = objc_opt_new();
  if (+[NTKEnumeratedEditOption numberOfOptionsForDevice:v3])
  {
    unint64_t v5 = 0;
    do
    {
      v6 = +[NTKFace defaultFaceOfStyle:9 forDevice:v3];
      v7 = +[NTKAstronomyVistaEditOption optionWithAstronomyVista:v5 forDevice:v3];
      [v6 selectOption:v7 forCustomEditMode:12 slot:0];

      v8 = +[NTKCAstronomyFacesGalleryCollection complicationTypesBySlot];
      [v6 _setFaceGalleryComplicationTypesForSlots:v8];

      [v4 addObject:v6];
      ++v5;
    }
    while (+[NTKEnumeratedEditOption numberOfOptionsForDevice:v3] > v5);
  }

  return v4;
}

+ (id)complicationTypesBySlot
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"top-right";
  v4[1] = @"bottom";
  v5[0] = &unk_1F16E9BE0;
  v5[1] = &unk_1F16E9BF8;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

@end