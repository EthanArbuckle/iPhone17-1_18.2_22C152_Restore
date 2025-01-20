@interface PaperKitPDFPage
- (Class)annotationSubclassForSubtype:(id)a3;
- (NSArray)annotations;
- (NSString)description;
- (_TtC8PaperKit15PaperKitPDFPage)init;
- (_TtC8PaperKit15PaperKitPDFPage)initWithImage:(id)a3 options:(id)a4;
- (char)isCandidateForOCR;
- (id)copyWithZone:(void *)a3;
- (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)a4 withOptions:(id)a5;
- (void)setCandidateForOCR:(char)a3;
@end

@implementation PaperKitPDFPage

- (id)copyWithZone:(void *)a3
{
  v4 = self;
  PaperKitPDFPage.copy(with:)((uint64_t)a3, v7);

  __swift_project_boxed_opaque_existential_1(v7, (uint64_t)v7[3]);
  v5 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5;
}

- (NSArray)annotations
{
  v2 = self;
  PaperKitPDFPage.annotations.getter();

  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for PDFAnnotation);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v3.super.isa;
}

- (NSString)description
{
  v2 = self;
  id v3 = PaperKitPDFPage.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x21054D080](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (char)isCandidateForOCR
{
  v2 = self;
  char v3 = PaperKitPDFPage.candidateForOCR.getter();

  return v3;
}

- (void)setCandidateForOCR:(char)a3
{
  uint64_t v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PaperKitPDFPage(0);
  [(PaperKitPDFPage *)&v4 setCandidateForOCR:v3];
}

- (void)drawWithBox:(int64_t)a3 inContext:(CGContext *)a4 withOptions:(id)a5
{
  if (a5) {
    uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v8 = 0;
  }
  v9 = a4;
  v10 = self;
  PaperKitPDFPage.draw(with:in:withOptions:)(a3, a4, v8);

  swift_bridgeObjectRelease();
}

- (Class)annotationSubclassForSubtype:(id)a3
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_bridgeObjectRelease();
  type metadata accessor for CanvasElementPDFAnnotation();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC8PaperKit15PaperKitPDFPage)init
{
  uint64_t v3 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8PaperKit15PaperKitPDFPage_render);
  *uint64_t v3 = 0;
  v3[1] = 0;
  objc_super v4 = (char *)self + OBJC_IVAR____TtC8PaperKit15PaperKitPDFPage_pageId;
  uint64_t v5 = type metadata accessor for PageId(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8PaperKit15PaperKitPDFPage_appearanceStreamAnnotations) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8PaperKit15PaperKitPDFPage_annotationIDState) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PaperKitPDFPage(0);
  return [(PaperKitPDFPage *)&v7 init];
}

- (_TtC8PaperKit15PaperKitPDFPage)initWithImage:(id)a3 options:(id)a4
{
  return (_TtC8PaperKit15PaperKitPDFPage *)PaperKitPDFPage.init(image:options:)(a3);
}

- (void).cxx_destruct
{
  outlined consume of (@escaping @callee_guaranteed (@guaranteed [NSAttributedStringKey : Any], @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ())?(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8PaperKit15PaperKitPDFPage_render));
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)self + OBJC_IVAR____TtC8PaperKit15PaperKitPDFPage_pageId, (uint64_t *)&demangling cache variable for type metadata for PageId?);
  swift_bridgeObjectRelease();
  unint64_t v3 = *(unint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC8PaperKit15PaperKitPDFPage_annotationIDState);
  outlined consume of PaperKitPDFPage.AnnotationIDState(v3);
}

@end