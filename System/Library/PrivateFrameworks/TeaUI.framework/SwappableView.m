@interface SwappableView
- (_TtC5TeaUI13SwappableView)initWithCoder:(id)a3;
- (_TtC5TeaUI13SwappableView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SwappableView

- (_TtC5TeaUI13SwappableView)initWithCoder:(id)a3
{
  id v3 = a3;
  SwappableView.init(coder:)();
}

- (_TtC5TeaUI13SwappableView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5TeaUI13SwappableView_currentView);
}

- (void)layoutSubviews
{
  v2 = self;
  SwappableView.layoutSubviews()();
}

@end