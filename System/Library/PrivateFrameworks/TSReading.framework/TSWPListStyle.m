@interface TSWPListStyle
+ (BOOL)defaultTieredNumber;
+ (BOOL)isDefaultMissingBulletImage:(id)a3;
+ (TSWPListStyle)listStyleWithNumberType:(int)a3 inStyleSheet:(id)a4 withNumberedPresetStyle:(id)a5;
+ (id)CJKListNameForNumberType:(int)a3;
+ (id)defaultLabelGeometries;
+ (id)defaultLabelIndents;
+ (id)defaultLabelString;
+ (id)defaultMissingBulletImage;
+ (id)defaultPropertyMap;
+ (id)defaultStyleWithContext:(id)a3;
+ (id)defaultStyleWithContext:(id)a3 type:(int)a4;
+ (id)defaultTextIndents;
+ (id)harvardStyleWithContext:(id)a3;
+ (id)numberedlistStyleForPresets:(id)a3;
+ (id)pDefaultLabelValuesForLabelTypeProperty:(int)a3;
+ (id)pLabelTypeArrayForType:(int)a3;
+ (id)presetStyleDescriptor;
+ (id)properties;
+ (id)propertiesAllowingNSNull;
+ (id)propertyMapForListNumberType:(int)a3;
+ (id)stickyOverrideProperties;
+ (int)defaultLabelNumberType;
+ (int)effectiveTypeForLevel:(unint64_t)a3 forPropertyMapping:(id)a4;
+ (int)firstLabelTypeForPropertyMapping:(id)a3;
+ (int)labelTypeForLevel:(unint64_t)a3 forPropertyMapping:(id)a4;
+ (int)pLabelTypeForLevel:(unint64_t)a3 forPropertyMapping:(id)a4 includeDegenerateLevels:(BOOL)a5;
+ (void)pGetDefaultTextIndentFloats:(double)a3[9];
- (NSString)presetKind;
- (TSWPListStyle)initWithContext:(id)a3 name:(id)a4 overridePropertyMap:(id)a5 isVariation:(BOOL)a6;
- (double)labelIndentForLevel:(unint64_t)a3;
- (double)textIndentForLevel:(unint64_t)a3 fontSize:(double)a4;
- (id)overridePropertyMapWithValue:(id)a3 forProperty:(int)a4 atParagraphLevels:(id)a5 withContext:(id)a6;
- (id)pOverrideArrayWithValue:(id)a3 forProperty:(int)a4 atParagraphLevels:(id)a5 withContext:(id)a6;
- (int)effectiveTypeForLevel:(unint64_t)a3;
- (int)firstLabelType;
- (int)labelTypeForLevel:(unint64_t)a3;
@end

@implementation TSWPListStyle

- (int)labelTypeForLevel:(unint64_t)a3
{
  v5 = objc_opt_class();

  return [v5 pLabelTypeForLevel:a3 forPropertyMapping:self includeDegenerateLevels:1];
}

- (double)textIndentForLevel:(unint64_t)a3 fontSize:(double)a4
{
  double v5 = 0.0;
  if (a3 <= 8) {
    objc_msgSend((id)objc_msgSend(-[TSSStyle valueForProperty:](self, "valueForProperty:", 176, 0.0), "objectAtIndexedSubscript:", a3), "doubleValue");
  }
  return v5 * a4;
}

- (double)labelIndentForLevel:(unint64_t)a3
{
  if (a3 > 8) {
    return 0.0;
  }
  v4 = objc_msgSend(-[TSSStyle valueForProperty:](self, "valueForProperty:", 177), "objectAtIndexedSubscript:", a3);
  [v4 doubleValue];
  return result;
}

