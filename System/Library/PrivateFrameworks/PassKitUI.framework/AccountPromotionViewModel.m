@interface AccountPromotionViewModel
- (_TtC9PassKitUI25AccountPromotionViewModel)init;
- (void)dealloc;
- (void)linkedApplicationDidChangeState:(id)a3;
@end

@implementation AccountPromotionViewModel

- (void)dealloc
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI25AccountPromotionViewModel_linkedApplication);
  if (v3) {
    objc_msgSend(v3, sel_removeObserver_, self);
  }
  else {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AccountPromotionViewModel();
  [(AccountPromotionViewModel *)&v5 dealloc];
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI25AccountPromotionViewModel__appStoreButtonTitle;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94A6D78);
  objc_super v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (_TtC9PassKitUI25AccountPromotionViewModel)init
{
  result = (_TtC9PassKitUI25AccountPromotionViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)linkedApplicationDidChangeState:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_19F775C58();
}

@end