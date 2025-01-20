@interface ICQLiftUIController
- (ICQLiftUIController)init;
- (id)makeLiftUIViewControllerWithContent:(id)a3 dataSource:(id)a4 presenter:(id)a5 data:(id)a6;
- (id)makeLiftUIViewControllerWithURL:(id)a3 dataSource:(id)a4 presenter:(id)a5 data:(id)a6;
- (void)updateStoreDataForKey:(id)a3 value:(id)a4;
@end

@implementation ICQLiftUIController

- (id)makeLiftUIViewControllerWithURL:(id)a3 dataSource:(id)a4 presenter:(id)a5 data:(id)a6
{
  uint64_t v10 = sub_22C9A14E8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C9A14C8();
  if (a6) {
    a6 = (id)sub_22C9A3618();
  }
  id v14 = a4;
  id v15 = a5;
  v16 = self;
  v17 = (void *)sub_22C927170((uint64_t)v13, v14, v15, (uint64_t)a6);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return v17;
}

- (id)makeLiftUIViewControllerWithContent:(id)a3 dataSource:(id)a4 presenter:(id)a5 data:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = self;
  id v14 = a6;
  uint64_t v15 = sub_22C9A14F8();
  unint64_t v17 = v16;

  if (v14)
  {
    uint64_t v18 = sub_22C9A3618();
  }
  else
  {
    uint64_t v18 = 0;
  }
  uint64_t v19 = (void *)sub_22C927B50(v15, v17, v11, v12, v18);
  swift_bridgeObjectRelease();
  sub_22C8E1CF4(v15, v17);

  return v19;
}

- (void)updateStoreDataForKey:(id)a3 value:(id)a4
{
  uint64_t v5 = sub_22C9A36C8();
  uint64_t v7 = v6;
  swift_unknownObjectRetain();
  v8 = self;
  sub_22C9A3CC8();
  swift_unknownObjectRelease();
  sub_22C928334(v5, v7, (uint64_t)v9);

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
}

- (ICQLiftUIController)init
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICQLiftUIController_dataSource) = 0;
  uint64_t v3 = OBJC_IVAR___ICQLiftUIController_store;
  sub_22C9A1D28();
  swift_allocObject();
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_22C9A1D18();
  uint64_t v5 = OBJC_IVAR___ICQLiftUIController_localStore;
  sub_22C9A1CC8();
  swift_allocObject();
  *(Class *)((char *)&v4->super.isa + v5) = (Class)sub_22C9A1CB8();

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for LiftUIController();
  return [(ICQLiftUIController *)&v7 init];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_release();
  swift_release();
}

@end