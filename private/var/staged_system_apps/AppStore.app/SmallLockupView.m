@interface SmallLockupView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore15SmallLockupView)initWithFrame:(CGRect)a3;
- (_TtC8AppStore25SearchAdTransparencyLabel)accessibilityAdLabel;
- (void)layoutSubviews;
- (void)lockupTapGestureRecognized;
@end

@implementation SmallLockupView

- (_TtC8AppStore15SmallLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore15SmallLockupView *)sub_10070A400();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v4 = type metadata accessor for SmallLockupLayout.Metrics();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  id v9 = [(SmallLockupView *)v8 traitCollection];
  sub_100708490((uint64_t)v7);
  [(SmallLockupView *)v8 layoutMargins];
  id v10 = [(SmallLockupView *)v8 traitCollection];
  double v11 = sub_100709D3C((uint64_t)v7);
  double v13 = v12;

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  double v14 = v11;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)intrinsicContentSize
{
  uint64_t v3 = type metadata accessor for SmallLockupLayout.Metrics();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_100708490((uint64_t)v6);
  [(SmallLockupView *)v7 layoutMargins];
  id v8 = [(SmallLockupView *)v7 traitCollection];
  sub_100709D3C((uint64_t)v6);
  double v10 = v9;

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  double v11 = UIViewNoIntrinsicMetric;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SmallLockupView();
  id v2 = v5.receiver;
  [(SmallLockupView *)&v5 layoutSubviews];
  sub_100708990((uint64_t)v4);
  sub_100081D90(v4, v4[3]);
  LayoutMarginsAware<>.layoutFrame.getter();
  id v3 = [v2 traitCollection];
  dispatch thunk of Placeable.place(at:with:)();

  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0((uint64_t)v4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  char v9 = sub_1007094E4(v6, v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v7 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore15SmallLockupView_lockupTapGestureRecognizer);
  if (!v7)
  {
    id v14 = a3;
    id v15 = a4;
    uint64_t v16 = self;
    goto LABEL_5;
  }
  sub_100084CF0(0, (unint64_t *)&qword_1009932C0);
  id v8 = a3;
  id v9 = a4;
  double v10 = self;
  id v11 = v7;
  char v12 = static NSObject.== infix(_:_:)();

  if ((v12 & 1) == 0)
  {
LABEL_5:
    self;
    BOOL v13 = swift_dynamicCastObjCClass() == 0;
    goto LABEL_6;
  }
  BOOL v13 = 0;
LABEL_6:

  return v13;
}

- (void)lockupTapGestureRecognized
{
  id v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore15SmallLockupView_lockupTapBlock);
  if (v2)
  {
    uint64_t v4 = self;
    uint64_t v3 = sub_100060050((uint64_t)v2);
    v2(v3);
    sub_10006012C((uint64_t)v2);
  }
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC8AppStore15SmallLockupView_metrics;
  uint64_t v4 = type metadata accessor for SmallLockupLayout.Metrics();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15SmallLockupView_searchAdTertiaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15SmallLockupView_inAppPurchaseIcon));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15SmallLockupView_lockupTapGestureRecognizer));
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore15SmallLockupView_lockupTapBlock);

  sub_10006012C(v5);
}

- (_TtC8AppStore25SearchAdTransparencyLabel)accessibilityAdLabel
{
  return (_TtC8AppStore25SearchAdTransparencyLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                             + OBJC_IVAR____TtC8AppStore15SmallLockupView_searchAdTertiaryLabel));
}

@end