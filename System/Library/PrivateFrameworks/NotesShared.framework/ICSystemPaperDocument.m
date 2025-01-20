@interface ICSystemPaperDocument
+ (id)assetsDirectoryAt:(id)a3;
+ (id)databaseDirectoryAt:(id)a3;
+ (void)closeContextForNote:(id)a3;
- (BOOL)copyAndArchivePaperBundleTo:(id)a3 error:(id *)a4;
- (BOOL)restorePaperBundleFrom:(id)a3 error:(id *)a4;
- (BOOL)writeNewVersionFromSyncArchive:(id)a3 error:(id *)a4;
- (CRContext)coherenceContext;
- (_TtC11NotesShared21ICSystemPaperDocument)init;
- (_TtC11NotesShared21ICSystemPaperDocument)initWithPaperAttachment:(id)a3;
- (id)archiveBundleForSyncAndReturnError:(id *)a3;
- (id)toFallbackPDFData;
- (void)removeStrokesFromStyleInventory;
- (void)updateGraphDestinationsUsingInlineAttachmentIdentifierMap:(id)a3 completion:(id)a4;
@end

@implementation ICSystemPaperDocument

- (CRContext)coherenceContext
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11NotesShared21ICSystemPaperDocument_attachment);
  v3 = self;
  id v4 = objc_msgSend(v2, sel_managedObjectContext);
  if (v4)
  {
    v5 = v4;
    MEMORY[0x1F4188790](v4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6FC310);
    sub_1C3DBA838();

    v6 = v8;
  }
  else
  {

    v6 = 0;
  }
  return (CRContext *)v6;
}

- (_TtC11NotesShared21ICSystemPaperDocument)initWithPaperAttachment:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11NotesShared21ICSystemPaperDocument_attachment) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  id v6 = a3;
  return [(ICSystemPaperDocument *)&v8 init];
}

- (id)archiveBundleForSyncAndReturnError:(id *)a3
{
  v3 = self;
  id v4 = ICSystemPaperDocument.archiveBundleForSync()();

  return v4;
}

- (BOOL)writeNewVersionFromSyncArchive:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = self;
  ICSystemPaperDocument.writeNewVersionFromSyncArchive(_:)(v5);

  return 1;
}

- (BOOL)copyAndArchivePaperBundleTo:(id)a3 error:(id *)a4
{
  return sub_1C3CF6F84(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(char *))ICSystemPaperDocument.copyAndArchivePaperBundle(to:));
}

- (BOOL)restorePaperBundleFrom:(id)a3 error:(id *)a4
{
  return sub_1C3CF6F84(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(char *))ICSystemPaperDocument.restorePaperBundle(from:));
}

+ (id)databaseDirectoryAt:(id)a3
{
  uint64_t v3 = sub_1C3DB88F8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v3);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  v9 = (char *)&v13 - v8;
  sub_1C3DB8898();
  sub_1C3DB8858();
  v10 = *(void (**)(char *, uint64_t))(v4 + 8);
  v10(v7, v3);
  v11 = (void *)sub_1C3DB8848();
  v10(v9, v3);
  return v11;
}

+ (id)assetsDirectoryAt:(id)a3
{
  uint64_t v3 = sub_1C3DB88F8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v3);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x1F4188790](v5);
  v10 = (char *)&v16 - v9;
  MEMORY[0x1F4188790](v8);
  v12 = (char *)&v16 - v11;
  sub_1C3DB8898();
  sub_1C3DB8858();
  sub_1C3DB8868();
  uint64_t v13 = *(void (**)(char *, uint64_t))(v4 + 8);
  v13(v7, v3);
  v13(v10, v3);
  v14 = (void *)sub_1C3DB8848();
  v13(v12, v3);
  return v14;
}

- (void)updateGraphDestinationsUsingInlineAttachmentIdentifierMap:(id)a3 completion:(id)a4
{
  uint64_t v5 = (void (*)(void))_Block_copy(a4);
  uint64_t v6 = sub_1C3DB9A98();
  if (v5)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v5;
    uint64_t v5 = (void (*)(void))sub_1C3CFDD78;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = self;
  ICSystemPaperDocument.updateGraphDestinations(usingInlineAttachmentIdentifierMap:completion:)(v6, v5, v7);
  sub_1C3C4D710((uint64_t)v5);

  swift_bridgeObjectRelease();
}

+ (void)closeContextForNote:(id)a3
{
  id v3 = a3;
  _s11NotesShared21ICSystemPaperDocumentC12closeContext3forySo6ICNoteC_tFZ_0(v3);
}

- (void)removeStrokesFromStyleInventory
{
  v2 = self;
  ICSystemPaperDocument.removeStrokesFromStyleInventory()();
}

- (id)toFallbackPDFData
{
  v2 = self;
  uint64_t v3 = ICSystemPaperDocument.toFallbackPDFData()();
  unint64_t v5 = v4;

  if (v5 >> 60 == 15)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = (void *)sub_1C3DB8938();
    sub_1C3CCDF74(v3, v5);
  }
  return v6;
}

- (_TtC11NotesShared21ICSystemPaperDocument)init
{
  result = (_TtC11NotesShared21ICSystemPaperDocument *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end