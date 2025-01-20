@interface WMParagraphStyleMapper
- (BOOL)checkListId:(int64_t)a3 level:(unsigned __int8)a4;
- (BOOL)getListLevel:(char *)a3 andListIndex:(int *)a4 fromStyleOnly:(BOOL)a5;
- (BOOL)isListItem;
- (WMParagraphStyleMapper)initWithWDParagraph:(id)a3 parent:(id)a4 isInTextFrame:(BOOL)a5;
- (id)bulletLabelForIndex:(int)a3 inLevelDescription:(id)a4 listState:(id)a5;
- (id)labelStringWithGap:(id)a3;
- (void)destyleEmptyParagraph;
- (void)getListLevel:(char *)a3 andListIndex:(int *)a4 foundListLevel:(BOOL *)a5 foundListIndex:(BOOL *)a6 fromParagraphProperties:(id)a7;
- (void)getListLevel:(char *)a3 andListIndex:(int *)a4 foundListLevel:(BOOL *)a5 foundListIndex:(BOOL *)a6 fromStyle:(id)a7;
- (void)mapAt:(id)a3 withState:(id)a4;
- (void)mapBulletAt:(id)a3 forIndex:(int)a4 inLevelDescription:(id)a5 listState:(id)a6;
- (void)mapBulletFromListId:(int)a3 listLevel:(unsigned __int8)a4 at:(id)a5 document:(id)a6 state:(id)a7;
- (void)mapListStyleAt:(id)a3 state:(id)a4;
- (void)mapListStyleFromParagraphStyleWithState:(id)a3;
- (void)mapParagraphProperties;
- (void)mapParagraphStyle;
- (void)mapStyleFromListId:(int)a3 listLevel:(unsigned __int8)a4 document:(id)a5 state:(id)a6;
- (void)updateOutlineStateWithListId:(int)a3 listLevel:(unsigned __int8)a4 document:(id)a5 state:(id)a6;
@end

@implementation WMParagraphStyleMapper

- (WMParagraphStyleMapper)initWithWDParagraph:(id)a3 parent:(id)a4 isInTextFrame:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v22.receiver = self;
  v22.super_class = (Class)WMParagraphStyleMapper;
  v11 = [(CMMapper *)&v22 initWithParent:v10];
  v12 = v11;
  if (v11)
  {
    mStyle = v11->mStyle;
    v11->mStyle = 0;

    objc_storeStrong((id *)&v12->wdParagraph, a3);
    uint64_t v14 = [(WDParagraph *)v12->wdParagraph properties];
    wdParaProperties = v12->wdParaProperties;
    v12->wdParaProperties = (WDParagraphProperties *)v14;

    if ([(WDParagraphProperties *)v12->wdParaProperties isBaseStyleOverridden])
    {
      v16 = [WMParagraphStyle alloc];
      v17 = [(WDParagraphProperties *)v12->wdParaProperties baseStyle];
      uint64_t v18 = [(WMParagraphStyle *)v16 initWithWDStyle:v17 isInTextFrame:v5];
      v19 = v12->mStyle;
      v12->mStyle = (WMParagraphStyle *)v18;
    }
    else
    {
      v20 = objc_alloc_init(WMParagraphStyle);
      v17 = v12->mStyle;
      v12->mStyle = v20;
    }
  }
  return v12;
}

- (BOOL)isListItem
{
  return [(WMParagraphStyleMapper *)self getListLevel:0 andListIndex:0 fromStyleOnly:0];
}

- (void)mapListStyleAt:(id)a3 state:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(WDParagraphProperties *)self->wdParaProperties isCharacterPropertiesOverridden])
  {
    v8 = [(WDParagraphProperties *)self->wdParaProperties characterProperties];
  }
  else
  {
    v8 = 0;
  }
  if (![v8 isDeletedOverridden] || (objc_msgSend(v8, "deleted") & 0xFFFFFF7F) != 1)
  {
    unsigned __int8 v16 = -1;
    unsigned int v15 = -1;
    if ([(WMParagraphStyleMapper *)self getListLevel:&v16 andListIndex:&v15 fromStyleOnly:0])
    {
      if (v16 == 255) {
        unsigned __int8 v16 = 0;
      }
      if ([(WDParagraphProperties *)self->wdParaProperties isListIndexOverridden])
      {
        uint64_t v9 = v15;
        uint64_t v10 = v16;
        v11 = [(WDParagraphProperties *)self->wdParaProperties document];
        [(WMParagraphStyleMapper *)self mapStyleFromListId:v9 listLevel:v10 document:v11 state:v7];
      }
      uint64_t v12 = v15;
      uint64_t v13 = v16;
      uint64_t v14 = [(WDParagraphProperties *)self->wdParaProperties document];
      [(WMParagraphStyleMapper *)self mapBulletFromListId:v12 listLevel:v13 at:v6 document:v14 state:v7];
    }
  }
}

