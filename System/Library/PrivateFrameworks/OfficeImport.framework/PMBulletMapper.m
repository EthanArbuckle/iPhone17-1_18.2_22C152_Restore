@interface PMBulletMapper
+ (id)stringForIndex:(unint64_t)a3 withFormat:(int)a4;
- (PMBulletMapper)initWithOadProperties:(id)a3 fontSize:(int)a4 parent:(id)a5;
- (id)bulletFontName;
- (id)makeBulletWithListState:(id)a3;
- (int)bulletSize;
- (void)mapAt:(id)a3 withState:(id)a4;
- (void)mapBulletColorWithState:(id)a3;
@end

@implementation PMBulletMapper

- (PMBulletMapper)initWithOadProperties:(id)a3 fontSize:(int)a4 parent:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PMBulletMapper;
  v11 = [(CMMapper *)&v16 initWithParent:v10];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->mProperties, a3);
    v13 = objc_alloc_init(CMStyle);
    mStyle = v12->mStyle;
    v12->mStyle = v13;

    v12->mFontSize = a4;
  }

  return v12;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(OADParagraphProperties *)self->mProperties bulletProperties];
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = [v7 listState];
        id v10 = [(PMBulletMapper *)self makeBulletWithListState:v9];
        if (v10)
        {
          uint64_t v11 = [(PMBulletMapper *)self bulletSize];
          v12 = [(PMBulletMapper *)self bulletFontName];
          unsigned int v26 = v11;
          if (+[WMSymbolMapper isSymbolFontName:v12])
          {
            int v13 = +[WMSymbolMapper mapCharacter:[(__CFString *)v10 characterAtIndex:0] withFontName:v12];
            __int16 v27 = v13;
            if (v13)
            {
              uint64_t v14 = [NSString stringWithCharacters:&v27 length:1];

              id v10 = (__CFString *)v14;
            }
            else
            {

              id v10 = @"•";
            }

            v12 = 0;
            uint64_t v11 = v26;
          }
          [(__CFString *)v10 oi_sizeWithFontName:v12 size:v11];
          double v16 = v15;
          [(OADParagraphProperties *)self->mProperties indent];
          float v18 = v17;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            int v19 = (int)(float)((float)-(int)v16 - v18) + 20;
          }
          else {
            int v19 = (int)(float)((float)-(int)v16 - v18);
          }
          [(OADParagraphProperties *)self->mProperties nonOveridenLeftMargin];
          if (v20 != 0.0)
          {
            mStyle = self->mStyle;
            [(OADParagraphProperties *)self->mProperties nonOveridenLeftMargin];
            [(CMStyle *)mStyle appendPropertyForName:0x26EC07B58 length:1 unit:-v22];
            [(OADParagraphProperties *)self->mProperties nonOveridenLeftMargin];
            int v19 = (int)(v23 + (double)v19);
          }
          if (v19 >= 1) {
            [(CMStyle *)self->mStyle appendPropertyForName:0x26EC19578 length:1 unit:(double)v19];
          }
          v24 = +[OIXMLElement elementWithType:16];
          v25 = +[OIXMLTextNode textNodeWithStringValue:v10];
          [v24 addChild:v25];

          [(CMStyle *)self->mStyle appendPropertyForName:0x26EC08778 intValue:v26];
          [(PMBulletMapper *)self mapBulletColorWithState:v7];
          [(CMMapper *)self addStyleUsingGlobalCacheTo:v24 style:self->mStyle];
          [v6 addChild:v24];
        }
      }
    }
  }
}

- (id)makeBulletWithListState:(id)a3
{
  id v4 = a3;
  v5 = [(OADParagraphProperties *)self->mProperties bulletProperties];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v6 = [(OADParagraphProperties *)self->mProperties level];
    +[PMBulletMapper stringForIndex:withFormat:](PMBulletMapper, "stringForIndex:withFormat:", [v4 counterAtLevel:v6] + 1, objc_msgSend(v5, "autoNumberSchemeType"));
    id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    [v4 increaseCounterAtLevel:v6];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v5 bullet];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v7 = @"•";
      }
      else {
        id v7 = 0;
      }
    }
  }

  return v7;
}

- (int)bulletSize
{
  if ([(OADParagraphProperties *)self->mProperties hasBulletSize])
  {
    v3 = [(OADParagraphProperties *)self->mProperties bulletSize];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v4 = [v3 points];
LABEL_16:

      return v4;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int mFontSize = self->mFontSize;
      if (mFontSize) {
        float v6 = (float)mFontSize;
      }
      else {
        [(OADCharacterProperties *)self->mProperties size];
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v4 = 18;
        goto LABEL_16;
      }
      [v3 percent];
      float v8 = v7;
      int v9 = self->mFontSize;
      if (v9) {
        float v10 = (float)v9;
      }
      else {
        [(OADCharacterProperties *)self->mProperties size];
      }
      float v6 = (float)(v8 / 100.0) * v10;
    }
    int v4 = (int)v6;
    goto LABEL_16;
  }
  return 18;
}

- (id)bulletFontName
{
  if (![(OADParagraphProperties *)self->mProperties hasBulletFont])
  {
    v5 = 0;
    goto LABEL_10;
  }
  v3 = [(OADParagraphProperties *)self->mProperties bulletFont];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 font];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_9;
    }
    uint64_t v4 = [(OADCharacterProperties *)self->mProperties latinFont];
  }
  v5 = (void *)v4;
LABEL_9:

LABEL_10:
  return v5;
}

- (void)mapBulletColorWithState:(id)a3
{
  id v11 = a3;
  if ([(OADParagraphProperties *)self->mProperties hasBulletColor])
  {
    uint64_t v4 = [(OADParagraphProperties *)self->mProperties bulletColor];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [v4 color];
      if (!v5) {
        goto LABEL_12;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_12;
      }
      float v6 = [(OADCharacterProperties *)self->mProperties fill];
      if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v5 = [v6 color];
      }
      else
      {
        v5 = 0;
      }

      if (!v5) {
        goto LABEL_12;
      }
    }
    float v7 = +[CMColorProperty nsColorFromOADColor:v5 state:v11];
    float v8 = NSString;
    int v9 = +[CMColorProperty cssStringFromTSUColor:v7];
    float v10 = [v8 stringWithString:v9];

    [(CMStyle *)self->mStyle appendPropertyForName:0x26EC18B58 stringWithColons:v10];
LABEL_12:
  }
}

+ (id)stringForIndex:(unint64_t)a3 withFormat:(int)a4
{
  if ((a4 - 1) > 0x14) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = dword_238EF15F0[a4 - 1];
  }
  float v7 = +[CMNumberFormatter formatterForNumberFormat:v6 language:1033];
  float v8 = [v7 stringForNumber:a3];
  if ((a4 - 3) >= 0x13) {
    int v9 = @"(%@)";
  }
  else {
    int v9 = off_264D68BE0[a4 - 3];
  }
  float v10 = objc_msgSend(NSString, "stringWithFormat:", v9, v8);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mStyle, 0);
  objc_storeStrong((id *)&self->mProperties, 0);
}

@end