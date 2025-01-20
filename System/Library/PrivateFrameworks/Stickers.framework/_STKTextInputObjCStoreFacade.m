@interface _STKTextInputObjCStoreFacade
- (BOOL)touchStickerWithIdentifier:(id)a3 error:(id *)a4;
- (_STKTextInputObjCStoreFacade)init;
- (id)representationsForStickersWithIdentifiers:(id)a3 roles:(id)a4 error:(id *)a5;
- (id)stickersWithIdentifiers:(id)a3 roles:(id)a4 error:(id *)a5;
@end

@implementation _STKTextInputObjCStoreFacade

- (_STKTextInputObjCStoreFacade)init
{
  uint64_t v3 = type metadata accessor for StickerStore.PersistenceType();
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_25E425690();
  uint64_t v7 = sub_25E425390();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, 1, 3, v7);
  uint64_t v8 = type metadata accessor for StickerStore();
  swift_allocObject();
  uint64_t v9 = StickerStore.init(persistence:)((uint64_t)v5);
  v10 = (uint64_t *)((char *)v6 + OBJC_IVAR____STKTextInputObjCStoreFacade_store);
  v10[3] = v8;
  v10[4] = (uint64_t)&protocol witness table for StickerStore;
  uint64_t *v10 = v9;

  v11 = (objc_class *)type metadata accessor for _STKTextInputObjCStoreFacade(0);
  v13.receiver = v6;
  v13.super_class = v11;
  return [(_STKTextInputObjCStoreFacade *)&v13 init];
}

- (id)stickersWithIdentifiers:(id)a3 roles:(id)a4 error:(id *)a5
{
  return sub_25E3D1A68(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t))sub_25E3D096C, (void (*)(void))type metadata accessor for _STKSticker);
}

- (id)representationsForStickersWithIdentifiers:(id)a3 roles:(id)a4 error:(id *)a5
{
  return sub_25E3D1A68(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t))sub_25E3D180C, (void (*)(void))type metadata accessor for _STKStickerRepresentation);
}

- (BOOL)touchStickerWithIdentifier:(id)a3 error:(id *)a4
{
  v14 = a4;
  uint64_t v5 = sub_25E4254F0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E4254C0();
  uint64_t v9 = *(void *)&self->store[OBJC_IVAR____STKTextInputObjCStoreFacade_store + 16];
  uint64_t v10 = *(void *)&self->store[OBJC_IVAR____STKTextInputObjCStoreFacade_store + 24];
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR____STKTextInputObjCStoreFacade_store), v9);
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 72);
  v12 = self;
  v11(v8, v9, v10);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return 1;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____STKTextInputObjCStoreFacade_store);
  uint64_t v3 = (char *)self + OBJC_IVAR____STKTextInputObjCStoreFacade_logger;
  uint64_t v4 = sub_25E4256A0();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end