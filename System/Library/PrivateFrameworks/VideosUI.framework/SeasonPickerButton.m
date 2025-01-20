@interface SeasonPickerButton
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (NSArray)accessibilityHeaderTitles;
- (VUILabel)accessibilityAltLabel;
- (VUILabel)accessibilityCurrentLabel;
- (_TtC8VideosUI18SeasonPickerButton)init;
- (_TtC8VideosUI18SeasonPickerButton)initWithCoder:(id)a3;
- (_TtC8VideosUI18SeasonPickerButton)initWithFrame:(CGRect)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)layoutSubviews;
@end

@implementation SeasonPickerButton

- (_TtC8VideosUI18SeasonPickerButton)init
{
  return (_TtC8VideosUI18SeasonPickerButton *)sub_1E3300170();
}

- (_TtC8VideosUI18SeasonPickerButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E33003CC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1E3300498();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_1E3300908(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  double v6 = self;
  id v7 = sub_1E3300964();

  return v7;
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = self;
  double v8 = sub_1E33004F0(a4, width, height);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (VUILabel)accessibilityCurrentLabel
{
  v2 = sub_1E3300C80();
  return (VUILabel *)v2;
}

- (VUILabel)accessibilityAltLabel
{
  v2 = sub_1E3300CE4();
  return (VUILabel *)v2;
}

- (NSArray)accessibilityHeaderTitles
{
  sub_1E3300D68();
  v2 = (void *)sub_1E387CC88();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (_TtC8VideosUI18SeasonPickerButton)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  sub_1E2F6ABF0((uint64_t)self + OBJC_IVAR____TtC8VideosUI18SeasonPickerButton_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18SeasonPickerButton_chevronDownImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18SeasonPickerButton_currentLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18SeasonPickerButton_altLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18SeasonPickerButton_textLayout));
  swift_bridgeObjectRelease();
}

@end