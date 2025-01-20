@interface SnippetHostViewController
- (BOOL)shouldShareTouchesWithHost;
- (NSArray)activityTouchRestrictedRects;
- (NSString)description;
- (_TtC15SiriInteractive12SceneMetrics)resolvedMetrics;
- (_TtC15SiriInteractive19SceneMetricsRequest)systemProvidedMetrics;
- (_TtC15SiriInteractive25SnippetHostViewController)initWithCoder:(id)a3;
- (_TtC15SiriInteractive25SnippetHostViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtP15SiriInteractive33SnippetHostViewControllerDelegate_)delegate;
- (id)cancelTouchesForCurrentEventInHostedContent;
- (unsigned)presentationMode;
- (void)dealloc;
- (void)ensureContentWithTimeout:(double)a3 queue:(id)a4 completion:(id)a5;
- (void)invalidate;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)scene:(id)a3 didReceiveActions:(id)a4;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneDidActivate:(id)a3;
- (void)sceneDidDeactivate:(id)a3 withError:(id)a4;
- (void)sceneDidInvalidate:(id)a3;
- (void)sceneLayerManagerDidStartTrackingLayers:(id)a3;
- (void)sceneLayerManagerDidStopTrackingLayers:(id)a3;
- (void)sceneLayerManagerDidUpdateLayers:(id)a3;
- (void)setActivityTouchRestrictedRects:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPresentationMode:(unsigned int)a3;
- (void)setResolvedMetrics:(id)a3;
- (void)setShouldShareTouchesWithHost:(BOOL)a3;
- (void)setSystemProvidedMetrics:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SnippetHostViewController

- (_TtP15SiriInteractive33SnippetHostViewControllerDelegate_)delegate
{
  v2 = (void *)sub_25C9A74F4();
  return (_TtP15SiriInteractive33SnippetHostViewControllerDelegate_ *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_25C9A7598();
}

- (unsigned)presentationMode
{
  return sub_25C9A784C();
}

- (void)setPresentationMode:(unsigned int)a3
{
  v4 = self;
  sub_25C9A78B0(a3);
}

- (_TtC15SiriInteractive12SceneMetrics)resolvedMetrics
{
  v2 = sub_25C9A7988();
  return (_TtC15SiriInteractive12SceneMetrics *)v2;
}

- (void)setResolvedMetrics:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_25C9A7A2C(a3);
}

- (NSArray)activityTouchRestrictedRects
{
  sub_25C9A7B14();
  type metadata accessor for CGRect(0);
  v2 = (void *)sub_25C9B81B0();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setActivityTouchRestrictedRects:(id)a3
{
  type metadata accessor for CGRect(0);
  uint64_t v4 = sub_25C9B81C0();
  id v5 = self;
  sub_25C9A7BC8(v4);
}

- (_TtC15SiriInteractive19SceneMetricsRequest)systemProvidedMetrics
{
  id v2 = sub_25C9A7C6C();
  return (_TtC15SiriInteractive19SceneMetricsRequest *)v2;
}

- (void)setSystemProvidedMetrics:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_25C9A7D18(v4);
}

- (_TtC15SiriInteractive25SnippetHostViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_25C9A8AD4();
}

- (void)dealloc
{
  id v2 = self;
  SnippetHostViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_25C9B6048((uint64_t)self + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_resolvedMetrics));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_systemProvidedMetrics));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_settingsDiffInspector));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_activatedSceneView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_snippetSceneSnapshotView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController____lazy_storage___queue));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_ensureContentTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneClientExitTimer));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_modalSceneViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneSpecification));
  id v3 = (char *)self + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_viewModel;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (void)viewDidLoad
{
  id v2 = self;
  sub_25C9A9050();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_25C9A91DC(a3);
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_25C9A9390((uint64_t)v6, (uint64_t)a4);

  swift_unknownObjectRelease();
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v7 = a3;
  v8 = self;
  sub_25C9A952C((uint64_t)a3, a4);
}

- (void)viewDidLayoutSubviews
{
  id v2 = self;
  sub_25C9A962C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_25C9A97B0((uint64_t)a3);
}

- (void)ensureContentWithTimeout:(double)a3 queue:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a4;
  v11 = self;
  sub_25C9A9980(v10, (uint64_t)sub_25C9B6040, v9, a3);

  swift_release();
}

- (void)invalidate
{
  id v2 = self;
  sub_25C9AAB7C();
}

- (NSString)description
{
  id v2 = self;
  sub_25C9AAE30();

  id v3 = (void *)sub_25C9B8140();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)shouldShareTouchesWithHost
{
  return sub_25C9AB5B8() & 1;
}

- (void)setShouldShareTouchesWithHost:(BOOL)a3
{
  id v4 = self;
  sub_25C9AB64C(a3);
}

- (id)cancelTouchesForCurrentEventInHostedContent
{
  id v2 = self;
  sub_25C9AB77C();
  id v4 = v3;

  return v4;
}

- (_TtC15SiriInteractive25SnippetHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_25C9B8150();
  }
  id v5 = a4;
  SnippetHostViewController.init(nibName:bundle:)();
}

- (void)sceneDidActivate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  SnippetHostViewController.sceneDidActivate(_:)();
}

- (void)sceneDidInvalidate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  SnippetHostViewController.sceneDidInvalidate(_:)();
}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  SnippetHostViewController.sceneDidDeactivate(_:withError:)(v6, a4);
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  sub_25C9950BC(0, &qword_26A5E0658);
  sub_25C9B5588();
  uint64_t v6 = sub_25C9B8260();
  id v7 = a3;
  id v8 = self;
  SnippetHostViewController.scene(_:didReceive:)((uint64_t)v8, v6);

  swift_bridgeObjectRelease();
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  SnippetHostViewController.scene(_:didUpdateClientSettingsWith:oldClientSettings:transitionContext:)();
}

- (void)sceneLayerManagerDidUpdateLayers:(id)a3
{
  id v4 = a3;
  id v5 = self;
  SnippetHostViewController.sceneLayerManagerDidUpdateLayers(_:)();
}

- (void)sceneLayerManagerDidStopTrackingLayers:(id)a3
{
  id v4 = a3;
  id v5 = self;
  SnippetHostViewController.sceneLayerManagerDidStopTrackingLayers(_:)();
}

- (void)sceneLayerManagerDidStartTrackingLayers:(id)a3
{
  id v4 = a3;
  id v5 = self;
  SnippetHostViewController.sceneLayerManagerDidStartTrackingLayers(_:)();
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  id v5 = self;
  SnippetHostViewController.presentationControllerDidDismiss(_:)((UIPresentationController)v5);
}

@end