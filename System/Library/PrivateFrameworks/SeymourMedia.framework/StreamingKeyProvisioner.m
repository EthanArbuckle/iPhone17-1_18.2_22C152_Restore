@interface StreamingKeyProvisioner
- (BOOL)contentKeySession:(id)a3 shouldRetryContentKeyRequest:(id)a4 reason:(id)a5;
- (_TtC12SeymourMedia23StreamingKeyProvisioner)init;
- (void)contentKeySession:(id)a3 contentKeyRequest:(id)a4 didFailWithError:(id)a5;
- (void)contentKeySession:(id)a3 contentKeyRequestDidSucceed:(id)a4;
- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4;
- (void)contentKeySession:(id)a3 didProvidePersistableContentKeyRequest:(id)a4;
- (void)contentKeySession:(id)a3 didProvideRenewingContentKeyRequest:(id)a4;
- (void)dealloc;
@end

@implementation StreamingKeyProvisioner

- (void)dealloc
{
  v2 = self;
  sub_22625E24C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12SeymourMedia23StreamingKeyProvisioner_analyticsReporter);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12SeymourMedia23StreamingKeyProvisioner_assetClient);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12SeymourMedia23StreamingKeyProvisioner_backoffIntervalProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12SeymourMedia23StreamingKeyProvisioner_keyDeliveryClient);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12SeymourMedia23StreamingKeyProvisioner_contentKeySession));
  sub_226263C38((uint64_t)self + OBJC_IVAR____TtC12SeymourMedia23StreamingKeyProvisioner_state);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC12SeymourMedia23StreamingKeyProvisioner_onUnrecoverableError);

  sub_2261B43A8(v3);
}

- (_TtC12SeymourMedia23StreamingKeyProvisioner)init
{
  result = (_TtC12SeymourMedia23StreamingKeyProvisioner *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_226260AF4((uint64_t)v6, v7);
}

- (void)contentKeySession:(id)a3 didProvidePersistableContentKeyRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_2262668F8(v7);
}

- (void)contentKeySession:(id)a3 didProvideRenewingContentKeyRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_226261F60((uint64_t)v6, v7);
}

- (void)contentKeySession:(id)a3 contentKeyRequest:(id)a4 didFailWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  v10 = self;
  sub_2262673F4(v9, v11);
}

- (void)contentKeySession:(id)a3 contentKeyRequestDidSucceed:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_226267B3C(v7);
}

- (BOOL)contentKeySession:(id)a3 shouldRetryContentKeyRequest:(id)a4 reason:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  LOBYTE(self) = sub_226267D90(v9, v10);

  return self & 1;
}

@end