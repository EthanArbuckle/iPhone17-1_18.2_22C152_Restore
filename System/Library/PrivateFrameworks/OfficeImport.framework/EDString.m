@interface EDString
+ (EDString)edStringWithString:(id)a3;
+ (EDString)edStringWithString:(id)a3 runs:(id)a4;
+ (id)string;
- (BOOL)areThereRuns;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEDString:(id)a3;
- (BOOL)isEqualToString:(id)a3;
- (EDString)init;
- (EDString)initWithString:(id)a3;
- (EDString)initWithString:(id)a3 runs:(id)a4;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)firstFont;
- (id)firstRunEffects;
- (id)firstRunFont;
- (id)phoneticInfo;
- (id)runs;
- (id)string;
- (unint64_t)hash;
- (void)appendString:(id)a3;
- (void)prependString:(id)a3;
- (void)removeCharacterAtIndex:(unint64_t)a3;
- (void)removeCharactersInSet:(id)a3;
- (void)setDoNotModify:(BOOL)a3;
- (void)setPhoneticInfo:(id)a3;
- (void)setRuns:(id)a3;
- (void)setString:(id)a3;
@end

@implementation EDString

+ (EDString)edStringWithString:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithString:v3];

  return (EDString *)v4;
}

- (EDString)initWithString:(id)a3
{
  id v4 = a3;
  v5 = [(EDString *)self init];
  v6 = v5;
  if (v5) {
    [(EDString *)v5 setString:v4];
  }

  return v6;
}

- (EDString)init
{
  v3.receiver = self;
  v3.super_class = (Class)EDString;
  result = [(EDString *)&v3 init];
  if (result) {
    result->mDoNotModify = 0;
  }
  return result;
}

- (void)setString:(id)a3
{
  v5 = (NSString *)a3;
  if (!self->mDoNotModify)
  {
    mString = self->mString;
    p_mString = &self->mString;
    if (mString != v5)
    {
      v8 = v5;
      objc_storeStrong((id *)p_mString, a3);
      v5 = v8;
    }
  }
}

- (id)string
{
  return self->mString;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (EDString *)a3;
  v5 = v4;
  if (v4 != self)
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v6 = [(EDString *)self isEqualToString:v5];
LABEL_8:
        BOOL v7 = v6;
        goto LABEL_10;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v6 = [(EDString *)self isEqualToEDString:v5];
        goto LABEL_8;
      }
    }
    BOOL v7 = 0;
    goto LABEL_10;
  }
  BOOL v7 = 1;
LABEL_10:

  return v7;
}

- (BOOL)isEqualToEDString:(id)a3
{
  id v4 = a3;
  mRuns = self->mRuns;
  if ((mRuns == (EDRunsCollection *)v4[2] || -[EDCollection isEqual:](mRuns, "isEqual:"))
    && ((mPhoneticInfo = self->mPhoneticInfo, mPhoneticInfo == (EDPhoneticInfo *)v4[3])
     || -[EDPhoneticInfo isEqual:](mPhoneticInfo, "isEqual:")))
  {
    mString = self->mString;
    if (mString == (NSString *)v4[1]) {
      char v8 = 1;
    }
    else {
      char v8 = -[NSString isEqual:](mString, "isEqual:");
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)setDoNotModify:(BOOL)a3
{
  self->mDoNotModify = a3;
}

- (id)runs
{
  return self->mRuns;
}

- (void)setRuns:(id)a3
{
  v5 = (EDRunsCollection *)a3;
  if (!self->mDoNotModify)
  {
    mRuns = self->mRuns;
    p_mRuns = &self->mRuns;
    if (mRuns != v5)
    {
      char v8 = v5;
      objc_storeStrong((id *)p_mRuns, a3);
      v5 = v8;
    }
  }
}

- (BOOL)isEmpty
{
  mString = self->mString;
  return !mString || [(NSString *)mString length] == 0;
}

- (BOOL)areThereRuns
{
  mRuns = self->mRuns;
  if (mRuns) {
    LOBYTE(mRuns) = [(EDCollection *)mRuns count] != 0;
  }
  return (char)mRuns;
}

- (BOOL)isEqualToString:(id)a3
{
  return [(NSString *)self->mString isEqual:a3];
}

+ (id)string
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (unint64_t)hash
{
  unint64_t v3 = [(EDPhoneticInfo *)self->mPhoneticInfo hash];
  unint64_t v4 = ([(EDCollection *)self->mRuns hash] << 8) + (v3 << 16);
  return v4 + [(NSString *)self->mString hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init((Class)objc_opt_class());
  BOOL v6 = v5;
  if (v5)
  {
    *((unsigned char *)v5 + 32) = 0;
    id v7 = [(EDKeyedCollection *)self->mRuns copyWithZone:a3];
    char v8 = (void *)v6[2];
    v6[2] = v7;

    uint64_t v9 = [(NSString *)self->mString copy];
    v10 = (void *)v6[1];
    v6[1] = v9;

    id v11 = [(EDPhoneticInfo *)self->mPhoneticInfo copyWithZone:a3];
    v12 = (void *)v6[3];
    v6[3] = v11;

    v13 = v6;
  }

  return v6;
}

- (id)phoneticInfo
{
  return self->mPhoneticInfo;
}

- (void)setPhoneticInfo:(id)a3
{
  id v7 = (EDPhoneticInfo *)a3;
  if (!self->mDoNotModify)
  {
    mPhoneticInfo = self->mPhoneticInfo;
    p_mPhoneticInfo = &self->mPhoneticInfo;
    if (mPhoneticInfo != v7)
    {
      objc_storeStrong((id *)p_mPhoneticInfo, a3);
      [(EDPhoneticInfo *)*p_mPhoneticInfo setDoNotModify:1];
    }
  }
}

- (id)firstRunFont
{
  if ([(EDString *)self areThereRuns])
  {
    unint64_t v3 = [(EDCollection *)self->mRuns objectAtIndex:0];
    unint64_t v4 = [v3 font];
  }
  else
  {
    unint64_t v4 = 0;
  }
  return v4;
}

- (id)firstRunEffects
{
  if ([(EDString *)self areThereRuns])
  {
    unint64_t v3 = [(EDCollection *)self->mRuns objectAtIndex:0];
    unint64_t v4 = [v3 effects];
  }
  else
  {
    unint64_t v4 = 0;
  }
  return v4;
}

- (EDString)initWithString:(id)a3 runs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(EDString *)self initWithString:v6];
  uint64_t v9 = v8;
  if (v8) {
    [(EDString *)v8 setRuns:v7];
  }

  return v9;
}

+ (EDString)edStringWithString:(id)a3 runs:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithString:v5 runs:v6];

  return (EDString *)v7;
}