+ (int)pLabelTypeForLevel:(unint64_t)a3 forPropertyMapping:(id)a4 includeDegenerateLevels:(BOOL)a5
{
  int result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForProperty:", 180), "objectAtIndexedSubscript:", a3), "intValue");
  if (!a5)
  {
    if (result == 1)
    {
      v12 = (void *)[a4 objectForProperty:182];
      if (v12)
      {
        v13 = v12;
        if ([v12 count] > (unint64_t)a3
          && (objc_msgSend(a1, "isDefaultMissingBulletImage:", objc_msgSend(v13, "objectAtIndexedSubscript:", a3)) & 1) == 0)
        {
          uint64_t v14 = [v13 objectAtIndexedSubscript:a3];
          if (v14 != [MEMORY[0x263EFF9D0] null]) {
            return 1;
          }
        }
      }
    }
    else
    {
      if (result != 2) {
        return result;
      }
      v10 = (void *)[a4 objectForProperty:183];
      if (v10)
      {
        v11 = v10;
        if ([v10 count] > (unint64_t)a3
          && !objc_msgSend((id)objc_msgSend(v11, "objectAtIndexedSubscript:", a3), "isEqualToString:", &stru_26D688A48))
        {
          return 2;
        }
      }
    }
    return 0;
  }
  return result;
}

- (int)effectiveTypeForLevel:(unint64_t)a3
{
  double v5 = objc_opt_class();

  return [v5 pLabelTypeForLevel:a3 forPropertyMapping:self includeDegenerateLevels:0];
}

TSSPropertySet *__27__TSWPListStyle_properties__block_invoke()
{
  int result = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 18, 16, 44, 178, 181, 182, 177, 184, 185, 183, 180, 176, 40, 179, 186, 0);
  +[TSWPListStyle properties]::s_properties = (uint64_t)result;
  return result;
}

- (TSWPListStyle)initWithContext:(id)a3 name:(id)a4 overridePropertyMap:(id)a5 isVariation:(BOOL)a6
{
  v7.receiver = self;
  v7.super_class = (Class)TSWPListStyle;
  return [(TSSStyle *)&v7 initWithContext:a3 name:a4 overridePropertyMap:a5 isVariation:a6];
}

+ (id)properties
{
  if (+[TSWPListStyle properties]::onceToken != -1) {
    dispatch_once(&+[TSWPListStyle properties]::onceToken, &__block_literal_global_8_0);
  }
  return (id)+[TSWPListStyle properties]::s_properties;
}

+ (id)defaultPropertyMap
{
  v9[9] = *MEMORY[0x263EF8340];
  uint64_t v3 = [[TSWPListLabelGeometry alloc] initWithScale:1 scaleWithText:1.0 baselineOffset:0.0];
  uint64_t v4 = [a1 defaultLabelIndents];
  double v5 = [TSSPropertyMap alloc];
  uint64_t v6 = [a1 pLabelTypeArrayForType:0];
  v9[0] = v3;
  v9[1] = v3;
  v9[2] = v3;
  v9[3] = v3;
  v9[4] = v3;
  v9[5] = v3;
  v9[6] = v3;
  v9[7] = v3;
  v9[8] = v3;
  objc_super v7 = -[TSSPropertyMap initWithPropertiesAndValues:](v5, "initWithPropertiesAndValues:", 180, v6, 176, v4, 177, &unk_26D739420, 181, [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:9], 0);

  return v7;
}

+ (id)pLabelTypeArrayForType:(int)a3
{
  v4[9] = *MEMORY[0x263EF8340];
  v4[0] = [NSNumber numberWithInt:*(void *)&a3];
  v4[1] = v4[0];
  v4[2] = v4[0];
  v4[3] = v4[0];
  v4[4] = v4[0];
  v4[5] = v4[0];
  v4[6] = v4[0];
  v4[7] = v4[0];
  v4[8] = v4[0];
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:9];
}

