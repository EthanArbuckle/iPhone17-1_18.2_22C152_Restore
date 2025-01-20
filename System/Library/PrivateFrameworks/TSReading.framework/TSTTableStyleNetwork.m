@interface TSTTableStyleNetwork
+ (id)createStylesInStylesheet:(id)a3 presetIndex:(unint64_t)a4 colors:(id)a5 alternate:(int)a6;
+ (id)defaultTableNameShapeStyleWithContext:(id)a3;
+ (id)identifiersForPresetIndex:(unint64_t)a3;
+ (id)networkFromStylesheet:(id)a3 presetIndex:(unint64_t)a4;
+ (id)networkFromTableModel:(id)a3;
+ (id)networkFromTheme:(id)a3 presetIndex:(unint64_t)a4;
+ (id)networkWithContext:(id)a3 presetIndex:(unint64_t)a4 colors:(id)a5 alternate:(int)a6;
+ (id)tableNameShapeStyleIDForPreset:(unint64_t)a3;
+ (id)tableNameStyleIDForPreset:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)stylesInStylesheet:(id)a3;
- (BOOL)valid;
- (TSTCellStyle)bodyCellStyle;
- (TSTCellStyle)footerRowCellStyle;
- (TSTCellStyle)headerColumnCellStyle;
- (TSTCellStyle)headerRowCellStyle;
- (TSTTableStyle)tableStyle;
- (TSTTableStyleNetwork)initWithContext:(id)a3;
- (TSTTableStyleNetwork)initWithContext:(id)a3 fromArray:(id)a4 presetIndex:(unint64_t)a5;
- (TSTTableStyleNetwork)initWithContext:(id)a3 fromDictionary:(id)a4 withPreset:(unint64_t)a5;
- (TSWPParagraphStyle)bodyTextStyle;
- (TSWPParagraphStyle)footerRowTextStyle;
- (TSWPParagraphStyle)headerColumnTextStyle;
- (TSWPParagraphStyle)headerRowTextStyle;
- (TSWPParagraphStyle)tableNameStyle;
- (TSWPShapeStyle)tableNameShapeStyle;
- (id)cellStyleForTableArea:(unsigned int)a3;
- (id)copy;
- (id)copyWithContext:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyWithZone:(_NSZone *)a3 context:(id)a4;
- (id)dictionaryWithPreset:(unint64_t)a3;
- (id)styleArray;
- (id)textStyleForTableArea:(unsigned int)a3;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (unint64_t)presetIndex;
- (void)dealloc;
- (void)setBodyCellStyle:(id)a3;
- (void)setBodyTextStyle:(id)a3;
- (void)setCellStyle:(id)a3 forTableArea:(unsigned int)a4;
- (void)setFooterRowCellStyle:(id)a3;
- (void)setFooterRowTextStyle:(id)a3;
- (void)setHeaderColumnCellStyle:(id)a3;
- (void)setHeaderColumnTextStyle:(id)a3;
- (void)setHeaderRowCellStyle:(id)a3;
- (void)setHeaderRowTextStyle:(id)a3;
- (void)setPresetIndex:(unint64_t)a3;
- (void)setStylesFromTableModel:(id)a3;
- (void)setTableNameShapeStyle:(id)a3;
- (void)setTableNameStyle:(id)a3;
- (void)setTableStyle:(id)a3;
- (void)setTextStyle:(id)a3 forTableArea:(unsigned int)a4;
@end

@implementation TSTTableStyleNetwork

- (TSTTableStyle)tableStyle
{
  return self->mTableStyle;
}

- (void)setTableStyle:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = a3;

  self->mTableStyle = (TSTTableStyle *)a3;
}

- (TSTCellStyle)bodyCellStyle
{
  return self->mBodyCellStyle;
}

- (void)setBodyCellStyle:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = a3;

  self->mBodyCellStyle = (TSTCellStyle *)a3;
}

- (TSTCellStyle)headerColumnCellStyle
{
  return self->mHeaderColumnCellStyle;
}

- (void)setHeaderColumnCellStyle:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = a3;

  self->mHeaderColumnCellStyle = (TSTCellStyle *)a3;
}

- (TSTCellStyle)footerRowCellStyle
{
  return self->mFooterRowCellStyle;
}

- (void)setFooterRowCellStyle:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = a3;

  self->mFooterRowCellStyle = (TSTCellStyle *)a3;
}

- (TSTCellStyle)headerRowCellStyle
{
  return self->mHeaderRowCellStyle;
}

- (void)setHeaderRowCellStyle:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = a3;

  self->mHeaderRowCellStyle = (TSTCellStyle *)a3;
}

- (TSWPParagraphStyle)bodyTextStyle
{
  return self->mBodyTextStyle;
}

- (void)setBodyTextStyle:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = a3;

  self->mBodyTextStyle = (TSWPParagraphStyle *)a3;
}

- (TSWPParagraphStyle)headerColumnTextStyle
{
  return self->mHeaderColumnTextStyle;
}

- (void)setHeaderColumnTextStyle:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = a3;

  self->mHeaderColumnTextStyle = (TSWPParagraphStyle *)a3;
}

- (TSWPParagraphStyle)footerRowTextStyle
{
  return self->mFooterRowTextStyle;
}

- (void)setFooterRowTextStyle:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = a3;

  self->mFooterRowTextStyle = (TSWPParagraphStyle *)a3;
}

- (TSWPParagraphStyle)headerRowTextStyle
{
  return self->mHeaderRowTextStyle;
}

- (void)setHeaderRowTextStyle:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = a3;

  self->mHeaderRowTextStyle = (TSWPParagraphStyle *)a3;
}

