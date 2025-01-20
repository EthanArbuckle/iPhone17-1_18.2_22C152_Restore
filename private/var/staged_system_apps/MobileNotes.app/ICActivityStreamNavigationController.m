@interface ICActivityStreamNavigationController
- (BOOL)hasInteractiveSizing;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (ICActivityStreamCoordinating)coordinator;
- (ICActivityStreamNavigationController)initWithCoder:(id)a3;
- (ICActivityStreamNavigationController)initWithCoordinator:(id)a3 hasInteractiveSizing:(BOOL)a4;
- (ICActivityStreamNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (ICActivityStreamNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (ICActivityStreamNavigationController)initWithRootViewController:(id)a3;
- (ICActivityStreamSelection)selection;
- (ICActivityStreamViewController)activityStreamViewController;
- (ICCloudSyncingObject)object;
- (UISheetPresentationController)sheetController;
- (double)viewModeDurationFor:(int64_t)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (int64_t)viewMode;
- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4;
- (void)_sheetPresentationController:(id)a3 didChangeIndexOfCurrentDetent:(int64_t)a4;
- (void)analyticsSessionWillEnd;
- (void)handleTap:(id)a3;
- (void)moveToViewMode:(int64_t)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setActivityStreamViewController:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setObject:(id)a3;
- (void)setSelection:(id)a3;
- (void)setSheetController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willEnterForeground;
@end

@implementation ICActivityStreamNavigationController

- (void)setSelection:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1000075A0(a3);
}

- (void)setObject:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___ICActivityStreamNavigationController_object);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___ICActivityStreamNavigationController_object) = (Class)a3;
  id v6 = a3;
  v5 = self;

  sub_100008610();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10001F614();
}

- (ICActivityStreamNavigationController)initWithCoordinator:(id)a3 hasInteractiveSizing:(BOOL)a4
{
  return (ICActivityStreamNavigationController *)sub_100019CA8((uint64_t)a3, a4);
}

- (ICActivityStreamCoordinating)coordinator
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (ICActivityStreamCoordinating *)Strong;
}

- (void)setCoordinator:(id)a3
{
}

- (BOOL)hasInteractiveSizing
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR___ICActivityStreamNavigationController_hasInteractiveSizing);
}

- (ICActivityStreamViewController)activityStreamViewController
{
  return (ICActivityStreamViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                   + OBJC_IVAR___ICActivityStreamNavigationController_activityStreamViewController));
}

- (void)setActivityStreamViewController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___ICActivityStreamNavigationController_activityStreamViewController);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___ICActivityStreamNavigationController_activityStreamViewController) = (Class)a3;
  id v3 = a3;
}

- (UISheetPresentationController)sheetController
{
  return (UISheetPresentationController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                  + OBJC_IVAR___ICActivityStreamNavigationController_sheetController));
}

- (void)setSheetController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___ICActivityStreamNavigationController_sheetController);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___ICActivityStreamNavigationController_sheetController) = (Class)a3;
  id v3 = a3;
}

- (ICActivityStreamNavigationController)initWithCoder:(id)a3
{
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_10040522C(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = v6.receiver;
  [(ICActivityStreamNavigationController *)&v6 viewDidAppear:v3];
  sub_100405DBC();
  LODWORD(v3) = UIAccessibilityLayoutChangedNotification;
  id v5 = [v4 view];
  UIAccessibilityPostNotification(v3, v5);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1004056D0();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(ICActivityStreamNavigationController *)&v5 viewWillDisappear:v3];
  sub_100406028();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = (char *)v7.receiver;
  [(ICActivityStreamNavigationController *)&v7 viewDidDisappear:v3];
  objc_super v5 = *(void **)&v4[OBJC_IVAR___ICActivityStreamNavigationController_activityStreamViewController];
  if (v5)
  {
    objc_super v6 = v5;
    sub_100170284(0);

    id v4 = v6;
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_100406324(a4, width, height);
  swift_unknownObjectRelease();
}

- (void)willEnterForeground
{
  uint64_t v3 = sub_10002F214((uint64_t *)&unk_1006A3E20);
  __chkstk_darwin(v3 - 8);
  objc_super v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v6 = self;
  Date.init()();
  uint64_t v7 = type metadata accessor for Date();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, 0, 1, v7);
  uint64_t v8 = (uint64_t)v6 + OBJC_IVAR___ICActivityStreamNavigationController_timeOfLastViewModeChange;
  swift_beginAccess();
  sub_10021E98C((uint64_t)v5, v8);
  swift_endAccess();
}

- (void)analyticsSessionWillEnd
{
  v2 = self;
  sub_100406028();
}

- (void)handleTap:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_100406C38(v4);
}

- (ICCloudSyncingObject)object
{
  return (ICCloudSyncingObject *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                         + OBJC_IVAR___ICActivityStreamNavigationController_object));
}

- (ICActivityStreamSelection)selection
{
  return (ICActivityStreamSelection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                              + OBJC_IVAR___ICActivityStreamNavigationController_selection));
}

- (int64_t)viewMode
{
  v2 = self;
  unint64_t v3 = sub_10040750C();

  return v3;
}

- (void)moveToViewMode:(int64_t)a3
{
  id v4 = self;
  sub_100407808(a3);
}

- (double)viewModeDurationFor:(int64_t)a3
{
  id v4 = self;
  double v5 = sub_100406BB4(a3);

  return v5;
}

- (ICActivityStreamNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (ICActivityStreamNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (ICActivityStreamNavigationController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (ICActivityStreamNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (ICActivityStreamNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (ICActivityStreamNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10015E5E8((uint64_t)self + OBJC_IVAR___ICActivityStreamNavigationController_coordinator);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamNavigationController_activityStreamViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamNavigationController_sheetController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamNavigationController_object));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamNavigationController_selection));
  swift_bridgeObjectRelease();
  sub_10033F718((uint64_t)self + OBJC_IVAR___ICActivityStreamNavigationController_timeOfLastViewModeChange);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamNavigationController____lazy_storage___unfilteredHeaderView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamNavigationController____lazy_storage___filteredHeaderView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ICActivityStreamNavigationController____lazy_storage___dockedDetent));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___ICActivityStreamNavigationController____lazy_storage___halfHeightDetent);
}

- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_100408758(a4);
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  if (*((unsigned char *)&self->super.super.super.super.isa
       + OBJC_IVAR___ICActivityStreamNavigationController_hasInteractiveSizing) == 1)
    return (int64_t)[a3 presentationStyle];
  else {
    return 2;
  }
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return (*((unsigned char *)&self->super.super.super.super.isa
          + OBJC_IVAR___ICActivityStreamNavigationController_hasInteractiveSizing) & 1) == 0;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1004089DC();
}

- (void)_sheetPresentationController:(id)a3 didChangeIndexOfCurrentDetent:(int64_t)a4
{
  id v6 = a3;
  id v7 = self;
  sub_10040832C(v6, a4);
}

@end