@interface PREditorColorPalette
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)additionalColorsForExtendedPalette;
+ (id)condensedPalette;
+ (id)condensedPaletteColors;
+ (id)extendedPalette;
+ (id)standardPalette;
+ (id)standardPaletteColors;
- (BOOL)hasGeneratedPickerColors;
- (BOOL)includesObjectsOfTypePRPosterColor;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldShowColorWell;
- (NSArray)colors;
- (NSArray)pickerColors;
- (NSString)description;
- (NSString)localizedName;
- (PREditorColorPalette)initWithBSXPCCoder:(id)a3;
- (PREditorColorPalette)initWithCoder:(id)a3;
- (PREditorColorPalette)initWithColors:(id)a3 localizedName:(id)a4 showsColorWell:(BOOL)a5;
- (PREditorColorPalette)initWithPickerColors:(id)a3 colors:(id)a4 localizedName:(id)a5 paletteType:(unint64_t)a6 showsColorWell:(BOOL)a7;
- (PREditorColorPalette)initWithPickerColors:(id)a3 localizedName:(id)a4;
- (unint64_t)hash;
- (unint64_t)paletteType;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)generatePickerColorsIfNeededForContext:(unint64_t)a3;
- (void)setHasGeneratedPickerColors:(BOOL)a3;
- (void)setPickerColors:(id)a3;
@end

@implementation PREditorColorPalette

+ (id)standardPaletteColors
{
  v18[12] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v17 = [MEMORY[0x1E4FB1618] colorNamed:@"lightBlue" inBundle:v2 compatibleWithTraitCollection:0];
  v18[0] = v17;
  v16 = [MEMORY[0x1E4FB1618] colorNamed:@"darkBlue" inBundle:v2 compatibleWithTraitCollection:0];
  v18[1] = v16;
  v15 = [MEMORY[0x1E4FB1618] colorNamed:@"plum" inBundle:v2 compatibleWithTraitCollection:0];
  v18[2] = v15;
  v14 = [MEMORY[0x1E4FB1618] colorNamed:@"magenta" inBundle:v2 compatibleWithTraitCollection:0];
  v18[3] = v14;
  v3 = [MEMORY[0x1E4FB1618] colorNamed:@"pink" inBundle:v2 compatibleWithTraitCollection:0];
  v18[4] = v3;
  v4 = [MEMORY[0x1E4FB1618] colorNamed:@"coral" inBundle:v2 compatibleWithTraitCollection:0];
  v18[5] = v4;
  v5 = [MEMORY[0x1E4FB1618] colorNamed:@"orange" inBundle:v2 compatibleWithTraitCollection:0];
  v18[6] = v5;
  v6 = [MEMORY[0x1E4FB1618] colorNamed:@"peach" inBundle:v2 compatibleWithTraitCollection:0];
  v18[7] = v6;
  v7 = [MEMORY[0x1E4FB1618] colorNamed:@"yellow" inBundle:v2 compatibleWithTraitCollection:0];
  v18[8] = v7;
  v8 = [MEMORY[0x1E4FB1618] colorNamed:@"greenYellow" inBundle:v2 compatibleWithTraitCollection:0];
  v18[9] = v8;
  v9 = [MEMORY[0x1E4FB1618] colorNamed:@"lightGreen" inBundle:v2 compatibleWithTraitCollection:0];
  v18[10] = v9;
  v10 = [MEMORY[0x1E4FB1618] colorNamed:@"green" inBundle:v2 compatibleWithTraitCollection:0];
  v18[11] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:12];

  v12 = objc_msgSend(v11, "bs_map:", &__block_literal_global_14);

  return v12;
}

PRPosterColor *__45__PREditorColorPalette_standardPaletteColors__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PRPosterColor alloc] initWithColor:v2];

  return v3;
}

