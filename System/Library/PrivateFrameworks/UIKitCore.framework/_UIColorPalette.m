@interface _UIColorPalette
+ (id)_coolColors;
+ (id)_warmColors;
+ (id)intelligenceAmbientPalette;
+ (id)intelligenceComputedPalette;
+ (id)intelligenceProcessingPalette;
+ (id)intelligenceSymbolLivingColorPalette;
+ (id)textAssistantPonderingFillPalette;
+ (id)textAssistantPonderingLightSheenPalette;
+ (id)textAssistantReplacementBuildInPalette;
+ (id)textAssistantReplacementBuildOutPalette;
+ (id)textAssistantReplacementSheenPalette;
- (BOOL)isEqual:(id)a3;
- (CGGradient)gradientRepresentation;
- (NSArray)colors;
- (NSArray)locations;
- (NSString)colorSpaceName;
- (_UIColorPalette)initWithColors:(id)a3;
- (_UIColorPalette)initWithColors:(id)a3 locations:(id)a4 colorSpaceName:(id)a5;
- (id)paletteByMergingPalette:(id)a3;
- (unint64_t)hash;
@end

@implementation _UIColorPalette

- (_UIColorPalette)initWithColors:(id)a3 locations:(id)a4 colorSpaceName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = (__CFString *)a5;
  v16.receiver = self;
  v16.super_class = (Class)_UIColorPalette;
  v12 = [(_UIColorPalette *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_colors, a3);
    objc_storeStrong((id *)&v13->_locations, a4);
    if (v11) {
      v14 = v11;
    }
    else {
      v14 = @"kCGColorSpaceDeviceRGB";
    }
    objc_storeStrong((id *)&v13->_colorSpaceName, v14);
  }

  return v13;
}

- (_UIColorPalette)initWithColors:(id)a3
{
  return [(_UIColorPalette *)self initWithColors:a3 locations:0 colorSpaceName:@"kCGColorSpaceDeviceRGB"];
}

- (id)paletteByMergingPalette:(id)a3
{
  id v5 = a3;
  v6 = [v5 locations];
  if ([v6 count])
  {
  }
  else
  {
    v7 = [(_UIColorPalette *)self locations];
    uint64_t v8 = [v7 count];

    if (!v8)
    {
      v37 = [(_UIColorPalette *)self colors];
      v38 = [v5 colors];
      v13 = [v37 arrayByAddingObjectsFromArray:v38];

      v36 = [(_UIColorPalette *)self initWithColors:v13];
      goto LABEL_26;
    }
  }
  id v9 = [v5 locations];
  if (![v9 count])
  {

    goto LABEL_24;
  }
  id v10 = [(_UIColorPalette *)self locations];
  uint64_t v11 = [v10 count];

  if (!v11)
  {
LABEL_24:
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_UIColorPalette.m", 63, @"Can't merge a _UIColorPalette with locations, and one without locations." object file lineNumber description];
    v36 = 0;
    goto LABEL_26;
  }
  v12 = [(_UIColorPalette *)self colors];
  v13 = (void *)[v12 mutableCopy];

  v14 = [(_UIColorPalette *)self locations];
  v15 = (void *)[v14 mutableCopy];

  objc_super v16 = [v5 colors];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    unint64_t v18 = 0;
    do
    {
      v19 = [v5 locations];
      v20 = [v19 objectAtIndex:v18];
      v21 = v20;
      if (v20)
      {
        [v20 doubleValue];
        double v23 = v22;
      }
      else
      {
        double v23 = 0.0;
      }

      if ([v15 count])
      {
        uint64_t v24 = 0;
        while (1)
        {
          v25 = [v15 objectAtIndex:v24];
          v26 = v25;
          if (v25)
          {
            [v25 doubleValue];
            double v28 = v27;
          }
          else
          {
            double v28 = 0.0;
          }

          if (v23 >= v28) {
            break;
          }
          if (++v24 >= (unint64_t)[v15 count]) {
            goto LABEL_19;
          }
        }
        v29 = [v5 colors];
        v30 = [v29 objectAtIndex:v18];
        [v13 insertObject:v30 atIndex:v24];

        v31 = [v5 locations];
        v32 = [v31 objectAtIndex:v18];
        [v15 insertObject:v32 atIndex:v24];
      }
LABEL_19:
      ++v18;
      v33 = [v5 colors];
      unint64_t v34 = [v33 count];
    }
    while (v18 < v34);
  }
  v35 = [v5 colorSpaceName];
  v36 = [(_UIColorPalette *)self initWithColors:v13 locations:v15 colorSpaceName:v35];

LABEL_26:
  return v36;
}

