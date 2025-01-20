@interface DwellBannerPresenter
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (BOOL)isDraggingDismissalEnabled;
- (BOOL)preventsAutomaticDismissal;
- (BOOL)providesHostedContent;
- (NSString)associatedAppBundleIdentifier;
- (NSString)associatedScenePersistenceIdentifier;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (SBUISystemApertureAccessoryView)leadingView;
- (SBUISystemApertureAccessoryView)minimalView;
- (SBUISystemApertureAccessoryView)trailingView;
- (_TtC17proximitycontrold20DwellBannerPresenter)initWithCoder:(id)a3;
- (_TtC17proximitycontrold20DwellBannerPresenter)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)activeLayoutMode;
- (int64_t)contentRole;
- (int64_t)maximumLayoutMode;
- (int64_t)preferredLayoutMode;
- (unint64_t)presentationBehaviors;
- (void)dealloc;
- (void)presentableDidAppearAsBanner:(id)a3;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillAppearAsBanner:(id)a3;
- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4;
- (void)setActiveLayoutMode:(int64_t)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3;
@end

@implementation DwellBannerPresenter

- (NSString)requesterIdentifier
{
  return (NSString *)sub_100017B84();
}

- (BOOL)isDraggingDismissalEnabled
{
  return 1;
}

- (int64_t)activeLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC17proximitycontrold20DwellBannerPresenter_activeLayoutMode);
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17proximitycontrold20DwellBannerPresenter_activeLayoutMode) = (Class)a3;
}

- (NSString)associatedAppBundleIdentifier
{
  return (NSString *)0;
}

- (NSString)associatedScenePersistenceIdentifier
{
  return (NSString *)0;
}

- (int64_t)contentRole
{
  return 1;
}

- (int64_t)maximumLayoutMode
{
  return 4;
}

- (int64_t)preferredLayoutMode
{
  return 4;
}

- (unint64_t)presentationBehaviors
{
  return 8;
}

- (BOOL)preventsAutomaticDismissal
{
  return 1;
}

- (BOOL)providesHostedContent
{
  return 1;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  return (SBUISystemApertureAccessoryView *)0;
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return (SBUISystemApertureAccessoryView *)0;
}

- (SBUISystemApertureAccessoryView)minimalView
{
  return (SBUISystemApertureAccessoryView *)0;
}

- (NSString)requestIdentifier
{
  return (NSString *)sub_100017B84();
}

- (void)dealloc
{
  v2 = self;
  sub_10000A38C(&qword_10035C250);
  AsyncStream.Continuation.finish()();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for DwellBannerPresenter();
  [(DwellBannerPresenter *)&v3 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17proximitycontrold20DwellBannerPresenter_bannerSource));
  objc_super v3 = (char *)self + OBJC_IVAR____TtC17proximitycontrold20DwellBannerPresenter_eventStream;
  uint64_t v4 = sub_10000A38C(&qword_10035C298);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC17proximitycontrold20DwellBannerPresenter_eventContinuation;
  uint64_t v6 = sub_10000A38C(&qword_10035C250);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17proximitycontrold20DwellBannerPresenter_childView));
  v7 = (char *)self + OBJC_IVAR____TtC17proximitycontrold20DwellBannerPresenter_endTime;

  sub_100019D08((uint64_t)v7);
}

- (_TtC17proximitycontrold20DwellBannerPresenter)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100018E38();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100017DF0();
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v7 = a3;
  v8 = self;
  sub_100017FEC((uint64_t)a3, a4);
}

- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3
{
}

- (void)presentableDidAppearAsBanner:(id)a3
{
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
}

- (void)presentableWillAppearAsBanner:(id)a3
{
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  id v7 = self;
  sub_100019AD4((uint64_t)a4);
  swift_unknownObjectRelease();
}

- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4
{
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (_TtC17proximitycontrold20DwellBannerPresenter)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC17proximitycontrold20DwellBannerPresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end