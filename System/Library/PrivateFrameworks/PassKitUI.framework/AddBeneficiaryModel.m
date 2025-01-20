@interface AddBeneficiaryModel
- (_TtC9PassKitUI19AddBeneficiaryModel)init;
- (void)nextViewControllerWithCompletion:(id)a3;
@end

@implementation AddBeneficiaryModel

- (void)nextViewControllerWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    *(void *)(swift_allocObject() + 16) = v4;
    v5 = sub_19F5F8C3C;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_19FDA53FC((uint64_t (*)(void, void))v5);
  sub_19F48BB68((uint64_t)v5);
}

- (_TtC9PassKitUI19AddBeneficiaryModel)init
{
  result = (_TtC9PassKitUI19AddBeneficiaryModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_19F48BB68(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI19AddBeneficiaryModel__onSubmission));
  sub_19F6EAD20((uint64_t)self + OBJC_IVAR____TtC9PassKitUI19AddBeneficiaryModel__error);

  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI19AddBeneficiaryModel___observationRegistrar;
  uint64_t v4 = sub_1A03AF618();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end