+ (id)defaultLabelIndents
{
  v3[9] = *MEMORY[0x263EF8340];
  id result = (id)+[TSWPListStyle defaultLabelIndents]::s_defaultLabelIndents;
  if (!+[TSWPListStyle defaultLabelIndents]::s_defaultLabelIndents)
  {
    memset_pattern16(v3, &unk_2646B2C90, 0x48uLL);
    id result = (id)[objc_alloc(MEMORY[0x263EFF8C0]) initWithObjects:v3 count:9];
    +[TSWPListStyle defaultLabelIndents]::s_defaultLabelIndents = (uint64_t)result;
  }
  return result;
}

+ (id)stickyOverrideProperties
{
  if (+[TSWPListStyle stickyOverrideProperties]::onceToken != -1) {
    dispatch_once(&+[TSWPListStyle stickyOverrideProperties]::onceToken, &__block_literal_global_71);
  }
  return (id)+[TSWPListStyle stickyOverrideProperties]::s_properties;
}

TSSPropertySet *__41__TSWPListStyle_stickyOverrideProperties__block_invoke()
{
  id result = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 181, 182, 184, 185, 183, 180, 176, 0);
  +[TSWPListStyle stickyOverrideProperties]::s_properties = (uint64_t)result;
  return result;
}

+ (id)propertiesAllowingNSNull
{
  if (+[TSWPListStyle propertiesAllowingNSNull]::onceToken != -1) {
    dispatch_once(&+[TSWPListStyle propertiesAllowingNSNull]::onceToken, &__block_literal_global_10_0);
  }
  return (id)+[TSWPListStyle propertiesAllowingNSNull]::s_nullProperties;
}

TSSPropertySet *__41__TSWPListStyle_propertiesAllowingNSNull__block_invoke()
{
  id result = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 18, 16, 40, 0);
  +[TSWPListStyle propertiesAllowingNSNull]::s_nullProperties = (uint64_t)result;
  return result;
}

+ (BOOL)isDefaultMissingBulletImage:(id)a3
{
  objc_opt_class();
  uint64_t v3 = (void *)TSUDynamicCast();
  if (v3)
  {
    uint64_t v4 = (void *)[v3 filename];
    LOBYTE(v3) = [v4 isEqualToString:@"TSWPMissingBulletImage.png"];
  }
  return (char)v3;
}

+ (int)effectiveTypeForLevel:(unint64_t)a3 forPropertyMapping:(id)a4
{
  uint64_t v6 = objc_opt_class();

  return [v6 pLabelTypeForLevel:a3 forPropertyMapping:a4 includeDegenerateLevels:0];
}

+ (int)labelTypeForLevel:(unint64_t)a3 forPropertyMapping:(id)a4
{
  uint64_t v6 = objc_opt_class();

  return [v6 pLabelTypeForLevel:a3 forPropertyMapping:a4 includeDegenerateLevels:1];
}

- (int)firstLabelType
{
  uint64_t v3 = objc_opt_class();

  return [v3 firstLabelTypeForPropertyMapping:self];
}

+ (int)firstLabelTypeForPropertyMapping:(id)a3
{
  uint64_t v4 = 0;
  do
  {
    int result = [(id)objc_opt_class() pLabelTypeForLevel:v4 forPropertyMapping:a3 includeDegenerateLevels:1];
    if (result) {
      break;
    }
  }
  while (v4++ != 8);
  return result;
}

+ (id)defaultLabelString
{
  id result = (id)+[TSWPListStyle defaultLabelString]::s_defaultLabelString;
  if (!+[TSWPListStyle defaultLabelString]::s_defaultLabelString)
  {
    id result = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"%C", 8226);
    +[TSWPListStyle defaultLabelString]::s_defaultLabelString = (uint64_t)result;
  }
  return result;
}

+ (int)defaultLabelNumberType
{
  return 0;
}

+ (BOOL)defaultTieredNumber
{
  return 0;
}

