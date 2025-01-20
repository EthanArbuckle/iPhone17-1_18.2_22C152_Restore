@interface TintColorObservingView
- (_TtC16MusicApplication22TintColorObservingView)initWithCoder:(id)a3;
- (_TtC16MusicApplication22TintColorObservingView)initWithFrame:(CGRect)a3;
- (void)tintColorDidChange;
@end

@implementation TintColorObservingView

- (void)tintColorDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TintColorObservingView();
  v2 = (char *)v7.receiver;
  [(TintColorObservingView *)&v7 tintColorDidChange];
  v3 = (void (**)(void))&v2[OBJC_IVAR____TtC16MusicApplication22TintColorObservingView_tintColorDidChangeCallback];
  swift_beginAccess();
  v4 = *v3;
  if (!*v3) {
    goto LABEL_4;
  }
  swift_retain();
  id v5 = [v2 tintColor];
  if (v5)
  {
    v6 = v5;
    v4();

    sub_1A528((uint64_t)v4);
LABEL_4:

    return;
  }
  __break(1u);
}

- (_TtC16MusicApplication22TintColorObservingView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication22TintColorObservingView_tintColorDidChangeCallback);
  v9 = (objc_class *)type metadata accessor for TintColorObservingView();
  void *v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[TintColorObservingView initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtC16MusicApplication22TintColorObservingView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication22TintColorObservingView_tintColorDidChangeCallback);
  void *v4 = 0;
  v4[1] = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TintColorObservingView();
  id v5 = a3;
  v6 = [(TintColorObservingView *)&v8 initWithCoder:v5];

  return v6;
}

- (void).cxx_destruct
{
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication22TintColorObservingView_tintColorDidChangeCallback));
}

@end