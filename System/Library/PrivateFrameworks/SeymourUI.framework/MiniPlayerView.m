@interface MiniPlayerView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (_TtC9SeymourUI14MiniPlayerView)initWithCoder:(id)a3;
- (_TtC9SeymourUI14MiniPlayerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)playbackControlTapped:(id)a3;
- (void)tapRecognized:(id)a3;
@end

@implementation MiniPlayerView

- (void)layoutSubviews
{
  v2 = self;
  sub_239EC618C(32.0, 0.0);
  sub_239EC618C(32.0, 0.0);
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for MiniPlayerView();
  [(MiniPlayerView *)&v3 layoutSubviews];
}

- (_TtC9SeymourUI14MiniPlayerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A6032C8();
}

- (void)playbackControlTapped:(id)a3
{
  if (*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI14MiniPlayerView_presenter))
  {
    uint64_t v4 = *((unsigned __int8 *)a3 + OBJC_IVAR____TtC9SeymourUI15PlaybackControl_type);
    id v5 = a3;
    v6 = self;
    swift_unknownObjectRetain();
    sub_23A62BF50(v4);

    swift_unknownObjectRelease();
  }
}

- (void)tapRecognized:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_23A60341C();
}

- (_TtC9SeymourUI14MiniPlayerView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI14MiniPlayerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI14MiniPlayerView_controlsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI14MiniPlayerView_metadataStackView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI14MiniPlayerView_skipForwardControl));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI14MiniPlayerView_titleLabel);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = objc_msgSend(v7, sel_view);
  if (v9)
  {
    v10 = v9;
    self;
    v11 = (void *)swift_dynamicCastObjCClass();
    if (!v11) {
  }
    }
  else
  {
    v11 = 0;
  }

  return v11 == 0;
}

@end