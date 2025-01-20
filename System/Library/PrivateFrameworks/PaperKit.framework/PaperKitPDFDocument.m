@interface PaperKitPDFDocument
- (BOOL)unlockWithPassword:(id)a3;
- (Class)annotationSubclassForType:(id)a3;
- (Class)pageClass;
- (_TtC8PaperKit19PaperKitPDFDocument)init;
- (_TtC8PaperKit19PaperKitPDFDocument)initWithData:(id)a3;
- (_TtC8PaperKit19PaperKitPDFDocument)initWithURL:(id)a3;
- (id)copyWithZone:(void *)a3;
- (id)pageAtIndex:(int64_t)a3;
- (void)exchangePageAtIndex:(int64_t)a3 withPageAtIndex:(int64_t)a4;
- (void)insertPage:(id)a3 atIndex:(int64_t)a4;
- (void)removePageAtIndex:(int64_t)a3;
@end

@implementation PaperKitPDFDocument

- (Class)pageClass
{
  type metadata accessor for PaperKitPDFPage(0);
  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)annotationSubclassForType:(id)a3
{
  type metadata accessor for CanvasElementPDFAnnotation();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC8PaperKit19PaperKitPDFDocument)init
{
  uint64_t v3 = MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8PaperKit19PaperKitPDFDocument_pageProxies) = (Class)MEMORY[0x263F8EE78];
  uint64_t v4 = OBJC_IVAR____TtC8PaperKit19PaperKitPDFDocument_pdfPageIdMap;
  v5 = self;
  *(Class *)((char *)&self->super.super.isa + v4) = (Class)specialized Dictionary.init(dictionaryLiteral:)(v3);
  uint64_t v6 = OBJC_IVAR____TtC8PaperKit19PaperKitPDFDocument_pageIdMap;
  *(Class *)((char *)&v5->super.super.isa + v6) = (Class)specialized Dictionary.init(dictionaryLiteral:)(v3);

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for PaperKitPDFDocument();
  return [(PDFDocument *)&v8 init];
}

- (_TtC8PaperKit19PaperKitPDFDocument)initWithURL:(id)a3
{
  uint64_t v3 = type metadata accessor for URL();
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC8PaperKit19PaperKitPDFDocument *)PaperKitPDFDocument.init(url:)((uint64_t)v5);
}

- (_TtC8PaperKit19PaperKitPDFDocument)initWithData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v6 = v5;

  return (_TtC8PaperKit19PaperKitPDFDocument *)PaperKitPDFDocument.init(data:)(v4, v6);
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v4 = self;
  PaperKitPDFDocument.copy(with:)((uint64_t)a3, v7);

  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  unint64_t v5 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5;
}

- (id)pageAtIndex:(int64_t)a3
{
  uint64_t v4 = self;
  PaperKitPDFDocument.page(at:)(v5, a3);
  uint64_t v7 = v6;

  return v7;
}

- (void)removePageAtIndex:(int64_t)a3
{
  uint64_t v4 = self;
  PaperKitPDFDocument.removePage(at:)(a3);
}

- (void)insertPage:(id)a3 atIndex:(int64_t)a4
{
  unint64_t v6 = (PDFPage *)a3;
  uint64_t v7 = self;
  PaperKitPDFDocument.insert(_:at:)(v6, a4);
}

- (void)exchangePageAtIndex:(int64_t)a3 withPageAtIndex:(int64_t)a4
{
  unint64_t v6 = self;
  PaperKitPDFDocument.exchangePage(at:withPageAt:)(a3, a4);
}

- (BOOL)unlockWithPassword:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for PageId?);
  MEMORY[0x270FA5388](v4 - 8);
  unint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  v10 = self;
  v11 = (void *)MEMORY[0x21054D080](v7, v9);
  v12 = (objc_class *)type metadata accessor for PaperKitPDFDocument();
  v19.receiver = v10;
  v19.super_class = v12;
  BOOL v13 = [(PDFDocument *)&v19 unlockWithPassword:v11];

  if (v13)
  {
    uint64_t v14 = type metadata accessor for PageId(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v6, 1, 1, v14);
    uint64_t v15 = specialized Array.init(repeating:count:)((uint64_t)v6, [(PDFDocument *)v10 pageCount]);
    v16 = (uint64_t *)((char *)v10 + OBJC_IVAR____TtC8PaperKit19PaperKitPDFDocument_pageProxies);
    swift_beginAccess();
    uint64_t *v16 = v15;

    swift_bridgeObjectRelease();
  }
  else
  {
  }
  swift_bridgeObjectRelease();
  return v13;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end