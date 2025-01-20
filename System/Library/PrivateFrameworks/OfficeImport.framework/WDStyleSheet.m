@interface WDStyleSheet
- (WDDocument)document;
- (WDStyleSheet)initWithDocument:(id)a3;
- (id)allAliasesForStyleId:(id)a3 name:(id)a4;
- (id)createStyleWithId:(id)a3 type:(int)a4;
- (id)createStyleWithName:(id)a3 type:(int)a4;
- (id)defaultCharacterProperties;
- (id)defaultCharacterStyle;
- (id)defaultListStyle;
- (id)defaultParagraphProperties;
- (id)defaultParagraphStyle;
- (id)defaultTableStyle;
- (id)description;
- (id)paragraphStyleWithStartingName:(id)a3;
- (id)styleIdForName:(id)a3;
- (id)styleIdToName:(id)a3;
- (id)styleNameToUniqueId:(id)a3;
- (id)styleWithId:(id)a3;
- (id)styleWithName:(id)a3;
- (id)styles;
- (unint64_t)styleCount;
- (void)addStyle:(id)a3 name:(id)a4;
- (void)createDefaultStyles;
- (void)initializeDefaultProperties;
- (void)removeStyleWithId:(id)a3;
- (void)setDefaultCharacterStyle:(id)a3;
- (void)setDefaultListStyle:(id)a3;
- (void)setDefaultParagraphStyle:(id)a3;
- (void)setDefaultTableStyle:(id)a3;
- (void)setName:(id)a3 forId:(id)a4;
@end

@implementation WDStyleSheet

- (WDStyleSheet)initWithDocument:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WDStyleSheet;
  v5 = [(WDStyleSheet *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mDocument, v4);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mStyleDictionary = v6->mStyleDictionary;
    v6->mStyleDictionary = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mStylesInOrder = v6->mStylesInOrder;
    v6->mStylesInOrder = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mIdDictionaryForName = v6->mIdDictionaryForName;
    v6->mIdDictionaryForName = v11;

    [(WDStyleSheet *)v6 initializeDefaultProperties];
  }

  return v6;
}

