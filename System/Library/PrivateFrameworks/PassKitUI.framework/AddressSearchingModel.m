@interface AddressSearchingModel
- (_TtC9PassKitUI21AddressSearchingModel)init;
- (void)contactsSearchUpdated:(id)a3;
- (void)mapSearchUpdated:(id)a3;
- (void)selectedAddress:(id)a3 withError:(id)a4;
@end

@implementation AddressSearchingModel

- (_TtC9PassKitUI21AddressSearchingModel)init
{
  result = (_TtC9PassKitUI21AddressSearchingModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI21AddressSearchingModel__isMatchingContact;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E949CE50);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC9PassKitUI21AddressSearchingModel__mapsOnly, v4);

  v6 = (char *)self + OBJC_IVAR____TtC9PassKitUI21AddressSearchingModel__contactResults;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94B0BC0);
  v8 = *(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8);
  v8(v6, v7);
  v8((char *)self + OBJC_IVAR____TtC9PassKitUI21AddressSearchingModel__mapsResults, v7);
  sub_19F48BB68(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC9PassKitUI21AddressSearchingModel_contactMatchHandler));
  v9 = (char *)self + OBJC_IVAR____TtC9PassKitUI21AddressSearchingModel__searchText;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94AC928);
  v11 = *(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8);

  v11(v9, v10);
}

- (void)contactsSearchUpdated:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19FA99770(v4, (uint64_t)&unk_1EF19EB08, (uint64_t)sub_19FA9A1D4, (uint64_t)&block_descriptor_54_2);
}

- (void)mapSearchUpdated:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19FA99770(v4, (uint64_t)&unk_1EF19EAB8, (uint64_t)sub_19FA9A17C, (uint64_t)&block_descriptor_42_4);
}

- (void)selectedAddress:(id)a3 withError:(id)a4
{
  id v7 = a3;
  v8 = self;
  id v9 = a4;
  sub_19FA99E38(a3);
}

@end