@interface KeyRequestBagConsumer
- (_TtC15SeymourServices21KeyRequestBagConsumer)init;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
@end

@implementation KeyRequestBagConsumer

- (_TtC15SeymourServices21KeyRequestBagConsumer)init
{
  result = (_TtC15SeymourServices21KeyRequestBagConsumer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15SeymourServices21KeyRequestBagConsumer_accountProvider);
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15SeymourServices21KeyRequestBagConsumer_amsSession);
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = self;
  sub_1D6844B74(v14, (uint64_t)sub_1D6844B6C, v11);

  swift_release();
}

@end