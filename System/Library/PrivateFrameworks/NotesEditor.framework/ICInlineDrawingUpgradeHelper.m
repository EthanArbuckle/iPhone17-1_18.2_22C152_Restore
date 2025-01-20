@interface ICInlineDrawingUpgradeHelper
- (ICNote)note;
- (NSManagedObjectContext)managedObjectContext;
- (UITextView)textView;
- (_TtC11NotesEditor28ICInlineDrawingUpgradeHelper)init;
- (_TtC11NotesEditor28ICInlineDrawingUpgradeHelper)initWithNote:(id)a3 managedObjectContext:(id)a4 textView:(id)a5;
- (id)upgradeWithAttachment:(id)a3 itemProviders:(id)a4 itemsAnchor:(int64_t)a5;
- (id)upgradeWithAttachment:(id)a3 itemProviders:(id)a4 itemsLocation:(CGPoint)a5;
- (void)cancelUpgrade;
- (void)setTextView:(id)a3;
- (void)upgradeAllAttachmentsInNote;
@end

@implementation ICInlineDrawingUpgradeHelper

- (ICNote)note
{
  return (ICNote *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC11NotesEditor28ICInlineDrawingUpgradeHelper_note));
}

- (NSManagedObjectContext)managedObjectContext
{
  return (NSManagedObjectContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR____TtC11NotesEditor28ICInlineDrawingUpgradeHelper_managedObjectContext));
}

- (UITextView)textView
{
  v2 = (void *)MEMORY[0x210546B30]((char *)self + OBJC_IVAR____TtC11NotesEditor28ICInlineDrawingUpgradeHelper_textView, a2);

  return (UITextView *)v2;
}

- (void)setTextView:(id)a3
{
}

- (_TtC11NotesEditor28ICInlineDrawingUpgradeHelper)initWithNote:(id)a3 managedObjectContext:(id)a4 textView:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (_TtC11NotesEditor28ICInlineDrawingUpgradeHelper *)sub_20C0440C0(v7, v8);

  return v10;
}

- (id)upgradeWithAttachment:(id)a3 itemProviders:(id)a4 itemsLocation:(CGPoint)a5
{
  uint64_t v5 = *(void *)&a5.y;
  uint64_t v6 = *(void *)&a5.x;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676BCEF0);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20BFCEE58(0, (unint64_t *)&unk_2676BBC50);
  uint64_t v12 = sub_20C162CF0();
  uint64_t v13 = sub_20C1623E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  id v14 = a3;
  v15 = self;
  v16 = (void *)sub_20C040A80(v14, v12, v6, v5, 0, (uint64_t)v11);
  sub_20BFCEDFC((uint64_t)v11, &qword_2676BCEF0);

  swift_bridgeObjectRelease();

  return v16;
}

- (id)upgradeWithAttachment:(id)a3 itemProviders:(id)a4 itemsAnchor:(int64_t)a5
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676BCEF0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20BFCEE58(0, (unint64_t *)&unk_2676BBC50);
  uint64_t v11 = sub_20C162CF0();
  type metadata accessor for ICSystemPaperDocumentHelper();
  sub_20C103470(a5, (uint64_t)v10);
  id v12 = a3;
  uint64_t v13 = self;
  id v14 = (void *)sub_20C040A80(v12, v11, 0, 0, 1, (uint64_t)v10);
  sub_20BFCEDFC((uint64_t)v10, &qword_2676BCEF0);

  swift_bridgeObjectRelease();

  return v14;
}

- (void)cancelUpgrade
{
  v2 = self;
  ICInlineDrawingUpgradeHelper.cancelUpgrade()();
}

- (void)upgradeAllAttachmentsInNote
{
  v2 = self;
  ICInlineDrawingUpgradeHelper.upgradeAllAttachmentsInNote()();
}

- (_TtC11NotesEditor28ICInlineDrawingUpgradeHelper)init
{
  result = (_TtC11NotesEditor28ICInlineDrawingUpgradeHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11NotesEditor28ICInlineDrawingUpgradeHelper_managedObjectContext));
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11NotesEditor28ICInlineDrawingUpgradeHelper_upgradeSemaphore);
}

@end