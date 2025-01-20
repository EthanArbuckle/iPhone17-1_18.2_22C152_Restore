@interface WDShading
+ (id)autoBackgroundColor;
+ (id)autoForegroundColor;
+ (id)nilShading;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToShading:(id)a3;
- (WDShading)init;
- (id)background;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)foreground;
- (int)style;
- (unint64_t)hash;
- (void)setBackground:(id)a3;
- (void)setForeground:(id)a3;
- (void)setShading:(id)a3;
- (void)setStyle:(int)a3;
@end

@implementation WDShading

- (WDShading)init
{
  v9.receiver = self;
  v9.super_class = (Class)WDShading;
  v2 = [(WDShading *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->mStyle = 0;
    uint64_t v4 = [(id)objc_opt_class() autoForegroundColor];
    mForegroundColor = v3->mForegroundColor;
    v3->mForegroundColor = (OITSUColor *)v4;

    uint64_t v6 = [(id)objc_opt_class() autoBackgroundColor];
    mBackgroundColor = v3->mBackgroundColor;
    v3->mBackgroundColor = (OITSUColor *)v6;
  }
  return v3;
}

+ (id)autoForegroundColor
{
  {
    +[WDShading autoForegroundColor]::theColor = [[OITSUColor alloc] initWithWhite:0.0 alpha:1.0];
  }
  v2 = (void *)+[WDShading autoForegroundColor]::theColor;
  return v2;
}

+ (id)autoBackgroundColor
{
  {
    +[WDShading autoBackgroundColor]::theColor = [[OITSUColor alloc] initWithWhite:1.0 alpha:1.0];
  }
  v2 = (void *)+[WDShading autoBackgroundColor]::theColor;
  return v2;
}

- (void)setStyle:(int)a3
{
  self->mStyle = a3;
}

- (void)setForeground:(id)a3
{
}

- (void)setBackground:(id)a3
{
}

- (int)style
{
  return self->mStyle;
}

- (id)foreground
{
  return self->mForegroundColor;
}

- (id)background
{
  return self->mBackgroundColor;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[WDShading allocWithZone:a3] init];
  v5 = v4;
  if (v4)
  {
    v4->mStyle = self->mStyle;
    mForegroundColor = self->mForegroundColor;
    v7 = [(id)objc_opt_class() autoForegroundColor];
    if (mForegroundColor == v7)
    {
      v8 = [(id)objc_opt_class() autoForegroundColor];
    }
    else
    {
      v8 = [(OITSUColor *)self->mForegroundColor copy];
    }
    objc_super v9 = v5->mForegroundColor;
    v5->mForegroundColor = v8;

    mBackgroundColor = self->mBackgroundColor;
    v11 = [(id)objc_opt_class() autoBackgroundColor];
    if (mBackgroundColor == v11)
    {
      v12 = [(id)objc_opt_class() autoBackgroundColor];
    }
    else
    {
      v12 = [(OITSUColor *)self->mBackgroundColor copy];
    }
    v13 = v5->mBackgroundColor;
    v5->mBackgroundColor = v12;
  }
  return v5;
}

+ (id)nilShading
{
  v2 = (void *)+[WDShading nilShading]::theShading;
  if (!+[WDShading nilShading]::theShading)
  {
    v3 = objc_alloc_init(WDShading);
    uint64_t v4 = (void *)+[WDShading nilShading]::theShading;
    +[WDShading nilShading]::theShading = (uint64_t)v3;

    [(id)+[WDShading nilShading]::theShading setStyle:0xFFFFLL];
    v2 = (void *)+[WDShading nilShading]::theShading;
  }
  return v2;
}

- (BOOL)isEqualToShading:(id)a3
{
  uint64_t v4 = (OITSUColor **)a3;
  if (self->mStyle == *((_DWORD *)v4 + 2)
    && ((mForegroundColor = self->mForegroundColor, mForegroundColor == v4[2])
     || -[OITSUColor isEqual:](mForegroundColor, "isEqual:")))
  {
    mBackgroundColor = self->mBackgroundColor;
    if (mBackgroundColor == v4[3]) {
      char v7 = 1;
    }
    else {
      char v7 = -[OITSUColor isEqual:](mBackgroundColor, "isEqual:");
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (WDShading *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(WDShading *)self isEqualToShading:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t mStyle = self->mStyle;
  v4.receiver = self;
  v4.super_class = (Class)WDShading;
  return [(WDShading *)&v4 hash] ^ mStyle;
}

- (void)setShading:(id)a3
{
  id v6 = a3;
  -[WDShading setStyle:](self, "setStyle:", [v6 style]);
  objc_super v4 = [v6 foreground];
  [(WDShading *)self setForeground:v4];

  v5 = [v6 background];
  [(WDShading *)self setBackground:v5];
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDShading;
  v2 = [(WDShading *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBackgroundColor, 0);
  objc_storeStrong((id *)&self->mForegroundColor, 0);
}

@end