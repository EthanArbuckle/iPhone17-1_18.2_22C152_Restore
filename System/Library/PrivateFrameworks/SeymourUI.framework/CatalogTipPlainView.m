@interface CatalogTipPlainView
- (_TtC9SeymourUI19CatalogTipPlainView)initWithCoder:(id)a3;
- (_TtC9SeymourUI19CatalogTipPlainView)initWithFrame:(CGRect)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation CatalogTipPlainView

- (_TtC9SeymourUI19CatalogTipPlainView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI19CatalogTipPlainView *)CatalogTipPlainView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI19CatalogTipPlainView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A0D7FF4();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19CatalogTipPlainView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19CatalogTipPlainView_separatorView));

  id v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI19CatalogTipPlainView_delegate;

  sub_239C1AE10((uint64_t)v3);
}

@end