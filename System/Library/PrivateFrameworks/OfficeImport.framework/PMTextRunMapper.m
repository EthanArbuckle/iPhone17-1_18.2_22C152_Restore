@interface PMTextRunMapper
- (BOOL)_isDefaultFill:(id)a3;
- (PMTextRunMapper)initWithOadTextRun:(id)a3 parent:(id)a4;
- (id)copyCharacterStyleWithState:(id)a3;
- (id)fontScheme;
- (void)addFontForLanguageType:(int)a3 toCharacterStyle:(id)a4;
- (void)mapAt:(id)a3 withState:(id)a4;
@end

@implementation PMTextRunMapper

- (PMTextRunMapper)initWithOadTextRun:(id)a3 parent:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PMTextRunMapper;
  v8 = [(CMMapper *)&v11 initWithParent:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->mTextRun, a3);
  }

  return v9;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v30 = a4;
  id v7 = [(OADTextRun *)self->mTextRun properties];
  v8 = [v7 clickHyperlink];

  v31 = v8;
  if (v8)
  {
    v9 = +[OIXMLElement elementWithType:0];
    v10 = [v8 targetLocation];
    objc_super v11 = [v10 absoluteString];
    v12 = +[OIXMLAttribute attributeWithName:0x26EC19118 stringValue:v11];
    [v9 addAttribute:v12];
  }
  else
  {
    v9 = +[OIXMLElement elementWithType:16];
  }
  v13 = v8;
  id v29 = [(PMTextRunMapper *)self copyCharacterStyleWithState:v30];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v14 = [(OADTextRun *)self->mTextRun text];
    if ([v14 length])
    {
      id v28 = v6;
      unint64_t v32 = 0;
      uint64_t v33 = 0;
      uint64_t v15 = objc_msgSend(v14, "tc_languageTypeAtIndex:effectiveRange:", 0, &v32);
      unint64_t v16 = v32;
      uint64_t v17 = v33;
      uint64_t v18 = [v14 length];
      if (v16) {
        BOOL v19 = 0;
      }
      else {
        BOOL v19 = v17 == v18;
      }
      char v20 = v19;
      if (v19)
      {
        [(PMTextRunMapper *)self addFontForLanguageType:v15 toCharacterStyle:v29];
        v21 = +[OIXMLTextNode textNodeWithStringValue:v14];
        [v9 addChild:v21];
      }
      [(CMMapper *)self addStyleUsingGlobalCacheTo:v9 style:v29];
      if ((v20 & 1) == 0)
      {
        do
        {
          v22 = +[OIXMLElement elementWithType:16];
          [v9 addChild:v22];
          v23 = objc_alloc_init(CMStyle);
          [(PMTextRunMapper *)self addFontForLanguageType:v15 toCharacterStyle:v23];
          [(CMMapper *)self addStyleUsingGlobalCacheTo:v22 style:v23];
          v24 = objc_msgSend(v14, "substringWithRange:", v32, v33);
          v25 = +[OIXMLTextNode textNodeWithStringValue:v24];
          [v22 addChild:v25];

          v32 += v33;
          unint64_t v26 = v32;
          if (v26 >= [v14 length]) {
            break;
          }
          uint64_t v15 = objc_msgSend(v14, "tc_languageTypeAtIndex:effectiveRange:", v32, &v32);
        }
        while ((v15 & 0x80000000) == 0);
      }

      id v6 = v28;
      v13 = v31;
      goto LABEL_23;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = objc_msgSend(NSString, "stringWithFormat:", @"%C", 13);
      [v9 setStringValue:v27];
      [(CMMapper *)self addStyleUsingGlobalCacheTo:v9 style:v29];

LABEL_23:
      [v6 addChild:v9];
    }
  }
}

- (id)copyCharacterStyleWithState:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v33 = a3;
  v4 = objc_alloc_init(CMStyle);
  v5 = [(OADTextRun *)self->mTextRun properties];
  if ([v5 hasBaseline] && (objc_msgSend(v5, "baseline"), (uint64_t)v6))
  {
    if ((uint64_t)v6 <= 0) {
      id v7 = @"sub";
    }
    else {
      id v7 = @"super";
    }
    [(CMStyle *)v4 appendPropertyForName:0x26EC18B78 stringValue:v7];
    int v8 = 1;
  }
  else
  {
    int v8 = 0;
  }
  v9 = [v33 currentRowStyle];
  unint64_t v32 = [v9 textStyle];
  if ([v5 hasSize])
  {
    [v5 size];
    float v11 = v10;
    v12 = [CMLengthProperty alloc];
    double v13 = v11;
    if (v8) {
      double v13 = v11 * 0.666666667;
    }
    v14 = [(CMLengthProperty *)v12 initWithNumber:1 unit:v13];
    [(CMStyle *)v4 addProperty:v14 forKey:0x26EC08778];
  }
  uint64_t v15 = [v5 fill];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!v9 || ![(PMTextRunMapper *)self _isDefaultFill:v15])
    {
      uint64_t v17 = +[CMColorProperty nsColorFromOADFill:v15 state:v33];
      if (v17)
      {
        v21 = NSString;
        v22 = +[CMColorProperty cssStringFromTSUColor:v17];
        unint64_t v16 = [v21 stringWithString:v22];

        [(CMStyle *)v4 appendPropertyForName:0x26EC18B58 stringWithColons:v16];
      }
      else
      {
        unint64_t v16 = 0;
      }
LABEL_22:

      goto LABEL_23;
    }