- (CGGradient)gradientRepresentation
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v4 = CGColorSpaceCreateWithName((CFStringRef)self->_colorSpaceName);
  if (!v4)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"_UIColorPalette.m", 72, @"Unable to create colorspace for name %@", self->_colorSpaceName object file lineNumber description];
  }
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFIndex v6 = [(NSArray *)self->_colors count];
  Mutable = CFArrayCreateMutable(v5, v6, MEMORY[0x1E4F1D510]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v8 = self->_colors;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        CFArrayAppendValue(Mutable, (const void *)[*(id *)(*((void *)&v22 + 1) + 8 * i) CGColor]);
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  locations = self->_locations;
  if (locations)
  {
    uint64_t v14 = [(NSArray *)locations count];
    v15 = (CGFloat *)malloc_type_malloc(8 * v14, 0x100004000313F17uLL);
    if (v14)
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        uint64_t v17 = [(NSArray *)self->_locations objectAtIndex:j];
        [v17 doubleValue];
        v15[j] = v18;
      }
    }
  }
  else
  {
    v15 = 0;
  }
  v19 = CGGradientCreateWithColors(v4, Mutable, v15);
  CGColorSpaceRelease(v4);
  CFRelease(Mutable);
  if (v15) {
    free(v15);
  }
  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    CFIndex v6 = [(_UIColorPalette *)self colorSpaceName];
    v7 = [v5 colorSpaceName];
    id v8 = v6;
    id v9 = v7;
    if (v8 == v9)
    {
    }
    else
    {
      uint64_t v10 = v9;
      char v11 = 0;
      if (!v8 || !v9) {
        goto LABEL_20;
      }
      char v12 = [v8 isEqual:v9];

      if ((v12 & 1) == 0) {
        goto LABEL_13;
      }
    }
    v13 = [(_UIColorPalette *)self colors];
    uint64_t v14 = [v5 colors];
    id v8 = v13;
    id v15 = v14;
    if (v8 == v15)
    {

LABEL_15:
      uint64_t v17 = [(_UIColorPalette *)self locations];
      CGFloat v18 = [v5 locations];
      id v8 = v17;
      id v19 = v18;
      if (v8 == v19)
      {
        char v11 = 1;
        uint64_t v10 = v8;
      }
      else
      {
        uint64_t v10 = v19;
        char v11 = 0;
        if (v8 && v19) {
          char v11 = [v8 isEqual:v19];
        }
      }
      goto LABEL_20;
    }
    uint64_t v10 = v15;
    char v11 = 0;
    if (v8 && v15)
    {
      char v16 = [v8 isEqual:v15];

      if ((v16 & 1) == 0)
      {
LABEL_13:
        char v11 = 0;
LABEL_21:

        goto LABEL_22;
      }
      goto LABEL_15;
    }
LABEL_20:

    goto LABEL_21;
  }
  char v11 = 0;
LABEL_22:

  return v11;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(_UIColorPalette *)self colorSpaceName];
  id v5 = (id)[v3 appendString:v4];

  CFIndex v6 = [(_UIColorPalette *)self colors];
  id v7 = (id)[v3 appendObject:v6];

  id v8 = [(_UIColorPalette *)self locations];
  id v9 = (id)[v3 appendObject:v8];

  unint64_t v10 = [v3 hash];
  return v10;
}

- (NSArray)colors
{
  return self->_colors;
}

- (NSArray)locations
{
  return self->_locations;
}

- (NSString)colorSpaceName
{
  return self->_colorSpaceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorSpaceName, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_colors, 0);
}

+ (id)_warmColors
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = +[UIColor colorWithRed:1.0 green:0.56 blue:0.011 alpha:1.0];
  v6[0] = v2;
  v3 = +[UIColor colorWithRed:0.933 green:0.227 blue:0.498 alpha:1.0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)_coolColors
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = +[UIColor colorWithRed:0.768 green:0.364 blue:0.909 alpha:1.0];
  v6[0] = v2;
  v3 = +[UIColor colorWithRed:0.337 green:0.756 blue:1.0 alpha:1.0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)intelligenceAmbientPalette
{
  id v3 = objc_alloc((Class)a1);
  id v4 = [a1 _warmColors];
  id v5 = [a1 _coolColors];
  CFIndex v6 = [v4 arrayByAddingObjectsFromArray:v5];
  id v7 = (void *)[v3 initWithColors:v6];

  return v7;
}

+ (id)intelligenceProcessingPalette
{
  id v3 = objc_alloc((Class)a1);
  id v4 = [a1 _warmColors];
  id v5 = (void *)[v3 initWithColors:v4];

  return v5;
}

+ (id)intelligenceComputedPalette
{
  id v3 = objc_alloc((Class)a1);
  id v4 = [a1 _coolColors];
  id v5 = (void *)[v3 initWithColors:v4];

  return v5;
}

