@interface ShelfFooterView
- (BOOL)_disableRasterizeInAnimations;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore15ShelfFooterView)initWithCoder:(id)a3;
- (_TtC8AppStore15ShelfFooterView)initWithFrame:(CGRect)a3;
- (void)didTapWithTitleButton:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ShelfFooterView

- (_TtC8AppStore15ShelfFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore15ShelfFooterView *)sub_100532ED0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore15ShelfFooterView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100533DF0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_1005331E0(v11);
  sub_100081D90(v11, v11[3]);
  id v4 = [(ShelfFooterView *)v3 traitCollection];
  dispatch thunk of Placeable.measure(toFit:with:)();
  double v6 = v5;
  double v8 = v7;

  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0((uint64_t)v11);
  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v2 = v5.receiver;
  [(ShelfFooterView *)&v5 layoutSubviews];
  sub_1005331E0(v4);
  sub_100081D90(v4, v4[3]);
  LayoutMarginsAware<>.layoutFrame.getter();
  id v3 = [v2 traitCollection];
  dispatch thunk of Placeable.place(at:with:)();

  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0((uint64_t)v4);
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v2 = (char *)v6.receiver;
  [(ShelfFooterView *)&v6 prepareForReuse];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore15ShelfFooterView_separator];
  sub_100084CF0(0, (unint64_t *)&qword_100981AA0);
  id v4 = (void *)static UIColor.defaultLine.getter();
  [v3 setBackgroundColor:v4];

  objc_super v5 = *(void **)&v2[OBJC_IVAR____TtC8AppStore15ShelfFooterView_titleButton];
  [v5 setHidden:0];
  [v5 setTitle:0 forState:0];
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void)didTapWithTitleButton:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_10053366C((uint64_t)v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15ShelfFooterView_titleButton));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore15ShelfFooterView_footerAction);

  sub_10006012C(v3);
}

@end