- (void)destyleEmptyParagraph
{
  id v2 = [(CMStyle *)self->mStyle properties];
  [v2 removeObjectForKey:0x26EC191F8];
}

- (void)mapAt:(id)a3 withState:(id)a4
{
}

- (BOOL)checkListId:(int64_t)a3 level:(unsigned __int8)a4
{
  BOOL v4 = 0;
  if (a3 >= 1 && a4 <= 9u)
  {
    id v6 = [(WDParagraphProperties *)self->wdParaProperties document];
    id v7 = [v6 listTable];

    if (v7)
    {
      v8 = [v7 lists];
      BOOL v4 = [v8 count] >= (unint64_t)a3;
    }
    else
    {
      BOOL v4 = 0;
    }
  }
  return v4;
}

- (void)updateOutlineStateWithListId:(int)a3 listLevel:(unsigned __int8)a4 document:(id)a5 state:(id)a6
{
  uint64_t v7 = a4;
  uint64_t v8 = *(void *)&a3;
  id v15 = a5;
  id v10 = a6;
  if ([(WMParagraphStyleMapper *)self checkListId:(int)v8 level:v7])
  {
    v11 = [v15 listWithListId:v8];
    uint64_t v12 = [v11 listDefinitionId];
    if (([v10 isCurrentListDefinitionId:v12] & 1) == 0)
    {
      uint64_t v13 = [v10 listStateForListDefinitionWithId:v12 settingUpStateIfNeededWithDocument:v15];
      [v10 setCurrentListState:v13];
    }
    uint64_t v14 = [v10 currentListState];
    [v14 setCurrentList:v11];
  }
}

- (void)mapStyleFromListId:(int)a3 listLevel:(unsigned __int8)a4 document:(id)a5 state:(id)a6
{
  uint64_t v7 = a4;
  uint64_t v8 = *(void *)&a3;
  id v15 = a5;
  id v10 = a6;
  if ([(WMParagraphStyleMapper *)self checkListId:(int)v8 level:v7])
  {
    [(WMParagraphStyleMapper *)self updateOutlineStateWithListId:v8 listLevel:v7 document:v15 state:v10];
    v11 = [v10 currentListState];
    uint64_t v12 = [v11 levelDescriptionAtIndex:v7];
    mStyle = self->mStyle;
    uint64_t v14 = [v12 paragraphProperties];
    [(WMParagraphStyle *)mStyle addParagraphProperties:v14];
  }
}

- (void)mapBulletFromListId:(int)a3 listLevel:(unsigned __int8)a4 at:(id)a5 document:(id)a6 state:(id)a7
{
  uint64_t v9 = a4;
  uint64_t v10 = *(void *)&a3;
  id v16 = a5;
  id v12 = a6;
  id v13 = a7;
  if ([(WMParagraphStyleMapper *)self checkListId:(int)v10 level:v9])
  {
    [(WMParagraphStyleMapper *)self updateOutlineStateWithListId:v10 listLevel:v9 document:v12 state:v13];
    uint64_t v14 = [v13 currentListState];
    id v15 = [v14 levelDescriptionAtIndex:v9];
    [v14 increaseCounterAtLevel:v9];
    [(WMParagraphStyleMapper *)self mapBulletAt:v16 forIndex:v9 inLevelDescription:v15 listState:v14];
  }
}

- (void)getListLevel:(char *)a3 andListIndex:(int *)a4 foundListLevel:(BOOL *)a5 foundListIndex:(BOOL *)a6 fromParagraphProperties:(id)a7
{
  id v11 = a7;
  if ([v11 isListIndexOverridden])
  {
    *a6 = 1;
    if (a4) {
      *a4 = [v11 listIndex];
    }
  }
  if ([v11 isListLevelOverridden])
  {
    *a5 = 1;
    if (a3) {
      *a3 = [v11 listLevel];
    }
  }
}

- (void)getListLevel:(char *)a3 andListIndex:(int *)a4 foundListLevel:(BOOL *)a5 foundListIndex:(BOOL *)a6 fromStyle:(id)a7
{
  id v12 = a7;
  if (v12)
  {
    id v17 = v12;
    id v13 = [v12 baseStyle];

    uint64_t v14 = v17;
    if (v13 != v17)
    {
      id v15 = [v17 baseStyle];
      [(WMParagraphStyleMapper *)self getListLevel:a3 andListIndex:a4 foundListLevel:a5 foundListIndex:a6 fromStyle:v15];

      uint64_t v14 = v17;
    }
    id v16 = [v14 paragraphProperties];
    [(WMParagraphStyleMapper *)self getListLevel:a3 andListIndex:a4 foundListLevel:a5 foundListIndex:a6 fromParagraphProperties:v16];

    id v12 = v17;
  }
}