+ (void)pGetDefaultTextIndentFloats:(double)a3[9]
{
  uint64_t v3 = 0;
  int64x2_t v4 = (int64x2_t)xmmword_223838000;
  uint64x2_t v5 = (uint64x2_t)vdupq_n_s64(9uLL);
  int64x2_t v6 = vdupq_n_s64(2uLL);
  do
  {
    if (vmovn_s64((int64x2_t)vcgtq_u64(v5, (uint64x2_t)v4)).u8[0]) {
      a3[v3] = (float)((float)v3 * 36.0);
    }
    if (vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(9uLL), *(uint64x2_t *)&v4)).i32[1]) {
      a3[v3 + 1] = (float)((float)(v3 + 1) * 36.0);
    }
    v3 += 2;
    int64x2_t v4 = vaddq_s64(v4, v6);
  }
  while (v3 != 10);
}

+ (id)defaultTextIndents
{
  v4[9] = *MEMORY[0x263EF8340];
  id result = (id)+[TSWPListStyle defaultTextIndents]::s_defaultTextIndents;
  if (!+[TSWPListStyle defaultTextIndents]::s_defaultTextIndents)
  {
    [a1 pGetDefaultTextIndentFloats:v4];
    id result = (id)[objc_alloc(MEMORY[0x263EFF8C0]) initWithCGFloats:v4 count:9];
    +[TSWPListStyle defaultTextIndents]::s_defaultTextIndents = (uint64_t)result;
  }
  return result;
}

+ (id)defaultLabelGeometries
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id result = (id)+[TSWPListStyle defaultLabelGeometries]::s_defaultLabelGeometries;
  if (!+[TSWPListStyle defaultLabelGeometries]::s_defaultLabelGeometries)
  {
    id v3 = +[TSWPListLabelGeometry listLabelGeometry];
    for (uint64_t i = 0; i != 72; i += 8)
      *(void *)&v5[i] = v3;
    id result = (id)[objc_alloc(MEMORY[0x263EFF8C0]) initWithObjects:v5 count:9];
    +[TSWPListStyle defaultLabelGeometries]::s_defaultLabelGeometries = (uint64_t)result;
  }
  return result;
}

+ (id)defaultMissingBulletImage
{
  uint64_t v2 = [(id)TSWPBundle() URLForResource:objc_msgSend(@"TSWPMissingBulletImage.png", "stringByDeletingPathExtension"), objc_msgSend(@"TSWPMissingBulletImage.png", "pathExtension") withExtension];

  return +[TSPData readOnlyDataFromURL:v2 context:0];
}

+ (id)defaultStyleWithContext:(id)a3
{
  id v3 = objc_msgSend(objc_alloc((Class)a1), "initWithContext:name:overridePropertyMap:isVariation:", a3, 0, objc_msgSend(a1, "defaultPropertyMap"), 0);

  return v3;
}

+ (id)defaultStyleWithContext:(id)a3 type:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v19[9] = *MEMORY[0x263EF8340];
  objc_super v7 = [[TSWPListLabelGeometry alloc] initWithScale:1 scaleWithText:dbl_22383AE68[a4] baselineOffset:0.0];
  if ((v4 - 1) >= 2)
  {
    if (v4 != 3)
    {
      uint64_t v10 = [a1 defaultLabelIndents];
      goto LABEL_7;
    }
    v18[0] = &unk_26D73A918;
    v18[1] = &unk_26D73A918;
    v18[2] = &unk_26D73A918;
    v18[3] = &unk_26D73A918;
    v18[4] = &unk_26D73A918;
    v18[5] = &unk_26D73A918;
    v18[6] = &unk_26D73A918;
    v18[7] = &unk_26D73A918;
    v18[8] = &unk_26D73A918;
    v8 = (void *)MEMORY[0x263EFF8C0];
    v9 = v18;
  }
  else
  {
    v19[0] = &unk_26D73A908;
    v19[1] = &unk_26D73A908;
    v19[2] = &unk_26D73A908;
    v19[3] = &unk_26D73A908;
    v19[4] = &unk_26D73A908;
    v19[5] = &unk_26D73A908;
    v19[6] = &unk_26D73A908;
    v19[7] = &unk_26D73A908;
    v19[8] = &unk_26D73A908;
    v8 = (void *)MEMORY[0x263EFF8C0];
    v9 = v19;
  }
  uint64_t v10 = [v8 arrayWithObjects:v9 count:9];
