@interface WelcomeViewController
- (BOOL)isModalInPresentation;
- (NSArray)keyCommands;
- (_TtC23ShelfKitCollectionViews21WelcomeViewController)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews21WelcomeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)acknowledgeTerms;
- (void)didTapStart:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation WelcomeViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_2852BC(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_285490(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_285708();
}

- (NSArray)keyCommands
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_478810);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_391100;
  v4 = self;
  NSString v5 = sub_384380();
  id v6 = [self keyCommandWithInput:v5 modifierFlags:0 action:"acknowledgeTerms"];

  *(void *)(v3 + 32) = v6;
  sub_384610();

  sub_2E66C(0, &qword_475948);
  v7.super.isa = sub_3845E0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v7.super.isa;
}

- (void)acknowledgeTerms
{
  v2 = self;
  sub_2867A0();
}

- (void)didTapStart:(id)a3
{
  id v4 = a3;
  NSString v5 = self;
  sub_28A7B4();
}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (_TtC23ShelfKitCollectionViews21WelcomeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_3843C0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC23ShelfKitCollectionViews21WelcomeViewController *)WelcomeViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC23ShelfKitCollectionViews21WelcomeViewController)initWithCoder:(id)a3
{
  return (_TtC23ShelfKitCollectionViews21WelcomeViewController *)WelcomeViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21WelcomeViewController_rootStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21WelcomeViewController_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21WelcomeViewController_tourButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21WelcomeViewController_headerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21WelcomeViewController_bodyLabel));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews21WelcomeViewController____lazy_storage___continueButton);
}

@end