- (TSWPParagraphStyle)tableNameStyle
{
  return self->mTableNameStyle;
}

- (void)setTableNameStyle:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = a3;

  self->mTableNameStyle = (TSWPParagraphStyle *)a3;
}

- (TSWPShapeStyle)tableNameShapeStyle
{
  return self->mTableNameShapeStyle;
}

- (void)setTableNameShapeStyle:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = a3;

  self->mTableNameShapeStyle = (TSWPShapeStyle *)a3;
}

- (unint64_t)presetIndex
{
  return self->mPresetIndex;
}

- (void)setPresetIndex:(unint64_t)a3
{
  self->mPresetIndex = a3;
}

+ (id)networkFromTableModel:(id)a3
{
  v4 = -[TSTTableStyleNetwork initWithContext:]([TSTTableStyleNetwork alloc], "initWithContext:", [a3 context]);
  [(TSTTableStyleNetwork *)v4 setStylesFromTableModel:a3];
  -[TSTTableStyleNetwork setPresetIndex:](v4, "setPresetIndex:", [a3 presetIndex]);

  return v4;
}

+ (id)networkWithContext:(id)a3 presetIndex:(unint64_t)a4 colors:(id)a5 alternate:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  v10 = [[TSTTableStyleNetwork alloc] initWithContext:a3];
  v11 = objc_alloc_init(TSSPropertyMap);
  +[TSTTableStyle initDefaultPropertyMap:v11 presetIndex:a4 colors:a5 alternate:v6];
  v12 = [[TSTTableStyle alloc] initWithContext:a3 name:0 overridePropertyMap:v11 isVariation:0];

  [(TSTTableStyleNetwork *)v10 setTableStyle:v12];
  uint64_t v13 = 0;
  do
  {
    v14 = objc_alloc_init(TSSPropertyMap);
    +[TSTCellStyle initDefaultPropertyMap:v14 forTableArea:v13 presetIndex:a4 colors:a5 alternate:v6];
    v15 = [(TSSStyle *)[TSTCellStyle alloc] initWithContext:a3 name:0 overridePropertyMap:v14 isVariation:0];
    [(TSTTableStyleNetwork *)v10 setCellStyle:v15 forTableArea:v13];

    id v16 = +[TSWPParagraphStyle defaultStyleWithContext:a3];
    objc_msgSend(v16, "setValue:forProperty:", +[TSWPParagraphStyle defaultValueForProperty:](TSWPParagraphStyle, "defaultValueForProperty:", 16), 16);
    [v16 setCGFloatValue:17 forProperty:15.0];
    [(TSTTableStyleNetwork *)v10 setTextStyle:v16 forTableArea:v13];
    uint64_t v13 = (v13 + 1);
  }
  while (v13 != 4);
  id v17 = +[TSWPParagraphStyle defaultStyleWithContext:a3];
  objc_msgSend(v17, "setValue:forProperty:", +[TSWPParagraphStyle defaultValueForProperty:](TSWPParagraphStyle, "defaultValueForProperty:", 16), 16);
  [v17 setCGFloatValue:17 forProperty:15.0];
  [(TSTTableStyleNetwork *)v10 setTableNameStyle:v17];
  [(TSTTableStyleNetwork *)v10 setPresetIndex:a4];

  return v10;
}

+ (id)createStylesInStylesheet:(id)a3 presetIndex:(unint64_t)a4 colors:(id)a5 alternate:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v10 = [a3 context];
  v11 = objc_alloc_init(TSSPropertyMap);
  id v25 = a5;
  +[TSTTableStyle initDefaultPropertyMap:v11 presetIndex:a4 colors:a5 alternate:v6];
  objc_msgSend(a3, "addStyle:withIdentifier:", -[TSTTableStyle initWithContext:name:overridePropertyMap:isVariation:]([TSTTableStyle alloc], "initWithContext:name:overridePropertyMap:isVariation:", v10, 0, v11, 0), +[TSTTableStyle styleIDForPreset:](TSTTableStyle, "styleIDForPreset:", a4));

  uint64_t v12 = 0;
  unsigned int v26 = v6;
  BOOL v14 = v6 == 2 || (v6 & 0xFFFFFFFD) == 4;
  char v24 = !v14;
  do
  {
    id v15 = +[TSTCellStyle styleIDForPreset:a4 andTableArea:v12];
    id v16 = +[TSTCellStyle textStyleIDForPreset:a4 andTableArea:v12];
    id v17 = objc_alloc_init(TSSPropertyMap);
    +[TSTCellStyle initDefaultPropertyMap:v17 forTableArea:v12 presetIndex:a4 colors:v25 alternate:v26];
    v18 = [(TSSStyle *)[TSTCellStyle alloc] initWithContext:v10 name:0 overridePropertyMap:v17 isVariation:0];
    id v19 = +[TSWPParagraphStyle defaultStyleWithContext:v10];
    objc_msgSend(v19, "setValue:forProperty:", +[TSWPParagraphStyle defaultValueForProperty:](TSWPParagraphStyle, "defaultValueForProperty:", 16), 16);
    [v19 setCGFloatValue:17 forProperty:15.0];
    [v19 setCGFloatValue:81 forProperty:0.0];
    if (v12) {
      char v20 = 1;
    }
    else {
      char v20 = v24;
    }
    if ((v20 & 1) == 0) {
      objc_msgSend(v19, "setValue:forProperty:", objc_msgSend(MEMORY[0x263F7C808], "whiteColor"), 18);
    }
    [a3 addStyle:v18 withIdentifier:v15];
    [a3 addStyle:v19 withIdentifier:v16];

    uint64_t v12 = (v12 + 1);
  }
  while (v12 != 4);
  id v21 = +[TSWPParagraphStyle defaultStyleWithContext:v10];
  objc_msgSend(v21, "setValue:forProperty:", +[TSWPParagraphStyle defaultValueForProperty:](TSWPParagraphStyle, "defaultValueForProperty:", 16), 16);
  [v21 setCGFloatValue:17 forProperty:15.0];
  objc_msgSend(a3, "addStyle:withIdentifier:", v21, +[TSTTableStyleNetwork tableNameStyleIDForPreset:](TSTTableStyleNetwork, "tableNameStyleIDForPreset:", a4));
  objc_msgSend(a3, "addStyle:withIdentifier:", +[TSTTableStyleNetwork defaultTableNameShapeStyleWithContext:](TSTTableStyleNetwork, "defaultTableNameShapeStyleWithContext:", v10), +[TSTTableStyleNetwork tableNameShapeStyleIDForPreset:](TSTTableStyleNetwork, "tableNameShapeStyleIDForPreset:", a4));

  return (id)[a1 networkFromStylesheet:a3 presetIndex:a4];
}

