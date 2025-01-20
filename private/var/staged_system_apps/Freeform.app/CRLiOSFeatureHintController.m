@interface CRLiOSFeatureHintController
- (_TtC8Freeform27CRLiOSFeatureHintController)initWithCoder:(id)a3;
- (_TtC8Freeform27CRLiOSFeatureHintController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)loadView;
- (void)triggerClose;
- (void)updatePreferredContentSize;
- (void)viewDidLoad;
@end

@implementation CRLiOSFeatureHintController

- (_TtC8Freeform27CRLiOSFeatureHintController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform27CRLiOSFeatureHintController_kVerticalMargin) = (Class)0x4028000000000000;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform27CRLiOSFeatureHintController_kLeadingMargin) = (Class)0x4030000000000000;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform27CRLiOSFeatureHintController_kTrailingMargin) = (Class)0x4028000000000000;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform27CRLiOSFeatureHintController_kTextToButtonSpacing) = (Class)0x4028000000000000;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform27CRLiOSFeatureHintController_kCloseButtonHitRegionWidth) = (Class)0x4046000000000000;
  id v4 = a3;

  result = (_TtC8Freeform27CRLiOSFeatureHintController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)loadView
{
  v2 = self;
  sub_100A5F3B4();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100A5F5D8();
}

- (void)updatePreferredContentSize
{
  v2 = self;
  sub_100A5FB34();
}

- (void)triggerClose
{
}

- (_TtC8Freeform27CRLiOSFeatureHintController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8Freeform27CRLiOSFeatureHintController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform27CRLiOSFeatureHintController_textHolder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform27CRLiOSFeatureHintController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform27CRLiOSFeatureHintController_subtitleLabel));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform27CRLiOSFeatureHintController_closeButton);
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

@end