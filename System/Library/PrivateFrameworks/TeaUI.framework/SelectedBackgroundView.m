@interface SelectedBackgroundView
- (_TtC5TeaUI22SelectedBackgroundView)initWithCoder:(id)a3;
- (_TtC5TeaUI22SelectedBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SelectedBackgroundView

- (_TtC5TeaUI22SelectedBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI22SelectedBackgroundView *)SelectedBackgroundView.init(frame:)();
}

- (void)layoutSubviews
{
  v2 = self;
  SelectedBackgroundView.layoutSubviews()();
}

- (_TtC5TeaUI22SelectedBackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  SelectedBackgroundView.init(coder:)();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  SelectedBackgroundView.traitCollectionDidChange(_:)(v9);
}

@end