+ (id)networkFromStylesheet:(id)a3 presetIndex:(unint64_t)a4
{
  uint64_t v6 = -[TSTTableStyleNetwork initWithContext:]([TSTTableStyleNetwork alloc], "initWithContext:", [a3 context]);
  uint64_t v7 = objc_msgSend(a3, "cascadedStyleWithIdentifier:", +[TSTTableStyle styleIDForPreset:](TSTTableStyle, "styleIDForPreset:", a4));
  if (v7)
  {
    [(TSTTableStyleNetwork *)v6 setTableStyle:v7];
    objc_opt_class();
    objc_msgSend(a3, "cascadedStyleWithIdentifier:", +[TSTTableStyleNetwork tableNameStyleIDForPreset:](TSTTableStyleNetwork, "tableNameStyleIDForPreset:", a4));
    uint64_t v8 = TSUDynamicCast();
    if (!v8)
    {
      v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v10 = [NSString stringWithUTF8String:"+[TSTTableStyleNetwork networkFromStylesheet:presetIndex:]"];
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyleNetwork.mm"), 244, @"invalid nil value for '%s'", "nameStyle");
    }
    [(TSTTableStyleNetwork *)v6 setTableNameStyle:v8];
    objc_opt_class();
    objc_msgSend(a3, "cascadedStyleWithIdentifier:", +[TSTTableStyleNetwork tableNameShapeStyleIDForPreset:](TSTTableStyleNetwork, "tableNameShapeStyleIDForPreset:", a4));
    uint64_t v11 = TSUDynamicCast();
    if (!v11)
    {
      uint64_t v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v13 = [NSString stringWithUTF8String:"+[TSTTableStyleNetwork networkFromStylesheet:presetIndex:]"];
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyleNetwork.mm"), 251, @"invalid nil value for '%s'", "tableNameShapeStyle");
    }
    [(TSTTableStyleNetwork *)v6 setTableNameShapeStyle:v11];
    uint64_t v14 = 0;
    do
    {
      id v15 = +[TSTCellStyle styleIDForPreset:a4 andTableArea:v14];
      uint64_t v16 = [a3 cascadedStyleWithIdentifier:v15];
      if (!v16)
      {
        id v21 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v22 = [NSString stringWithUTF8String:"+[TSTTableStyleNetwork networkFromStylesheet:presetIndex:]"];
        [v21 handleFailureInFunction:v22, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyleNetwork.mm"), 261, @"no default cell style for id %@ in stylesheet %p", v15, a3 file lineNumber description];
        return 0;
      }
      [(TSTTableStyleNetwork *)v6 setCellStyle:v16 forTableArea:v14];
      uint64_t v17 = objc_msgSend(a3, "cascadedStyleWithIdentifier:", +[TSTCellStyle textStyleIDForPreset:andTableArea:](TSTCellStyle, "textStyleIDForPreset:andTableArea:", a4, v14));
      if (!v17)
      {
        v23 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v24 = [NSString stringWithUTF8String:"+[TSTTableStyleNetwork networkFromStylesheet:presetIndex:]"];
        [v23 handleFailureInFunction:v24, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyleNetwork.mm"), 271, @"no default cell style for id %@ in stylesheet %p", v15, a3 file lineNumber description];
        return 0;
      }
      [(TSTTableStyleNetwork *)v6 setTextStyle:v17 forTableArea:v14];
      uint64_t v14 = (v14 + 1);
    }
    while (v14 != 4);
    [(TSTTableStyleNetwork *)v6 setPresetIndex:a4];
    return v6;
  }
  else
  {
    id v19 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v20 = [NSString stringWithUTF8String:"+[TSTTableStyleNetwork networkFromStylesheet:presetIndex:]"];
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyleNetwork.mm"), 232, @"no default table style in stylesheet %p", a3, v25);
    return 0;
  }
}

+ (id)networkFromTheme:(id)a3 presetIndex:(unint64_t)a4
{
  if (!a3)
  {
    uint64_t v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"+[TSTTableStyleNetwork networkFromTheme:presetIndex:]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyleNetwork.mm"), 285, @"invalid nil value for '%s'", "theme");
  }
  objc_opt_class();
  [a3 presetOfKind:String index:a4];
  uint64_t v8 = (void *)TSUDynamicCast();

  return (id)[v8 styleNetwork];
}

