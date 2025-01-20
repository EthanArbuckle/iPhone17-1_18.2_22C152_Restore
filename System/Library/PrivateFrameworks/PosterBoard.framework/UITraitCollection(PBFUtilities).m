@interface UITraitCollection(PBFUtilities)
+ (id)pbf_traitCollectionForDisplayContext:()PBFUtilities;
@end

@implementation UITraitCollection(PBFUtilities)

+ (id)pbf_traitCollectionForDisplayContext:()PBFUtilities
{
  v16[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    id v3 = +[PBFGenericDisplayContext mainScreen];
  }
  if (objc_msgSend(v3, "pbf_accessibilityContrast") == -1) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = UIAccessibilityContrastFromPBFAccessibilityContrast(objc_msgSend(v3, "pbf_accessibilityContrast"));
  }
  if (objc_msgSend(v3, "pbf_userInterfaceStyle")) {
    unint64_t v5 = UIUserInterfaceStyleFromPBFUserInterfaceStyle(objc_msgSend(v3, "pbf_userInterfaceStyle"));
  }
  else {
    unint64_t v5 = 1;
  }
  objc_msgSend(v3, "pbf_interfaceOrientation");
  uint64_t v6 = 1;
  if (BSInterfaceOrientationIsLandscape()) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  objc_msgSend(v3, "pbf_interfaceOrientation");
  if (!BSInterfaceOrientationIsLandscape()) {
    uint64_t v6 = 2;
  }
  v8 = (void *)MEMORY[0x1E4FB1E20];
  v9 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:v5];
  v16[0] = v9;
  v10 = [MEMORY[0x1E4FB1E20] traitCollectionWithAccessibilityContrast:v4];
  v16[1] = v10;
  v11 = [MEMORY[0x1E4FB1E20] traitCollectionWithHorizontalSizeClass:v7];
  v16[2] = v11;
  v12 = [MEMORY[0x1E4FB1E20] traitCollectionWithVerticalSizeClass:v6];
  v16[3] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
  v14 = [v8 traitCollectionWithTraitsFromCollections:v13];

  return v14;
}

@end