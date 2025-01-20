@interface OADTableTextStyle
+ (id)defaultColor;
+ (id)defaultFontReference;
+ (id)defaultStyle;
+ (int)defaultBold;
+ (int)defaultItalic;
- (OADTableTextStyle)init;
- (id)color;
- (id)description;
- (id)fontReference;
- (id)shallowCopy;
- (int)bold;
- (int)italic;
- (void)applyOverridesFrom:(id)a3;
- (void)setBold:(int)a3;
- (void)setColor:(id)a3;
- (void)setFontReference:(id)a3;
- (void)setItalic:(int)a3;
@end

@implementation OADTableTextStyle

- (OADTableTextStyle)init
{
  v3.receiver = self;
  v3.super_class = (Class)OADTableTextStyle;
  result = [(OADTableTextStyle *)&v3 init];
  if (result) {
    *(void *)&result->mBold = 0x200000002;
  }
  return result;
}

- (void)setFontReference:(id)a3
{
}

- (void)setColor:(id)a3
{
}

- (void)setBold:(int)a3
{
  self->mBold = a3;
}

- (id)color
{
  return self->mColor;
}

- (int)bold
{
  return self->mBold;
}

- (id)fontReference
{
  return self->mFontReference;
}

- (int)italic
{
  return self->mItalic;
}

- (void)setItalic:(int)a3
{
  self->mItalic = a3;
}

+ (id)defaultColor
{
  v2 = (void *)+[OADTableTextStyle defaultColor]::defaultColor;
  if (!+[OADTableTextStyle defaultColor]::defaultColor)
  {
    objc_super v3 = [[OADSchemeColor alloc] initWithSchemeColorIndex:1];
    v4 = (void *)+[OADTableTextStyle defaultColor]::defaultColor;
    +[OADTableTextStyle defaultColor]::defaultColor = (uint64_t)v3;

    v2 = (void *)+[OADTableTextStyle defaultColor]::defaultColor;
  }
  return v2;
}

+ (id)defaultFontReference
{
  objc_super v3 = (void *)+[OADTableTextStyle defaultFontReference]::defaultFontReference;
  if (!+[OADTableTextStyle defaultFontReference]::defaultFontReference)
  {
    v4 = objc_alloc_init(OADFontReference);
    v5 = (void *)+[OADTableTextStyle defaultFontReference]::defaultFontReference;
    +[OADTableTextStyle defaultFontReference]::defaultFontReference = (uint64_t)v4;

    [(id)+[OADTableTextStyle defaultFontReference]::defaultFontReference setIndex:1];
    v6 = (void *)+[OADTableTextStyle defaultFontReference]::defaultFontReference;
    v7 = [a1 defaultColor];
    [v6 setColor:v7];

    objc_super v3 = (void *)+[OADTableTextStyle defaultFontReference]::defaultFontReference;
  }
  return v3;
}

+ (int)defaultBold
{
  return 2;
}

+ (int)defaultItalic
{
  return 2;
}

+ (id)defaultStyle
{
  objc_super v3 = (void *)+[OADTableTextStyle defaultStyle]::defaultStyle;
  if (!+[OADTableTextStyle defaultStyle]::defaultStyle)
  {
    v4 = objc_alloc_init(OADTableTextStyle);
    v5 = (void *)+[OADTableTextStyle defaultStyle]::defaultStyle;
    +[OADTableTextStyle defaultStyle]::defaultStyle = (uint64_t)v4;

    v6 = (void *)+[OADTableTextStyle defaultStyle]::defaultStyle;
    v7 = [a1 defaultFontReference];
    [v6 setFontReference:v7];

    v8 = (void *)+[OADTableTextStyle defaultStyle]::defaultStyle;
    v9 = [a1 defaultColor];
    [v8 setColor:v9];

    objc_msgSend((id)+[OADTableTextStyle defaultStyle]::defaultStyle, "setBold:", objc_msgSend(a1, "defaultBold"));
    objc_msgSend((id)+[OADTableTextStyle defaultStyle]::defaultStyle, "setItalic:", objc_msgSend(a1, "defaultItalic"));
    objc_super v3 = (void *)+[OADTableTextStyle defaultStyle]::defaultStyle;
  }
  return v3;
}

- (id)shallowCopy
{
  objc_super v3 = objc_alloc_init(OADTableTextStyle);
  v4 = [(OADTableTextStyle *)self fontReference];
  [(OADTableTextStyle *)v3 setFontReference:v4];

  v5 = [(OADTableTextStyle *)self color];
  [(OADTableTextStyle *)v3 setColor:v5];

  [(OADTableTextStyle *)v3 setBold:[(OADTableTextStyle *)self bold]];
  [(OADTableTextStyle *)v3 setItalic:[(OADTableTextStyle *)self italic]];
  return v3;
}

- (void)applyOverridesFrom:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    v4 = [v8 fontReference];

    if (v4)
    {
      v5 = [v8 fontReference];
      [(OADTableTextStyle *)self setFontReference:v5];
    }
    v6 = [v8 color];

    if (v6)
    {
      v7 = [v8 color];
      [(OADTableTextStyle *)self setColor:v7];
    }
    if ([v8 bold] != 2) {
      -[OADTableTextStyle setBold:](self, "setBold:", [v8 bold]);
    }
    if ([v8 italic] != 2) {
      -[OADTableTextStyle setItalic:](self, "setItalic:", [v8 italic]);
    }
  }
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADTableTextStyle;
  v2 = [(OADTableTextStyle *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mColor, 0);
  objc_storeStrong((id *)&self->mFontReference, 0);
}

@end