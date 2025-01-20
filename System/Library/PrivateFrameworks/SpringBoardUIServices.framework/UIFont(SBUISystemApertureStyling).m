@interface UIFont(SBUISystemApertureStyling)
+ (id)sbui_systemAperturePreferredFontForTextStyle:()SBUISystemApertureStyling;
+ (id)sbui_systemAperturePreferredFontForTextStyle:()SBUISystemApertureStyling compatibleWithTraitCollection:;
+ (id)sbui_systemAperturePreferredTextButtonFont;
+ (id)sbui_systemAperturePreferredTextButtonFontCompatibleWithTraitCollection:()SBUISystemApertureStyling;
@end

@implementation UIFont(SBUISystemApertureStyling)

+ (id)sbui_systemAperturePreferredFontForTextStyle:()SBUISystemApertureStyling
{
  v5 = objc_msgSend(MEMORY[0x1E4F42F80], "sbui_bestTraitCollection");
  v6 = objc_msgSend(a1, "sbui_systemAperturePreferredFontForTextStyle:compatibleWithTraitCollection:", a3, v5);

  return v6;
}

+ (id)sbui_systemAperturePreferredFontForTextStyle:()SBUISystemApertureStyling compatibleWithTraitCollection:
{
  id v5 = a4;
  id v6 = (id)*MEMORY[0x1E4F43870];
  id v7 = (id)*MEMORY[0x1E4F43820];
  double v8 = *MEMORY[0x1E4F43928];
  double v9 = 0.0;
  switch(a3)
  {
    case 0:
      v10 = (id *)MEMORY[0x1E4F438A0];
      goto LABEL_5;
    case 1:
      v10 = (id *)MEMORY[0x1E4F438C8];
      goto LABEL_5;
    case 2:
      v10 = (id *)MEMORY[0x1E4F438F8];
LABEL_5:
      id v11 = *v10;

      double v8 = *MEMORY[0x1E4F43920];
      goto LABEL_7;
    case 3:
      id v11 = (id)*MEMORY[0x1E4F438C0];

LABEL_7:
      id v6 = v11;
      break;
    case 4:
      double v8 = *MEMORY[0x1E4F43920];
      double v9 = 14.5;
      break;
    case 5:
      double v8 = *MEMORY[0x1E4F43930];
      double v9 = 15.0;
      break;
    case 6:
      id v12 = (id)*MEMORY[0x1E4F43830];

      double v8 = *MEMORY[0x1E4F43910];
      double v9 = 13.0;
      id v7 = v12;
      break;
    default:
      break;
  }
  if (v5) {
    [MEMORY[0x1E4F42A38] _preferredFontDescriptorWithTextStyle:v6 addingSymbolicTraits:0 design:v7 weight:v5 compatibleWithTraitCollection:v8];
  }
  else {
  v13 = [MEMORY[0x1E4F42A38] _preferredFontDescriptorWithTextStyle:v6 design:v7 weight:v8];
  }
  v14 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v13 size:v9];

  return v14;
}

+ (id)sbui_systemAperturePreferredTextButtonFont
{
  v2 = objc_msgSend(MEMORY[0x1E4F42F80], "sbui_bestTraitCollection");
  v3 = objc_msgSend(a1, "sbui_systemAperturePreferredTextButtonFontCompatibleWithTraitCollection:", v2);

  return v3;
}

+ (id)sbui_systemAperturePreferredTextButtonFontCompatibleWithTraitCollection:()SBUISystemApertureStyling
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 preferredContentSizeCategory];
    id v7 = UIContentSizeCategoryClip(v6, (void *)*MEMORY[0x1E4F437B0], (void *)*MEMORY[0x1E4F43790]);

    double v8 = [v5 preferredContentSizeCategory];
    char v9 = [v7 isEqualToString:v8];

    if ((v9 & 1) == 0)
    {
      v10 = (void *)MEMORY[0x1E4F42F80];
      v16[0] = v5;
      id v11 = [MEMORY[0x1E4F42F80] traitCollectionWithPreferredContentSizeCategory:v7];
      v16[1] = v11;
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
      uint64_t v13 = [v10 traitCollectionWithTraitsFromCollections:v12];

      id v5 = (void *)v13;
    }
  }
  v14 = objc_msgSend(a1, "sbui_systemAperturePreferredFontForTextStyle:compatibleWithTraitCollection:", 2, v5);

  return v14;
}

@end