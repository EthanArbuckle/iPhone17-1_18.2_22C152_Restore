@interface NTKWhistlerSubdialsFace
+ (id)_complicationSlotDescriptors;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_initialDefaultComplicationForSlot:(id)a3 forDevice:(id)a4;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_orderedComplicationSlots;
+ (id)_richComplicationSlotsForDevice:(id)a3;
+ (id)pigmentFaceDomain;
- (BOOL)requiresPigmentEditOption;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultBackgroundOption;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)editOptionsThatHideEditModes;
- (id)localizedExplanationMessageForDisabledEditMode:(int64_t)a3;
- (id)pigmentOptionProvider;
- (int64_t)timeStyle;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (void)applyPreviewConfigurationWithFamily:(int64_t)a3 faceColor:(int64_t)a4;
- (void)selectOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
@end

@implementation NTKWhistlerSubdialsFace

- (int64_t)timeStyle
{
  v2 = [(NTKFace *)self selectedOptionForCustomEditMode:15 slot:0];
  int64_t v3 = [v2 style] != 0;

  return v3;
}

- (void)selectOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(NTKFace *)self selectedOptionForCustomEditMode:a4 slot:v9];
  v13.receiver = self;
  v13.super_class = (Class)NTKWhistlerSubdialsFace;
  [(NTKFace *)&v13 selectOption:v8 forCustomEditMode:a4 slot:v9];

  if (a4 == 15 && (NTKEqualObjects(v8, v10) & 1) == 0)
  {
    id v11 = v10;
    uint64_t v12 = [v8 style];
    if (v12 != [v11 style]) {
      [(NTKFace *)self _notifyObserversFaceTimeStyleChanged];
    }
  }
}

+ (id)_complicationSlotDescriptors
{
  v16[3] = *MEMORY[0x1E4F143B8];
  v2 = NTKAllSignatureCircularTypes();
  int64_t v3 = NTKAllSignatureRectangularTypes();
  v4 = NTKComplicationTypeRankedListWithDefaultTypes(&unk_1F16EA768);
  v5 = [MEMORY[0x1E4F19A30] currentDevice];
  int v6 = [v5 isTinker];

  if (v6) {
    v7 = &unk_1F16EA780;
  }
  else {
    v7 = &unk_1F16EA798;
  }
  id v8 = NTKComplicationTypeRankedListWithDefaultTypes(v7);
  id v9 = NTKComplicationTypeRankedListWithDefaultTypes(&unk_1F16EA7B0);
  v15[0] = @"top";
  v10 = NTKComplicationSlotDescriptor(10, v2, v4);
  v16[0] = v10;
  v15[1] = @"center";
  id v11 = NTKComplicationSlotDescriptor(10, v2, v8);
  v16[1] = v11;
  v15[2] = @"bottom";
  uint64_t v12 = NTKComplicationSlotDescriptor(11, v3, v9);
  v16[2] = v12;
  objc_super v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];

  return v13;
}

+ (id)_initialDefaultComplicationForSlot:(id)a3 forDevice:(id)a4
{
  id v5 = a4;
  if ([a3 isEqualToString:@"bottom"])
  {
    int v6 = [v5 supportsUrsa];
    v7 = NTKBundleComplicationUrsaBearingBundleIdentifier;
    if (!v6) {
      v7 = NTKBundleComplicationNoiseBundleIdentifier;
    }
    id v8 = *v7;
    id v9 = NTKBundleComplicationUrsaAppBundleIdentifier;
    if (!v6) {
      id v9 = NTKBundleComplicationNoiseAppBundleIdentifier;
    }
    v10 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:v8 appBundleIdentifier:*v9 complicationDescriptor:0];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  return @"top";
}

+ (id)_orderedComplicationSlots
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"top";
  v4[1] = @"center";
  v4[2] = @"bottom";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  return v2;
}

- (id)_customEditModes
{
  int64_t v3 = [(NTKFace *)self device];
  int v4 = NTKShowGossamerUI(v3);

  if (!v4) {
    return &unk_1F16EA7F8;
  }
  id v5 = [(NTKFace *)self device];
  int v6 = NTKShowIndicScriptNumerals(v5);

  if (v6) {
    return &unk_1F16EA7C8;
  }
  else {
    return &unk_1F16EA7E0;
  }
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  v7 = 0;
  switch(a3)
  {
    case 10:
      id v8 = [(NTKFace *)self device];
      uint64_t v9 = NTKDefaultFaceColorForDeviceCollection(v8, 7);

      v10 = [(NTKFace *)self device];
      uint64_t v11 = +[NTKFaceColorEditOption optionWithFaceColor:v9 forDevice:v10];
      goto LABEL_6;
    case 15:
      uint64_t v12 = [(NTKFace *)self device];
      unsigned int v13 = [v12 isTinker];

      v10 = [(NTKFace *)self device];
      uint64_t v11 = +[NTKDualTimeStyleEditOption optionWithStyle:v13 forDevice:v10];
      goto LABEL_6;
    case 17:
      v7 = [(NTKWhistlerSubdialsFace *)self _defaultBackgroundOption];
      break;
    case 19:
      uint64_t Language = CLKLocaleNumberSystemForFirstLanguage();
      uint64_t v15 = NTKNumeralOptionFromCLKLocaleNumberSystem(Language);
      v10 = [(NTKFace *)self device];
      uint64_t v11 = +[NTKNumeralEditOption optionWithNumeral:v15 forDevice:v10];
LABEL_6:
      v7 = (void *)v11;

      break;
    default:
      break;
  }

  return v7;
}

