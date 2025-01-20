@interface PlayButton
- (BOOL)_supportsMacIdiom;
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (CGSize)intrinsicContentSize;
- (NSString)accessibilityLabel;
- (_TtC23ShelfKitCollectionViews10PlayButton)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews10PlayButton)initWithFrame:(CGRect)a3;
- (void)setAccessibilityLabel:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)tintColorDidChange;
- (void)trigger;
@end

@implementation PlayButton

- (_TtC23ShelfKitCollectionViews10PlayButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_C7D7C();
}

- (void)trigger
{
  v2 = self;
  sub_C2570();
}

- (BOOL)isHighlighted
{
  return sub_C30C0(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
}

- (BOOL)isEnabled
{
  return sub_C30C0(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(PlayButton *)&v3 tintColorDidChange];
  sub_BF74C();
}

- (CGSize)intrinsicContentSize
{
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  id v2 = v10.receiver;
  [(PlayButton *)&v10 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  if (qword_46FBD8 != -1) {
    swift_once();
  }
  double v7 = *(double *)&qword_474198;

  if (v6 > v7) {
    double v8 = v6;
  }
  else {
    double v8 = v7;
  }
  double v9 = v4;
  result.height = v8;
  result.width = v9;
  return result;
}

- (BOOL)_supportsMacIdiom
{
  return 0;
}

- (NSString)accessibilityLabel
{
  uint64_t v3 = sub_381DB0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  double v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v7 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews10PlayButton_buttonState;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  double v8 = self;
  sub_381D40();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  NSString v9 = sub_384380();
  swift_bridgeObjectRelease();

  return (NSString *)v9;
}

- (void)setAccessibilityLabel:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_3843C0();
    double v6 = self;
    a3 = sub_384380();
    swift_bridgeObjectRelease();
  }
  else
  {
    double v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  [(PlayButton *)&v8 setAccessibilityLabel:a3];
}

- (_TtC23ShelfKitCollectionViews10PlayButton)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC23ShelfKitCollectionViews10PlayButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_E544((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews10PlayButton_data, (uint64_t *)&unk_477CC0);
  swift_release();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews10PlayButton_buttonState;
  uint64_t v4 = sub_381DB0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews10PlayButton_symbolSwapView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews10PlayButton_progressView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews10PlayButton_progressLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews10PlayButton_progressWidthConstraint));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews10PlayButton_waveformView));

  swift_release();
}

@end