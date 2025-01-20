@interface JSSubscriptionPurchaseLoadingViewController
- (_TtC16MusicApplication43JSSubscriptionPurchaseLoadingViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication43JSSubscriptionPurchaseLoadingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation JSSubscriptionPurchaseLoadingViewController

- (_TtC16MusicApplication43JSSubscriptionPurchaseLoadingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_AB6510();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  v9 = (_TtC16MusicApplication43JSSubscriptionPurchaseLoadingViewController *)sub_3E2244(v5, v7, (uint64_t)a4);

  return v9;
}

- (_TtC16MusicApplication43JSSubscriptionPurchaseLoadingViewController)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC16MusicApplication43JSSubscriptionPurchaseLoadingViewController_loadingView;
  id v5 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)_s16MusicApplication43JSSubscriptionPurchaseLoadingViewControllerC07loadingF033_E9A8DE5BD8B377223C15E85C975C1B400A6CoreUI0eF0Cvpfi_0();

  result = (_TtC16MusicApplication43JSSubscriptionPurchaseLoadingViewController *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  JSSubscriptionPurchaseLoadingViewController.viewDidLoad()();
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v2 = (char *)v6.receiver;
  [(JSSubscriptionPurchaseLoadingViewController *)&v6 viewDidLayoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC16MusicApplication43JSSubscriptionPurchaseLoadingViewController_loadingView];
  id v4 = [v2 view];
  if (v4)
  {
    id v5 = v4;
    [v4 center];
    [v3 setCenter:];
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  JSSubscriptionPurchaseLoadingViewController.viewWillAppear(_:)(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  JSSubscriptionPurchaseLoadingViewController.viewWillDisappear(_:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication43JSSubscriptionPurchaseLoadingViewController_loadingView));
}

@end