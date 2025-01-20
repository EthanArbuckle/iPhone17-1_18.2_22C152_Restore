@interface PUIStylePalette
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)_additionalColorsForExtendedPalette;
+ (id)_condensedPaletteColors;
+ (id)_incomingCallRainbowTextStyle;
+ (id)_standardPaletteColors;
+ (id)defaultPaletteForContext:(unint64_t)a3;
+ (id)defaultPaletteForContext:(unint64_t)a3 role:(id)a4;
- (BOOL)isDefaultPalette;
- (BOOL)isEqual:(id)a3;
- (NSArray)styles;
- (NSString)description;
- (NSString)localizedName;
- (NSString)role;
- (PUIStylePalette)initWithBSXPCCoder:(id)a3;
- (PUIStylePalette)initWithCoder:(id)a3;
- (PUIStylePalette)initWithStyles:(id)a3;
- (PUIStylePalette)initWithStyles:(id)a3 context:(unint64_t)a4 role:(id)a5 localizedName:(id)a6 defaultPalette:(BOOL)a7;
- (PUIStylePalette)initWithStyles:(id)a3 localizedName:(id)a4;
- (unint64_t)context;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setContext:(unint64_t)a3;
@end

@implementation PUIStylePalette

+ (id)_standardPaletteColors
{
  v17[12] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v16 = [MEMORY[0x263F1C550] colorNamed:@"lightBlue" inBundle:v2 compatibleWithTraitCollection:0];
  v17[0] = v16;
  v15 = [MEMORY[0x263F1C550] colorNamed:@"darkBlue" inBundle:v2 compatibleWithTraitCollection:0];
  v17[1] = v15;
  v14 = [MEMORY[0x263F1C550] colorNamed:@"plum" inBundle:v2 compatibleWithTraitCollection:0];
  v17[2] = v14;
  v13 = [MEMORY[0x263F1C550] colorNamed:@"magenta" inBundle:v2 compatibleWithTraitCollection:0];
  v17[3] = v13;
  v3 = [MEMORY[0x263F1C550] colorNamed:@"pink" inBundle:v2 compatibleWithTraitCollection:0];
  v17[4] = v3;
  v4 = [MEMORY[0x263F1C550] colorNamed:@"coral" inBundle:v2 compatibleWithTraitCollection:0];
  v17[5] = v4;
  v5 = [MEMORY[0x263F1C550] colorNamed:@"orange" inBundle:v2 compatibleWithTraitCollection:0];
  v17[6] = v5;
  v6 = [MEMORY[0x263F1C550] colorNamed:@"peach" inBundle:v2 compatibleWithTraitCollection:0];
  v17[7] = v6;
  v7 = [MEMORY[0x263F1C550] colorNamed:@"yellow" inBundle:v2 compatibleWithTraitCollection:0];
  v17[8] = v7;
  v8 = [MEMORY[0x263F1C550] colorNamed:@"greenYellow" inBundle:v2 compatibleWithTraitCollection:0];
  v17[9] = v8;
  v9 = [MEMORY[0x263F1C550] colorNamed:@"lightGreen" inBundle:v2 compatibleWithTraitCollection:0];
  v17[10] = v9;
  v10 = [MEMORY[0x263F1C550] colorNamed:@"green" inBundle:v2 compatibleWithTraitCollection:0];
  v17[11] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:12];

  return v11;
}

+ (id)_condensedPaletteColors
{
  v14[9] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v13 = [MEMORY[0x263F1C550] colorNamed:@"lightBlue" inBundle:v2 compatibleWithTraitCollection:0];
  v14[0] = v13;
  v3 = [MEMORY[0x263F1C550] colorNamed:@"darkBlue" inBundle:v2 compatibleWithTraitCollection:0];
  v14[1] = v3;
  v4 = [MEMORY[0x263F1C550] colorNamed:@"plum" inBundle:v2 compatibleWithTraitCollection:0];
  v14[2] = v4;
  v5 = [MEMORY[0x263F1C550] colorNamed:@"magenta" inBundle:v2 compatibleWithTraitCollection:0];
  v14[3] = v5;
  v6 = [MEMORY[0x263F1C550] colorNamed:@"coral" inBundle:v2 compatibleWithTraitCollection:0];
  v14[4] = v6;
  v7 = [MEMORY[0x263F1C550] colorNamed:@"peach" inBundle:v2 compatibleWithTraitCollection:0];
  v14[5] = v7;
  v8 = [MEMORY[0x263F1C550] colorNamed:@"yellow" inBundle:v2 compatibleWithTraitCollection:0];
  v14[6] = v8;
  v9 = [MEMORY[0x263F1C550] colorNamed:@"lightGreen" inBundle:v2 compatibleWithTraitCollection:0];
  v14[7] = v9;
  v10 = [MEMORY[0x263F1C550] colorNamed:@"green" inBundle:v2 compatibleWithTraitCollection:0];
  v14[8] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:9];

  return v11;
}

