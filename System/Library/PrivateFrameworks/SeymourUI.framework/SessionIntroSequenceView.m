@interface SessionIntroSequenceView
- (CGRect)bounds;
- (CGRect)frame;
- (_TtC9SeymourUI24SessionIntroSequenceView)initWithCoder:(id)a3;
- (_TtC9SeymourUI24SessionIntroSequenceView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)didTouchDownPlayIcon:(id)a3;
- (void)didTouchUpInsidePlayIcon:(id)a3;
- (void)didTouchUpOutsidePlayIcon:(id)a3;
- (void)handlePlayPauseGesture;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation SessionIntroSequenceView

- (CGRect)frame
{
  sub_23A2222B0(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
}

- (CGRect)bounds
{
  sub_23A2222B0(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
}

- (void)handlePlayPauseGesture
{
  uint64_t v3 = sub_23A7FEE28();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_23A7FE868();
  sub_23A7FEE08();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (_TtC9SeymourUI24SessionIntroSequenceView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A223124();
}

- (void)didTouchDownPlayIcon:(id)a3
{
  uint64_t v5 = self;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = self;
  *(void *)(v6 + 24) = 0x3FD851EB851EB852;
  v10[4] = sub_23A223464;
  v10[5] = v6;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_239E3E38C;
  v10[3] = &block_descriptor_36_1;
  v7 = _Block_copy(v10);
  uint64_t v8 = self;
  id v9 = a3;
  swift_release();
  objc_msgSend(v5, sel_animateWithDuration_animations_, v7, 0.2);
  _Block_release(v7);
}

- (void)didTouchUpInsidePlayIcon:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_23A2231E0();
}

- (void)didTouchUpOutsidePlayIcon:(id)a3
{
  uint64_t v5 = self;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = self;
  v10[4] = sub_23A22311C;
  v10[5] = v6;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_239E3E38C;
  v10[3] = &block_descriptor_91;
  v7 = _Block_copy(v10);
  uint64_t v8 = self;
  id v9 = a3;
  swift_release();
  objc_msgSend(v5, sel_animateWithDuration_animations_, v7, 0.2);
  _Block_release(v7);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v7 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI24SessionIntroSequenceView_playButtonView);
  id v8 = a4;
  id v9 = self;
  objc_msgSend(v7, sel_frame);
  v14.double x = x;
  v14.double y = y;
  if (CGRectContainsPoint(v15, v14))
  {
    v12.receiver = v9;
    v12.super_class = (Class)type metadata accessor for SessionIntroSequenceView();
    id v10 = -[SessionIntroSequenceView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v8, x, y);
  }
  else
  {

    id v10 = 0;
  }

  return v10;
}

- (_TtC9SeymourUI24SessionIntroSequenceView)initWithFrame:(CGRect)a3
{
  CGRect result = (_TtC9SeymourUI24SessionIntroSequenceView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SessionIntroSequenceView_presenter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SessionIntroSequenceView_countdownView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SessionIntroSequenceView_playButtonView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SessionIntroSequenceView_spinnerView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI24SessionIntroSequenceView_playPauseGestureRecognizer);
}

@end