- (void)initializeDefaultProperties
{
  p_mDocument = &self->mDocument;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
  v5 = [WeakRetained fontTable];
  id v32 = [v5 fontWithName:@"Times New Roman" create:1];

  id v6 = objc_loadWeakRetained((id *)p_mDocument);
  v7 = [v6 fontTable];
  v8 = [v7 fontWithName:@"Times New Roman" create:1];

  id v9 = objc_loadWeakRetained((id *)p_mDocument);
  v10 = [v9 fontTable];
  v11 = [v10 fontWithName:@"Arial Unicode MS" create:1];

  v12 = [WDCharacterProperties alloc];
  v13 = [(WDStyleSheet *)self document];
  objc_super v14 = [(WDCharacterProperties *)v12 initWithDocument:v13];
  mDefaultCharacterProperties = self->mDefaultCharacterProperties;
  self->mDefaultCharacterProperties = v14;

  [(WDCharacterProperties *)self->mDefaultCharacterProperties setResolveMode:0];
  [(WDCharacterProperties *)self->mDefaultCharacterProperties setBold:0];
  [(WDCharacterProperties *)self->mDefaultCharacterProperties setBoldForBiText:0];
  [(WDCharacterProperties *)self->mDefaultCharacterProperties setItalic:0];
  [(WDCharacterProperties *)self->mDefaultCharacterProperties setItalicForBiText:0];
  [(WDCharacterProperties *)self->mDefaultCharacterProperties setOutline:0];
  [(WDCharacterProperties *)self->mDefaultCharacterProperties setShadow:0];
  [(WDCharacterProperties *)self->mDefaultCharacterProperties setEmbossed:0];
  [(WDCharacterProperties *)self->mDefaultCharacterProperties setImprint:0];
  [(WDCharacterProperties *)self->mDefaultCharacterProperties setUnderline:0];
  v16 = self->mDefaultCharacterProperties;
  v17 = +[OITSUColor clearColor];
  [(WDCharacterProperties *)v16 setUnderlineColor:v17];

  [(WDCharacterProperties *)self->mDefaultCharacterProperties setStrikeThrough:0];
  [(WDCharacterProperties *)self->mDefaultCharacterProperties setDoubleStrikeThrough:0];
  id v18 = [(WDCharacterProperties *)self->mDefaultCharacterProperties mutableBorder];
  v19 = self->mDefaultCharacterProperties;
  v20 = +[OITSUColor clearColor];
  [(WDCharacterProperties *)v19 setColor:v20];

  [(WDCharacterProperties *)self->mDefaultCharacterProperties setHighlightColor:0];
  [(WDCharacterProperties *)self->mDefaultCharacterProperties setSmallCaps:0];
  [(WDCharacterProperties *)self->mDefaultCharacterProperties setCaps:0];
  [(WDCharacterProperties *)self->mDefaultCharacterProperties setHidden:0];
  [(WDCharacterProperties *)self->mDefaultCharacterProperties setSpacing:0];
  [(WDCharacterProperties *)self->mDefaultCharacterProperties setTextScale:0];
  [(WDCharacterProperties *)self->mDefaultCharacterProperties setPosition:0];
  [(WDCharacterProperties *)self->mDefaultCharacterProperties setVerticalAlign:0];
  [(WDCharacterProperties *)self->mDefaultCharacterProperties setFontSize:20];
  [(WDCharacterProperties *)self->mDefaultCharacterProperties setFontSizeForBiText:20];
  [(WDCharacterProperties *)self->mDefaultCharacterProperties setKerning:0];
  [(WDCharacterProperties *)self->mDefaultCharacterProperties setTextScale:100];
  [(WDCharacterProperties *)self->mDefaultCharacterProperties setRightToLeft:0];
  [(WDCharacterProperties *)self->mDefaultCharacterProperties setFont:v32];
  [(WDCharacterProperties *)self->mDefaultCharacterProperties setFarEastFont:v11];
  [(WDCharacterProperties *)self->mDefaultCharacterProperties setExtendedFont:v8];
  [(WDCharacterProperties *)self->mDefaultCharacterProperties setSymbolFont:v32];
  [(WDCharacterProperties *)self->mDefaultCharacterProperties setLanguageForDefaultText:0xFFFFLL];
  [(WDCharacterProperties *)self->mDefaultCharacterProperties setLanguageForFarEast:0xFFFFLL];
  [(WDCharacterProperties *)self->mDefaultCharacterProperties setLanguageForBiText:0xFFFFLL];
  [(WDCharacterProperties *)self->mDefaultCharacterProperties setDeleted:0];
  [(WDCharacterProperties *)self->mDefaultCharacterProperties setEdited:0];
  [(WDCharacterProperties *)self->mDefaultCharacterProperties setFormattingChanged:0];
  [(WDCharacterProperties *)self->mDefaultCharacterProperties setResolveMode:2];
  v21 = [WDParagraphProperties alloc];
  v22 = [(WDStyleSheet *)self document];
  v23 = [(WDParagraphProperties *)v21 initWithDocument:v22];
  mDefaultParagraphProperties = self->mDefaultParagraphProperties;
  self->mDefaultParagraphProperties = v23;

  [(WDParagraphProperties *)self->mDefaultParagraphProperties setResolveMode:0];
  [(WDParagraphProperties *)self->mDefaultParagraphProperties setPageBreakBefore:0];
  [(WDParagraphProperties *)self->mDefaultParagraphProperties setListLevel:0];
  [(WDParagraphProperties *)self->mDefaultParagraphProperties setListIndex:0];
  [(WDParagraphProperties *)self->mDefaultParagraphProperties setDropCap:0];
  [(WDParagraphProperties *)self->mDefaultParagraphProperties setWidth:0];
  [(WDParagraphProperties *)self->mDefaultParagraphProperties setHeight:0];
  [(WDParagraphProperties *)self->mDefaultParagraphProperties setHeightRule:0];
  [(WDParagraphProperties *)self->mDefaultParagraphProperties setVerticalSpace:0];
  [(WDParagraphProperties *)self->mDefaultParagraphProperties setHorizontalSpace:0];
  [(WDParagraphProperties *)self->mDefaultParagraphProperties setWrap:0];
  [(WDParagraphProperties *)self->mDefaultParagraphProperties setVerticalAnchor:0];
  [(WDParagraphProperties *)self->mDefaultParagraphProperties setHorizontalPosition:0];
  [(WDParagraphProperties *)self->mDefaultParagraphProperties setVerticalPosition:0];
  [(WDParagraphProperties *)self->mDefaultParagraphProperties setAnchorLock:0];
  id v25 = [(WDParagraphProperties *)self->mDefaultParagraphProperties mutableTopBorder];
  id v26 = [(WDParagraphProperties *)self->mDefaultParagraphProperties mutableLeftBorder];
  id v27 = [(WDParagraphProperties *)self->mDefaultParagraphProperties mutableBottomBorder];
  id v28 = [(WDParagraphProperties *)self->mDefaultParagraphProperties mutableRightBorder];
  id v29 = [(WDParagraphProperties *)self->mDefaultParagraphProperties mutableBetweenBorder];
  id v30 = [(WDParagraphProperties *)self->mDefaultParagraphProperties mutableBarBorder];
  [(WDParagraphProperties *)self->mDefaultParagraphProperties setSpaceBefore:0];
  [(WDParagraphProperties *)self->mDefaultParagraphProperties setSpaceBeforeAuto:0];
  [(WDParagraphProperties *)self->mDefaultParagraphProperties setSpaceAfter:0];
  [(WDParagraphProperties *)self->mDefaultParagraphProperties setSpaceAfterAuto:0];
  [(WDParagraphProperties *)self->mDefaultParagraphProperties setLineSpacing:240];
  [(WDParagraphProperties *)self->mDefaultParagraphProperties setLineSpacingRule:0];
  [(WDParagraphProperties *)self->mDefaultParagraphProperties setLeftIndent:0];
  [(WDParagraphProperties *)self->mDefaultParagraphProperties setRightIndent:0];
  [(WDParagraphProperties *)self->mDefaultParagraphProperties setFirstLineIndent:0];
  [(WDParagraphProperties *)self->mDefaultParagraphProperties setJustification:0];
  [(WDParagraphProperties *)self->mDefaultParagraphProperties setOutlineLevel:9];
  [(WDParagraphProperties *)self->mDefaultParagraphProperties setSuppressLineNumbers:0];
  [(WDParagraphProperties *)self->mDefaultParagraphProperties setSuppressAutoHyphens:0];
  [(WDParagraphProperties *)self->mDefaultParagraphProperties setWidowControl:1];
  [(WDParagraphProperties *)self->mDefaultParagraphProperties setKeepLinesTogether:0];
  [(WDParagraphProperties *)self->mDefaultParagraphProperties setKeepNextParagraphTogether:0];
  id v31 = [(WDParagraphProperties *)self->mDefaultParagraphProperties mutableShading];
  [(WDParagraphProperties *)self->mDefaultParagraphProperties setTabStopAddedCount:0];
  [(WDParagraphProperties *)self->mDefaultParagraphProperties setTabStopDeletedPositionCount:0];
}