+ (id)_additionalColorsForExtendedPalette
{
  v11[6] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [MEMORY[0x263F1C550] colorNamed:@"desaturatedGreen" inBundle:v2 compatibleWithTraitCollection:0];
  v11[0] = v3;
  v4 = [MEMORY[0x263F1C550] colorNamed:@"desaturatedBlue" inBundle:v2 compatibleWithTraitCollection:0];
  v11[1] = v4;
  v5 = [MEMORY[0x263F1C550] colorNamed:@"desaturatedPurple" inBundle:v2 compatibleWithTraitCollection:0];
  v11[2] = v5;
  v6 = [MEMORY[0x263F1C550] colorNamed:@"desaturatedBrown" inBundle:v2 compatibleWithTraitCollection:0];
  v11[3] = v6;
  v7 = [MEMORY[0x263F1C550] whiteColor];
  v11[4] = v7;
  v8 = [MEMORY[0x263F1C550] blackColor];
  v11[5] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:6];

  return v9;
}

+ (id)_incomingCallRainbowTextStyle
{
  v12[7] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F1C550] colorWithRed:0.250980392 green:0.878431373 blue:0.815686275 alpha:1.0];
  v3 = objc_msgSend(MEMORY[0x263F1C550], "colorWithRed:green:blue:alpha:", 0.250980392, 0.878431373, 0.815686275, 1.0, v2);
  v12[1] = v3;
  v4 = [MEMORY[0x263F1C550] colorWithRed:0.564705882 green:0.835294118 blue:0.294117647 alpha:1.0];
  v12[2] = v4;
  v5 = [MEMORY[0x263F1C550] colorWithRed:1.0 green:0.8 blue:0.0 alpha:1.0];
  v12[3] = v5;
  v6 = [MEMORY[0x263F1C550] colorWithRed:1.0 green:0.68627451 blue:0.0 alpha:1.0];
  v12[4] = v6;
  v7 = [MEMORY[0x263F1C550] colorWithRed:1.0 green:0.470588235 blue:0.156862745 alpha:1.0];
  v12[5] = v7;
  v8 = [MEMORY[0x263F1C550] colorWithRed:1.0 green:0.282352941 blue:0.294117647 alpha:1.0];
  v12[6] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:7];

  v10 = -[PUIStyleGradient initWithColors:gradientType:locations:startPoint:endPoint:]([PUIStyleGradient alloc], "initWithColors:gradientType:locations:startPoint:endPoint:", v9, 0, &unk_27081B4E8, 0.0, 0.5, 1.0, 0.5);
  return v10;
}

+ (id)defaultPaletteForContext:(unint64_t)a3 role:(id)a4
{
  v21[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = [MEMORY[0x263F1C5C0] currentDevice];
  if ([v7 userInterfaceIdiom] == 1) {
    [a1 _condensedPaletteColors];
  }
  else {
  v8 = [a1 _standardPaletteColors];
  }

  if (a3 == 2)
  {
    v9 = objc_alloc_init(PUIStyleVibrantMaterial);
    v21[0] = v9;
    v10 = objc_alloc_init(PUIStyleVibrantMonochrome);
    v21[1] = v10;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];

    if (_os_feature_enabled_impl()) {
      int v12 = [v6 isEqualToString:*MEMORY[0x263F5F458]];
    }
    else {
      int v12 = 0;
    }
    int v16 = _os_feature_enabled_impl();
    if (v16) {
      int v16 = [v6 isEqualToString:*MEMORY[0x263F5F460]];
    }
    if ((v12 | v16) == 1)
    {
      v17 = [(id)objc_opt_class() _incomingCallRainbowTextStyle];
      uint64_t v18 = [v11 arrayByAddingObject:v17];

      v11 = (void *)v18;
    }
    v14 = objc_msgSend(v8, "bs_map:", &__block_literal_global_7);
    v15 = [v11 arrayByAddingObjectsFromArray:v14];
  }
  else
  {
    v13 = [a1 _additionalColorsForExtendedPalette];
    v14 = [v8 arrayByAddingObjectsFromArray:v13];

    v15 = objc_msgSend(v14, "bs_map:", &__block_literal_global_70);
  }

  v19 = (void *)[objc_alloc((Class)a1) initWithStyles:v15 context:a3 role:v6 localizedName:0 defaultPalette:1];
  return v19;
}