+ (id)tableNameStyleIDForPreset:(unint64_t)a3
{
  return (id)String((uint64_t)TSTTableNameStylePrefix[0], a3, @"textStyle");
}

+ (id)tableNameShapeStyleIDForPreset:(unint64_t)a3
{
  return (id)String(@"tableName", a3, @"shapeStyle");
}

+ (id)defaultTableNameShapeStyleWithContext:(id)a3
{
  id v3 = +[TSSStyle defaultStyleWithContext:a3];
  [v3 setIntValue:1 forProperty:149];
  objc_msgSend(v3, "setValue:forProperty:", +[TSDStroke emptyStroke](TSDStroke, "emptyStroke"), 517);
  objc_msgSend(v3, "setValue:forProperty:", +[TSWPPadding padding](TSWPPadding, "padding"), 146);
  return v3;
}

- (TSTTableStyleNetwork)initWithContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSTTableStyleNetwork;
  return [(TSPObject *)&v4 initWithContext:a3];
}

- (TSTTableStyleNetwork)initWithContext:(id)a3 fromArray:(id)a4 presetIndex:(unint64_t)a5
{
  v21[11] = *MEMORY[0x263EF8340];
  uint64_t v7 = [(TSTTableStyleNetwork *)self initWithContext:a3];
  if ([a4 count] != 11)
  {
    uint64_t v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSTTableStyleNetwork initWithContext:fromArray:presetIndex:]"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyleNetwork.mm"), 330, @"expected equality between %s and %s", "[array count]", "11");
  }
  if (v7)
  {
    v21[0] = &v7->mTableStyle;
    v21[1] = &v7->mHeaderRowCellStyle;
    v21[2] = &v7->mHeaderColumnCellStyle;
    v21[3] = &v7->mFooterRowCellStyle;
    v21[4] = &v7->mBodyCellStyle;
    v21[5] = &v7->mHeaderRowTextStyle;
    v21[6] = &v7->mHeaderColumnTextStyle;
    v21[7] = &v7->mFooterRowTextStyle;
    v21[8] = &v7->mBodyTextStyle;
    v21[9] = &v7->mTableNameStyle;
    v21[10] = &v7->mTableNameShapeStyle;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v10 = [a4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(a4);
          }
          *(void *)v21[v12 + v14] = *(id *)(*((void *)&v16 + 1) + 8 * v14);
          ++v14;
        }
        while (v11 != v14);
        uint64_t v11 = [a4 countByEnumeratingWithState:&v16 objects:v20 count:16];
        v12 += v14;
      }
      while (v11);
    }
    v7->mPresetIndex = a5;
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3 context:(id)a4
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithContext:", a4);
  if (v5)
  {
    v5[7] = self->mTableStyle;
    v5[8] = self->mHeaderRowCellStyle;
    v5[9] = self->mHeaderColumnCellStyle;
    v5[10] = self->mFooterRowCellStyle;
    v5[11] = self->mBodyCellStyle;
    v5[12] = self->mHeaderRowTextStyle;
    v5[13] = self->mHeaderColumnTextStyle;
    v5[14] = self->mFooterRowTextStyle;
    v5[15] = self->mBodyTextStyle;
    v5[16] = self->mTableNameStyle;
    v5[17] = self->mTableNameShapeStyle;
    v5[6] = self->mPresetIndex;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [(TSPObject *)self context];

  return [(TSTTableStyleNetwork *)self copyWithZone:a3 context:v5];
}

- (id)copyWithContext:(id)a3
{
  return [(TSTTableStyleNetwork *)self copyWithZone:0 context:a3];
}

