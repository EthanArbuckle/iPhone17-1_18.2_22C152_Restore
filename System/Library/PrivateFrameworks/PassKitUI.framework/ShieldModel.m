@interface ShieldModel
- (_TtC9PassKitUIP33_81D0147D6FAEBFC2E9CB6EB898C8034D11ShieldModel)init;
- (void)appProtectionCoordinatorDidFailAccess;
- (void)appProtectionCoordinatorDidGainAccess;
- (void)dealloc;
@end

@implementation ShieldModel

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC9PassKitUIP33_81D0147D6FAEBFC2E9CB6EB898C8034D11ShieldModel_coordinator);
  v5 = self;
  id v6 = v4;
  sub_1A03AFD28();

  v7.receiver = v5;
  v7.super_class = ObjectType;
  [(ShieldModel *)&v7 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUIP33_81D0147D6FAEBFC2E9CB6EB898C8034D11ShieldModel_coordinator));
  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUIP33_81D0147D6FAEBFC2E9CB6EB898C8034D11ShieldModel___observationRegistrar;
  uint64_t v4 = sub_1A03AF618();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (void)appProtectionCoordinatorDidGainAccess
{
  v2 = self;
  sub_19FA30874();
}

- (void)appProtectionCoordinatorDidFailAccess
{
  swift_getKeyPath();
  sub_19FA31A84(&qword_1E94AFA60, (void (*)(uint64_t))type metadata accessor for ShieldModel);
  v3 = self;
  sub_1A03AF5C8();

  swift_release();
}

- (_TtC9PassKitUIP33_81D0147D6FAEBFC2E9CB6EB898C8034D11ShieldModel)init
{
  result = (_TtC9PassKitUIP33_81D0147D6FAEBFC2E9CB6EB898C8034D11ShieldModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end