- (BOOL)getListLevel:(char *)a3 andListIndex:(int *)a4 fromStyleOnly:(BOOL)a5
{
  __int16 v11 = 0;
  if ([(WDParagraphProperties *)self->wdParaProperties isBaseStyleOverridden])
  {
    uint64_t v9 = [(WDParagraphProperties *)self->wdParaProperties baseStyle];
    [(WMParagraphStyleMapper *)self getListLevel:a3 andListIndex:a4 foundListLevel:(char *)&v11 + 1 foundListIndex:&v11 fromStyle:v9];
  }
  if (!a5) {
    [(WMParagraphStyleMapper *)self getListLevel:a3 andListIndex:a4 foundListLevel:(char *)&v11 + 1 foundListIndex:&v11 fromParagraphProperties:self->wdParaProperties];
  }
  return v11;
}

- (void)mapListStyleFromParagraphStyleWithState:(id)a3
{
  id v4 = a3;
  unsigned __int8 v9 = -1;
  unsigned int v8 = -1;
  if ([(WMParagraphStyleMapper *)self getListLevel:&v9 andListIndex:&v8 fromStyleOnly:1])
  {
    uint64_t v5 = v9;
    if (v9 == 255)
    {
      uint64_t v5 = 0;
      unsigned __int8 v9 = 0;
    }
    uint64_t v6 = v8;
    uint64_t v7 = [(WDParagraphProperties *)self->wdParaProperties document];
    [(WMParagraphStyleMapper *)self mapStyleFromListId:v6 listLevel:v5 document:v7 state:v4];
  }
}

- (void)mapParagraphStyle
{
}

- (void)mapParagraphProperties
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mStyle, 0);
  objc_storeStrong((id *)&self->wdParagraph, 0);
  objc_storeStrong((id *)&self->wdParaProperties, 0);
}

- (id)labelStringWithGap:(id)a3
{
  v3 = [NSString stringWithFormat:@"%@ ", a3];
  return v3;
}

- (id)bulletLabelForIndex:(int)a3 inLevelDescription:(id)a4 listState:(id)a5
{
  id v29 = a4;
  id v7 = a5;
  id v8 = objc_alloc(MEMORY[0x263EFF980]);
  unsigned __int8 v9 = [v7 listDefinition];
  uint64_t v10 = objc_msgSend(v8, "initWithCapacity:", (int)objc_msgSend(v9, "levelCount"));

  for (unsigned __int8 i = 0; ; ++i)
  {
    id v12 = [v7 listDefinition];
    int v13 = [v12 levelCount];

    if (v13 <= i) {
      break;
    }
    uint64_t v14 = [v7 levelDescriptionAtIndex:i];
    [v10 addObject:v14];
  }
  id v15 = [WMListLevelTextMapper alloc];
  id v16 = [v29 text];
  id v17 = [(WDParagraphProperties *)self->wdParaProperties document];
  uint64_t v18 = [v17 styleSheet];
  v19 = [v18 defaultCharacterProperties];
  v20 = -[WMListLevelTextMapper initWithText:levelDescriptions:language:](v15, "initWithText:levelDescriptions:language:", v16, v10, [v19 languageForDefaultText]);

  v21 = [(WMListLevelTextMapper *)v20 listLevelTextForOutline:v7];
  objc_super v22 = [v29 characterProperties];
  if ([v22 isFontOverridden])
  {
    v23 = [v22 fontForFontType:0];
    v24 = [v23 name];
    v25 = [v22 fontForFontType:3];
    v26 = [v25 name];
    uint64_t v27 = +[TCFontUtils stringByFixingString:v21 latinFontFamilyName:v24 symbolFontFamilyName:v26];

    v21 = (void *)v27;
  }

  return v21;
}

- (void)mapBulletAt:(id)a3 forIndex:(int)a4 inLevelDescription:(id)a5 listState:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v19 = a3;
  id v10 = a5;
  __int16 v11 = [(WMParagraphStyleMapper *)self bulletLabelForIndex:v8 inLevelDescription:v10 listState:a6];
  id v12 = [v11 stringByAppendingString:@" "];
  int v13 = +[OIXMLElement elementWithType:16];
  uint64_t v14 = objc_alloc_init(WMParagraphStyle);
  [v19 addChild:v13];
  id v15 = +[OIXMLTextNode textNodeWithStringValue:v12];
  [v13 addChild:v15];

  if ([(WDParagraphProperties *)self->wdParaProperties isFirstLineIndentOverridden])
  {
    id v16 = [[CMLengthProperty alloc] initWithNumber:2 unit:(double)[(WDParagraphProperties *)self->wdParaProperties firstLineIndent]];
    [(CMStyle *)v14 addProperty:v16 forKey:0x26EC194D8];
  }
  if ([(WDParagraphProperties *)self->wdParaProperties isBaseStyleOverridden])
  {
    id v17 = [(WDParagraphProperties *)self->wdParaProperties baseStyle];
    [(WMParagraphStyle *)v14 addParagraphStyleCharacterProperties:v17];
  }
  uint64_t v18 = [v10 characterProperties];
  [(WMStyle *)v14 addCharacterProperties:v18];

  [(CMMapper *)self addStyleUsingGlobalCacheTo:v13 style:v14];
}

@end