PUIStyleDiscreteColors *__49__PUIStylePalette_defaultPaletteForContext_role___block_invoke(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = [PUIStyleDiscreteColors alloc];
  v7[0] = v2;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];

  v5 = [(PUIStyleDiscreteColors *)v3 initWithVibrantColors:v4 variation:0.0];
  return v5;
}

PUIStyleDiscreteColors *__49__PUIStylePalette_defaultPaletteForContext_role___block_invoke_2(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = [PUIStyleDiscreteColors alloc];
  v7[0] = v2;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];

  v5 = [(PUIStyleDiscreteColors *)v3 initWithOpaqueColors:v4 variation:0.0];
  return v5;
}

+ (id)defaultPaletteForContext:(unint64_t)a3
{
  return (id)[a1 defaultPaletteForContext:a3 role:0];
}

- (PUIStylePalette)initWithStyles:(id)a3
{
  return [(PUIStylePalette *)self initWithStyles:a3 localizedName:0];
}

- (PUIStylePalette)initWithStyles:(id)a3 localizedName:(id)a4
{
  return [(PUIStylePalette *)self initWithStyles:a3 context:0 role:0 localizedName:a4 defaultPalette:0];
}

- (PUIStylePalette)initWithStyles:(id)a3 context:(unint64_t)a4 role:(id)a5 localizedName:(id)a6 defaultPalette:(BOOL)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PUIStylePalette;
  int v16 = [(PUIStylePalette *)&v20 init];
  if (v16)
  {
    uint64_t v17 = [v15 copy];
    localizedName = v16->_localizedName;
    v16->_localizedName = (NSString *)v17;

    objc_storeStrong((id *)&v16->_styles, a3);
    v16->_context = a4;
    objc_storeStrong((id *)&v16->_role, a5);
    v16->_defaultPalette = a7;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PUIStylePalette *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v7 = v4;
      v8 = [(PUIStylePalette *)self localizedName];
      v9 = [(PUIStylePalette *)v7 localizedName];
      int v10 = BSEqualStrings();

      if (v10)
      {
        v11 = [(PUIStylePalette *)self styles];
        int v12 = [(PUIStylePalette *)v7 styles];
        char v13 = BSEqualObjects();
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = [(PUIStylePalette *)self styles];
  uint64_t v4 = [v3 hash];
  v5 = [(PUIStylePalette *)self localizedName];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F29C48]);
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = __30__PUIStylePalette_description__block_invoke;
  int v10 = &unk_265471108;
  v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __30__PUIStylePalette_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(PUIStylePalette *)self styles];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v9), "type", (void)v14) == 999)
        {
          char v13 = v5;
          goto LABEL_13;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  int v10 = [(PUIStylePalette *)self styles];
  [v4 encodeObject:v10 forKey:@"styles"];

  role = self->_role;
  if (role) {
    [v4 encodeObject:role forKey:@"role"];
  }
  id v12 = [(PUIStylePalette *)self localizedName];
  [v4 encodeObject:v12 forKey:@"localizedName"];

  char v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PUIStylePalette context](self, "context"));
  [v4 encodeObject:v13 forKey:@"context"];
LABEL_13:
}

