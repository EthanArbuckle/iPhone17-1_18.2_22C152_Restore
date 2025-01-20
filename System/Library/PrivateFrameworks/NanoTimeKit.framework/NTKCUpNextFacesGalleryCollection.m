@interface NTKCUpNextFacesGalleryCollection
+ (id)complicationTypesBySlot;
- (id)descriptionText;
- (id)facesForDevice:(id)a3;
- (id)title;
@end

@implementation NTKCUpNextFacesGalleryCollection

- (id)title
{
  return NTKClockFaceLocalizedString(@"FACE_STYLE_21_IN_TITLE_CASE", @"Siri");
}

- (id)descriptionText
{
  return NTKCCustomizationLocalizedString(@"GALLERY_UPNEXT_DESCRIPTION", @"description", v2);
}

- (id)facesForDevice:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (NTKShowBlueRidgeUI(v3)) {
    uint64_t v4 = 221;
  }
  else {
    uint64_t v4 = 21;
  }
  v5 = +[NTKFace defaultFaceOfStyle:v4 forDevice:v3];

  v6 = +[NTKCUpNextFacesGalleryCollection complicationTypesBySlot];
  [v5 _setFaceGalleryComplicationTypesForSlots:v6];

  v9[0] = v5;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return v7;
}

+ (id)complicationTypesBySlot
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"top-left";
  v4[1] = @"top-right";
  v5[0] = &unk_1F16E9CB8;
  v5[1] = &unk_1F16E9CD0;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

@end