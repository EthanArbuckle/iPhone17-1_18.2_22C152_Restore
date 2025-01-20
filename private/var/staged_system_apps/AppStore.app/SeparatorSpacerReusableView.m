@interface SeparatorSpacerReusableView
- (_TtC8AppStore27SeparatorSpacerReusableView)initWithCoder:(id)a3;
- (_TtC8AppStore27SeparatorSpacerReusableView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SeparatorSpacerReusableView

- (_TtC8AppStore27SeparatorSpacerReusableView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore27SeparatorSpacerReusableView *)sub_100467E90(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore27SeparatorSpacerReusableView)initWithCoder:(id)a3
{
  v5 = (_OWORD *)((char *)self + OBJC_IVAR____TtC8AppStore27SeparatorSpacerReusableView_separatorInsets);
  long long v6 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  _OWORD *v5 = *(_OWORD *)&UIEdgeInsetsZero.top;
  v5[1] = v6;
  uint64_t v7 = OBJC_IVAR____TtC8AppStore27SeparatorSpacerReusableView_lineView;
  id v8 = objc_allocWithZone((Class)UIView);
  id v9 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v7) = (Class)[v8 initWithFrame:0.0, 0.0, 0.0, 0.0];

  result = (_TtC8AppStore27SeparatorSpacerReusableView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100468130();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27SeparatorSpacerReusableView_lineView));
}

@end