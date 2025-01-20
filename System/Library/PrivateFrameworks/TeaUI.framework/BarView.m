@interface BarView
- (_TtC5TeaUI7BarView)initWithCoder:(id)a3;
- (_TtC5TeaUI7BarView)initWithEffect:(id)a3;
- (void)layoutSubviews;
@end

@implementation BarView

- (_TtC5TeaUI7BarView)initWithEffect:(id)a3
{
  id v4 = a3;
  return (_TtC5TeaUI7BarView *)BarView.init(effect:)(a3);
}

- (_TtC5TeaUI7BarView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B5FC281C();
}

- (void)layoutSubviews
{
  v2 = self;
  BarView.layoutSubviews()();
}

- (void).cxx_destruct
{
  sub_1B5FC2588(*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5TeaUI7BarView_style));

  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5TeaUI7BarView_separatorView);
}

@end