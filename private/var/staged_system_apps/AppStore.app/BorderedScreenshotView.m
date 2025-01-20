@interface BorderedScreenshotView
- (_TtC8AppStore22BorderedScreenshotView)initWithCoder:(id)a3;
- (_TtC8AppStore22BorderedScreenshotView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BorderedScreenshotView

- (_TtC8AppStore22BorderedScreenshotView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore22BorderedScreenshotView *)sub_100643710(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore22BorderedScreenshotView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore22BorderedScreenshotView_platform) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore22BorderedScreenshotView_chromeBorderView) = 0;
  uint64_t v4 = OBJC_IVAR____TtC8AppStore22BorderedScreenshotView_displayConfiguration;
  uint64_t v5 = qword_100980210;
  id v6 = a3;
  if (v5 != -1) {
    swift_once();
  }
  v7 = (char *)self + v4;
  uint64_t v8 = qword_1009E6B00;
  char v9 = byte_1009E6B08;
  uint64_t v10 = qword_1009E6B10;
  char v11 = byte_1009E6B18;
  uint64_t v12 = qword_1009E6B20;
  v13 = (void *)qword_1009E6B28;
  long long v14 = unk_1009E6B30;
  long long v15 = unk_1009E6B40;
  *(void *)v7 = qword_1009E6AF8;
  *((void *)v7 + 1) = v8;
  v7[16] = v9;
  *((void *)v7 + 3) = v10;
  v7[32] = v11;
  *((void *)v7 + 5) = v12;
  *((void *)v7 + 6) = v13;
  *(_OWORD *)(v7 + 56) = v14;
  *(_OWORD *)(v7 + 72) = v15;
  id v16 = v13;

  result = (_TtC8AppStore22BorderedScreenshotView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100643A00();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22BorderedScreenshotView_chromeBorderView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22BorderedScreenshotView_artworkView));
  v3 = *(void **)&self->displayConfiguration[OBJC_IVAR____TtC8AppStore22BorderedScreenshotView_displayConfiguration + 16];
}

@end