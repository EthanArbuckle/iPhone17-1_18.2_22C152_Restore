@interface TLKVibrantDarkAppearance
- (BOOL)isVibrant;
- (id)compositingFilter;
- (id)name;
- (id)platterColor;
- (id)primaryColor;
- (id)quaternaryColor;
- (id)secondaryColor;
- (id)tertiaryColor;
- (id)textColorForColor:(int64_t)a3;
- (unint64_t)style;
@end

@implementation TLKVibrantDarkAppearance

- (id)primaryColor
{
  return (id)[MEMORY[0x1E4FB1618] whiteColor];
}

- (id)compositingFilter
{
  return (id)*MEMORY[0x1E4F3A2E8];
}

- (id)quaternaryColor
{
  return [(TLKAppearance *)self primaryColorWithDefaultAlpha:0.1];
}

- (id)tertiaryColor
{
  return [(TLKAppearance *)self primaryColorWithDefaultAlpha:0.2];
}

- (id)secondaryColor
{
  return [(TLKAppearance *)self primaryColorWithDefaultAlpha:0.6];
}

- (BOOL)isVibrant
{
  return 1;
}

- (id)platterColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.14];
}

- (unint64_t)style
{
  return 3;
}

- (id)name
{
  return @"Vibrant Dark";
}

- (id)textColorForColor:(int64_t)a3
{
  switch(a3)
  {
    case 4:
      uint64_t v3 = 76;
      uint64_t v4 = 217;
      uint64_t v5 = 100;
      goto LABEL_7;
    case 2:
      uint64_t v3 = 255;
      uint64_t v4 = 179;
      uint64_t v5 = 64;
      goto LABEL_7;
    case 1:
      uint64_t v3 = 255;
      uint64_t v4 = 105;
      uint64_t v5 = 97;
LABEL_7:
      v6 = +[TLKAppearance colorWithRed:v3 green:v4 blue:v5];
      goto LABEL_9;
  }
  v8.receiver = self;
  v8.super_class = (Class)TLKVibrantDarkAppearance;
  v6 = -[TLKAppearance textColorForColor:](&v8, sel_textColorForColor_);
LABEL_9:
  return v6;
}

@end