- (WDDocument)document
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
  return (WDDocument *)WeakRetained;
}

- (id)styleIdForName:(id)a3
{
  mIdDictionaryForName = self->mIdDictionaryForName;
  id v4 = [a3 lowercaseString];
  v5 = [(NSMutableDictionary *)mIdDictionaryForName objectForKey:v4];

  return v5;
}

- (id)styleWithId:(id)a3
{
  v3 = [(NSMutableDictionary *)self->mStyleDictionary objectForKey:a3];
  return v3;
}

- (id)createStyleWithId:(id)a3 type:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = [[WDStyle alloc] initWithStyleSheet:self id:v6 type:v4];
  [(NSMutableDictionary *)self->mStyleDictionary setObject:v7 forKey:v6];
  [(NSMutableArray *)self->mStylesInOrder addObject:v7];

  return v7;
}

- (void)setName:(id)a3 forId:(id)a4
{
  id v8 = a4;
  mIdDictionaryForName = self->mIdDictionaryForName;
  v7 = [a3 lowercaseString];
  [(NSMutableDictionary *)mIdDictionaryForName setObject:v8 forKey:v7];
}

- (void)setDefaultParagraphStyle:(id)a3
{
}

- (void)setDefaultCharacterStyle:(id)a3
{
}

- (void)setDefaultTableStyle:(id)a3
{
}