+ (id)condensedPaletteColors
{
  v15[9] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v14 = [MEMORY[0x1E4FB1618] colorNamed:@"lightBlue" inBundle:v2 compatibleWithTraitCollection:0];
  v15[0] = v14;
  v3 = [MEMORY[0x1E4FB1618] colorNamed:@"darkBlue" inBundle:v2 compatibleWithTraitCollection:0];
  v15[1] = v3;
  v4 = [MEMORY[0x1E4FB1618] colorNamed:@"plum" inBundle:v2 compatibleWithTraitCollection:0];
  v15[2] = v4;
  v5 = [MEMORY[0x1E4FB1618] colorNamed:@"magenta" inBundle:v2 compatibleWithTraitCollection:0];
  v15[3] = v5;
  v6 = [MEMORY[0x1E4FB1618] colorNamed:@"coral" inBundle:v2 compatibleWithTraitCollection:0];
  v15[4] = v6;
  v7 = [MEMORY[0x1E4FB1618] colorNamed:@"peach" inBundle:v2 compatibleWithTraitCollection:0];
  v15[5] = v7;
  v8 = [MEMORY[0x1E4FB1618] colorNamed:@"yellow" inBundle:v2 compatibleWithTraitCollection:0];
  v15[6] = v8;
  v9 = [MEMORY[0x1E4FB1618] colorNamed:@"lightGreen" inBundle:v2 compatibleWithTraitCollection:0];
  v15[7] = v9;
  v10 = [MEMORY[0x1E4FB1618] colorNamed:@"green" inBundle:v2 compatibleWithTraitCollection:0];
  v15[8] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:9];

  v12 = objc_msgSend(v11, "bs_map:", &__block_literal_global_39);

  return v12;
}

PRPosterColor *__46__PREditorColorPalette_condensedPaletteColors__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PRPosterColor alloc] initWithColor:v2];

  return v3;
}

+ (id)additionalColorsForExtendedPalette
{
  v12[6] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [MEMORY[0x1E4FB1618] colorNamed:@"desaturatedGreen" inBundle:v2 compatibleWithTraitCollection:0];
  v12[0] = v3;
  v4 = [MEMORY[0x1E4FB1618] colorNamed:@"desaturatedBlue" inBundle:v2 compatibleWithTraitCollection:0];
  v12[1] = v4;
  v5 = [MEMORY[0x1E4FB1618] colorNamed:@"desaturatedPurple" inBundle:v2 compatibleWithTraitCollection:0];
  v12[2] = v5;
  v6 = [MEMORY[0x1E4FB1618] colorNamed:@"desaturatedBrown" inBundle:v2 compatibleWithTraitCollection:0];
  v12[3] = v6;
  v7 = [MEMORY[0x1E4FB1618] whiteColor];
  v12[4] = v7;
  v8 = [MEMORY[0x1E4FB1618] blackColor];
  v12[5] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:6];

  v10 = objc_msgSend(v9, "bs_map:", &__block_literal_global_53);

  return v10;
}

PRPosterColor *__58__PREditorColorPalette_additionalColorsForExtendedPalette__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PRPosterColor alloc] initWithColor:v2];

  return v3;
}

+ (id)standardPalette
{
  id v3 = objc_alloc((Class)a1);
  v4 = [a1 standardPaletteColors];
  v5 = (void *)[v3 initWithPickerColors:0 colors:v4 localizedName:0 paletteType:0 showsColorWell:0];

  return v5;
}

+ (id)extendedPalette
{
  id v3 = [a1 standardPaletteColors];
  v4 = [a1 additionalColorsForExtendedPalette];
  v5 = [v3 arrayByAddingObjectsFromArray:v4];

  v6 = (void *)[objc_alloc((Class)a1) initWithPickerColors:0 colors:v5 localizedName:0 paletteType:1 showsColorWell:0];
  return v6;
}

+ (id)condensedPalette
{
  id v3 = objc_alloc((Class)a1);
  v4 = [a1 condensedPaletteColors];
  v5 = (void *)[v3 initWithPickerColors:0 colors:v4 localizedName:0 paletteType:2 showsColorWell:0];

  return v5;
}

