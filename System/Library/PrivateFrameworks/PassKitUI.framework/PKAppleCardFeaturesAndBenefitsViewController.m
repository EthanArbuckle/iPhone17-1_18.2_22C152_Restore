@interface PKAppleCardFeaturesAndBenefitsViewController
- (PKAppleCardFeaturesAndBenefitsViewController)init;
- (PKAppleCardFeaturesAndBenefitsViewController)initWithCoder:(id)a3;
- (PKAppleCardFeaturesAndBenefitsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
@end

@implementation PKAppleCardFeaturesAndBenefitsViewController

- (PKAppleCardFeaturesAndBenefitsViewController)init
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for AppleCardFeaturesAndBenefitsManager());
  v4 = self;
  v5 = (objc_class *)objc_msgSend(v3, sel_init);
  *(Class *)((char *)&v4->super.super.super.isa + OBJC_IVAR___PKAppleCardFeaturesAndBenefitsViewController_dataManager) = v5;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for AppleCardFeaturesAndBenefitsViewController();
  return [(PKAppleCardFeaturesAndBenefitsViewController *)&v7 initWithNibName:0 bundle:0];
}

- (PKAppleCardFeaturesAndBenefitsViewController)initWithCoder:(id)a3
{
  result = (PKAppleCardFeaturesAndBenefitsViewController *)sub_1A03B5A98();
  __break(1u);
  return result;
}

- (void)loadView
{
  v2 = self;
  sub_19FB46D14();
}

- (PKAppleCardFeaturesAndBenefitsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (PKAppleCardFeaturesAndBenefitsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PKAppleCardFeaturesAndBenefitsViewController_dataManager));
}

@end