- (void)prependString:(id)a3
{
  id v4 = a3;
  if (!self->mDoNotModify)
  {
    id v11 = v4;
    id v5 = [v4 stringByAppendingString:self->mString];
    [(EDString *)self setString:v5];

    unint64_t v6 = [(EDCollection *)self->mRuns count];
    uint64_t v7 = [v11 length];
    if (v6 >= 2)
    {
      uint64_t v8 = v7;
      for (uint64_t i = 1; i != v6; ++i)
      {
        v10 = [(EDCollection *)self->mRuns objectAtIndex:i];
        [v10 adjustIndex:v8];
      }
    }
    [(EDPhoneticInfo *)self->mPhoneticInfo prependString:v11];
    id v4 = v11;
  }
}

- (void)appendString:(id)a3
{
  id v4 = a3;
  if (!self->mDoNotModify)
  {
    id v6 = v4;
    id v5 = [(NSString *)self->mString stringByAppendingString:v4];
    [(EDString *)self setString:v5];

    id v4 = v6;
  }
}

- (void)removeCharacterAtIndex:(unint64_t)a3
{
  mString = self->mString;
  if (mString && [(NSString *)mString length] > a3)
  {
    unint64_t v6 = [(EDCollection *)self->mRuns count];
    if (v6 >= 2)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 1; i != v7; ++i)
      {
        id v11 = [(EDCollection *)self->mRuns objectAtIndex:i];
        unint64_t v9 = [v11 charIndex];
        if (v9) {
          BOOL v10 = v9 >= a3;
        }
        else {
          BOOL v10 = 0;
        }
        if (v10) {
          [v11 setCharIndex:v9 - 1];
        }
      }
    }
    -[NSString stringByReplacingCharactersInRange:withString:](self->mString, "stringByReplacingCharactersInRange:withString:", a3, 1, &stru_26EBF24D8);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    -[EDString setString:](self, "setString:");
  }
}

- (void)removeCharactersInSet:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    mString = self->mString;
    if (mString)
    {
      for (uint64_t i = [(NSString *)mString rangeOfCharacterFromSet:v6];
            i != 0x7FFFFFFFFFFFFFFFLL;
            uint64_t i = [(NSString *)self->mString rangeOfCharacterFromSet:v6])
      {
        -[EDString removeCharacterAtIndex:](self, "removeCharacterAtIndex:");
      }
    }
  }
}

- (id)firstFont
{
  mRuns = self->mRuns;
  if (mRuns
    && [(EDCollection *)mRuns count]
    && ([(EDCollection *)self->mRuns objectAtIndex:0],
        id v4 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v4,
        (isKindOfClass & 1) != 0))
  {
    id v6 = [(EDCollection *)self->mRuns objectAtIndex:0];
    unint64_t v7 = [v6 font];
  }
  else
  {
    unint64_t v7 = 0;
  }
  return v7;
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDString;
  id v2 = [(EDString *)&v4 description];
  return (NSString *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPhoneticInfo, 0);
  objc_storeStrong((id *)&self->mRuns, 0);
  objc_storeStrong((id *)&self->mString, 0);
}

@end