@interface TintColorObservingView
- (_TtC12NowPlayingUI22TintColorObservingView)initWithCoder:(id)a3;
- (_TtC12NowPlayingUI22TintColorObservingView)initWithFrame:(CGRect)a3;
- (void)tintColorDidChange;
@end

@implementation TintColorObservingView

- (void)tintColorDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TintColorObservingView();
  v2 = (char *)v6.receiver;
  [(TintColorObservingView *)&v6 tintColorDidChange];
  v3 = *(void (**)(void))&v2[OBJC_IVAR____TtC12NowPlayingUI22TintColorObservingView_tintColorDidChangeCallback];
  if (!v3) {
    goto LABEL_4;
  }
  swift_retain();
  id v4 = [v2 tintColor];
  if (v4)
  {
    v5 = v4;
    v3();

    sub_FB70((uint64_t)v3);
LABEL_4:

    return;
  }
  __break(1u);
}

- (_TtC12NowPlayingUI22TintColorObservingView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12NowPlayingUI22TintColorObservingView_tintColorDidChangeCallback);
  v9 = (objc_class *)type metadata accessor for TintColorObservingView();
  void *v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[TintColorObservingView initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtC12NowPlayingUI22TintColorObservingView)initWithCoder:(id)a3
{
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12NowPlayingUI22TintColorObservingView_tintColorDidChangeCallback);
  objc_super v6 = (objc_class *)type metadata accessor for TintColorObservingView();
  void *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(TintColorObservingView *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_FB70(*(uint64_t *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC12NowPlayingUI22TintColorObservingView_tintColorDidChangeCallback));
}

@end