LABEL_7:
  uint64_t v11 = v10;
  v12 = [TSSPropertyMap alloc];
  uint64_t v13 = [a1 pLabelTypeArrayForType:v4];
  v17[0] = v7;
  v17[1] = v7;
  v17[2] = v7;
  v17[3] = v7;
  v17[4] = v7;
  v17[5] = v7;
  v17[6] = v7;
  v17[7] = v7;
  v17[8] = v7;
  uint64_t v14 = -[TSSPropertyMap initWithPropertiesAndValues:](v12, "initWithPropertiesAndValues:", 180, v13, 176, v11, 177, &unk_26D739438, 181, [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:9], 0);

  if (v4)
  {
    -[TSSPropertyMap setObject:forProperty:](v14, "setObject:forProperty:", [a1 pDefaultLabelValuesForLabelTypeProperty:+[TSWPListStyle defaultStyleWithContext:type:]::labelSpecificProperties[v4]], +[TSWPListStyle defaultStyleWithContext:type:]::labelSpecificProperties[v4]);
    if (v4 == 3) {
      -[TSSPropertyMap setObject:forProperty:](v14, "setObject:forProperty:", [a1 pDefaultLabelValuesForLabelTypeProperty:185], 185);
    }
  }
  id v15 = (id)[objc_alloc((Class)a1) initWithContext:a3 name:0 overridePropertyMap:v14 isVariation:0];

  return v15;
}

+ (id)harvardStyleWithContext:(id)a3
{
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithInts:&sHarvardNumberFormats count:9];
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithCGFloats:&sHarvardLabelIndents count:9];
  objc_super v7 = -[TSSPropertyMap initWithPropertiesAndValues:]([TSSPropertyMap alloc], "initWithPropertiesAndValues:", 180, [a1 pLabelTypeArrayForType:3], 176, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithCGFloats:count:", &sHarvardTextIndents, 9), 177, v6, 181, objc_msgSend((id)objc_opt_class(), "defaultLabelGeometries"), 184, v5, 185, objc_msgSend(a1, "pDefaultLabelValuesForLabelTypeProperty:", 185), 0);
  id v8 = (id)[objc_alloc((Class)a1) initWithContext:a3 name:0 overridePropertyMap:v7 isVariation:0];

  return v8;
}

+ (id)numberedlistStyleForPresets:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v20;
  do
  {
    uint64_t v7 = 0;
LABEL_4:
    if (*(void *)v20 != v6) {
      objc_enumerationMutation(a3);
    }
    id v8 = *(void **)(*((void *)&v19 + 1) + 8 * v7);
    v9 = (void *)[v8 objectForProperty:180];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (!v10) {
      break;
    }
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
LABEL_8:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v16 != v12) {
        objc_enumerationMutation(v9);
      }
      if ([*(id *)(*((void *)&v15 + 1) + 8 * v13) intValue] != 3) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v11) {
          goto LABEL_8;
        }
        return v8;
      }
    }
    if (++v7 != v5) {
      goto LABEL_4;
    }
    uint64_t v5 = [a3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    id v8 = 0;
  }
  while (v5);
  return v8;
}