- (void)setDefaultListStyle:(id)a3
{
}

- (id)defaultCharacterProperties
{
  return self->mDefaultCharacterProperties;
}

- (id)defaultParagraphStyle
{
  return self->mDefaultParagraphStyle;
}

- (void)addStyle:(id)a3 name:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = [a3 id];
  [(NSMutableDictionary *)self->mIdDictionaryForName setObject:v7 forKey:v6];
  [v6 componentsSeparatedByString:@","];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        mIdDictionaryForName = self->mIdDictionaryForName;
        v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "lowercaseString", (void)v14);
        [(NSMutableDictionary *)mIdDictionaryForName setObject:v7 forKey:v13];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (id)defaultListStyle
{
  return self->mDefaultListStyle;
}

- (id)defaultParagraphProperties
{
  return self->mDefaultParagraphProperties;
}

- (id)styles
{
  return (id)[(NSMutableArray *)self->mStylesInOrder objectEnumerator];
}

- (unint64_t)styleCount
{
  return [(NSMutableDictionary *)self->mStyleDictionary count];
}

- (id)styleWithName:(id)a3
{
  uint64_t v4 = [(WDStyleSheet *)self styleIdForName:a3];
  v5 = [(WDStyleSheet *)self styleWithId:v4];

  return v5;
}

- (id)paragraphStyleWithStartingName:(id)a3
{
  id v4 = a3;
  v5 = [v4 lowercaseString];
  id v6 = [(NSMutableDictionary *)self->mIdDictionaryForName keyEnumerator];
  while (1)
  {
    v7 = [v6 nextObject];
    id v8 = v7;
    if (!v7)
    {
      uint64_t v9 = 0;
      goto LABEL_10;
    }
    if (objc_msgSend(v7, "tc_startsWithString:", v5)) {
      break;
    }
LABEL_7:
  }
  uint64_t v9 = [(WDStyleSheet *)self styleWithName:v8];
  if ([v9 type] != 1 && objc_msgSend(v9, "type") != 3)
  {

    goto LABEL_7;
  }

LABEL_10:
  return v9;
}

- (id)createStyleWithName:(id)a3 type:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = [(WDStyleSheet *)self styleNameToUniqueId:a3];
  v7 = [(WDStyleSheet *)self createStyleWithId:v6 type:v4];

  return v7;
}

- (void)removeStyleWithId:(id)a3
{
  id v4 = a3;
  mStylesInOrder = self->mStylesInOrder;
  id v8 = v4;
  id v6 = -[NSMutableDictionary objectForKey:](self->mStyleDictionary, "objectForKey:");
  [(NSMutableArray *)mStylesInOrder removeObject:v6];

  v7 = [(NSMutableDictionary *)self->mIdDictionaryForName allKeysForObject:v8];
  [(NSMutableDictionary *)self->mIdDictionaryForName removeObjectsForKeys:v7];
  [(NSMutableDictionary *)self->mStyleDictionary removeObjectForKey:v8];
}

