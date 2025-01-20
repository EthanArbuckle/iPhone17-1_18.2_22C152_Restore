@interface ApplyControllerModel
- (_TtC9PassKitUI20ApplyControllerModel)init;
- (void)viewControllerDidTerminateSetupFlow:(id)a3;
@end

@implementation ApplyControllerModel

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_19F7202A0(a3);
}

- (_TtC9PassKitUI20ApplyControllerModel)init
{
  return (_TtC9PassKitUI20ApplyControllerModel *)sub_19F7204E0();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI20ApplyControllerModel__nextView;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E94A6240);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  id v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI20ApplyControllerModel__accountError;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94A59A0);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC9PassKitUI20ApplyControllerModel__hasFieldsSubmitted;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E94A6230);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  v9 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI20ApplyControllerModel_applyController);
}

@end