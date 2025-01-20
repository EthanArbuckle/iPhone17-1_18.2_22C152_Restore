@interface TSTCellStyle
+ (id)nonEmphasisCellProperties;
+ (id)properties;
+ (id)propertiesAllowingNSNull;
+ (id)regionStringForTableArea:(unsigned int)a3;
+ (id)styleIDForPreset:(unint64_t)a3 andTableArea:(unsigned int)a4;
+ (id)textStyleIDForPreset:(unint64_t)a3 andTableArea:(unsigned int)a4;
+ (void)initDefaultPropertyMap:(id)a3 forTableArea:(unsigned int)a4 presetIndex:(unint64_t)a5 colors:(id)a6 alternate:(int)a7;
+ (void)p_initBodyRegionPropertyMap:(id)a3 presetIndex:(unint64_t)a4 colors:(id)a5 alternate:(int)a6;
+ (void)p_initFooterRowRegionPropertyMap:(id)a3 presetIndex:(unint64_t)a4 colors:(id)a5 alternate:(int)a6;
+ (void)p_initHeaderColumnRegionPropertyMap:(id)a3 presetIndex:(unint64_t)a4 colors:(id)a5 alternate:(int)a6;
+ (void)p_initHeaderRowRegionPropertyMap:(id)a3 presetIndex:(unint64_t)a4 colors:(id)a5 alternate:(int)a6;
- (SEL)mapThemePropertyMapSelector;
- (void)dealloc;
- (void)validate;
@end

@implementation TSTCellStyle

+ (id)properties
{
  id result = (id)+[TSTCellStyle properties]::sProperties;
  if (!+[TSTCellStyle properties]::sProperties)
  {
    objc_sync_enter(a1);
    if (!+[TSTCellStyle properties]::sProperties)
    {
      v4 = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 896, 897, 898, 899, 900, 901, 902, 903, 904, 0);
      __dmb(0xBu);
      +[TSTCellStyle properties]::sProperties = (uint64_t)v4;
      if (!v4)
      {
        v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v6 = [NSString stringWithUTF8String:"+[TSTCellStyle properties]"];
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCellStyle.mm"), 67, @"Couldn't initialize lazy variable %s", "sProperties");
      }
    }
    objc_sync_exit(a1);
    return (id)+[TSTCellStyle properties]::sProperties;
  }
  return result;
}

+ (id)propertiesAllowingNSNull
{
  id result = (id)+[TSTCellStyle propertiesAllowingNSNull]::s_nullProperties;
  if (!+[TSTCellStyle propertiesAllowingNSNull]::s_nullProperties)
  {
    objc_sync_enter(a1);
    if (!+[TSTCellStyle propertiesAllowingNSNull]::s_nullProperties)
    {
      v4 = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 898, 899, 900, 901, 902, 0);
      __dmb(0xBu);
      +[TSTCellStyle propertiesAllowingNSNull]::s_nullProperties = (uint64_t)v4;
      if (!v4)
      {
        v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v6 = [NSString stringWithUTF8String:"+[TSTCellStyle propertiesAllowingNSNull]"];
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCellStyle.mm"), 83, @"Couldn't initialize lazy variable %s", "s_nullProperties");
      }
    }
    objc_sync_exit(a1);
    return (id)+[TSTCellStyle propertiesAllowingNSNull]::s_nullProperties;
  }
  return result;
}

+ (id)nonEmphasisCellProperties
{
  id result = (id)+[TSTCellStyle nonEmphasisCellProperties]::s_nonEmphasisProperties;
  if (!+[TSTCellStyle nonEmphasisCellProperties]::s_nonEmphasisProperties)
  {
    objc_sync_enter(a1);
    if (!+[TSTCellStyle nonEmphasisCellProperties]::s_nonEmphasisProperties)
    {
      v4 = -[TSSPropertySet initWithProperties:]([TSSPropertySet alloc], "initWithProperties:", 896, 903, 904, 0);
      __dmb(0xBu);
      +[TSTCellStyle nonEmphasisCellProperties]::s_nonEmphasisProperties = (uint64_t)v4;
      if (!v4)
      {
        v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v6 = [NSString stringWithUTF8String:"+[TSTCellStyle nonEmphasisCellProperties]"];
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCellStyle.mm"), 98, @"Couldn't initialize lazy variable %s", "s_nonEmphasisProperties");
      }
    }
    objc_sync_exit(a1);
    return (id)+[TSTCellStyle nonEmphasisCellProperties]::s_nonEmphasisProperties;
  }
  return result;
}

+ (id)regionStringForTableArea:(unsigned int)a3
{
  if (a3 < 6) {
    return off_2646B3C10[a3];
  }
  v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v5 = [NSString stringWithUTF8String:"+[TSTCellStyle regionStringForTableArea:]"];
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCellStyle.mm"), 129, @"Unexpected value for region.");
  return 0;
}

+ (id)styleIDForPreset:(unint64_t)a3 andTableArea:(unsigned int)a4
{
  uint64_t v5 = [a1 regionStringForTableArea:*(void *)&a4];

  return (id)String(@"tableCell", a3, v5);
}

+ (id)textStyleIDForPreset:(unint64_t)a3 andTableArea:(unsigned int)a4
{
  uint64_t v5 = TSTTextStylePrefix;
  uint64_t v6 = [a1 regionStringForTableArea:*(void *)&a4];

  return (id)String((uint64_t)v5, a3, v6);
}