- (id)copy
{
  id v3 = [(TSPObject *)self context];

  return [(TSTTableStyleNetwork *)self copyWithZone:0 context:v3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSTTableStyleNetwork;
  [(TSTTableStyleNetwork *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  uint64_t v4 = TSUDynamicCast();
  if (v4)
  {
    id v5 = (void *)v4;
    unint64_t v6 = [(TSTTableStyleNetwork *)self presetIndex];
    if (v6 != [v5 presetIndex]) {
      goto LABEL_14;
    }
    uint64_t v7 = [(TSTTableStyleNetwork *)self tableStyle];
    if (v7 != (TSTTableStyle *)[v5 tableStyle]) {
      goto LABEL_14;
    }
    uint64_t v8 = [(TSTTableStyleNetwork *)self bodyCellStyle];
    if (v8 != (TSTCellStyle *)[v5 bodyCellStyle]) {
      goto LABEL_14;
    }
    uint64_t v9 = [(TSTTableStyleNetwork *)self headerColumnCellStyle];
    if (v9 != (TSTCellStyle *)[v5 headerColumnCellStyle]) {
      goto LABEL_14;
    }
    uint64_t v10 = [(TSTTableStyleNetwork *)self footerRowCellStyle];
    if (v10 != (TSTCellStyle *)[v5 footerRowCellStyle]) {
      goto LABEL_14;
    }
    uint64_t v11 = [(TSTTableStyleNetwork *)self headerRowCellStyle];
    if (v11 == (TSTCellStyle *)[v5 headerRowCellStyle]
      && (uint64_t v12 = [(TSTTableStyleNetwork *)self bodyTextStyle],
          v12 == (TSWPParagraphStyle *)[v5 bodyTextStyle])
      && (uint64_t v13 = [(TSTTableStyleNetwork *)self headerColumnTextStyle],
          v13 == (TSWPParagraphStyle *)[v5 headerColumnTextStyle])
      && (uint64_t v14 = [(TSTTableStyleNetwork *)self footerRowTextStyle],
          v14 == (TSWPParagraphStyle *)[v5 footerRowTextStyle])
      && (id v15 = [(TSTTableStyleNetwork *)self headerRowTextStyle],
          v15 == (TSWPParagraphStyle *)[v5 headerRowTextStyle])
      && (long long v16 = [(TSTTableStyleNetwork *)self tableNameStyle],
          v16 == (TSWPParagraphStyle *)[v5 tableNameStyle])
      && (long long v17 = [(TSTTableStyleNetwork *)self tableNameShapeStyle],
          v17 == (TSWPShapeStyle *)[v5 tableNameShapeStyle]))
    {
      LOBYTE(v4) = 1;
    }
    else
    {
LABEL_14:
      LODWORD(v4) = -[TSSStyle hasEqualValues:forProperties:](self->mTableStyle, "hasEqualValues:forProperties:", [v5 tableStyle], +[TSSPropertySet propertySetWithProperties:](TSSPropertySet, "propertySetWithProperties:", 768, 769, 770, 771, 772, 773, 774, 775, 776, 777, 778, 779, 780,
                        781,
                        782,
                        783,
                        784,
                        785,
                        786,
                        788,
                        789,
                        791,
                        793,
                        795,
                        796,
                        797,
                        0));
      if (v4)
      {
        LODWORD(v4) = -[TSSStyle overridePropertyMapIsEqualTo:](self->mHeaderRowCellStyle, "overridePropertyMapIsEqualTo:", objc_msgSend((id)objc_msgSend(v5, "headerRowCellStyle"), "overridePropertyMap"));
        if (v4)
        {
          LODWORD(v4) = -[TSSStyle overridePropertyMapIsEqualTo:](self->mHeaderColumnCellStyle, "overridePropertyMapIsEqualTo:", objc_msgSend((id)objc_msgSend(v5, "headerColumnCellStyle"), "overridePropertyMap"));
          if (v4)
          {
            LODWORD(v4) = -[TSSStyle overridePropertyMapIsEqualTo:](self->mFooterRowCellStyle, "overridePropertyMapIsEqualTo:", objc_msgSend((id)objc_msgSend(v5, "footerRowCellStyle"), "overridePropertyMap"));
            if (v4)
            {
              LODWORD(v4) = -[TSSStyle overridePropertyMapIsEqualTo:](self->mBodyCellStyle, "overridePropertyMapIsEqualTo:", objc_msgSend((id)objc_msgSend(v5, "bodyCellStyle"), "overridePropertyMap"));
              if (v4)
              {
                LODWORD(v4) = -[TSSStyle overridePropertyMapIsEqualTo:](self->mHeaderRowTextStyle, "overridePropertyMapIsEqualTo:", objc_msgSend((id)objc_msgSend(v5, "headerRowTextStyle"), "overridePropertyMap"));
                if (v4)
                {
                  LODWORD(v4) = -[TSSStyle overridePropertyMapIsEqualTo:](self->mHeaderColumnTextStyle, "overridePropertyMapIsEqualTo:", objc_msgSend((id)objc_msgSend(v5, "headerColumnTextStyle"), "overridePropertyMap"));
                  if (v4)
                  {
                    LODWORD(v4) = -[TSSStyle overridePropertyMapIsEqualTo:](self->mFooterRowTextStyle, "overridePropertyMapIsEqualTo:", objc_msgSend((id)objc_msgSend(v5, "footerRowTextStyle"), "overridePropertyMap"));
                    if (v4)
                    {
                      mBodyTextStyle = self->mBodyTextStyle;
                      uint64_t v19 = objc_msgSend((id)objc_msgSend(v5, "bodyTextStyle"), "overridePropertyMap");
                      LOBYTE(v4) = [(TSSStyle *)mBodyTextStyle overridePropertyMapIsEqualTo:v19];
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v4;
}

- (unint64_t)hash
{
  objc_super v3 = (objc_class *)objc_opt_class();
  return self->mPresetIndex + [NSStringFromClass(v3) hash];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v15[11] = *MEMORY[0x263EF8340];
  mHeaderRowCellStyle = self->mHeaderRowCellStyle;
  v15[0] = self->mTableStyle;
  v15[1] = mHeaderRowCellStyle;
  mFooterRowCellStyle = self->mFooterRowCellStyle;
  v15[2] = self->mHeaderColumnCellStyle;
  v15[3] = mFooterRowCellStyle;
  mHeaderRowTextStyle = self->mHeaderRowTextStyle;
  v15[4] = self->mBodyCellStyle;
  v15[5] = mHeaderRowTextStyle;
  mFooterRowTextStyle = self->mFooterRowTextStyle;
  v15[6] = self->mHeaderColumnTextStyle;
  v15[7] = mFooterRowTextStyle;
  mTableNameStyle = self->mTableNameStyle;
  v15[8] = self->mBodyTextStyle;
  v15[9] = mTableNameStyle;
  unint64_t var0 = a3->var0;
  if (11 - a3->var0 >= a5) {
    unint64_t v11 = a5;
  }
  else {
    unint64_t v11 = 11 - a3->var0;
  }
  v15[10] = self->mTableNameShapeStyle;
  if (v11)
  {
    memcpy(a4, &v15[var0], 8 * v11);
    a3->var0 += v11;
    a3->var1 = a4;
    a3->var2 = (unint64_t *)&a3->var2;
  }
  return v11;
}

+ (id)identifiersForPresetIndex:(unint64_t)a3
{
  objc_super v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", +[TSTTableStyle styleIDForPreset:](TSTTableStyle, "styleIDForPreset:", a3), +[TSTCellStyle styleIDForPreset:andTableArea:](TSTCellStyle, "styleIDForPreset:andTableArea:", a3, 1), +[TSTCellStyle styleIDForPreset:andTableArea:](TSTCellStyle, "styleIDForPreset:andTableArea:", a3, 2), +[TSTCellStyle styleIDForPreset:andTableArea:](TSTCellStyle, "styleIDForPreset:andTableArea:", a3, 3), +[TSTCellStyle styleIDForPreset:andTableArea:](
                   TSTCellStyle,
                   "styleIDForPreset:andTableArea:",
                   a3,
                   0),
                 +[TSTCellStyle textStyleIDForPreset:andTableArea:](TSTCellStyle, "textStyleIDForPreset:andTableArea:", a3, 1), +[TSTCellStyle textStyleIDForPreset:andTableArea:](TSTCellStyle, "textStyleIDForPreset:andTableArea:", a3, 2), +[TSTCellStyle textStyleIDForPreset:andTableArea:](TSTCellStyle, "textStyleIDForPreset:andTableArea:", a3, 3), +[TSTCellStyle textStyleIDForPreset:a3 andTableArea:0],
                 +[TSTTableStyleNetwork tableNameStyleIDForPreset:](TSTTableStyleNetwork, "tableNameStyleIDForPreset:", a3), +[TSTTableStyleNetwork tableNameShapeStyleIDForPreset:a3], 0);

  return v3;
}

- (BOOL)stylesInStylesheet:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = [(TSPObject *)self context];
  if (v5 == (TSPObjectContext *)[a3 context])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    unint64_t v7 = [(TSTTableStyleNetwork *)self countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      unint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
LABEL_6:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(self);
        }
        unint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
        int v6 = [a3 containsStyle:v11];
        if (!v6) {
          break;
        }
        if ((id)[v11 stylesheet] != a3) {
          goto LABEL_2;
        }
        if (v8 == ++v10)
        {
          unint64_t v8 = [(TSTTableStyleNetwork *)self countByEnumeratingWithState:&v13 objects:v17 count:16];
          LOBYTE(v6) = 1;
          if (v8) {
            goto LABEL_6;
          }
          return v6;
        }
      }
    }
    else
    {
      LOBYTE(v6) = 1;
    }
  }
  else
  {
LABEL_2:
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (id)cellStyleForTableArea:(unsigned int)a3
{
  switch(a3)
  {
    case 0u:
      uint64_t v3 = 88;
      goto LABEL_7;
    case 1u:
    case 4u:
      uint64_t v3 = 64;
      goto LABEL_7;
    case 2u:
      uint64_t v3 = 72;
      goto LABEL_7;
    case 3u:
    case 5u:
      uint64_t v3 = 80;
LABEL_7:
      id result = *(Class *)((char *)&self->super.super.isa + v3);
      break;
    default:
      uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"-[TSTTableStyleNetwork cellStyleForTableArea:]"];
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyleNetwork.mm"), 581, @"illegal table region in style bootstrapping");
      id result = 0;
      break;
  }
  return result;
}

- (id)textStyleForTableArea:(unsigned int)a3
{
  switch(a3)
  {
    case 0u:
      uint64_t v3 = 120;
      goto LABEL_7;
    case 1u:
    case 4u:
      uint64_t v3 = 96;
      goto LABEL_7;
    case 2u:
      uint64_t v3 = 104;
      goto LABEL_7;
    case 3u:
    case 5u:
      uint64_t v3 = 112;
LABEL_7:
      id result = *(Class *)((char *)&self->super.super.isa + v3);
      break;
    default:
      uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"-[TSTTableStyleNetwork textStyleForTableArea:]"];
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyleNetwork.mm"), 600, @"illegal table region in style bootstrapping");
      id result = 0;
      break;
  }
  return result;
}

- (void)setCellStyle:(id)a3 forTableArea:(unsigned int)a4
{
  [(TSPObject *)self willModify];
  if (a4 >= 6)
  {
    unint64_t v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSTTableStyleNetwork setCellStyle:forTableArea:]"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyleNetwork.mm"), 622, @"illegal table region in style bootstrapping");
  }
  else
  {
    unint64_t v7 = *(Class *)((char *)&self->super.super.isa + *off_2646B3690[a4]);
    if (v7) {
  }
    }
  switch(a4)
  {
    case 0u:
      uint64_t v10 = (objc_class *)a3;
      uint64_t v11 = 88;
      goto LABEL_13;
    case 1u:
    case 4u:
      uint64_t v10 = (objc_class *)a3;
      uint64_t v11 = 64;
      goto LABEL_13;
    case 2u:
      uint64_t v10 = (objc_class *)a3;
      uint64_t v11 = 72;
      goto LABEL_13;
    case 3u:
    case 5u:
      uint64_t v10 = (objc_class *)a3;
      uint64_t v11 = 80;
LABEL_13:
      *(Class *)((char *)&self->super.super.isa + v11) = v10;
      break;
    default:
      uint64_t v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v13 = [NSString stringWithUTF8String:"-[TSTTableStyleNetwork setCellStyle:forTableArea:]"];
      uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyleNetwork.mm"];
      [v12 handleFailureInFunction:v13 file:v14 lineNumber:638 description:@"illegal table region in style bootstrapping"];
      break;
  }
}

- (void)setTextStyle:(id)a3 forTableArea:(unsigned int)a4
{
  [(TSPObject *)self willModify];
  if (a4 >= 6)
  {
    unint64_t v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSTTableStyleNetwork setTextStyle:forTableArea:]"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyleNetwork.mm"), 658, @"illegal table region in style bootstrapping");
  }
  else
  {
    unint64_t v7 = *(Class *)((char *)&self->super.super.isa + *off_2646B36C0[a4]);
    if (v7) {
  }
    }
  switch(a4)
  {
    case 0u:
      uint64_t v10 = (objc_class *)a3;
      uint64_t v11 = 120;
      goto LABEL_13;
    case 1u:
    case 4u:
      uint64_t v10 = (objc_class *)a3;
      uint64_t v11 = 96;
      goto LABEL_13;
    case 2u:
      uint64_t v10 = (objc_class *)a3;
      uint64_t v11 = 104;
      goto LABEL_13;
    case 3u:
    case 5u:
      uint64_t v10 = (objc_class *)a3;
      uint64_t v11 = 112;
LABEL_13:
      *(Class *)((char *)&self->super.super.isa + v11) = v10;
      break;
    default:
      uint64_t v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v13 = [NSString stringWithUTF8String:"-[TSTTableStyleNetwork setTextStyle:forTableArea:]"];
      uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyleNetwork.mm"];
      [v12 handleFailureInFunction:v13 file:v14 lineNumber:674 description:@"illegal table region in style bootstrapping"];
      break;
  }
}

- (void)setStylesFromTableModel:(id)a3
{
  [(TSPObject *)self willModify];
  uint64_t v5 = (TSPObjectContext *)[a3 context];
  if (v5 != [(TSPObject *)self context])
  {
    int v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSTTableStyleNetwork setStylesFromTableModel:]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTTableStyleNetwork.mm"), 683, @"Cannot set styles from a different context");
  }
  self->mPresetIndex = [a3 presetIndex];
  -[TSTTableStyleNetwork setTableStyle:](self, "setTableStyle:", [a3 tableStyle]);
  -[TSTTableStyleNetwork setCellStyle:forTableArea:](self, "setCellStyle:forTableArea:", [a3 bodyCellStyle], 0);
  -[TSTTableStyleNetwork setCellStyle:forTableArea:](self, "setCellStyle:forTableArea:", [a3 headerRowCellStyle], 1);
  -[TSTTableStyleNetwork setCellStyle:forTableArea:](self, "setCellStyle:forTableArea:", [a3 headerColumnCellStyle], 2);
  -[TSTTableStyleNetwork setCellStyle:forTableArea:](self, "setCellStyle:forTableArea:", [a3 footerRowCellStyle], 3);
  -[TSTTableStyleNetwork setTextStyle:forTableArea:](self, "setTextStyle:forTableArea:", [a3 bodyTextStyle], 0);
  -[TSTTableStyleNetwork setTextStyle:forTableArea:](self, "setTextStyle:forTableArea:", [a3 headerRowTextStyle], 1);
  -[TSTTableStyleNetwork setTextStyle:forTableArea:](self, "setTextStyle:forTableArea:", [a3 headerColumnTextStyle], 2);
  -[TSTTableStyleNetwork setTextStyle:forTableArea:](self, "setTextStyle:forTableArea:", [a3 footerRowTextStyle], 3);
  -[TSTTableStyleNetwork setTableNameStyle:](self, "setTableNameStyle:", [a3 tableNameStyle]);
  uint64_t v8 = [a3 tableNameShapeStyle];

  [(TSTTableStyleNetwork *)self setTableNameShapeStyle:v8];
}

