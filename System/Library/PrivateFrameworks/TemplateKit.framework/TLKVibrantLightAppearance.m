@interface TLKVibrantLightAppearance
- (BOOL)isVibrant;
- (id)compositingFilter;
- (id)name;
- (id)primaryColor;
- (id)quaternaryColor;
- (id)secondaryColor;
- (id)tertiaryColor;
- (id)textColorForColor:(int64_t)a3;
- (unint64_t)style;
@end

@implementation TLKVibrantLightAppearance

- (unint64_t)style
{
  return 2;
}

- (id)name
{
  return @"Vibrant Light";
}

- (BOOL)isVibrant
{
  return 1;
}

- (id)primaryColor
{
  return (id)[MEMORY[0x1E4FB1618] blackColor];
}

- (id)secondaryColor
{
  return [(TLKAppearance *)self primaryColorWithDefaultAlpha:0.6];
}

- (id)tertiaryColor
{
  return [(TLKAppearance *)self primaryColorWithDefaultAlpha:0.2];
}

- (id)quaternaryColor
{
  return [(TLKAppearance *)self primaryColorWithDefaultAlpha:0.1];
}

- (id)compositingFilter
{
  return (id)*MEMORY[0x1E4F3A2E0];
}

- (id)textColorForColor:(int64_t)a3
{
  switch(a3)
  {
    case 4:
      uint64_t v3 = 28;
      uint64_t v4 = 188;
      uint64_t v5 = 52;
      goto LABEL_7;
    case 2:
      uint64_t v3 = 255;
      uint64_t v4 = 132;
      uint64_t v5 = 0;
      goto LABEL_7;
    case 1:
      uint64_t v3 = 255;
      uint64_t v4 = 59;
      uint64_t v5 = 48;
LABEL_7:
      v6 = +[TLKAppearance colorWithRed:v3 green:v4 blue:v5];
      goto LABEL_9;
  }
  v8.receiver = self;
  v8.super_class = (Class)TLKVibrantLightAppearance;
  v6 = -[TLKAppearance textColorForColor:](&v8, sel_textColorForColor_);
LABEL_9:
  return v6;
}

@end