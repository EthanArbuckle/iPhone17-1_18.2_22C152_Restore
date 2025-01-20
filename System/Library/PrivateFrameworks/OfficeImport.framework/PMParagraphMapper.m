@interface PMParagraphMapper
- (PMParagraphMapper)initWithOadParagraph:(id)a3 parent:(id)a4;
- (id)copyParagraphStyleWithState:(id)a3 isFirstParagraph:(BOOL)a4;
- (id)fontScheme;
- (int)firstTextRunFontSize;
- (void)addEndCharacterStyleToStyle:(id)a3;
- (void)mapAt:(id)a3 withState:(id)a4 isFirstParagraph:(BOOL)a5;
@end

@implementation PMParagraphMapper

- (PMParagraphMapper)initWithOadParagraph:(id)a3 parent:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PMParagraphMapper;
  v8 = [(CMMapper *)&v11 initWithParent:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->mParagraph, a3);
  }

  return v9;
}

- (void)mapAt:(id)a3 withState:(id)a4 isFirstParagraph:(BOOL)a5
{
  BOOL v5 = a5;
  id v22 = a3;
  id v8 = a4;
  if (!self->mParagraph) {
    goto LABEL_14;
  }
  v9 = (void *)MEMORY[0x23EC9A170]();
  v10 = +[OIXMLElement elementWithType:14];
  [v22 addChild:v10];
  id v21 = [(PMParagraphMapper *)self copyParagraphStyleWithState:v8 isFirstParagraph:v5];
  if (![v10 childrenCount]) {
    [(PMParagraphMapper *)self addEndCharacterStyleToStyle:v21];
  }
  [(CMMapper *)self addStyleUsingGlobalCacheTo:v10 style:v21];
  id v11 = v10;

  v12 = [(OADParagraph *)self->mParagraph properties];
  if ([(PMBulletMapper *)v12 hasBulletProperties])
  {
    BOOL v13 = [(OADParagraph *)self->mParagraph isEmpty];

    if (v13) {
      goto LABEL_8;
    }
    v14 = [PMBulletMapper alloc];
    v15 = [(OADParagraph *)self->mParagraph properties];
    v12 = [(PMBulletMapper *)v14 initWithOadProperties:v15 fontSize:[(PMParagraphMapper *)self firstTextRunFontSize] parent:self];

    [(PMBulletMapper *)v12 mapAt:v11 withState:v8];
  }

LABEL_8:
  for (unint64_t i = 0; i < [(OADParagraph *)self->mParagraph textRunCount]; ++i)
  {
    v17 = [PMTextRunMapper alloc];
    v18 = [(OADParagraph *)self->mParagraph textRunAtIndex:i];
    v19 = [(PMTextRunMapper *)v17 initWithOadTextRun:v18 parent:self];

    [(PMTextRunMapper *)v19 mapAt:v11 withState:v8];
  }
  if (![v11 childrenCount])
  {
    v20 = objc_msgSend(NSString, "stringWithFormat:", @"%C", 160);
    [v11 setStringValue:v20];
  }
  id v22 = v11;
LABEL_14:
}

- (id)copyParagraphStyleWithState:(id)a3 isFirstParagraph:(BOOL)a4
{
  v6 = [(OADParagraph *)self->mParagraph properties];
  id v7 = objc_alloc_init(CMStyle);
  if ([v6 hasAlign])
  {
    if ([v6 align])
    {
      unsigned int v8 = [v6 align] - 1;
      if (v8 < 3) {
        [(CMStyle *)v7 appendPropertyForName:0x26EC195B8 stringValue:*(&off_264D68C78)[(char)v8]];
      }
    }
  }
  if ([v6 hasLeftMargin])
  {
    [v6 leftMargin];
    if (v9 != 0.0)
    {
      [v6 leftMargin];
      [(CMStyle *)v7 appendPropertyForName:0x26EC07B58 length:1 unit:v10];
    }
  }
  p_mParent = &self->super.mParent;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.mParent);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = objc_loadWeakRetained((id *)p_mParent);
    char v14 = [v13 isTableCellContent];

    if (v14) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  if ([v6 hasIndent])
  {
    [v6 indent];
    if (v15 != 0.0)
    {
      [v6 indent];
      [(CMStyle *)v7 appendPropertyForName:0x26EC195D8 length:1 unit:v16];
    }
  }
LABEL_15:
  if ([v6 hasLineSpacing])
  {
    v17 = [v6 lineSpacing];
    [(CMStyle *)v7 appendPropertyForName:0x26EC19438 oadTextSpacing:v17];
  }
  if ([v6 hasBeforeSpacing] && !a4)
  {
    v18 = [v6 beforeSpacing];
    [v6 size];
    -[CMStyle appendPropertyForName:oadTextSpacing:lineHeight:unit:](v7, "appendPropertyForName:oadTextSpacing:lineHeight:unit:", 0x26EC19598, v18, 1);
  }
  if ([v6 hasAfterSpacing])
  {
    v19 = [v6 afterSpacing];
    [v6 size];
    -[CMStyle appendPropertyForName:oadTextSpacing:lineHeight:unit:](v7, "appendPropertyForName:oadTextSpacing:lineHeight:unit:", 0x26EC19538, v19, 1);
  }
  return v7;
}

- (void)addEndCharacterStyleToStyle:(id)a3
{
  id v18 = a3;
  v4 = [(OADParagraph *)self->mParagraph paragraphEndCharacterProperties];
  BOOL v5 = [(PMParagraphMapper *)self fontScheme];
  if ([v4 hasLatinFont])
  {
    v6 = [v4 latinFont];

    if (v6)
    {
      id v7 = [v4 latinFont];
      unint64_t v9 = OADSchemeFontReference::schemeFontReferenceWithString(v7, v8);
      unint64_t v10 = HIDWORD(v9);
      if (v9 != -1 && HIDWORD(v9) != -1)
      {
        v12 = objc_msgSend(v5, "fontForId:");
        uint64_t v13 = [v12 baseFontForId:v10];

        id v7 = (OADSchemeFontReference *)v13;
      }
      char v14 = [[CMStringProperty alloc] initWithString:v7];
      [v18 addProperty:v14 forKey:0x26EC08758];
    }
  }
  if ([v4 hasSize])
  {
    float v15 = [CMLengthProperty alloc];
    [v4 size];
    v17 = [(CMLengthProperty *)v15 initWithNumber:1 unit:v16];
    [v18 addProperty:v17 forKey:0x26EC08778];
  }
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
    v6 = [v3 defaultTheme];
    id v7 = v6;
    if (v6)
    {
      unsigned int v8 = [v6 baseStyles];
      BOOL v5 = [v8 fontScheme];
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  else
  {
LABEL_5:
    BOOL v5 = 0;
  }
  return v5;
}

- (int)firstTextRunFontSize
{
  if (![(OADParagraph *)self->mParagraph textRunCount]) {
    return 0;
  }
  v3 = [(OADParagraph *)self->mParagraph textRunAtIndex:0];
  uint64_t v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 properties];
    if ([v5 hasSize])
    {
      [v5 size];
      int v7 = (int)v6;
    }
    else
    {
      int v7 = 0;
    }
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end