- (id)pOverrideArrayWithValue:(id)a3 forProperty:(int)a4 atParagraphLevels:(id)a5 withContext:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v25 = *MEMORY[0x263EF8340];
  objc_opt_class();
  [(TSSStyle *)self valueForProperty:v7];
  uint64_t v10 = TSUDynamicCast();
  if (!v10) {
    uint64_t v10 = [(id)objc_opt_class() pDefaultLabelValuesForLabelTypeProperty:v7];
  }
  uint64_t v11 = (void *)[MEMORY[0x263EFF980] arrayWithArray:v10];
  if (a3)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    if (!a5) {
      a5 = &unk_26D739450;
    }
    long long v20 = 0uLL;
    long long v21 = 0uLL;
    uint64_t v12 = [a5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(a5);
          }
          int v16 = [*(id *)(*((void *)&v20 + 1) + 8 * i) intValue];
          if ([v11 count] <= (unint64_t)v16)
          {
            long long v17 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
            uint64_t v18 = [NSString stringWithUTF8String:"-[TSWPListStyle pOverrideArrayWithValue:forProperty:atParagraphLevels:withContext:]"];
            objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPListStyle.mm"), 784, @"out of paragraph level bounds");
          }
          if ([v11 count] > (unint64_t)v16) {
            [v11 setObject:a3 atIndexedSubscript:v16];
          }
        }
        uint64_t v13 = [a5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }
  }
  return v11;
}

- (id)overridePropertyMapWithValue:(id)a3 forProperty:(int)a4 atParagraphLevels:(id)a5 withContext:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v11 = objc_alloc_init(TSSPropertyMap);
  switch((int)v8)
  {
    case 180:
      switch([a3 intValue])
      {
        case 0u:
          goto LABEL_9;
        case 1u:
          id v12 = [(TSWPListStyle *)self pOverrideArrayWithValue:[+[TSWPImageBulletProvider sharedInstance] dataForDefaultImageBulletWithContext:a6] forProperty:182 atParagraphLevels:a5 withContext:a6];
          uint64_t v13 = v11;
          uint64_t v14 = 182;
          goto LABEL_8;
        case 2u:
          id v12 = [(TSWPListStyle *)self pOverrideArrayWithValue:+[TSWPListStyle defaultLabelString] forProperty:183 atParagraphLevels:a5 withContext:a6];
          uint64_t v13 = v11;
          uint64_t v14 = 183;
          goto LABEL_8;
        case 3u:
          -[TSSPropertyMap setObject:forProperty:](v11, "setObject:forProperty:", -[TSWPListStyle pOverrideArrayWithValue:forProperty:atParagraphLevels:withContext:](self, "pOverrideArrayWithValue:forProperty:atParagraphLevels:withContext:", objc_msgSend(NSNumber, "numberWithInt:", +[TSWPListStyle defaultLabelNumberType](TSWPListStyle, "defaultLabelNumberType")), 184, a5, a6), 184);
          id v12 = -[TSWPListStyle pOverrideArrayWithValue:forProperty:atParagraphLevels:withContext:](self, "pOverrideArrayWithValue:forProperty:atParagraphLevels:withContext:", objc_msgSend(NSNumber, "numberWithInt:", +[TSWPListStyle defaultTieredNumber](TSWPListStyle, "defaultTieredNumber")), 185, a5, a6);
          uint64_t v13 = v11;
          uint64_t v14 = 185;
          goto LABEL_8;
        default:
          uint64_t v23 = [MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v24 = [NSString stringWithUTF8String:"-[TSWPListStyle overridePropertyMapWithValue:forProperty:atParagraphLevels:withContext:]"];
          uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPListStyle.mm"];
          uint64_t v18 = @"Not covering a list type in inspector setter";
          long long v19 = (void *)v23;
          uint64_t v20 = v24;
          uint64_t v21 = 828;
          goto LABEL_5;
      }
    case 182:
    case 183:
      break;
    case 184:
      [(TSSPropertyMap *)v11 setObject:[(TSWPListStyle *)self pOverrideArrayWithValue:0 forProperty:185 atParagraphLevels:a5 withContext:a6] forProperty:185];
      goto LABEL_7;
    case 185:
LABEL_7:
      id v12 = [(TSWPListStyle *)self pOverrideArrayWithValue:0 forProperty:184 atParagraphLevels:a5 withContext:a6];
      uint64_t v13 = v11;
      uint64_t v14 = 184;
LABEL_8:
      [(TSSPropertyMap *)v13 setObject:v12 forProperty:v14];
      break;
    default:
      uint64_t v15 = [MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v16 = [NSString stringWithUTF8String:"-[TSWPListStyle overridePropertyMapWithValue:forProperty:atParagraphLevels:withContext:]"];
      uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPListStyle.mm"];
      uint64_t v18 = @"Unhandled override property in list";
      long long v19 = (void *)v15;
      uint64_t v20 = v16;
      uint64_t v21 = 849;
LABEL_5:
      [v19 handleFailureInFunction:v20 file:v17 lineNumber:v21 description:v18];
      break;
  }
LABEL_9:
  [(TSSPropertyMap *)v11 setObject:[(TSWPListStyle *)self pOverrideArrayWithValue:a3 forProperty:v8 atParagraphLevels:a5 withContext:a6] forProperty:v8];

  return v11;
}

+ (TSWPListStyle)listStyleWithNumberType:(int)a3 inStyleSheet:(id)a4 withNumberedPresetStyle:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = objc_alloc(NSNumber);
  *(float *)&double v9 = (float)a3;
  uint64_t v10 = (void *)[v8 initWithFloat:v9];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v11 = objc_msgSend(a4, "childrenOfStyle:", a5, 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(TSWPListStyle **)(*((void *)&v22 + 1) + 8 * i);
        if ([(TSWPListStyle *)v16 effectiveTypeForLevel:0] == 3)
        {
          id v17 = [(TSSStyle *)v16 valueForProperty:184];
          uint64_t v18 = 0;
          while ((objc_msgSend((id)objc_msgSend(v17, "objectAtIndexedSubscript:", v18), "isEqual:", v10) & 1) != 0)
          {
            if (++v18 == 9) {
              goto LABEL_16;
            }
          }
        }
        else
        {
          long long v19 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v20 = [NSString stringWithUTF8String:"+[TSWPListStyle listStyleWithNumberType:inStyleSheet:withNumberedPresetStyle:]"];
          objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPListStyle.mm"), 871, @"Expected numbered list style");
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      uint64_t v16 = 0;
    }
    while (v13);
  }
  else
  {
    uint64_t v16 = 0;
  }
LABEL_16:

  return v16;
}

