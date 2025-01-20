@interface WMCharacterRunMapper
+ (void)addNonCollapsableSpanAt:(id)a3 withState:(id)a4;
- (BOOL)isDeleted;
- (WMCharacterRunMapper)initWithText:(id)a3;
- (WMCharacterRunMapper)initWithWDCharacterRun:(id)a3 parent:(id)a4;
- (id)baseStyle;
- (id)boldStyle;
- (id)copyCharacterStyle;
- (int)defaultTabWidth;
- (unsigned)countAndStripLeadingTabs;
- (void)map1At:(id)a3 withState:(id)a4;
- (void)mapAt:(id)a3 withState:(id)a4;
- (void)mapSubstring:(id)a3 at:(id)a4;
- (void)mapTabs:(unsigned int)a3 at:(id)a4 afterText:(id)a5;
@end

@implementation WMCharacterRunMapper

- (WMCharacterRunMapper)initWithWDCharacterRun:(id)a3 parent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WMCharacterRunMapper;
  v9 = [(CMMapper *)&v18 initWithParent:v8];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->wdCharacterRun, a3);
    uint64_t v11 = [(WMCharacterRunMapper *)v10 copyCharacterStyle];
    mStyle = v10->mStyle;
    v10->mStyle = (WMStyle *)v11;

    v13 = v10->mStyle;
    v14 = [v7 properties];
    [(WMStyle *)v13 addCharacterProperties:v14];

    uint64_t v15 = [v7 string];
    mText = v10->mText;
    v10->mText = (NSString *)v15;
  }
  return v10;
}

- (id)copyCharacterStyle
{
  v3 = [(WDRun *)self->wdCharacterRun paragraph];
  v4 = [v3 properties];
  if ([v4 isBaseStyleOverridden])
  {
    v5 = [v4 baseStyle];
    v6 = [[WMStyle alloc] initWithWDStyle:v5];
  }
  else
  {
    v6 = objc_alloc_init(WMStyle);
  }
  id v7 = [(WDRunWithCharacterProperties *)self->wdCharacterRun properties];
  if ([v7 isBaseStyleOverridden])
  {
    id v8 = [v7 baseStyle];
    v9 = [[WMStyle alloc] initWithWDStyle:v8];
    [(WMStyle *)v6 cascadeWithStyle:v9];
  }
  return v6;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v33 = a3;
  id v6 = a4;
  id v7 = [(WDRunWithCharacterProperties *)self->wdCharacterRun properties];
  if ([v7 isDeletedOverridden] && (objc_msgSend(v7, "deleted") & 0xFFFFFF7F) == 1)
  {
    self->mIsDeleted = 1;
    goto LABEL_53;
  }
  if ([v7 isHiddenOverridden] && objc_msgSend(v7, "hidden") == 1) {
    goto LABEL_53;
  }
  mText = self->mText;
  if (!mText) {
    goto LABEL_53;
  }
  if (![(NSString *)mText length]) {
    goto LABEL_53;
  }
  unint64_t v9 = [(NSString *)self->mText length];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_53;
  }
  if (v9)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if ([(NSString *)self->mText characterAtIndex:i] == 12) {
        objc_msgSend(v6, "setCurrentPage:", objc_msgSend(v6, "currentPage") + 1);
      }
    }
  }
  if ([v6 isOnPhone] && objc_msgSend(v6, "textLevel") <= 0)
  {
    uint64_t v11 = [(CMStyle *)self->mStyle propertyForName:0x26EC08778];
    v12 = v11;
    if (v11)
    {
      [v11 value];
      double v14 = v13;
      int v15 = [v12 unitType];
      float v16 = v14;
      if (v15 == 1 || v15 == 4)
      {
LABEL_23:
        if (v16 < 18.0)
        {
          if (v16 >= 8.0) {
            int v18 = 17;
          }
          else {
            int v18 = 20;
          }
          self->mFontSizeBumpFactor = v18;
          float v19 = 1.7;
          if (v16 < 8.0) {
            float v19 = 2.0;
          }
          if ((float)(v16 * v19) > 18.0) {
            self->mFontSizeBumpFactor = 15;
          }
        }
        goto LABEL_31;
      }
      if (v15 == 6)
      {
        float v16 = v16 * 0.5;
        goto LABEL_23;
      }
    }
LABEL_31:
  }
  if (v9)
  {
    unint64_t v20 = 0;
    v21 = 0;
    unint64_t v22 = v9;
    while (1)
    {
      unint64_t v23 = -[NSString rangeOfString:options:range:](self->mText, "rangeOfString:options:range:", 0x26EBF9318, 2, v20, v22);
      if (!v24) {
        break;
      }
      unint64_t v25 = v23;
      if (v23 <= v20)
      {

        v21 = 0;
      }
      else
      {
        uint64_t v26 = -[NSString substringWithRange:](self->mText, "substringWithRange:", v20, v23 - v20);

        v21 = (void *)v26;
        [(WMCharacterRunMapper *)self mapSubstring:v26 at:v33];
        unint64_t v20 = v25;
      }
      unint64_t v27 = v20 + 1;
      if (v20 + 1 >= v9)
      {
        uint64_t v29 = 1;
      }
      else
      {
        uint64_t v28 = (v9 - v20);
        uint64_t v29 = 1;
        while ([(NSString *)self->mText characterAtIndex:v27] == 9)
        {
          uint64_t v29 = (v29 + 1);
          if (v9 == ++v27)
          {
            uint64_t v29 = v28;
            unint64_t v20 = v9;
            goto LABEL_45;
          }
        }
      }
      unint64_t v20 = v27;
LABEL_45:
      [(WMCharacterRunMapper *)self mapTabs:v29 at:v33 afterText:v21];
      unint64_t v22 = v9 - v20;
      if (v9 == v20) {
        goto LABEL_52;
      }
    }
    v30 = self->mText;
    if (v20)
    {
      -[NSString substringWithRange:](v30, "substringWithRange:", v20, v22);
      v31 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = v30;
    }
    v32 = v31;

    v21 = v32;
    [(WMCharacterRunMapper *)self mapSubstring:v32 at:v33];
  }
  else
  {
    v21 = 0;
  }