+ (void)p_initBodyRegionPropertyMap:(id)a3 presetIndex:(unint64_t)a4 colors:(id)a5 alternate:(int)a6
{
  if (a6 <= 6 && ((1 << a6) & 0x54) != 0) {
    id v7 = +[TSDColorFill blackColor];
  }
  else {
    id v7 = +[TSDColorFill whiteColor];
  }

  [a3 setObject:v7 forProperty:898];
}

+ (void)p_initHeaderRowRegionPropertyMap:(id)a3 presetIndex:(unint64_t)a4 colors:(id)a5 alternate:(int)a6
{
  if (a5) {
    id v7 = +[TSDColorFill colorWithColor:](TSDColorFill, "colorWithColor:", [a5 objectAtIndex:s_TableStyleFills[4 * a4 + 1]]);
  }
  else {
    id v7 = +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", a3, a4, 0, *(void *)&a6, 0.921500027, 0.921500027, 0.921500027, 1.0);
  }

  [a3 setObject:v7 forProperty:898];
}

+ (void)p_initHeaderColumnRegionPropertyMap:(id)a3 presetIndex:(unint64_t)a4 colors:(id)a5 alternate:(int)a6
{
  if (a5) {
    id v7 = +[TSDColorFill colorWithColor:](TSDColorFill, "colorWithColor:", [a5 objectAtIndex:s_TableStyleFills[4 * a4 + 2]]);
  }
  else {
    id v7 = +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", a3, a4, 0, *(void *)&a6, 0.921500027, 0.921500027, 0.921500027, 1.0);
  }

  [a3 setObject:v7 forProperty:898];
}

+ (void)p_initFooterRowRegionPropertyMap:(id)a3 presetIndex:(unint64_t)a4 colors:(id)a5 alternate:(int)a6
{
  if (a5) {
    id v7 = +[TSDColorFill colorWithColor:](TSDColorFill, "colorWithColor:", [a5 objectAtIndex:s_TableStyleFills[4 * a4 + 3]]);
  }
  else {
    id v7 = +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", a3, a4, 0, *(void *)&a6, 235.0, 235.0, 235.0, 1.0);
  }

  [a3 setObject:v7 forProperty:898];
}

+ (void)initDefaultPropertyMap:(id)a3 forTableArea:(unsigned int)a4 presetIndex:(unint64_t)a5 colors:(id)a6 alternate:(int)a7
{
  switch(a4)
  {
    case 0u:
      objc_msgSend(a1, "p_initBodyRegionPropertyMap:presetIndex:colors:alternate:", a3, a5, a6, *(void *)&a7);
      break;
    case 1u:
      objc_msgSend(a1, "p_initHeaderRowRegionPropertyMap:presetIndex:colors:alternate:", a3, a5, a6, *(void *)&a7);
      break;
    case 2u:
      objc_msgSend(a1, "p_initHeaderColumnRegionPropertyMap:presetIndex:colors:alternate:", a3, a5, a6, *(void *)&a7);
      break;
    case 3u:
      objc_msgSend(a1, "p_initFooterRowRegionPropertyMap:presetIndex:colors:alternate:", a3, a5, a6, *(void *)&a7);
      break;
    case 4u:
    case 5u:
      uint64_t v7 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
      uint64_t v8 = [NSString stringWithUTF8String:"+[TSTCellStyle initDefaultPropertyMap:forTableArea:presetIndex:colors:alternate:]"];
      uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCellStyle.mm"];
      v10 = @"there is no style for the corner cells";
      uint64_t v11 = v9;
      v12 = (void *)v7;
      uint64_t v13 = v8;
      uint64_t v14 = 258;
      goto LABEL_4;
    default:
      uint64_t v15 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
      uint64_t v16 = [NSString stringWithUTF8String:"+[TSTCellStyle initDefaultPropertyMap:forTableArea:presetIndex:colors:alternate:]"];
      uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCellStyle.mm"];
      v10 = @"Unexpected value for region.";
      uint64_t v11 = v17;
      v12 = (void *)v15;
      uint64_t v13 = v16;
      uint64_t v14 = 261;
LABEL_4:
      [v12 handleFailureInFunction:v13 file:v11 lineNumber:v14 description:v10];
      break;
  }
}

- (void)validate
{
  if (![(TSSStyle *)self stylesheet])
  {
    v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSTCellStyle validate]"];
    [v3 handleFailureInFunction:v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCellStyle.mm"), 373, @"orphaned cell style %@", self file lineNumber description];
  }
  if (![(TSSStylesheet *)[(TSSStyle *)self stylesheet] containsStyle:self]
    || (uint64_t v5 = [(TSSStyle *)self stylesheet], v5 != [(TSSStyle *)self stylesheet]))
  {
    uint64_t v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSTCellStyle validate]"];
    uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCellStyle.mm"];
    [v6 handleFailureInFunction:v7 file:v8 lineNumber:375 description:@"Cell style not in its stylesheet"];
  }
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)TSTCellStyle;
  [(TSSStyle *)&v2 dealloc];
}

- (SEL)mapThemePropertyMapSelector
{
  return sel_tstMapCellStylePropertyMap_;
}

@end