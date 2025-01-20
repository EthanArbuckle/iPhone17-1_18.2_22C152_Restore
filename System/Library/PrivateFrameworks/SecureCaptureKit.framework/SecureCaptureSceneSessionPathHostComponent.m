@interface SecureCaptureSceneSessionPathHostComponent
- (_TtC16SecureCaptureKit42SecureCaptureSceneSessionPathHostComponent)init;
- (_TtC16SecureCaptureKit42SecureCaptureSceneSessionPathHostComponent)initWithScene:(id)a3;
- (void)scene:(id)a3 didUpdateClientSettings:(id)a4;
@end

@implementation SecureCaptureSceneSessionPathHostComponent

- (void)scene:(id)a3 didUpdateClientSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_25BEF7520(v7);
}

- (_TtC16SecureCaptureKit42SecureCaptureSceneSessionPathHostComponent)init
{
  return (_TtC16SecureCaptureKit42SecureCaptureSceneSessionPathHostComponent *)sub_25BEF6A40((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC16SecureCaptureKit42SecureCaptureSceneSessionPathHostComponent_delegate, type metadata accessor for SecureCaptureSceneSessionPathHostComponent);
}

- (_TtC16SecureCaptureKit42SecureCaptureSceneSessionPathHostComponent)initWithScene:(id)a3
{
  return (_TtC16SecureCaptureKit42SecureCaptureSceneSessionPathHostComponent *)sub_25BEF6AB8((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC16SecureCaptureKit42SecureCaptureSceneSessionPathHostComponent_delegate, type metadata accessor for SecureCaptureSceneSessionPathHostComponent);
}

- (void).cxx_destruct
{
}

@end