- (void)createDefaultStyles
{
  id v20 = [(WDStyleSheet *)self createStyleWithName:@"Normal" type:1];
  [v20 setNextStyle:v20];
  [v20 setName:@"Normal"];
  v3 = [v20 paragraphProperties];
  [v3 setResolveMode:0];

  id v4 = [v20 paragraphProperties];
  [v4 setBaseStyle:v20];

  v5 = [v20 paragraphProperties];
  [v5 setResolveMode:2];

  id v6 = [v20 characterProperties];
  [v6 setResolveMode:0];
  [v6 setFontSize:24];
  [v6 setLanguageForDefaultText:1033];
  [v6 setLanguageForFarEast:1033];
  [v6 setLanguageForBiText:1025];
  [v6 setFontSizeForBiText:24];
  [(WDStyleSheet *)self setDefaultParagraphStyle:v20];
  v7 = [(WDStyleSheet *)self styleNameToUniqueId:@"Default Paragraph Font"];
  id v8 = [(WDStyleSheet *)self createStyleWithId:v7 type:2];

  [v8 setNextStyle:v8];
  [v8 setHidden:1];
  [v8 setName:@"Default Paragraph Font"];
  [(WDStyleSheet *)self setDefaultCharacterStyle:v8];
  uint64_t v9 = [(WDStyleSheet *)self createStyleWithName:@"Hyperlink" type:2];

  [v9 setName:@"Hyperlink"];
  uint64_t v10 = [v9 characterProperties];
  [v10 setUnderline:1];

  uint64_t v11 = [(WDStyleSheet *)self createStyleWithName:@"Table Normal" type:3];

  [v11 setNextStyle:v11];
  [v11 setHidden:1];
  [v11 setName:@"Table Normal"];
  v12 = [v11 paragraphProperties];
  [v12 setResolveMode:0];

  v13 = [v11 paragraphProperties];
  [v13 setBaseStyle:v11];

  long long v14 = [v11 paragraphProperties];
  [v14 setResolveMode:2];

  long long v15 = [v11 tableProperties];
  [v15 setResolveMode:0];
  [v15 setIndentType:3];
  [v15 setIndent:0];
  [v15 setResolveMode:2];
  [(WDStyleSheet *)self setDefaultTableStyle:v11];
  id v21 = [(WDStyleSheet *)self createStyleWithName:@"No List" type:4];

  [v21 setNextStyle:v21];
  [v21 setHidden:1];
  [v21 setName:@"No List"];
  long long v16 = [v21 paragraphProperties];
  [v16 setResolveMode:0];

  long long v17 = [v21 paragraphProperties];
  id v18 = [(WDStyleSheet *)self defaultParagraphStyle];
  [v17 setBaseStyle:v18];

  uint64_t v19 = [v21 paragraphProperties];
  [v19 setResolveMode:2];

  -[WDStyleSheet setDefaultListStyle:](self, "setDefaultListStyle:");
}

- (id)defaultCharacterStyle
{
  return self->mDefaultCharacterStyle;
}

- (id)defaultTableStyle
{
  return self->mDefaultTableStyle;
}

- (id)styleNameToUniqueId:(id)a3
{
  id v4 = a3;
  uint64_t v5 = 0;
  for (i = v4; ; i = (void *)v8)
  {
    v7 = [(WDStyleSheet *)self styleIdForName:i];

    if (!v7) {
      break;
    }
    uint64_t v8 = [NSString stringWithFormat:@"%@.%d", v4, v5];

    uint64_t v5 = (v5 + 1);
  }

  return i;
}

- (id)styleIdToName:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@"." options:4];
  if (v5)
  {
    uint64_t v6 = [v3 substringToIndex:v4];

    id v3 = (id)v6;
  }
  return v3;
}

- (id)allAliasesForStyleId:(id)a3 name:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v16 = [MEMORY[0x263EFF980] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = self->mIdDictionaryForName;
  uint64_t v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v13 = [(NSMutableDictionary *)self->mIdDictionaryForName objectForKey:v12];
        if ([v13 isEqualToString:v6])
        {
          char v14 = [v12 isEqualToString:v7];

          if ((v14 & 1) == 0) {
            [v16 addObject:v12];
          }
        }
        else
        {
        }
      }
      uint64_t v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  return v16;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDStyleSheet;
  v2 = [(WDStyleSheet *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mDocument);
  objc_storeStrong((id *)&self->mIdDictionaryForName, 0);
  objc_storeStrong((id *)&self->mStylesInOrder, 0);
  objc_storeStrong((id *)&self->mDefaultListStyle, 0);
  objc_storeStrong((id *)&self->mDefaultTableStyle, 0);
  objc_storeStrong((id *)&self->mDefaultCharacterStyle, 0);
  objc_storeStrong((id *)&self->mDefaultParagraphStyle, 0);
  objc_storeStrong((id *)&self->mDefaultParagraphProperties, 0);
  objc_storeStrong((id *)&self->mDefaultCharacterProperties, 0);
  objc_storeStrong((id *)&self->mStyleDictionary, 0);
}

@end