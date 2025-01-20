@interface SessionOverlayView
- (_TtC9SeymourUI18SessionOverlayView)initWithCoder:(id)a3;
- (_TtC9SeymourUI18SessionOverlayView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)safeAreaInsetsDidChange;
- (void)updateConstraints;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation SessionOverlayView

- (void)willMoveToSuperview:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for SessionOverlayView();
  id v4 = a3;
  v5 = (char *)v12.receiver;
  [(SessionOverlayView *)&v12 willMoveToSuperview:v4];
  v6 = *(void **)&v5[OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_metricContainer];
  v7 = self;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  *(unsigned char *)(v8 + 24) = 0;
  v11[4] = sub_23A7F559C;
  v11[5] = v8;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1107296256;
  v11[2] = sub_239E3E38C;
  v11[3] = &block_descriptor_64;
  v9 = _Block_copy(v11);
  id v10 = v6;
  swift_release();
  objc_msgSend(v7, sel_animateWithDuration_delay_options_animations_completion_, 0, v9, 0, 0.5, 0.0);
  _Block_release(v9);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_23A7F1764();
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SessionOverlayView();
  id v2 = v3.receiver;
  [(SessionOverlayView *)&v3 safeAreaInsetsDidChange];
  sub_23A7F1A28();
  sub_23A7F1BEC();
}

- (_TtC9SeymourUI18SessionOverlayView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A7F53F8();
}

- (_TtC9SeymourUI18SessionOverlayView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI18SessionOverlayView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_contentLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_unobscuredLayoutGuide));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_heartRateView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_metricContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_multiUserCelebrationView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_highlightPlatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_highlightLabel));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_intensityView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_separatorView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_trackViewRightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_multiUserCelebrationViewRightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_overlayLayoutGuide));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_overlayLayoutGuideTop));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_overlayLayoutGuideBottom));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_overlayLayoutGuideLeft));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_overlayLayoutGuideRight);
}

- (void)updateConstraints
{
  id v2 = self;
  sub_23A7F3478();
}

@end