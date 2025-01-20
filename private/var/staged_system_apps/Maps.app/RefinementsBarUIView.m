@interface RefinementsBarUIView
- (UIView)hostingView;
- (_TtC4Maps20RefinementsBarUIView)initWithCoder:(id)a3;
- (_TtC4Maps20RefinementsBarUIView)initWithFrame:(CGRect)a3;
- (_TtC4Maps23RefinementsBarViewModel)viewModel;
- (_TtP4Maps26RefinementsBarViewDelegate_)delegate;
- (void)setDelegate:(id)a3;
- (void)setHostingView:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation RefinementsBarUIView

- (UIView)hostingView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC4Maps20RefinementsBarUIView_hostingView));
}

- (void)setHostingView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Maps20RefinementsBarUIView_hostingView);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Maps20RefinementsBarUIView_hostingView) = (Class)a3;
  id v3 = a3;
}

- (_TtP4Maps26RefinementsBarViewDelegate_)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP4Maps26RefinementsBarViewDelegate_ *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC4Maps20RefinementsBarUIView)initWithFrame:(CGRect)a3
{
  return (_TtC4Maps20RefinementsBarUIView *)sub_10024899C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC4Maps20RefinementsBarUIView)initWithCoder:(id)a3
{
  v5 = (_OWORD *)((char *)self + OBJC_IVAR____TtC4Maps20RefinementsBarUIView_refinementBar);
  _OWORD *v5 = 0u;
  v5[1] = 0u;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Maps20RefinementsBarUIView_hostingView) = 0;
  swift_unknownObjectWeakInit();
  id v6 = a3;

  result = (_TtC4Maps20RefinementsBarUIView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC4Maps23RefinementsBarViewModel)viewModel
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps20RefinementsBarUIView_refinementBar);
  id v3 = *(void **)&self->refinementBar[OBJC_IVAR____TtC4Maps20RefinementsBarUIView_refinementBar];
  if (v3)
  {
    uint64_t v5 = *v2;
    sub_100249628(*v2, v3);
    sub_100249628(v5, v3);
    id v6 = self;
    swift_release();

    id v7 = v3;
    sub_100249668(v5, v3);
  }
  else
  {
    id v7 = 0;
  }

  return (_TtC4Maps23RefinementsBarViewModel *)v7;
}

- (void)setViewModel:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_100248E50(a3);
}

- (void).cxx_destruct
{
  sub_100249668(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Maps20RefinementsBarUIView_refinementBar), *(void **)&self->refinementBar[OBJC_IVAR____TtC4Maps20RefinementsBarUIView_refinementBar]);

  id v3 = (char *)self + OBJC_IVAR____TtC4Maps20RefinementsBarUIView_delegate;

  sub_100123CE4((uint64_t)v3);
}

@end