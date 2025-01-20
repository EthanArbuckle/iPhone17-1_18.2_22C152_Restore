@interface WDFont
+ (int)cpFontClassFromWdFontFamily:(int)a3;
- (BOOL)isEqual:(id)a3;
- (WDFont)init;
- (WDFont)initWithName:(id)a3;
- (id)alternateNames;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)name;
- (id)secondName;
- (int)characterSet;
- (int)fontFamily;
- (int)pitch;
- (unint64_t)hash;
- (void)addAlternateName:(id)a3;
- (void)setCharacterSet:(int)a3;
- (void)setFontFamily:(int)a3;
- (void)setName:(id)a3;
- (void)setPitch:(int)a3;
@end

@implementation WDFont

- (WDFont)initWithName:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WDFont;
  v5 = [(WDFont *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    mName = v5->mName;
    v5->mName = (NSString *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mAlternateNames = v5->mAlternateNames;
    v5->mAlternateNames = v8;

    *(void *)&v5->mFontFamily = 1;
    v5->mPitch = 0;
  }

  return v5;
}

- (void)setPitch:(int)a3
{
  self->mPitch = a3;
}

- (void)setFontFamily:(int)a3
{
  self->mFontFamily = a3;
}

- (void)setCharacterSet:(int)a3
{
  self->mCharacterSet = a3;
}

- (id)name
{
  return self->mName;
}

+ (int)cpFontClassFromWdFontFamily:(int)a3
{
  if ((a3 - 1) > 4) {
    return 0;
  }
  else {
    return dword_238EEEDC0[a3 - 1];
  }
}

- (void)setName:(id)a3
{
  id v6 = a3;
  id v4 = (NSString *)[v6 copy];
  mName = self->mName;
  self->mName = v4;
}

- (id)alternateNames
{
  return self->mAlternateNames;
}

- (void)addAlternateName:(id)a3
{
  mAlternateNames = self->mAlternateNames;
  id v4 = (id)[a3 copy];
  -[NSMutableArray addObject:](mAlternateNames, "addObject:");
}

- (id)secondName
{
  v3 = (void *)[(NSMutableArray *)self->mAlternateNames count];
  if (v3)
  {
    v3 = [(NSMutableArray *)self->mAlternateNames objectAtIndex:0];
  }
  return v3;
}

- (int)fontFamily
{
  return self->mFontFamily;
}

- (int)characterSet
{
  return self->mCharacterSet;
}

- (int)pitch
{
  return self->mPitch;
}

- (WDFont)init
{
  v8.receiver = self;
  v8.super_class = (Class)WDFont;
  v2 = [(WDFont *)&v8 init];
  if (v2)
  {
    v3 = (NSString *)objc_alloc_init(NSString);
    mName = v2->mName;
    v2->mName = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mAlternateNames = v2->mAlternateNames;
    v2->mAlternateNames = v5;

    *(void *)&v2->mFontFamily = 1;
    v2->mPitch = 0;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[WDFont allocWithZone:a3] init];
  uint64_t v5 = [(NSString *)self->mName copy];
  mName = v4->mName;
  v4->mName = (NSString *)v5;

  uint64_t v7 = [(NSMutableArray *)self->mAlternateNames copy];
  mAlternateNames = v4->mAlternateNames;
  v4->mAlternateNames = (NSMutableArray *)v7;

  *(void *)&v4->mFontFamily = *(void *)&self->mFontFamily;
  v4->mPitch = self->mPitch;
  return v4;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->mName hash];
  return [(NSMutableArray *)self->mAlternateNames hash] ^ v3 ^ self->mFontFamily ^ (unint64_t)self->mCharacterSet ^ self->mPitch;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    mName = self->mName;
    uint64_t v7 = [v5 name];
    if ([(NSString *)mName isEqualToString:v7])
    {
      mAlternateNames = self->mAlternateNames;
      v9 = [v5 alternateNames];
      if ([(NSMutableArray *)mAlternateNames isEqualToArray:v9]
        && (int mFontFamily = self->mFontFamily, mFontFamily == [v5 fontFamily])
        && (int mCharacterSet = self->mCharacterSet, mCharacterSet == [v5 characterSet]))
      {
        int mPitch = self->mPitch;
        BOOL v13 = mPitch == [v5 pitch];
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDFont;
  v2 = [(WDFont *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mAlternateNames, 0);
  objc_storeStrong((id *)&self->mName, 0);
}

@end