LABEL_52:

LABEL_53:
}

- (BOOL)isDeleted
{
  return self->mIsDeleted;
}

+ (void)addNonCollapsableSpanAt:(id)a3 withState:(id)a4
{
  id v6 = a3;
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%C", 160);
  v5 = +[OIXMLElement elementWithType:16];
  [v5 setStringValue:v4];
  [v6 addChild:v5];
}

- (void)mapSubstring:(id)a3 at:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (self->mFontSizeBumpFactor < 11)
  {
    id v7 = +[OIXMLElement elementWithType:16 stringValue:v11];
    [v6 addChild:v7];
    [(CMMapper *)self addStyleUsingGlobalCacheTo:v7 style:self->mStyle];
  }
  else
  {
    id v7 = +[OIXMLElement elementWithType:16];
    [v6 addChild:v7];
    [(CMMapper *)self addStyleUsingGlobalCacheTo:v7 style:self->mStyle];
    id v8 = +[OIXMLElement elementWithType:16 stringValue:v11];
    int mFontSizeBumpFactor = self->mFontSizeBumpFactor;
    if (mFontSizeBumpFactor == 17)
    {
      v10 = +[OIXMLAttribute attributeWithName:0x26EBF96F8 stringValue:@"bumpedFont17"];
      [v8 addAttribute:v10];
    }
    else
    {
      if (mFontSizeBumpFactor == 15) {
        +[OIXMLAttribute attributeWithName:0x26EBF96F8 stringValue:@"bumpedFont15"];
      }
      else {
      v10 = +[OIXMLAttribute attributeWithName:0x26EBF96F8 stringValue:@"bumpedFont20"];
      }
      [v8 addAttribute:v10];
    }

    [v7 addChild:v8];
  }
}

- (void)mapTabs:(unsigned int)a3 at:(id)a4 afterText:(id)a5
{
  id v30 = a4;
  id v8 = a5;
  int v9 = [(WMCharacterRunMapper *)self defaultTabWidth];
  unsigned int v10 = v9;
  if (v8)
  {
    uint64_t v29 = v8;
    id v11 = [(CMStyle *)self->mStyle properties];
    v12 = [v11 objectForKey:0x26EC08778];

    uint64_t v28 = v12;
    if (v12)
    {
      [v12 value];
      uint64_t v14 = (int)v13;
    }
    else
    {
      uint64_t v14 = 10;
    }
    float v16 = [(CMStyle *)self->mStyle properties];
    v17 = [v16 objectForKey:0x26EC08758];

    if (v17)
    {
      int v18 = [v17 value];
    }
    else
    {
      int v18 = @"Arial";
    }
    uint64_t v19 = [(CMStyle *)self->mStyle properties];
    unint64_t v20 = [(id)v19 objectForKey:0x26EC087B8];

    LOBYTE(v19) = [v20 value];
    v21 = [(CMStyle *)self->mStyle properties];
    unint64_t v22 = [v21 objectForKey:0x26EC087F8];

    objc_msgSend(v29, "oi_sizeWithFontName:size:bold:italic:", v18, v14, v19 & 1, objc_msgSend(v22, "value") & 1);
    uint64_t v15 = (int)v23 / v10 * v10 - (int)v23 + v10 * a3;

    id v8 = v29;
  }
  else
  {
    uint64_t v15 = v9 * a3;
  }
  uint64_t v24 = +[OIXMLElement elementWithType:16];
  [v30 addChild:v24];
  unint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"padding-left:%d", v15);;
  [(CMMapper *)self addAttribute:0x26EBFB938 toNode:v24 value:v25];
  uint64_t v26 = objc_msgSend(NSString, "stringWithFormat:", @"%C", 8203);
  unint64_t v27 = +[OIXMLTextNode textNodeWithStringValue:v26];

  [v24 addChild:v27];
}