- (PREditorColorPalette)initWithColors:(id)a3 localizedName:(id)a4 showsColorWell:(BOOL)a5
{
  return [(PREditorColorPalette *)self initWithPickerColors:0 colors:a3 localizedName:a4 paletteType:3 showsColorWell:a5];
}

- (PREditorColorPalette)initWithPickerColors:(id)a3 localizedName:(id)a4
{
  return [(PREditorColorPalette *)self initWithPickerColors:a3 colors:0 localizedName:a4 paletteType:3 showsColorWell:0];
}

- (PREditorColorPalette)initWithPickerColors:(id)a3 colors:(id)a4 localizedName:(id)a5 paletteType:(unint64_t)a6 showsColorWell:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v32.receiver = self;
  v32.super_class = (Class)PREditorColorPalette;
  v16 = [(PREditorColorPalette *)&v32 init];
  if (v16)
  {
    uint64_t v17 = [v15 copy];
    localizedName = v16->_localizedName;
    v16->_localizedName = (NSString *)v17;

    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __93__PREditorColorPalette_initWithPickerColors_colors_localizedName_paletteType_showsColorWell___block_invoke;
    v24[3] = &unk_1E54DAB18;
    v26 = &v28;
    SEL v27 = a2;
    v19 = v16;
    v25 = v19;
    v20 = objc_msgSend(v14, "bs_map:", v24);
    uint64_t v21 = [v20 copy];
    colors = v19->_colors;
    v19->_colors = (NSArray *)v21;

    objc_storeStrong((id *)&v19->_pickerColors, a3);
    v19->_includesObjectsOfTypePRPosterColor = *((unsigned char *)v29 + 24);
    v19->_paletteType = a6;
    if (v13) {
      v19->_hasGeneratedPickerColors = 1;
    }

    _Block_object_dispose(&v28, 8);
  }

  return v16;
}

PRPosterColor *__93__PREditorColorPalette_initWithPickerColors_colors_localizedName_paletteType_showsColorWell___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = (PRPosterColor *)v3;
LABEL_5:
    v5 = v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    v4 = [[PRPosterColor alloc] initWithColor:v3];
    goto LABEL_5;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

- (void)generatePickerColorsIfNeededForContext:(unint64_t)a3
{
  if (!self->_hasGeneratedPickerColors)
  {
    uint64_t v5 = objc_opt_class();
    colors = self->_colors;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63__PREditorColorPalette_generatePickerColorsIfNeededForContext___block_invoke;
    v9[3] = &__block_descriptor_48_e23__16__0__PRPosterColor_8lu40l8;
    v9[4] = a3;
    v9[5] = v5;
    v7 = [(NSArray *)colors bs_map:v9];
    pickerColors = self->_pickerColors;
    self->_pickerColors = v7;

    self->_hasGeneratedPickerColors = 1;
  }
}

id __63__PREditorColorPalette_generatePickerColorsIfNeededForContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  double v5 = 0.0;
  if (*(void *)(a1 + 32) == 1)
  {
    if ([v3 preferredStyle] == 1) {
      double v5 = 1.0;
    }
    else {
      double v5 = 0.0;
    }
  }
  v6 = (void *)[objc_alloc(*(Class *)(a1 + 40)) initWithColor:v4 initialVariation:v5];

  return v6;
}