- (PUIStylePalette)initWithCoder:(id)a3
{
  v16[6] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context"];
  uint64_t v6 = [v5 unsignedIntegerValue];

  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"role"];
  if (v6)
  {
    uint64_t v8 = [(id)objc_opt_class() defaultPaletteForContext:v6 role:v7];
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x263EFFA08];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v16[2] = objc_opt_class();
    v16[3] = objc_opt_class();
    v16[4] = objc_opt_class();
    v16[5] = objc_opt_class();
    int v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:6];
    v11 = [v9 setWithArray:v10];
    id v12 = [v4 decodeArrayOfObjectsOfClasses:v11 forKey:@"styles"];

    char v13 = self;
    long long v14 = [v4 decodeObjectOfClass:v13 forKey:@"localizedName"];

    self = [(PUIStylePalette *)self initWithStyles:v12 context:0 role:v7 localizedName:v14 defaultPalette:0];
    uint64_t v8 = self;
  }

  return v8;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(PUIStylePalette *)self styles];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v27 + 1) + 8 * i) type] == 999)
        {
          v21 = v5;
          goto LABEL_20;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  int v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  [v4 encodeObject:v10 forKey:@"styleCount"];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v22 = v5;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * j);
        uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"style%ld", v14 + j);
        [v4 encodeObject:v17 forKey:v18];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
      v14 += j;
    }
    while (v13);
  }

  role = self->_role;
  if (role) {
    [v4 encodeObject:role forKey:@"role"];
  }
  objc_super v20 = [(PUIStylePalette *)self localizedName];
  [v4 encodeObject:v20 forKey:@"localizedName"];

  v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PUIStylePalette context](self, "context"));
  [v4 encodeObject:v21 forKey:@"context"];
  id v5 = v22;
LABEL_20:
}

- (PUIStylePalette)initWithBSXPCCoder:(id)a3
{
  v37[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context"];
  uint64_t v6 = [v5 unsignedIntegerValue];

  unint64_t v7 = 0x263F08000uLL;
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"role"];
  uint64_t v9 = (void *)v8;
  if (v6)
  {
    int v10 = [(id)objc_opt_class() defaultPaletteForContext:v6 role:v8];
  }
  else
  {
    long long v28 = (void *)v8;
    long long v29 = self;
    id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"styleCount"];
    uint64_t v12 = [v11 integerValue];

    long long v30 = [MEMORY[0x263EFF980] array];
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    v37[2] = objc_opt_class();
    v37[3] = objc_opt_class();
    v37[4] = objc_opt_class();
    v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:5];
    if (v12)
    {
      uint64_t v13 = v12;
      for (uint64_t i = 0; i != v13; ++i)
      {
        unint64_t v15 = v7;
        long long v16 = objc_msgSend(*(id *)(v7 + 2880), "stringWithFormat:", @"style%ld", i);
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v17 = v31;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v33;
          while (2)
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v33 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = [v4 decodeObjectOfClass:*(void *)(*((void *)&v32 + 1) + 8 * j) forKey:v16];
              if (v22)
              {
                long long v23 = (void *)v22;
                [v30 addObject:v22];

                goto LABEL_15;
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
            if (v19) {
              continue;
            }
            break;
          }
        }
LABEL_15:

        unint64_t v7 = v15;
      }
    }
    long long v24 = self;
    long long v25 = [v4 decodeObjectOfClass:v24 forKey:@"localizedName"];

    long long v26 = (void *)[v30 copy];
    uint64_t v9 = v28;
    self = [(PUIStylePalette *)v29 initWithStyles:v26 context:0 role:v28 localizedName:v25 defaultPalette:0];

    int v10 = self;
  }

  return v10;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PUIStylePalette *)self context];
  if (v5 > 2) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = off_265471128[v5];
  }
  [v4 appendString:v6 withName:@"context"];
  unint64_t v7 = [(PUIStylePalette *)self role];
  [v4 appendString:v7 withName:@"role"];

  uint64_t v8 = [(PUIStylePalette *)self styles];
  id v9 = (id)[v4 appendObject:v8 withName:@"styles"];

  id v10 = [(PUIStylePalette *)self localizedName];
  [v4 appendString:v10 withName:@"localizedName" skipIfEmpty:1];
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (NSArray)styles
{
  return self->_styles;
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (BOOL)isDefaultPalette
{
  return self->_defaultPalette;
}

- (NSString)role
{
  return self->_role;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_styles, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end