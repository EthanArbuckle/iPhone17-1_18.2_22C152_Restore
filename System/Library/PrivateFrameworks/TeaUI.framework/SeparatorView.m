@interface SeparatorView
- (BOOL)isHidden;
- (UIColor)backgroundColor;
- (_TtC5TeaUI13SeparatorView)initWithCoder:(id)a3;
- (_TtC5TeaUI13SeparatorView)initWithFrame:(CGRect)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setHidden:(BOOL)a3;
@end

@implementation SeparatorView

- (BOOL)isHidden
{
  v2 = self;
  unsigned __int8 v3 = SeparatorView.isHidden.getter();

  return v3 & 1;
}

- (void)setHidden:(BOOL)a3
{
  v4 = self;
  SeparatorView.isHidden.setter(a3);
}

- (UIColor)backgroundColor
{
  v2 = self;
  id v3 = SeparatorView.backgroundColor.getter();

  return (UIColor *)v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v5 = a3;
  v6 = self;
  SeparatorView.backgroundColor.setter(a3);
}

- (_TtC5TeaUI13SeparatorView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI13SeparatorView *)SeparatorView.init(frame:)();
}

- (_TtC5TeaUI13SeparatorView)initWithCoder:(id)a3
{
  id v3 = a3;
  SeparatorView.init(coder:)();
}

- (void).cxx_destruct
{
}

@end