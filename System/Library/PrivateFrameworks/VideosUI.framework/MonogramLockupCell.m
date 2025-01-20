@interface MonogramLockupCell
- (BOOL)isAccessibilityElement;
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI18MonogramLockupCell)initWithCoder:(id)a3;
- (_TtC8VideosUI18MonogramLockupCell)initWithFrame:(CGRect)a3;
- (id)zoomSourceView;
- (void)setIsAccessibilityElement:(BOOL)a3;
- (void)vui_setHighlighted:(BOOL)a3;
@end

@implementation MonogramLockupCell

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E34A01CC(v4);
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  CGFloat width = a3.width;
  v6 = self;
  CGFloat v7 = sub_1E34A0CB8(a4, width);
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.CGFloat width = v10;
  return result;
}

- (void)vui_setHighlighted:(BOOL)a3
{
  v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E34A1A18(v4);
}

- (_TtC8VideosUI18MonogramLockupCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI18MonogramLockupCell *)sub_1E34A1AE0();
}

- (_TtC8VideosUI18MonogramLockupCell)initWithCoder:(id)a3
{
  return (_TtC8VideosUI18MonogramLockupCell *)sub_1E34A1B90(a3);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18MonogramLockupCell_monogramView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18MonogramLockupCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18MonogramLockupCell_subtitleLabel));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI18MonogramLockupCell_separatorView);
}

- (id)zoomSourceView
{
  v2 = self;
  v3 = sub_1E34A2258();

  return v3;
}

@end