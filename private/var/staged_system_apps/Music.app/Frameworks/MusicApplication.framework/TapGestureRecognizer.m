@interface TapGestureRecognizer
- (_TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB720TapGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)ignoreTouch:(id)a3 forEvent:(id)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation TapGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)ignoreTouch:(id)a3 forEvent:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for TapGestureRecognizer();
  id v6 = a3;
  id v7 = a4;
  v8 = (char *)v11.receiver;
  [(TapGestureRecognizer *)&v11 ignoreTouch:v6 forEvent:v7];
  v9 = *(void (**)(uint64_t))&v8[OBJC_IVAR____TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB720TapGestureRecognizer_onTouchUp];
  if (v9)
  {
    uint64_t v10 = swift_retain();
    v9(v10);
    sub_1A528((uint64_t)v9);
  }
}

- (_TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB720TapGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    sub_AB7E30();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB720TapGestureRecognizer *)sub_FBF2C((uint64_t)v6, (uint64_t)a4);
}

- (void).cxx_destruct
{
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB720TapGestureRecognizer_onTouchDown));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB720TapGestureRecognizer_onTouchUp);

  sub_1A528(v3);
}

@end