- (BOOL)shouldShowColorWell
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PREditorColorPalette *)a3;
  if (self == v4)
  {
    char v16 = 1;
  }
  else
  {
    double v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v7 = v4;
      v8 = [(PREditorColorPalette *)self localizedName];
      v9 = [(PREditorColorPalette *)v7 localizedName];
      int v10 = BSEqualStrings();

      if (v10
        && ([(PREditorColorPalette *)self colors],
            v11 = objc_claimAutoreleasedReturnValue(),
            [(PREditorColorPalette *)v7 colors],
            v12 = objc_claimAutoreleasedReturnValue(),
            int v13 = BSEqualObjects(),
            v12,
            v11,
            v13))
      {
        id v14 = [(PREditorColorPalette *)self pickerColors];
        id v15 = [(PREditorColorPalette *)v7 pickerColors];
        char v16 = BSEqualObjects();
      }
      else
      {
        char v16 = 0;
      }
    }
    else
    {
      char v16 = 0;
    }
  }

  return v16;
}

- (unint64_t)hash
{
  id v3 = [(PREditorColorPalette *)self colors];
  uint64_t v4 = [v3 hash];
  double v5 = [(PREditorColorPalette *)self localizedName];
  unint64_t v6 = [v5 hash] ^ v4;

  if ([(PREditorColorPalette *)self hasGeneratedPickerColors])
  {
    v7 = [(PREditorColorPalette *)self pickerColors];
    v6 ^= [v7 hash];
  }
  return v6;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __35__PREditorColorPalette_description__block_invoke;
  int v10 = &unk_1E54DAA08;
  v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  double v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __35__PREditorColorPalette_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PREditorColorPalette *)self pickerColors];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "isCustomColor", (void)v13))
        {
          id v12 = v5;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  int v10 = [(PREditorColorPalette *)self colors];
  [v4 encodeObject:v10 forKey:@"colors"];

  v11 = [(PREditorColorPalette *)self localizedName];
  [v4 encodeObject:v11 forKey:@"localizedName"];

  objc_msgSend(v4, "encodeBool:forKey:", -[PREditorColorPalette includesObjectsOfTypePRPosterColor](self, "includesObjectsOfTypePRPosterColor"), @"includesPosterColors");
  id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PREditorColorPalette paletteType](self, "paletteType"));
  [v4 encodeObject:v12 forKey:@"paletteType"];
LABEL_11:
}

- (PREditorColorPalette)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paletteType"];
  uint64_t v6 = v5;
  if (!v5)
  {
    if (([v4 decodeBoolForKey:@"isStandardPalette"] & 1) == 0)
    {
      uint64_t v8 = 3;
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  uint64_t v7 = [v5 unsignedIntegerValue];
  if (v7 == 2)
  {
    uint64_t v9 = [(id)objc_opt_class() condensedPalette];
    goto LABEL_16;
  }
  uint64_t v8 = v7;
  if (v7 == 1)
  {
    uint64_t v9 = [(id)objc_opt_class() extendedPalette];
    goto LABEL_16;
  }
  if (!v7)
  {
LABEL_7:
    uint64_t v9 = [(id)objc_opt_class() standardPalette];
LABEL_16:
    uint64_t v21 = (PREditorColorPalette *)v9;
    goto LABEL_17;
  }
LABEL_9:
  int v10 = (void *)MEMORY[0x1E4F1CAD0];
  v11 = self;
  id v12 = self;
  long long v13 = self;
  long long v14 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, 0);
  long long v15 = [v4 decodeObjectOfClasses:v14 forKey:@"colors"];

  char v16 = [v4 decodeBoolForKey:@"includesPosterColors"];
  uint64_t v17 = self;
  uint64_t v18 = [v4 decodeObjectOfClass:v17 forKey:@"localizedName"];

  if (v15 && [v15 count])
  {
    v19 = [(PREditorColorPalette *)self initWithPickerColors:0 colors:v15 localizedName:v18 paletteType:v8 showsColorWell:0];
    v19->_includesObjectsOfTypePRPosterColor = v16;
    v20 = v19;
    self = v20;
  }
  else
  {
    v20 = +[PREditorColorPalette standardPalette];
  }
  uint64_t v21 = v20;

LABEL_17:
  return v21;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PREditorColorPalette *)self pickerColors];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "isCustomColor", (void)v13))
        {
          id v12 = v5;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  int v10 = [(PREditorColorPalette *)self colors];
  [v4 encodeObject:v10 forKey:@"colors"];

  v11 = [(PREditorColorPalette *)self localizedName];
  [v4 encodeObject:v11 forKey:@"localizedName"];

  objc_msgSend(v4, "encodeBool:forKey:", -[PREditorColorPalette includesObjectsOfTypePRPosterColor](self, "includesObjectsOfTypePRPosterColor"), @"includesPosterColors");
  id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PREditorColorPalette paletteType](self, "paletteType"));
  [v4 encodeObject:v12 forKey:@"paletteType"];