LABEL_17:
    unint64_t v16 = [v32 color];
    uint64_t v17 = +[CMColorProperty nsColorFromOADColor:v16 state:v33];
    if (v17)
    {
      uint64_t v18 = NSString;
      BOOL v19 = +[CMColorProperty cssStringFromTSUColor:v17];
      char v20 = [v18 stringWithString:v19];

      [(CMStyle *)v4 appendPropertyForName:0x26EC18B58 stringWithColons:v20];
    }
    goto LABEL_22;
  }
  if (v9) {
    goto LABEL_17;
  }
LABEL_23:
  if ([v5 hasIsBold] && (objc_msgSend(v5, "isBold") & 1) != 0
    || v32 && ![v32 bold])
  {
    [(CMStyle *)v4 appendPropertyForName:0x26EC087B8 stringValue:@"bold"];
  }
  if ([v5 isItalic]) {
    [(CMStyle *)v4 appendPropertyForName:0x26EC087F8 stringValue:@"italic"];
  }
  [v5 effects];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v35 != v25) {
          objc_enumerationMutation(v23);
        }
        if ([*(id *)(*((void *)&v34 + 1) + 8 * i) type] == 6) {
          [(CMStyle *)v4 appendPropertyForName:0x26EC19618 stringValue:@"2px 2px 2px #000"];
        }
      }
      uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v24);
  }

  if ([v5 underlineType])
  {
    v27 = @"underline";
LABEL_41:
    [(CMStyle *)v4 appendPropertyForName:0x26EC08818 stringValue:v27];
    goto LABEL_45;
  }
  if ([v5 hasStrikeThroughType] && objc_msgSend(v5, "strikeThroughType"))
  {
    v27 = @"line-through";
    goto LABEL_41;
  }
LABEL_45:
  if ([v5 hasCaps] && objc_msgSend(v5, "caps") == 1)
  {
    id v28 = @":small-caps;";
    id v29 = HUPropNmFontVariant;
LABEL_51:
    [(CMStyle *)v4 appendPropertyForName:*v29 stringWithColons:v28];
    goto LABEL_52;
  }
  if ([v5 hasCaps] && objc_msgSend(v5, "caps") == 2)
  {
    id v28 = @":uppercase;";
    id v29 = HUPropNmTextTransform;
    goto LABEL_51;
  }
LABEL_52:
  if ([v5 hasSpacing])
  {
    [v5 spacing];
    if (v30 != 0.0) {
      [(CMStyle *)v4 appendPropertyForName:0x26EC19418 length:1 unit:v30];
    }
  }

  return v4;
}

- (id)fontScheme
{
  uint64_t v2 = [(CMMapper *)self parent];
  if (v2)
  {
    v3 = (void *)v2;
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v4 = [v3 parent];

      v3 = (void *)v4;
      if (!v4) {
        goto LABEL_5;
      }
    }
    float v6 = [v3 defaultTheme];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [v6 fontScheme];
    }
    else
    {
      id v7 = [v6 baseStyles];
      v5 = [v7 fontScheme];
    }
  }
  else
  {
LABEL_5:
    v5 = 0;
  }
  return v5;
}

- (BOOL)_isDefaultFill:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 color];
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [v4 schemeColorIndex] == 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)addFontForLanguageType:(int)a3 toCharacterStyle:(id)a4
{
  id v6 = a4;
  id v7 = [(OADTextRun *)self->mTextRun properties];
  int v8 = v7;
  switch(a3)
  {
    case -1:
    case 0:
    case 4:
      uint64_t v9 = [v7 latinFont];
      goto LABEL_6;
    case 1:
      uint64_t v9 = [v7 eastAsianFont];
      goto LABEL_6;
    case 2:
      uint64_t v9 = [v7 bidiFont];
      goto LABEL_6;
    case 3:
      uint64_t v9 = [v7 symbolFont];
LABEL_6:
      float v10 = (void *)v9;
      if (!v9) {
        goto LABEL_7;
      }
      goto LABEL_9;
    default:
LABEL_7:
      float v10 = [v8 latinFont];
      if (!v10)
      {
        float v10 = [v8 symbolFont];
      }
LABEL_9:
      float v11 = [(PMTextRunMapper *)self fontScheme];
      id v22 = v6;
      id v12 = v11;
      double v13 = v10;
      uint64_t v15 = v13;
      if (v13)
      {
        unint64_t v16 = OADSchemeFontReference::schemeFontReferenceWithString(v13, v14);
        uint64_t v17 = HIDWORD(v16);
        BOOL v18 = v16 == -1 || HIDWORD(v16) == -1;
        BOOL v19 = v15;
        if (!v18)
        {
          char v20 = objc_msgSend(v12, "fontForId:");
          BOOL v19 = [v20 baseFontForId:v17];
        }
        v21 = [[CMStringProperty alloc] initWithString:v19];
        [v22 addProperty:v21 forKey:0x26EC08758];
      }

      return;
  }
}

- (void).cxx_destruct
{
}

@end