- (id)styleArray
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[MEMORY[0x263EFF980] array];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v4 = [(TSTTableStyleNetwork *)self countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    unint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(self);
        }
        [v3 addObject:*(void *)(*((void *)&v9 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      unint64_t v5 = [(TSTTableStyleNetwork *)self countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  return v3;
}

- (id)dictionaryWithPreset:(unint64_t)a3
{
  unint64_t v5 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  mTableStyle = self->mTableStyle;
  if (mTableStyle) {
    objc_msgSend(v5, "setObject:forKey:", mTableStyle, +[TSTTableStyle styleIDForPreset:](TSTTableStyle, "styleIDForPreset:", a3));
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  uint64_t v19 = __45__TSTTableStyleNetwork_dictionaryWithPreset___block_invoke;
  uint64_t v20 = &unk_2646B3648;
  id v21 = v5;
  unint64_t v22 = a3;
  mBodyCellStyle = self->mBodyCellStyle;
  if (mBodyCellStyle)
  {
    objc_msgSend(v5, "setObject:forKey:", mBodyCellStyle, +[TSTCellStyle styleIDForPreset:andTableArea:](TSTCellStyle, "styleIDForPreset:andTableArea:", a3, 0));
    v19((uint64_t)v18, (uint64_t)self->mHeaderRowCellStyle, 1);
  }
  else
  {
    __45__TSTTableStyleNetwork_dictionaryWithPreset___block_invoke((uint64_t)v18, (uint64_t)self->mHeaderRowCellStyle, 1);
  }
  v19((uint64_t)v18, (uint64_t)self->mHeaderColumnCellStyle, 2);
  v19((uint64_t)v18, (uint64_t)self->mFooterRowCellStyle, 3);
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __45__TSTTableStyleNetwork_dictionaryWithPreset___block_invoke_2;
  long long v15 = &unk_2646B3670;
  long long v16 = v5;
  unint64_t v17 = a3;
  mBodyTextStyle = self->mBodyTextStyle;
  if (mBodyTextStyle)
  {
    objc_msgSend(v5, "setObject:forKey:", mBodyTextStyle, +[TSTCellStyle textStyleIDForPreset:andTableArea:](TSTCellStyle, "textStyleIDForPreset:andTableArea:", a3, 0, v12, v13));
    v14((uint64_t)&v12, (uint64_t)self->mHeaderRowTextStyle, 1);
  }
  else
  {
    __45__TSTTableStyleNetwork_dictionaryWithPreset___block_invoke_2((uint64_t)&v12, (uint64_t)self->mHeaderRowTextStyle, 1);
  }
  v14((uint64_t)&v12, (uint64_t)self->mHeaderColumnTextStyle, 2);
  v14((uint64_t)&v12, (uint64_t)self->mFooterRowTextStyle, 3);
  mTableNameStyle = self->mTableNameStyle;
  if (mTableNameStyle) {
    objc_msgSend(v5, "setObject:forKey:", mTableNameStyle, +[TSTTableStyleNetwork tableNameStyleIDForPreset:](TSTTableStyleNetwork, "tableNameStyleIDForPreset:", a3));
  }
  mTableNameShapeStyle = self->mTableNameShapeStyle;
  if (mTableNameShapeStyle) {
    objc_msgSend(v5, "setObject:forKey:", mTableNameShapeStyle, +[TSTTableStyleNetwork tableNameShapeStyleIDForPreset:](TSTTableStyleNetwork, "tableNameShapeStyleIDForPreset:", a3));
  }
  return v5;
}

uint64_t __45__TSTTableStyleNetwork_dictionaryWithPreset___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    unint64_t v4 = *(void **)(result + 32);
    id v5 = +[TSTCellStyle styleIDForPreset:*(void *)(result + 40) andTableArea:a3];
    return [v4 setObject:a2 forKey:v5];
  }
  return result;
}

uint64_t __45__TSTTableStyleNetwork_dictionaryWithPreset___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    unint64_t v4 = *(void **)(result + 32);
    id v5 = +[TSTCellStyle textStyleIDForPreset:*(void *)(result + 40) andTableArea:a3];
    return [v4 setObject:a2 forKey:v5];
  }
  return result;
}

