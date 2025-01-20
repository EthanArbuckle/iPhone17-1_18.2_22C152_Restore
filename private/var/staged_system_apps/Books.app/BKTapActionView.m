@interface BKTapActionView
- (CGSize)intrinsicContentSize;
- (_TtC5Books15BKTapActionView)initWithCoder:(id)a3;
- (_TtC5Books15BKTapActionView)initWithFrame:(CGRect)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)be_singleTapAction;
- (void)didMoveToWindow;
- (void)fireAction:(id)a3;
@end

@implementation BKTapActionView

- (_TtC5Books15BKTapActionView)initWithCoder:(id)a3
{
  *(void *)&self->fixedSize[OBJC_IVAR____TtC5Books15BKTapActionView_listener] = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC5Books15BKTapActionView *)sub_1007FF260();
  __break(1u);
  return result;
}

- (void)didMoveToWindow
{
  v2 = self;
  sub_10053D98C();
}

- (CGSize)intrinsicContentSize
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC5Books15BKTapActionView_fixedSize);
  if (self->fixedSize[OBJC_IVAR____TtC5Books15BKTapActionView_fixedSize + 8])
  {
    v5.receiver = self;
    v5.super_class = (Class)type metadata accessor for BKTapActionView();
    [(BKTapActionView *)&v5 intrinsicContentSize];
  }
  else
  {
    double v3 = *v2;
    double v4 = v2[1];
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)fireAction:(id)a3
{
  double v4 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC5Books15BKTapActionView_action);
  swift_unknownObjectRetain();
  objc_super v5 = self;
  uint64_t v6 = swift_retain();
  v4(v6);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)be_singleTapAction
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC5Books15BKTapActionView_action);
  double v3 = self;
  uint64_t v4 = swift_retain();
  v2(v4);

  swift_release();
}

- (_TtC5Books15BKTapActionView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC5Books15BKTapActionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  double v3 = (char *)self + OBJC_IVAR____TtC5Books15BKTapActionView_listener;

  sub_10023E454((uint64_t)v3);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  v12 = (void *)sub_10053E1F0(v8);

  return v12;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = (void *)sub_10053E2F8(v6);

  return v9;
}

@end