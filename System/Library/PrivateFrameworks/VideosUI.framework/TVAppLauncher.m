@interface TVAppLauncher
- (_TtC8VideosUI13TVAppLauncher)init;
- (void)configureAppWindow;
- (void)hideLoadingView;
- (void)showLoadingView;
@end

@implementation TVAppLauncher

- (void)showLoadingView
{
  v2 = self;
  TVAppLauncher.showLoadingView()();
}

- (void)hideLoadingView
{
  v2 = self;
  TVAppLauncher.hideLoadingView()();
}

- (void)configureAppWindow
{
  v2 = self;
  TVAppLauncher.configureAppWindow()();
}

- (_TtC8VideosUI13TVAppLauncher)init
{
  return (_TtC8VideosUI13TVAppLauncher *)TVAppLauncher.init()();
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC8VideosUI13TVAppLauncher__isLoading;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBF84090);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_release();
}

@end