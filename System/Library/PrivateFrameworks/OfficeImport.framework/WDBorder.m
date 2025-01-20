@interface WDBorder
- (BOOL)frame;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToBorder:(id)a3;
- (BOOL)shadow;
- (WDBorder)init;
- (id)color;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)style;
- (unint64_t)hash;
- (unsigned)space;
- (unsigned)width;
- (void)setBorder:(id)a3;
- (void)setColor:(id)a3;
- (void)setFrame:(BOOL)a3;
- (void)setNullBorder;
- (void)setShadow:(BOOL)a3;
- (void)setSingleBlackBorder;
- (void)setSpace:(unsigned __int8)a3;
- (void)setStyle:(int)a3;
- (void)setWidth:(unsigned __int8)a3;
@end

@implementation WDBorder

- (WDBorder)init
{
  v6.receiver = self;
  v6.super_class = (Class)WDBorder;
  v2 = [(WDBorder *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[OITSUColor clearColor];
    mColor = v2->mColor;
    v2->mColor = (OITSUColor *)v3;
  }
  return v2;
}

- (void)setStyle:(int)a3
{
  self->mStyle = a3;
}

- (void)setColor:(id)a3
{
}

- (void)setWidth:(unsigned __int8)a3
{
  self->mWidth = a3;
}

- (void)setSpace:(unsigned __int8)a3
{
  self->mSpace = a3;
}

- (void)setShadow:(BOOL)a3
{
  self->mShadow = a3;
}

- (void)setFrame:(BOOL)a3
{
  self->mFrame = a3;
}

- (int)style
{
  return self->mStyle;
}

- (unsigned)width
{
  return self->mWidth;
}

- (id)color
{
  return self->mColor;
}

- (BOOL)isEqualToBorder:(id)a3
{
  v4 = a3;
  v5 = v4;
  if (self->mStyle == *((_DWORD *)v4 + 2)
    && self->mWidth == *((unsigned __int8 *)v4 + 24)
    && self->mSpace == *((unsigned __int8 *)v4 + 25)
    && self->mShadow == *((unsigned __int8 *)v4 + 26)
    && self->mFrame == *((unsigned __int8 *)v4 + 27))
  {
    mColor = self->mColor;
    if (mColor == (OITSUColor *)v5[2]) {
      char v7 = 1;
    }
    else {
      char v7 = -[OITSUColor isEqual:](mColor, "isEqual:");
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
  v4 = (WDBorder *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(WDBorder *)self isEqualToBorder:v5];

  return v6;
}

- (unint64_t)hash
{
  unint64_t v2 = (self->mStyle << 16) | ((unint64_t)self->mWidth << 8);
  uint64_t mSpace = self->mSpace;
  v5.receiver = self;
  v5.super_class = (Class)WDBorder;
  return ([(WDBorder *)&v5 hash] ^ mSpace) + v2;
}

- (void)setBorder:(id)a3
{
  id v5 = a3;
  -[WDBorder setStyle:](self, "setStyle:", [v5 style]);
  v4 = [v5 color];
  [(WDBorder *)self setColor:v4];

  -[WDBorder setWidth:](self, "setWidth:", [v5 width]);
  -[WDBorder setSpace:](self, "setSpace:", [v5 space]);
  -[WDBorder setShadow:](self, "setShadow:", [v5 shadow]);
  -[WDBorder setFrame:](self, "setFrame:", [v5 frame]);
}

- (void)setNullBorder
{
  [(WDBorder *)self setStyle:0];
  uint64_t v3 = +[OITSUColor clearColor];
  [(WDBorder *)self setColor:v3];

  [(WDBorder *)self setWidth:0];
  [(WDBorder *)self setSpace:0];
  [(WDBorder *)self setShadow:0];
  [(WDBorder *)self setFrame:0];
}

- (void)setSingleBlackBorder
{
  [(WDBorder *)self setStyle:1];
  uint64_t v3 = +[OITSUColor blackColor];
  [(WDBorder *)self setColor:v3];

  [(WDBorder *)self setWidth:1];
  [(WDBorder *)self setSpace:0];
  [(WDBorder *)self setShadow:0];
  [(WDBorder *)self setFrame:0];
}

- (unsigned)space
{
  return self->mSpace;
}

- (BOOL)shadow
{
  return self->mShadow;
}

- (BOOL)frame
{
  return self->mFrame;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[WDBorder allocWithZone:a3] init];
  id v5 = v4;
  if (v4)
  {
    v4->mStyle = self->mStyle;
    BOOL v6 = [(OITSUColor *)self->mColor copy];
    mColor = v5->mColor;
    v5->mColor = v6;

    v5->mWidth = self->mWidth;
    v5->uint64_t mSpace = self->mSpace;
    v5->mShadow = self->mShadow;
    v5->mFrame = self->mFrame;
  }
  return v5;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDBorder;
  unint64_t v2 = [(WDBorder *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end