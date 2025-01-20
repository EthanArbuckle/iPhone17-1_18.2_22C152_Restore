@interface CardViewTitleView
- (_TtC5TeaUI17CardViewTitleView)initWithCoder:(id)a3;
- (_TtC5TeaUI17CardViewTitleView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
@end

@implementation CardViewTitleView

- (_TtC5TeaUI17CardViewTitleView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI17CardViewTitleView *)CardViewTitleView.init(frame:)();
}

- (_TtC5TeaUI17CardViewTitleView)initWithCoder:(id)a3
{
  id v3 = a3;
  CardViewTitleView.init(coder:)();
}

- (void)layoutSubviews
{
  v2 = self;
  CardViewTitleView.layoutSubviews()();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  v15.value.super.isa = (Class)a4;
  CardViewTitleView.hitTest(_:with:)(v10, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v15);
  v12 = v11;

  return v12;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI17CardViewTitleView_closeAffordanceButton));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5TeaUI17CardViewTitleView_contentView);
}

@end