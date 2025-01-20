@interface SecureCaptureSceneStatusBarHostComponent
- (_TtC16SecureCaptureKit40SecureCaptureSceneStatusBarHostComponent)init;
- (_TtC16SecureCaptureKit40SecureCaptureSceneStatusBarHostComponent)initWithScene:(id)a3;
- (void)scene:(id)a3 didUpdateClientSettings:(id)a4;
- (void)scene:(id)a3 willUpdateSettings:(id)a4;
@end

@implementation SecureCaptureSceneStatusBarHostComponent

- (void)scene:(id)a3 willUpdateSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_25BEF72F0(v7);
}

- (void)scene:(id)a3 didUpdateClientSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_25BEF6618(v6, v7);
}

- (_TtC16SecureCaptureKit40SecureCaptureSceneStatusBarHostComponent)init
{
  return (_TtC16SecureCaptureKit40SecureCaptureSceneStatusBarHostComponent *)sub_25BEF6A40((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC16SecureCaptureKit40SecureCaptureSceneStatusBarHostComponent_delegate, type metadata accessor for SecureCaptureSceneStatusBarHostComponent);
}

- (_TtC16SecureCaptureKit40SecureCaptureSceneStatusBarHostComponent)initWithScene:(id)a3
{
  return (_TtC16SecureCaptureKit40SecureCaptureSceneStatusBarHostComponent *)sub_25BEF6AB8((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC16SecureCaptureKit40SecureCaptureSceneStatusBarHostComponent_delegate, type metadata accessor for SecureCaptureSceneStatusBarHostComponent);
}

- (void).cxx_destruct
{
}

@end