+ (id)propertyMapForListNumberType:(int)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = (float)a3;
  uint64_t v7 = (void *)[v5 initWithFloat:v6];
  id v8 = objc_alloc_init(TSSPropertyMap);
  -[TSSPropertyMap setObject:forProperty:](v8, "setObject:forProperty:", [a1 pLabelTypeArrayForType:3], 180);
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  int v11 = 9;
  uint64_t v12 = MEMORY[0x263EFFA80];
  do
  {
    [v9 addObject:v7];
    [v10 addObject:v12];
    --v11;
  }
  while (v11);
  [(TSSPropertyMap *)v8 setObject:v9 forProperty:184];
  [(TSSPropertyMap *)v8 setObject:v10 forProperty:185];

  return v8;
}

+ (id)CJKListNameForNumberType:(int)a3
{
  if (a3 > 32)
  {
    switch(a3)
    {
      case '*':
        id v3 = @"Chinese Financial Numerals - Trad.";
        goto LABEL_27;
      case '+':
      case ',':
      case '.':
      case '/':
      case '2':
      case '3':
      case '5':
      case '6':
      case '8':
      case '9':
      case ';':
      case '<':
        return 0;
      case '-':
        id v3 = @"Korean";
        goto LABEL_27;
      case '0':
        id v3 = @"Circled Numbers";
        goto LABEL_27;
      case '1':
        id v3 = @"Arabic";
        goto LABEL_27;
      case '4':
        id v3 = @"Arabic Alpha";
        goto LABEL_27;
      case '7':
        id v3 = @"Arabic Abjad";
        goto LABEL_27;
      case ':':
        id v3 = @"Hebrew Alpha";
        goto LABEL_27;
      case '=':
        id v3 = @"Hebrew Biblical";
        goto LABEL_27;
      default:
        if (a3 == 33)
        {
          id v3 = @"Chinese Numerals - Trad.";
        }
        else
        {
          if (a3 != 39) {
            return 0;
          }
          id v3 = @"Chinese Financial Numerals - Simp.";
        }
        break;
    }
    goto LABEL_27;
  }
  if (a3 <= 20)
  {
    if (a3 == 15)
    {
      id v3 = @"Kanji";
      goto LABEL_27;
    }
    if (a3 == 18)
    {
      id v3 = @"Hiragana";
      goto LABEL_27;
    }
    return 0;
  }
  if (a3 == 21)
  {
    id v3 = @"Katakana";
    goto LABEL_27;
  }
  if (a3 == 27)
  {
    id v3 = @"Katakana Iroha";
    goto LABEL_27;
  }
  if (a3 != 30) {
    return 0;
  }
  id v3 = @"Chinese Numerals - Simp.";
LABEL_27:
  id v5 = (void *)TSWPBundle();

  return (id)[v5 localizedStringForKey:v3 value:&stru_26D688A48 table:@"TSText"];
}

