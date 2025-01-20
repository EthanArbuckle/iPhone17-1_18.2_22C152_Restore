@interface SSKSceneHostingDisplayControllerAdapter
- (CADisplay)caDisplay;
- (SSKSceneHostingDisplayControllerAdapter)init;
- (SSKSceneHostingDisplayControllerAdapter)initWithConfiguration:(id)a3 displayIdentity:(id)a4 displayConfiguration:(id)a5 updateTransformsAdapter:(id)a6;
- (void)displayDisconnected:(id)a3;
- (void)gainedControl;
- (void)lostControl;
- (void)workspace:(id)a3 didReceiveScene:(id)a4 withContext:(id)a5 fromProcess:(id)a6;
- (void)workspace:(id)a3 didReceiveSceneRequestWithOptions:(id)a4 fromProcess:(id)a5 completion:(id)a6;
@end

@implementation SSKSceneHostingDisplayControllerAdapter

- (CADisplay)caDisplay
{
  return (CADisplay *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_caDisplay));
}

- (SSKSceneHostingDisplayControllerAdapter)initWithConfiguration:(id)a3 displayIdentity:(id)a4 displayConfiguration:(id)a5 updateTransformsAdapter:(id)a6
{
  return (SSKSceneHostingDisplayControllerAdapter *)SceneHostingDisplayControllerAdapter.init(boxedConfiguration:display:displayConfiguration:updateTransformsAdapter:)(a3, a4, a5, a6);
}

- (SSKSceneHostingDisplayControllerAdapter)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_caDisplayObservation) = 0;

  result = (SSKSceneHostingDisplayControllerAdapter *)sub_25C47AF18();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_updateTransformsAdapter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___SSKSceneHostingDisplayControllerAdapter_caDisplayObservation));
  swift_release();
  swift_release();
  swift_release();
}

- (void)workspace:(id)a3 didReceiveSceneRequestWithOptions:(id)a4 fromProcess:(id)a5 completion:(id)a6
{
  v9 = (void (**)(void *, void, void *))_Block_copy(a6);
  sub_25C477558();
  v10 = (void *)swift_allocError();
  id v11 = a3;
  id v12 = a4;
  swift_unknownObjectRetain();
  v14 = self;
  v13 = (void *)sub_25C47A9C8();
  v9[2](v9, 0, v13);

  _Block_release(v9);
  swift_unknownObjectRelease();
}

- (void)workspace:(id)a3 didReceiveScene:(id)a4 withContext:(id)a5 fromProcess:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  swift_unknownObjectRetain();
  v13 = self;
  sub_25C4775AC(v11, (uint64_t)a6);

  swift_unknownObjectRelease();
}

- (void)displayDisconnected:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s13ShellSceneKit0B31HostingDisplayControllerAdapterC19displayDisconnectedyySo18FBSDisplayIdentityCF_0();
}

- (void)gainedControl
{
  v2 = self;
  SceneHostingDisplayControllerAdapter.gainedControl()();
}

- (void)lostControl
{
  v2 = self;
  SceneHostingDisplayControllerAdapter.lostControl()();
}

@end