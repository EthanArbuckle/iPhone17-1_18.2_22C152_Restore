@interface CaptureSceneDelegate
- (UIWindow)window;
- (_TtC16SecureCaptureKit20CaptureSceneDelegate)init;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation CaptureSceneDelegate

- (UIWindow)window
{
  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window);
  swift_beginAccess();
  return (UIWindow *)*v2;
}

- (void)setWindow:(id)a3
{
  v4 = (void **)((char *)&self->super.super.isa + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (_TtC16SecureCaptureKit20CaptureSceneDelegate)init
{
  return (_TtC16SecureCaptureKit20CaptureSceneDelegate *)CaptureSceneDelegate.init()();
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_25BF0315C(v8, v10);
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  sub_25BF030D0();
  sub_25BF03F48();
  uint64_t v6 = sub_25BF05678();
  id v7 = a3;
  id v8 = self;
  sub_25BF023E0(v6);

  swift_bridgeObjectRelease();
}

- (void)sceneDidDisconnect:(id)a3
{
  v3 = (void **)((char *)&self->super.super.isa + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window);
  swift_beginAccess();
  v4 = *v3;
  *v3 = 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_rootViewController));

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_sessionPath));
  v3 = (char *)self + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_urlContexts;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5822E0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_urlContextsProducerContinuation;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A582B38);
  id v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
}

@end