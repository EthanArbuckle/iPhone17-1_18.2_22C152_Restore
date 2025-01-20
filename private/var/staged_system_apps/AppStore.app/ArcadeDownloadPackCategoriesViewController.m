@interface ArcadeDownloadPackCategoriesViewController
- (void)didTapContinueButton;
- (void)didTapSkipButton;
- (void)viewDidLoad;
@end

@implementation ArcadeDownloadPackCategoriesViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v2 = v5.receiver;
  [(ArcadeDownloadPackViewController *)&v5 viewDidLoad];
  [v2 setModalInPresentation:1];
  id v3 = [v2 navigationItem];
  [v3 setHidesBackButton:1];

  id v4 = [v2 navigationItem];
  [v4 setBackButtonDisplayMode:1];
}

- (void)didTapContinueButton
{
  id v2 = self;
  dispatch thunk of ArcadeDownloadPackCategoriesPagePresenter.didTapContinueButton()();
}

- (void)didTapSkipButton
{
  id v2 = self;
  dispatch thunk of ArcadeDownloadPackCategoriesPagePresenter.didTapSkipButton()();
  [(ArcadeDownloadPackCategoriesViewController *)v2 dismissViewControllerAnimated:1 completion:0];
}

- (void).cxx_destruct
{
  swift_release();

  id v3 = *(void **)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC8AppStore42ArcadeDownloadPackCategoriesViewController_skipButton];
}

@end