- (int)defaultTabWidth
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.mParent);

  if (!WeakRetained) {
    return 36;
  }
  v4 = [(CMMapper *)self root];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = (int)((double)(int)[v4 defaultTabWidth] / 20.0);
    if (v5) {
      int v6 = v5;
    }
    else {
      int v6 = 36;
    }
  }
  else
  {
    int v6 = 36;
  }

  return v6;
}

- (WMCharacterRunMapper)initWithText:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WMCharacterRunMapper;
  int v6 = [(CMMapper *)&v13 init];
  id v7 = v6;
  if (v6)
  {
    wdCharacterRun = v6->wdCharacterRun;
    v6->wdCharacterRun = 0;

    objc_storeWeak((id *)&v7->super.mParent, 0);
    objc_storeStrong((id *)&v7->mText, a3);
    int v9 = objc_alloc_init(WMStyle);
    mStyle = v7->mStyle;
    v7->mStyle = v9;

    id v11 = v7;
  }

  return v7;
}

- (void)map1At:(id)a3 withState:(id)a4
{
  id v14 = a3;
  id v5 = [(WDCharacterRun *)self->wdCharacterRun string];
  int v6 = v5;
  if (v5 && [v5 length])
  {
    id v7 = +[OIXMLElement elementWithType:16];
    [v14 addChild:v7];
    unsigned int v8 = [(WMCharacterRunMapper *)self countAndStripLeadingTabs];
    int v9 = +[OIXMLTextNode textNodeWithStringValue:v6];
    [v7 addChild:v9];
    id v10 = [(WMCharacterRunMapper *)self copyCharacterStyle];
    id v11 = [(WDRunWithCharacterProperties *)self->wdCharacterRun properties];
    [v10 addCharacterProperties:v11];
    if (v8)
    {
      v12 = [(CMMapper *)self root];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        goto LABEL_8;
      }
      objc_super v13 = -[CMLengthProperty initWithNumber:unit:]([CMLengthProperty alloc], "initWithNumber:unit:", 2, (double)(int)([v12 defaultTabWidth] * v8));
      [v10 addProperty:v13 forKey:0x26EC19558];
    }
    [(CMMapper *)self addStyleUsingGlobalCacheTo:v7 style:v10];
LABEL_8:
  }
}

- (unsigned)countAndStripLeadingTabs
{
  v3 = [(WDCharacterRun *)self->wdCharacterRun string];
  uint64_t v4 = [v3 length];
  if (v4)
  {
    uint64_t v5 = 0;
    unsigned int v6 = 0;
    while (1)
    {
      int v7 = [v3 characterAtIndex:v5];
      if (v7 != 9 && v7 != 32) {
        break;
      }
      if (v7 == 9) {
        ++v6;
      }
      if (v4 == ++v5)
      {
        if (!v6) {
          goto LABEL_15;
        }
LABEL_9:
        wdCharacterRun = self->wdCharacterRun;
        int v9 = objc_msgSend(NSString, "stringWithFormat:", @"%C", 8203);
        [(WDCharacterRun *)wdCharacterRun setString:v9];
        goto LABEL_14;
      }
    }
    if (!v6) {
      goto LABEL_15;
    }
    if (!v5) {
      goto LABEL_9;
    }
    id v10 = self->wdCharacterRun;
    int v9 = objc_msgSend(v3, "substringWithRange:", v5, v4 - v5);
    [(WDCharacterRun *)v10 setString:v9];
LABEL_14:
  }
  else
  {
    unsigned int v6 = 0;
  }
LABEL_15:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mText, 0);
  objc_storeStrong((id *)&self->mStyle, 0);
  objc_storeStrong((id *)&self->wdCharacterRun, 0);
}

- (id)boldStyle
{
  v2 = objc_alloc_init(WMStyle);
  v3 = [[CMToggleProperty alloc] initWithCMTogglePropertyValue:1];
  [(CMStyle *)v2 addProperty:v3 forKey:0x26EC087B8];

  return v2;
}

- (id)baseStyle
{
  v3 = [(WDRunWithCharacterProperties *)self->wdCharacterRun properties];
  if ([v3 isBaseStyleOverridden])
  {
    uint64_t v4 = [v3 baseStyle];
    uint64_t v5 = [[WMStyle alloc] initWithWDStyle:v4];
  }
  else
  {
    uint64_t v4 = [(WDRun *)self->wdCharacterRun paragraph];
    unsigned int v6 = [v4 properties];
    if ([v6 isBaseStyleOverridden])
    {
      int v7 = [v6 baseStyle];
      uint64_t v5 = [[WMStyle alloc] initWithWDStyle:v7];
    }
    else
    {
      uint64_t v5 = [(WMCharacterRunMapper *)self boldStyle];
    }
  }
  return v5;
}

@end