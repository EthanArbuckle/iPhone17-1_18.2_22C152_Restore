@interface WeatherMapViewController
- (BOOL)popoverPresentationControllerShouldDismissPopover:(id)a3;
- (_TtC11WeatherMaps24WeatherMapViewController)initWithCoder:(id)a3;
- (_TtC11WeatherMaps24WeatherMapViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (void)loadView;
- (void)mapSnapshotViewDidRetrieveSnapshot:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation WeatherMapViewController

- (_TtC11WeatherMaps24WeatherMapViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A2163D8();
}

- (void)loadView
{
  v2 = self;
  WeatherMapViewController.loadView()();
}

- (void)viewDidLoad
{
  v2 = self;
  WeatherMapViewController.viewDidLoad()();
}

- (void)willMoveToParentViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  WeatherMapViewController.willMove(toParent:)((UIViewController_optional *)a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  WeatherMapViewController.viewDidAppear(_:)(a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  WeatherMapViewController.viewDidLayoutSubviews()();
}

- (_TtC11WeatherMaps24WeatherMapViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_20A38B610();
  }
  id v5 = a4;
  WeatherMapViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController_resolver);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController_snapshotViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController_interactiveViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController_locationPickerViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController_locationPopoverViewController));
  OUTLINED_FUNCTION_20(OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController_previewViewController);
  OUTLINED_FUNCTION_20(OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController_locationActionHandler);
  OUTLINED_FUNCTION_20(OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController_canAddLocationHandler);
  OUTLINED_FUNCTION_20(OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController_canViewLocationHandler);
  OUTLINED_FUNCTION_20(OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController_onMapEventHandler);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController____lazy_storage___supplementaryOverlayContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController_supplementaryOverlayDebounceTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController_supplementaryOverlayViewController));
  swift_release();
  sub_20A21EC24((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController_lastViewModel, (void (*)(void))type metadata accessor for WeatherMapStore.ViewModel);
  sub_20A1D4270((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController_viewModelToUpdate, &qword_26AC3AE10);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController_resizeTimer));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController_bannerUpdateBlock);
  sub_20A1E59F0(v3);
}

- (void)mapSnapshotViewDidRetrieveSnapshot:(id)a3
{
  uint64_t v4 = sub_20A388FE0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A388FB0();
  v8 = self;
  sub_20A21B9AC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  WeatherMapViewController.popoverPresentationControllerShouldDismissPopover(_:)((UIPopoverPresentationController)v5);

  return 1;
}

@end