+ (id)pDefaultLabelValuesForLabelTypeProperty:(int)a3
{
  v11[9] = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 182:
      v8[0] = [a1 defaultMissingBulletImage];
      v8[1] = v8[0];
      v8[2] = v8[0];
      v8[3] = v8[0];
      v8[4] = v8[0];
      v8[5] = v8[0];
      v8[6] = v8[0];
      v8[7] = v8[0];
      v8[8] = v8[0];
      id v3 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v4 = v8;
      goto LABEL_7;
    case 183:
      v11[0] = [a1 defaultLabelString];
      v11[1] = v11[0];
      v11[2] = v11[0];
      v11[3] = v11[0];
      v11[4] = v11[0];
      v11[5] = v11[0];
      v11[6] = v11[0];
      v11[7] = v11[0];
      v11[8] = v11[0];
      id v3 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v4 = v11;
      goto LABEL_7;
    case 184:
      v10[0] = objc_msgSend(NSNumber, "numberWithInt:", +[TSWPListStyle defaultLabelNumberType](TSWPListStyle, "defaultLabelNumberType"));
      v10[1] = v10[0];
      v10[2] = v10[0];
      v10[3] = v10[0];
      v10[4] = v10[0];
      v10[5] = v10[0];
      v10[6] = v10[0];
      v10[7] = v10[0];
      v10[8] = v10[0];
      id v3 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v4 = v10;
      goto LABEL_7;
    case 185:
      v9[0] = objc_msgSend(NSNumber, "numberWithInt:", +[TSWPListStyle defaultTieredNumber](TSWPListStyle, "defaultTieredNumber"));
      v9[1] = v9[0];
      v9[2] = v9[0];
      v9[3] = v9[0];
      v9[4] = v9[0];
      v9[5] = v9[0];
      v9[6] = v9[0];
      v9[7] = v9[0];
      v9[8] = v9[0];
      id v3 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v4 = v9;
LABEL_7:
      id result = (id)[v3 arrayWithObjects:v4 count:9];
      break;
    default:
      id v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"+[TSWPListStyle pDefaultLabelValuesForLabelTypeProperty:]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPListStyle.mm"), 1029, @"Unhandled array property in list");
      id result = 0;
      break;
  }
  return result;
}

- (NSString)presetKind
{
  return (NSString *)String;
}

+ (id)presetStyleDescriptor
{
  return @"liststyle";
}

@end