+ (id)textAssistantPonderingFillPalette
{
  v11[5] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc((Class)a1);
  id v3 = +[UIColor colorWithHue:0.12 saturation:1.0 brightness:1.0 alpha:0.0];
  id v4 = +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", 0.81, 1.0, 1.0, 1.0, v3);
  v11[1] = v4;
  id v5 = +[UIColor colorWithHue:0.76 saturation:0.96 brightness:0.98 alpha:0.8];
  v11[2] = v5;
  CFIndex v6 = +[UIColor colorWithHue:0.66 saturation:1.0 brightness:0.81 alpha:0.72];
  v11[3] = v6;
  id v7 = +[UIColor colorWithHue:0.66 saturation:1.0 brightness:0.81 alpha:0.0];
  v11[4] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:5];
  id v9 = (void *)[v2 initWithColors:v8 locations:&unk_1ED3F10A8 colorSpaceName:0];

  return v9;
}

+ (id)textAssistantPonderingLightSheenPalette
{
  v11[5] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc((Class)a1);
  id v3 = +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.0];
  id v4 = +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0, v3);
  v11[1] = v4;
  id v5 = +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  v11[2] = v5;
  CFIndex v6 = +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.0];
  v11[3] = v6;
  id v7 = +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.0];
  v11[4] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:5];
  id v9 = (void *)[v2 initWithColors:v8 locations:&unk_1ED3F10C0 colorSpaceName:0];

  return v9;
}

+ (id)textAssistantReplacementBuildInPalette
{
  v13[7] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc((Class)a1);
  id v3 = +[UIColor colorWithRed:0.489 green:0.631 blue:0.845 alpha:0.0];
  id v4 = +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.49, 0.631, 0.847, 0.5, v3);
  v13[1] = v4;
  id v5 = +[UIColor colorWithRed:0.801 green:0.615 blue:0.875 alpha:0.72];
  v13[2] = v5;
  CFIndex v6 = +[UIColor colorWithHue:0.986 saturation:0.349 brightness:0.948 alpha:1.0];
  v13[3] = v6;
  id v7 = +[UIColor colorWithHue:0.121 saturation:0.319 brightness:0.864 alpha:1.0];
  v13[4] = v7;
  id v8 = +[UIColor colorWithHue:0.057 saturation:0.092 brightness:0.95 alpha:1.0];
  v13[5] = v8;
  id v9 = +[UIColor colorWithHue:0.129 saturation:1.0 brightness:1.0 alpha:0.0];
  v13[6] = v9;
  unint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:7];
  char v11 = (void *)[v2 initWithColors:v10 locations:&unk_1ED3F10D8 colorSpaceName:0];

  return v11;
}

+ (id)textAssistantReplacementBuildOutPalette
{
  v10[4] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc((Class)a1);
  id v3 = +[UIColor colorWithWhite:1.0 alpha:1.0];
  v10[0] = v3;
  id v4 = +[UIColor colorWithRed:0.945 green:0.678 blue:0.388 alpha:1.0];
  v10[1] = v4;
  id v5 = +[UIColor colorWithRed:0.812 green:0.518 blue:0.4 alpha:1.0];
  v10[2] = v5;
  CFIndex v6 = +[UIColor colorWithRed:0.475 green:0.345 blue:0.773 alpha:1.0];
  v10[3] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];
  id v8 = (void *)[v2 initWithColors:v7];

  return v8;
}

+ (id)textAssistantReplacementSheenPalette
{
  v13[7] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc((Class)a1);
  id v3 = +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.0];
  id v4 = +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.2, 1.2, 1.2, 0.31, v3);
  v13[1] = v4;
  id v5 = +[UIColor colorWithRed:1.2 green:1.2 blue:1.2 alpha:0.4];
  v13[2] = v5;
  CFIndex v6 = +[UIColor colorWithRed:1.2 green:1.2 blue:1.2 alpha:0.6];
  v13[3] = v6;
  id v7 = +[UIColor colorWithRed:1.2 green:1.2 blue:1.2 alpha:0.6];
  v13[4] = v7;
  id v8 = +[UIColor colorWithRed:1.2 green:1.2 blue:1.2 alpha:1.0];
  v13[5] = v8;
  id v9 = +[UIColor colorWithRed:1.2 green:1.2 blue:1.2 alpha:0.0];
  v13[6] = v9;
  unint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:7];
  char v11 = (void *)[v2 initWithColors:v10 locations:&unk_1ED3F10F0 colorSpaceName:0];

  return v11;
}

+ (id)intelligenceSymbolLivingColorPalette
{
  v10[4] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc((Class)a1);
  id v3 = +[UIColor colorWithRed:1.0 green:0.471 blue:0.2 alpha:1.0];
  v10[0] = v3;
  id v4 = +[UIColor colorWithRed:0.98 green:0.263 blue:0.408 alpha:1.0];
  v10[1] = v4;
  id v5 = +[UIColor colorWithRed:0.294 green:0.678 blue:0.976 alpha:1.0];
  v10[2] = v5;
  CFIndex v6 = +[UIColor colorWithRed:0.851 green:0.588 blue:0.992 alpha:1.0];
  v10[3] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];
  id v8 = (void *)[v2 initWithColors:v7];

  return v8;
}

@end