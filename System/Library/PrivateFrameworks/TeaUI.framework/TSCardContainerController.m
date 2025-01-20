@interface TSCardContainerController
- (BOOL)accessibilityPerformEscape;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (TSCardContainerController)initWithCoder:(id)a3;
- (TSCardContainerController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIViewController)childViewControllerForStatusBarStyle;
- (void)collapseCards:(id)a3;
- (void)expandCards:(id)a3;
- (void)popCards;
- (void)pushCardWithViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation TSCardContainerController

- (UIViewController)childViewControllerForStatusBarStyle
{
  v2 = self;
  id v3 = sub_1B5E9CEAC();

  return (UIViewController *)v3;
}

- (TSCardContainerController)initWithCoder:(id)a3
{
  id v3 = a3;
  CardContainerController.init(coder:)();
}

- (TSCardContainerController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1B61B20F0();
  }
  id v5 = a4;
  CardContainerController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  sub_1B5E437C4((uint64_t)self + OBJC_IVAR___TSCardContainerController_delegate);
  swift_release();

  sub_1B5EA8F74(0, (unint64_t *)&qword_1EB63EA00, (uint64_t (*)(uint64_t))type metadata accessor for CardContainerController.CardItem, MEMORY[0x1E4FAB048]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_1();
  v3();

  swift_release();
}

- (void)viewDidLoad
{
  v2 = self;
  CardContainerController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  CardContainerController.viewWillAppear(_:)(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  CardContainerController.viewDidAppear(_:)(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  CardContainerController.viewWillDisappear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  CardContainerController.viewDidDisappear(_:)(a3);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  CardContainerController.viewWillLayoutSubviews()();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  CardContainerController.viewDidLayoutSubviews()();
}

- (void)viewLayoutMarginsDidChange
{
  v2 = self;
  CardContainerController.viewLayoutMarginsDidChange()();
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewSafeAreaInsetsDidChange
{
  v2 = self;
  CardContainerController.viewSafeAreaInsetsDidChange()();
}

- (void)collapseCards:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    *(void *)(swift_allocObject() + 16) = v4;
    id v5 = sub_1B5EAA464;
  }
  else
  {
    id v5 = 0;
  }
  v6 = self;
  CardContainerController.collapseCards(completion:)();
  sub_1B5E3799C((uint64_t)v5);
}

- (void)expandCards:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    *(void *)(swift_allocObject() + 16) = v4;
    id v5 = sub_1B5EA9C18;
  }
  else
  {
    id v5 = 0;
  }
  v6 = self;
  CardContainerController.expandCards(completion:)();
  sub_1B5E3799C((uint64_t)v5);
}

- (void)pushCardWithViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  if (v7)
  {
    *(void *)(swift_allocObject() + 16) = v7;
    v7 = sub_1B5EA9C10;
  }
  id v8 = a3;
  v9 = self;
  CardContainerController.pushCard(_:animated:completion:)();
  sub_1B5E3799C((uint64_t)v7);
}

- (void)popCards
{
  v2 = self;
  CardContainerController.popCards()();
}

- (BOOL)accessibilityPerformEscape
{
  v2 = self;
  Swift::Bool v3 = CardContainerController.accessibilityPerformEscape()();

  return v3;
}

@end