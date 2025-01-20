@interface OADFontReference
- (BOOL)isEqual:(id)a3;
- (id)color;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)index;
- (unint64_t)hash;
- (void)applyToParagraphProperties:(id)a3;
- (void)setColor:(id)a3;
- (void)setIndex:(int)a3;
@end

@implementation OADFontReference

- (void)setIndex:(int)a3
{
  self->mIndex = a3;
}

- (void)setColor:(id)a3
{
}

- (void)applyToParagraphProperties:(id)a3
{
  id v10 = a3;
  int mIndex = self->mIndex;
  if (mIndex)
  {
    if (mIndex != 1) {
      goto LABEL_15;
    }
    v5 = @"+mn-lt";
    v6 = @"+mn-cs";
    v7 = @"+mn-ea";
  }
  else
  {
    v5 = @"+mj-lt";
    v6 = @"+mj-cs";
    v7 = @"+mj-ea";
  }
  uint64_t v8 = [v10 isMergedWithParent];
  [v10 setMergedWithParent:0];
  if (([v10 hasLatinFont] & 1) == 0) {
    [v10 setLatinFont:v5];
  }
  if (([v10 hasEastAsianFont] & 1) == 0) {
    [v10 setEastAsianFont:v7];
  }
  if (([v10 hasBidiFont] & 1) == 0) {
    [v10 setBidiFont:v6];
  }
  if (self->mColor && ([v10 hasFill] & 1) == 0)
  {
    v9 = objc_alloc_init(OADSolidFill);
    [(OADSolidFill *)v9 setColor:self->mColor];
    [v10 setFill:v9];
  }
  [v10 setMergedWithParent:v8];
LABEL_15:
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init((Class)objc_opt_class());
  v5[2] = self->mIndex;
  id v6 = [(OADColor *)self->mColor copyWithZone:a3];
  v7 = (void *)*((void *)v5 + 2);
  *((void *)v5 + 2) = v6;

  return v5;
}

- (int)index
{
  return self->mIndex;
}

- (id)color
{
  return self->mColor;
}

- (unint64_t)hash
{
  uint64_t mIndex = self->mIndex;
  return [(OADColor *)self->mColor hash] ^ mIndex;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = (OADColor **)v4;
    if (self->mIndex == *((_DWORD *)v7 + 2))
    {
      mColor = self->mColor;
      if (mColor == v7[2]) {
        char v6 = 1;
      }
      else {
        char v6 = -[OADColor isEqual:](mColor, "isEqual:");
      }
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADFontReference;
  v2 = [(OADFontReference *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end