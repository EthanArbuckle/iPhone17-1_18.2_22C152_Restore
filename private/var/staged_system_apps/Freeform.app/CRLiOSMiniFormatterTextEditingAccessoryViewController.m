@interface CRLiOSMiniFormatterTextEditingAccessoryViewController
- (_TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController)initWithCoder:(id)a3;
- (_TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)loadView;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentationControllerDidDismiss:(id)a3;
@end

@implementation CRLiOSMiniFormatterTextEditingAccessoryViewController

- (_TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100E822F0();
}

- (void)loadView
{
  id v3 = objc_allocWithZone((Class)UIInputView);
  v4 = self;
  id v5 = [v3 initWithFrame:0 inputViewStyle:0.0];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CRLiOSMiniFormatterTextEditingAccessoryViewController *)v4 setInputView:v5];
  sub_100E7DD0C();
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  if (v7)
  {
    *(void *)(swift_allocObject() + 16) = v7;
    v7 = sub_1005E2108;
  }
  id v8 = a3;
  v9 = self;
  sub_100E823E4(v8);
  sub_1005174AC((uint64_t)v7);
}

- (_TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController_textBuilder));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController_icc));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController_editorController));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController_presentedNavigationController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController_presentedAuxiliaryViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController_toolbar));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController_auxiliaryPresentedBuilder));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController_inputViewStateAtLastReload));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  if (*(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8Freeform53CRLiOSMiniFormatterTextEditingAccessoryViewController_presentedAuxiliaryViewController)
    && objc_msgSend(self, "crl_phoneUI"))
  {
    return 1;
  }
  else
  {
    return -1;
  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100E813F4(v4);
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  type metadata accessor for CRLiOSMiniFormatterPopoverContainerViewController();
  if (swift_dynamicCastClass())
  {
    id v8 = a3;
    id v9 = a4;
    v14 = self;
    sub_100657F44(v10, v11, v12, v13);
    [v8 setPreferredContentSize:];
  }
}

@end