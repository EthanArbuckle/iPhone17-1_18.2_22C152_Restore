@interface TintingBoldTrayButton
- (_TtC5TeaUIP33_38E434230891E09FE3424A0E4B18140A21TintingBoldTrayButton)initWithCoder:(id)a3;
- (_TtC5TeaUIP33_38E434230891E09FE3424A0E4B18140A21TintingBoldTrayButton)initWithFrame:(CGRect)a3;
- (void)tintColorDidChange;
@end

@implementation TintingBoldTrayButton

- (void)tintColorDidChange
{
  v2 = self;
  sub_1B6198D34();
}

- (_TtC5TeaUIP33_38E434230891E09FE3424A0E4B18140A21TintingBoldTrayButton)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUIP33_38E434230891E09FE3424A0E4B18140A21TintingBoldTrayButton *)sub_1B6198EA0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5TeaUIP33_38E434230891E09FE3424A0E4B18140A21TintingBoldTrayButton)initWithCoder:(id)a3
{
  return (_TtC5TeaUIP33_38E434230891E09FE3424A0E4B18140A21TintingBoldTrayButton *)sub_1B6198F2C(a3);
}

@end