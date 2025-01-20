@interface EDPhoneticInfo
+ (id)phoneticInfoWithResources:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEDPhoneticInfo:(id)a3;
- (EDPhoneticInfo)initWithResources:(id)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)font;
- (id)runs;
- (id)string;
- (int)align;
- (int)type;
- (unint64_t)fontIndex;
- (unint64_t)hash;
- (void)appendString:(id)a3;
- (void)prependString:(id)a3;
- (void)setAlign:(int)a3;
- (void)setDoNotModify:(BOOL)a3;
- (void)setFont:(id)a3;
- (void)setFontIndex:(unint64_t)a3;
- (void)setString:(id)a3;
- (void)setType:(int)a3;
@end

@implementation EDPhoneticInfo

- (EDPhoneticInfo)initWithResources:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EDPhoneticInfo;
  v5 = [(EDPhoneticInfo *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mResources, v4);
    v6->mFontIndex = 0;
    *(void *)&v6->mType = 0;
  }

  return v6;
}

+ (id)phoneticInfoWithResources:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithResources:v3];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  uint64_t v7 = [v5 initWithResources:WeakRetained];

  if (v7)
  {
    *(void *)(v7 + 16) = self->mFontIndex;
    *(void *)(v7 + 32) = *(void *)&self->mType;
    uint64_t v8 = [(NSString *)self->mString copy];
    v9 = *(void **)(v7 + 24);
    *(void *)(v7 + 24) = v8;

    id v10 = [(EDCollection *)self->mRuns copyWithZone:a3];
    v11 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v10;

    *(unsigned char *)(v7 + 48) = self->mDoNotModify;
    id v12 = (id)v7;
  }

  return (id)v7;
}

- (BOOL)isEqualToEDPhoneticInfo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  BOOL v6 = self->mFontIndex == v4[2]
    && self->mType == *((_DWORD *)v4 + 8)
    && [(EDCollection *)self->mRuns isEqual:v4[5]]
    && [(NSString *)self->mString isEqualToString:v5[3]]
    && self->mAlign == *((_DWORD *)v5 + 9);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (EDPhoneticInfo *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(EDPhoneticInfo *)self isEqualToEDPhoneticInfo:v5];

  return v6;
}

- (unint64_t)hash
{
  unint64_t mFontIndex = self->mFontIndex;
  return ([(EDCollection *)self->mRuns hash] << 8) + (mFontIndex << 16) + self->mAlign + (uint64_t)self->mType;
}

- (int)type
{
  return self->mType;
}

- (void)setType:(int)a3
{
  if (!self->mDoNotModify) {
    self->mType = a3;
  }
}

- (int)align
{
  return self->mAlign;
}

- (void)setAlign:(int)a3
{
  if (!self->mDoNotModify) {
    self->mAlign = a3;
  }
}

- (id)string
{
  return self->mString;
}

- (void)setString:(id)a3
{
  id v5 = (NSString *)a3;
  if (!self->mDoNotModify)
  {
    mString = self->mString;
    p_mString = &self->mString;
    if (mString != v5)
    {
      uint64_t v8 = v5;
      objc_storeStrong((id *)p_mString, a3);
      id v5 = v8;
    }
  }
}

- (void)prependString:(id)a3
{
  id v10 = a3;
  if (!self->mDoNotModify)
  {
    id v4 = [v10 stringByAppendingString:self->mString];
    [(EDPhoneticInfo *)self setString:v4];

    unint64_t v5 = [(EDCollection *)self->mRuns count];
    uint64_t v6 = [v10 length];
    if (v5 >= 2)
    {
      uint64_t v7 = v6;
      for (uint64_t i = 1; i != v5; ++i)
      {
        v9 = [(EDCollection *)self->mRuns objectAtIndex:i];
        [v9 adjustIndex:v7];
      }
    }
  }
}

- (void)appendString:(id)a3
{
  id v4 = a3;
  if (!self->mDoNotModify)
  {
    id v6 = v4;
    unint64_t v5 = [(NSString *)self->mString stringByAppendingString:v4];
    [(EDPhoneticInfo *)self setString:v5];

    id v4 = v6;
  }
}

- (id)font
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  id v4 = [WeakRetained fonts];

  unint64_t v5 = [v4 objectAtIndex:self->mFontIndex];

  return v5;
}

- (void)setFont:(id)a3
{
  id v4 = a3;
  if (!self->mDoNotModify)
  {
    id v7 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
    id v6 = [WeakRetained fonts];

    self->unint64_t mFontIndex = [v6 addObject:v7];
    id v4 = v7;
  }
}

- (id)runs
{
  return self->mRuns;
}

- (void)setDoNotModify:(BOOL)a3
{
  self->mDoNotModify = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mRuns, 0);
  objc_storeStrong((id *)&self->mString, 0);
  objc_destroyWeak((id *)&self->mResources);
}

- (unint64_t)fontIndex
{
  return self->mFontIndex;
}

- (void)setFontIndex:(unint64_t)a3
{
  if (!self->mDoNotModify) {
    self->unint64_t mFontIndex = a3;
  }
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDPhoneticInfo;
  v2 = [(EDPhoneticInfo *)&v4 description];
  return (NSString *)v2;
}

@end