- (id)_defaultBackgroundOption
{
  v2 = [(NTKFace *)self device];
  int64_t v3 = +[NTKFaceBackgroundStyleEditOption optionWithBackgroundStyle:0 forDevice:v2];

  return v3;
}

- (id)pigmentOptionProvider
{
  int64_t v3 = [(NTKFace *)self device];
  int v4 = NTKShowGossamerUI(v3);

  if (self->_isGossamerPigmentEditOptionProvider != v4)
  {
    pigmentEditOptionProvider = self->_pigmentEditOptionProvider;
    self->_pigmentEditOptionProvider = 0;
  }
  id v6 = self->_pigmentEditOptionProvider;
  if (!v6)
  {
    self->_isGossamerPigmentEditOptionProvider = v4;
    v7 = [(id)objc_opt_class() pigmentFaceDomain];
    id v8 = v7;
    if (self->_isGossamerPigmentEditOptionProvider)
    {
      uint64_t v9 = [v7 stringByAppendingString:@"-Gossamer"];

      id v8 = (void *)v9;
    }
    v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v11 = [[NTKPigmentEditOptionProvider alloc] initWithDomain:v8 bundle:v10];
    uint64_t v12 = self->_pigmentEditOptionProvider;
    self->_pigmentEditOptionProvider = v11;

    id v6 = self->_pigmentEditOptionProvider;
  }
  return v6;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v5 = -[NTKWhistlerSubdialsFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  id v6 = [(NTKFace *)self device];
  unint64_t v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  unint64_t v7 = [(NTKWhistlerSubdialsFace *)self _optionClassForCustomEditMode:a4];
  id v8 = [(NTKFace *)self device];
  uint64_t v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  id v8 = [(NTKWhistlerSubdialsFace *)self _optionClassForCustomEditMode:a4];
  uint64_t v9 = [(NTKFace *)self device];
  unint64_t v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return v10;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (unint64_t)(a3 - 10) <= 9 && ((0x2A1u >> (a3 - 10)))
  {
    int v4 = objc_opt_class();
  }
  else
  {
    int v4 = 0;
  }
  return (Class)v4;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 15)
  {
    int v4 = NTKCompanionClockFaceLocalizedString(@"EDIT_MODE_LABEL_TIME_COMPANION", @"Time");
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___NTKWhistlerSubdialsFace;
    int v4 = objc_msgSendSuper2(&v6, sel__localizedNameOverrideForCustomEditMode_forDevice_, a3, a4);
  }
  return v4;
}

+ (id)_richComplicationSlotsForDevice:(id)a3
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v5[0] = @"top";
  v5[1] = @"center";
  v5[2] = @"bottom";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  return v3;
}

- (void)applyPreviewConfigurationWithFamily:(int64_t)a3 faceColor:(int64_t)a4
{
  switch(a4)
  {
    case 0:
      id v5 = @"special.rainbow";
      goto LABEL_12;
    case 1:
      objc_super v6 = @"gossamer.color3";
      break;
    case 2:
      objc_super v6 = @"gossamer.color5";
      break;
    case 3:
      objc_super v6 = @"gossamer.color6";
      break;
    case 4:
      objc_super v6 = @"gossamer.color8";
      break;
    case 5:
      objc_super v6 = @"gossamer.color2";
      break;
    case 6:
      id v7 = ntk_standard_pink;
      goto LABEL_11;
    case 7:
      id v7 = ntk_standard_purple;
LABEL_11:
      id v5 = *v7;
LABEL_12:
      objc_super v6 = v5;
      break;
    default:
      objc_super v6 = 0;
      break;
  }
  uint64_t v12 = v6;
  id v8 = +[NTKPigmentEditOption pigmentNamed:v6];
  [(NTKWhistlerSubdialsFace *)self selectOption:v8 forCustomEditMode:10 slot:0];
  uint64_t v9 = [(NTKFace *)self device];
  unint64_t v10 = +[NTKFaceBackgroundStyleEditOption optionWithBackgroundStyle:v12 != @"special.rainbow" forDevice:v9];

  [(NTKWhistlerSubdialsFace *)self selectOption:v10 forCustomEditMode:17 slot:0];
  uint64_t v11 = +[NTKComplication anyComplicationOfType:0];
  [(NTKFace *)self setComplication:v11 forSlot:@"top"];
  [(NTKFace *)self setComplication:v11 forSlot:@"center"];
  [(NTKFace *)self setComplication:v11 forSlot:@"bottom"];
}

- (BOOL)requiresPigmentEditOption
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return @"modularCompact";
}

- (id)editOptionsThatHideEditModes
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = [(NTKFace *)self device];
  uint64_t v3 = +[NTKDualTimeStyleEditOption optionWithStyle:0 forDevice:v2];

  id v7 = v3;
  id v8 = &unk_1F16E4818;
  int v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
  v9[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return v5;
}

- (id)localizedExplanationMessageForDisabledEditMode:(int64_t)a3
{
  return &stru_1F1635E90;
}

- (void).cxx_destruct
{
}

@end