- (BOOL)valid
{
  return self->mTableStyle
      || self->mBodyCellStyle
      || self->mHeaderRowCellStyle
      || self->mHeaderColumnCellStyle
      || self->mFooterRowTextStyle
      || self->mBodyTextStyle
      || self->mHeaderRowTextStyle != 0;
}

- (TSTTableStyleNetwork)initWithContext:(id)a3 fromDictionary:(id)a4 withPreset:(unint64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)TSTTableStyleNetwork;
  uint64_t v7 = [(TSPObject *)&v10 initWithContext:a3];
  uint64_t v8 = v7;
  if (v7)
  {
    v7->mPresetIndex = a5;
    v7->mTableStyle = (TSTTableStyle *)(id)objc_msgSend(a4, "objectForKey:", +[TSTTableStyle styleIDForPreset:](TSTTableStyle, "styleIDForPreset:", a5));
    v8->mBodyCellStyle = (TSTCellStyle *)(id)objc_msgSend(a4, "objectForKey:", +[TSTCellStyle styleIDForPreset:andTableArea:](TSTCellStyle, "styleIDForPreset:andTableArea:", a5, 0));
    v8->mHeaderRowCellStyle = (TSTCellStyle *)(id)objc_msgSend(a4, "objectForKey:", +[TSTCellStyle styleIDForPreset:andTableArea:](TSTCellStyle, "styleIDForPreset:andTableArea:", a5, 1));
    v8->mHeaderColumnCellStyle = (TSTCellStyle *)(id)objc_msgSend(a4, "objectForKey:", +[TSTCellStyle styleIDForPreset:andTableArea:](TSTCellStyle, "styleIDForPreset:andTableArea:", a5, 2));
    v8->mFooterRowCellStyle = (TSTCellStyle *)(id)objc_msgSend(a4, "objectForKey:", +[TSTCellStyle styleIDForPreset:andTableArea:](TSTCellStyle, "styleIDForPreset:andTableArea:", a5, 3));
    v8->mBodyTextStyle = (TSWPParagraphStyle *)(id)objc_msgSend(a4, "objectForKey:", +[TSTCellStyle textStyleIDForPreset:andTableArea:](TSTCellStyle, "textStyleIDForPreset:andTableArea:", a5, 0));
    v8->mHeaderRowTextStyle = (TSWPParagraphStyle *)(id)objc_msgSend(a4, "objectForKey:", +[TSTCellStyle textStyleIDForPreset:andTableArea:](TSTCellStyle, "textStyleIDForPreset:andTableArea:", a5, 1));
    v8->mHeaderColumnTextStyle = (TSWPParagraphStyle *)(id)objc_msgSend(a4, "objectForKey:", +[TSTCellStyle textStyleIDForPreset:andTableArea:](TSTCellStyle, "textStyleIDForPreset:andTableArea:", a5, 2));
    v8->mFooterRowTextStyle = (TSWPParagraphStyle *)(id)objc_msgSend(a4, "objectForKey:", +[TSTCellStyle textStyleIDForPreset:andTableArea:](TSTCellStyle, "textStyleIDForPreset:andTableArea:", a5, 3));
    v8->mTableNameStyle = (TSWPParagraphStyle *)(id)objc_msgSend(a4, "objectForKey:", +[TSTTableStyleNetwork tableNameStyleIDForPreset:](TSTTableStyleNetwork, "tableNameStyleIDForPreset:", a5));
    v8->mTableNameShapeStyle = (TSWPShapeStyle *)(id)objc_msgSend(a4, "objectForKey:", +[TSTTableStyleNetwork tableNameShapeStyleIDForPreset:](TSTTableStyleNetwork, "tableNameShapeStyleIDForPreset:", a5));
  }
  return v8;
}

@end