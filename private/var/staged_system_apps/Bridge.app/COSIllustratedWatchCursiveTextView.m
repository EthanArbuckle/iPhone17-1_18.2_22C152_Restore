@interface COSIllustratedWatchCursiveTextView
- (_TtC6Bridge34COSIllustratedWatchCursiveTextView)initWithBackgroundImageName:(id)a3;
- (_TtC6Bridge34COSIllustratedWatchCursiveTextView)initWithCoder:(id)a3;
- (_TtC6Bridge34COSIllustratedWatchCursiveTextView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)startAnimation;
- (void)stopAnimation;
@end

@implementation COSIllustratedWatchCursiveTextView

- (_TtC6Bridge34COSIllustratedWatchCursiveTextView)initWithBackgroundImageName:(id)a3
{
  if (a3)
  {
    uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  return (_TtC6Bridge34COSIllustratedWatchCursiveTextView *)sub_10014CFB4(v3, v4);
}

- (_TtC6Bridge34COSIllustratedWatchCursiveTextView)initWithCoder:(id)a3
{
  *(void *)&self->BPSIllustratedWatchView_opaque[OBJC_IVAR____TtC6Bridge34COSIllustratedWatchCursiveTextView_helloView] = 0;
  *(void *)&self->BPSIllustratedWatchView_opaque[OBJC_IVAR____TtC6Bridge34COSIllustratedWatchCursiveTextView_backgroundImage] = 0;
  id v4 = a3;

  result = (_TtC6Bridge34COSIllustratedWatchCursiveTextView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)startAnimation
{
  v2 = *(void **)&self->BPSIllustratedWatchView_opaque[OBJC_IVAR____TtC6Bridge34COSIllustratedWatchCursiveTextView_helloView];
  if (v2)
  {
    uint64_t v3 = *(void (**)(uint64_t))((*v2 & swift_isaMask) + 0xF8);
    id v4 = self;
    v5 = v2;
    v3(1);
  }
  else
  {
    __break(1u);
  }
}

- (void)stopAnimation
{
  v2 = *(void **)&self->BPSIllustratedWatchView_opaque[OBJC_IVAR____TtC6Bridge34COSIllustratedWatchCursiveTextView_helloView];
  if (v2)
  {
    uint64_t v3 = *(void (**)(void))((*v2 & swift_isaMask) + 0x100);
    id v4 = self;
    v5 = v2;
    v3();
  }
  else
  {
    __break(1u);
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for COSIllustratedWatchCursiveTextView();
  id v2 = v3.receiver;
  [(COSIllustratedWatchCursiveTextView *)&v3 layoutSubviews];
  sub_10014D1F0();
}

- (_TtC6Bridge34COSIllustratedWatchCursiveTextView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_super v3 = *(void **)&self->BPSIllustratedWatchView_opaque[OBJC_IVAR____TtC6Bridge34COSIllustratedWatchCursiveTextView_backgroundImage];
}

@end