LABEL_11:
}

- (PREditorColorPalette)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paletteType"];
  uint64_t v6 = v5;
  if (!v5)
  {
    if (([v4 decodeBoolForKey:@"isStandardPalette"] & 1) == 0)
    {
      uint64_t v8 = 3;
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  uint64_t v7 = [v5 unsignedIntegerValue];
  if (v7 == 2)
  {
    uint64_t v9 = [(id)objc_opt_class() condensedPalette];
    goto LABEL_16;
  }
  uint64_t v8 = v7;
  if (v7 == 1)
  {
    uint64_t v9 = [(id)objc_opt_class() extendedPalette];
    goto LABEL_16;
  }
  if (!v7)
  {
LABEL_7:
    uint64_t v9 = [(id)objc_opt_class() standardPalette];
LABEL_16:
    uint64_t v17 = (PREditorColorPalette *)v9;
    goto LABEL_17;
  }
LABEL_9:
  uint64_t v10 = objc_opt_class();
  v11 = [v4 decodeCollectionOfClass:v10 containingClass:objc_opt_class() forKey:@"colors"];
  char v12 = [v4 decodeBoolForKey:@"includesPosterColors"];
  long long v13 = self;
  long long v14 = [v4 decodeObjectOfClass:v13 forKey:@"localizedName"];

  if (v11 && [v11 count])
  {
    long long v15 = [(PREditorColorPalette *)self initWithPickerColors:0 colors:v11 localizedName:v14 paletteType:v8 showsColorWell:0];
    v15->_includesObjectsOfTypePRPosterColor = v12;
    long long v16 = v15;
    self = v16;
  }
  else
  {
    long long v16 = +[PREditorColorPalette standardPalette];
  }
  uint64_t v17 = v16;

LABEL_17:
  return v17;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v12 = a3;
  id v4 = [(PREditorColorPalette *)self colors];
  id v5 = (id)[v12 appendObject:v4 withName:@"colors"];

  uint64_t v6 = [(PREditorColorPalette *)self pickerColors];
  id v7 = (id)[v12 appendObject:v6 withName:@"pickerColors" skipIfNil:1];

  uint64_t v8 = [(PREditorColorPalette *)self localizedName];
  [v12 appendString:v8 withName:@"localizedName" skipIfEmpty:1];

  unint64_t v9 = [(PREditorColorPalette *)self paletteType];
  if (v9 > 3) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = off_1E54DB948[v9];
  }
  [v12 appendString:v10 withName:@"paletteType"];
  id v11 = (id)objc_msgSend(v12, "appendBool:withName:", -[PREditorColorPalette includesObjectsOfTypePRPosterColor](self, "includesObjectsOfTypePRPosterColor"), @"includesPosterColors");
}

- (NSString)localizedName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)colors
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)hasGeneratedPickerColors
{
  return self->_hasGeneratedPickerColors;
}

- (void)setHasGeneratedPickerColors:(BOOL)a3
{
  self->_hasGeneratedPickerColors = a3;
}

- (BOOL)includesObjectsOfTypePRPosterColor
{
  return self->_includesObjectsOfTypePRPosterColor;
}

- (unint64_t)paletteType
{
  return self->_paletteType;
}

- (NSArray)pickerColors
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPickerColors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerColors, 0);
  objc_storeStrong((id *)&self->_colors, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end