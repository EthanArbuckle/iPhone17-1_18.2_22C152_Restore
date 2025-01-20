@interface PaperDocumentThumbnailView.ThumbnailDelegate
- (_TtCC8PaperKit26PaperDocumentThumbnailView17ThumbnailDelegate)init;
- (id)menuElementsForPage:(id)a3;
- (id)pasteActionForPage:(id)a3;
- (void)didSelectPage;
- (void)handlePageOrderedCollectionDifference:(id)a3;
- (void)insertFileAtURL:(id)a3 atIndex:(int64_t)a4 completionHandler:(id)a5;
- (void)registerFileRepresentationsForPage:(int64_t)a3 toItemProvider:(id)a4;
@end

@implementation PaperDocumentThumbnailView.ThumbnailDelegate

- (void)didSelectPage
{
  v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_defaultCenter);
  if (one-time initialization token for PaperKitPDFThumbnailViewDidSelectPageNotification != -1) {
    swift_once();
  }
  NSNotificationName v6 = PaperKitPDFThumbnailViewDidSelectPageNotification;
  id v7 = (id)MEMORY[0x210550400]((char *)v4 + OBJC_IVAR____TtCC8PaperKit26PaperDocumentThumbnailView17ThumbnailDelegate_thumbnailView);
  objc_msgSend(v5, sel_postNotificationName_object_, v6, v7);
}

- (id)menuElementsForPage:(id)a3
{
  id v4 = a3;
  id v5 = self;
  uint64_t v6 = PaperDocumentThumbnailView.ThumbnailDelegate.menuElements(for:)((uint64_t)v4, (uint64_t (*)(uint64_t))PaperDocumentView.menuElements(for:));

  if (v6)
  {
    type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for UIMenuElement);
    v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7.super.isa = 0;
  }
  return v7.super.isa;
}

- (void)handlePageOrderedCollectionDifference:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CollectionDifference<PDFPage>);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  NSArray v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for PDFPage);
  static CollectionDifference._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = MEMORY[0x210550400]((char *)self + OBJC_IVAR____TtCC8PaperKit26PaperDocumentThumbnailView17ThumbnailDelegate_thumbnailView);
  if (v8)
  {
    v9 = (void *)v8;
    uint64_t v10 = v8 + OBJC_IVAR____TtC8PaperKit26PaperDocumentThumbnailView_documentView;
    swift_beginAccess();
    uint64_t v11 = MEMORY[0x210550400](v10);
    v12 = self;

    if (v11)
    {
      PaperDocumentView.handlePageOrderedCollectionDifference(_:)();

      v12 = (_TtCC8PaperKit26PaperDocumentThumbnailView17ThumbnailDelegate *)v11;
    }
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)insertFileAtURL:(id)a3 atIndex:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  v14 = self;
  PaperDocumentThumbnailView.ThumbnailDelegate.insertFile(at:at:completionHandler:)((uint64_t)v11, a4, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned UITargetedDragPreview) -> (), v13);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)registerFileRepresentationsForPage:(int64_t)a3 toItemProvider:(id)a4
{
  uint64_t v7 = MEMORY[0x210550400]((char *)self + OBJC_IVAR____TtCC8PaperKit26PaperDocumentThumbnailView17ThumbnailDelegate_thumbnailView, a2);
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = v7 + OBJC_IVAR____TtC8PaperKit26PaperDocumentThumbnailView_documentView;
    swift_beginAccess();
    uint64_t v10 = MEMORY[0x210550400](v9);
    uint64_t v11 = (_TtCC8PaperKit26PaperDocumentThumbnailView17ThumbnailDelegate *)a4;
    v12 = self;

    if (v10)
    {
      PaperDocumentView.registerFileRepresentations(forPage:to:)(a3, (NSItemProvider)v11);

      uint64_t v11 = v12;
      v12 = (_TtCC8PaperKit26PaperDocumentThumbnailView17ThumbnailDelegate *)v10;
    }
  }
}

- (id)pasteActionForPage:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  uint64_t v7 = (void *)PaperDocumentThumbnailView.ThumbnailDelegate.menuElements(for:)((uint64_t)a3, (uint64_t (*)(uint64_t))PaperDocumentView.pasteAction(for:));

  return v7;
}

- (_TtCC8PaperKit26PaperDocumentThumbnailView17ThumbnailDelegate)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(PaperDocumentThumbnailView.ThumbnailDelegate *)&v5 init];
}

- (void).cxx_destruct
{
}

@end