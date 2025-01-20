@interface InfoCardHeaderView
- (BOOL)blurButtons;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hideActionButtons;
- (BOOL)hideTitleLabel;
- (NSArray)buttonConfigurations;
- (NSString)title;
- (_TtC4Maps18InfoCardHeaderView)initWithCoder:(id)a3;
- (_TtC4Maps18InfoCardHeaderView)initWithFrame:(CGRect)a3;
- (_TtP4Maps26InfoCardHeaderViewDelegate_)delegate;
- (double)hairLineAlpha;
- (double)titleLabelPointSize;
- (double)titleToEndTrailingConstant;
- (id)getActionButtonWithType:(unint64_t)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)cardButtonTappedWithSender:(id)a3;
- (void)handleTapWithGestureRecognizer:(id)a3;
- (void)infoCardThemeChanged;
- (void)invalidateButtonMenus;
- (void)layoutSubviews;
- (void)setBlurButtons:(BOOL)a3;
- (void)setButtonConfigurations:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHairLineAlpha:(double)a3;
- (void)setHideActionButtons:(BOOL)a3;
- (void)setHideTitleLabel:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation InfoCardHeaderView

- (NSString)title
{
  if (*(void *)&self->title[OBJC_IVAR____TtC4Maps18InfoCardHeaderView_title])
  {
    swift_bridgeObjectRetain();
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setTitle:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  sub_1001DCCA8(v4, v6);
}

- (NSArray)buttonConfigurations
{
  type metadata accessor for InfoCardButtonConfiguration();
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setButtonConfigurations:(id)a3
{
  type metadata accessor for InfoCardButtonConfiguration();
  uint64_t v4 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = OBJC_IVAR____TtC4Maps18InfoCardHeaderView__buttonConfigurations;
  uint64_t v6 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC4Maps18InfoCardHeaderView__buttonConfigurations);
  v8 = self;
  swift_bridgeObjectRetain();
  unsigned __int8 v7 = sub_10019EB88((unint64_t)v4, v6);
  swift_bridgeObjectRelease();
  if (v7)
  {

    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.isa + v5) = v4;
    swift_bridgeObjectRelease();
    sub_1001DCEA4();
  }
}

- (_TtP4Maps26InfoCardHeaderViewDelegate_)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP4Maps26InfoCardHeaderViewDelegate_ *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (double)hairLineAlpha
{
  return *(double *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_hairLineAlpha);
}

- (void)setHairLineAlpha:(double)a3
{
  *(double *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_hairLineAlpha) = a3;
  [*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_bottomHairlineView) setAlpha:];
}

- (BOOL)hideActionButtons
{
  return *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_hideActionButtons);
}

- (void)setHideActionButtons:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1001DDDCC(a3, &OBJC_IVAR____TtC4Maps18InfoCardHeaderView_hideActionButtons, (SEL *)&selRef_setHidden_);
}

- (BOOL)hideTitleLabel
{
  return *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_hideTitleLabel);
}

- (void)setHideTitleLabel:(BOOL)a3
{
  BOOL v3 = a3;
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_hideTitleLabel) = a3;
  uint64_t v4 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_titleLabel);
  uint64_t v5 = self;
  [v4 setHidden:v3];
  sub_1001DD378();
}

- (double)titleLabelPointSize
{
  NSArray v2 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_titleLabel);
  BOOL v3 = self;
  id v4 = [v2 font];
  if (v4)
  {
    uint64_t v6 = v4;
    [v4 pointSize];
    double v8 = v7;

    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (double)titleToEndTrailingConstant
{
  if ((self->title[OBJC_IVAR____TtC4Maps18InfoCardHeaderView_capturedTitleToEndTrailingConstant] & 1) == 0) {
    return *(double *)((char *)&self->super.super.super.super.isa
  }
                     + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_capturedTitleToEndTrailingConstant);
  [*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC4Maps18InfoCardHeaderView_actionButtonsLayoutGuide) frame];
  return v2;
}

- (id)getActionButtonWithType:(unint64_t)a3
{
  id v4 = self;
  uint64_t v5 = (void *)sub_1001DDB18(a3);

  return v5;
}

- (BOOL)blurButtons
{
  return *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_blurButtons);
}

- (void)setBlurButtons:(BOOL)a3
{
  id v4 = self;
  sub_1001DDDCC(a3, &OBJC_IVAR____TtC4Maps18InfoCardHeaderView_blurButtons, (SEL *)&selRef_setBlurBackground_);
}

- (void)invalidateButtonMenus
{
  double v2 = self;
  sub_1001DDED8();
}

- (void)infoCardThemeChanged
{
  double v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_bottomHairlineView);
  BOOL v3 = self;
  id v4 = [(InfoCardHeaderView *)v3 theme];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = [v4 hairlineColor];

    [v2 setBackgroundColor:v6];
  }
  else
  {
    __break(1u);
  }
}

- (_TtC4Maps18InfoCardHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC4Maps18InfoCardHeaderView *)sub_1001E2E48();
}

- (_TtC4Maps18InfoCardHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001E3050();
}

- (void)cardButtonTappedWithSender:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1001DF0F8((uint64_t)v4);
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  id v2 = v4.receiver;
  [(InfoCardHeaderView *)&v4 layoutSubviews];
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    [Strong headerViewDidLayoutSubviews:v2, v4.receiver, v4.super_class];

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)handleTapWithGestureRecognizer:(id)a3
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v6 = (void *)Strong;
    id v7 = a3;
    double v8 = self;
    [v6 headerViewTapped:v8];

    swift_unknownObjectRelease();
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_1001DFED8((uint64_t)a4, x, y);

  return v10;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LOBYTE(self) = sub_1001E0188(v4);

  return self & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100123CE4((uint64_t)self + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_actionButtonsTrailingToSuperViewTrailing));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_actionButtonsLeadingToSuperviewTrailing));

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_actionButtonsLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_bottomHairlineView));
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC4Maps18InfoCardHeaderView_tapGestureRecognizer);
}

@end