@interface ExtensionViewController
- (_TtC8PaperKit23ExtensionViewController)initWithCoder:(id)a3;
- (_TtC8PaperKit23ExtensionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)endSearch;
- (void)handleLink:(id)a3;
- (void)loadBookmark:(id)a3 readOnly:(BOOL)a4;
- (void)loadPaper:(id)a3 paperBookmark:(id)a4 coherenceContextBookmark:(id)a5 encrypted:(BOOL)a6 userInterfaceState:(int64_t)a7;
- (void)loadPaper:(id)a3 paperURL:(id)a4 coherenceContextURL:(id)a5 encrypted:(BOOL)a6 userInterfaceState:(int64_t)a7;
- (void)receiveLiveStreamData:(id)a3;
- (void)receiveMulticastData:(id)a3;
- (void)reportSafeAreaInsetsWithTop:(double)a3 left:(double)a4 bottom:(double)a5 right:(double)a6;
- (void)revertAllChanges;
- (void)searchDrawImageFor:(int64_t)a3 reply:(id)a4;
- (void)searchFor:(id)a3 ignoreCase:(BOOL)a4 wholeWords:(BOOL)a5 reply:(id)a6;
- (void)searchFrameFor:(int64_t)a3 reply:(id)a4;
- (void)searchScrollToVisible:(int64_t)a3;
- (void)setCanvasContentMode:(int64_t)a3;
- (void)setHasLiveStreamMessenger:(BOOL)a3;
- (void)setLinedPaperWithHorizontalLineSpacing:(double)a3 verticalLineSpacing:(double)a4 horizontalInset:(double)a5;
- (void)setMathDocument:(id)a3;
- (void)setMathEnabled:(BOOL)a3;
- (void)setMathResult:(id)a3 expressionUUID:(id)a4;
- (void)setPaperDocumentInlineThumbnailsVisible:(BOOL)a3;
- (void)setTool:(id)a3;
- (void)setUserInterfaceStyleWithUserInterfaceStyle:(int64_t)a3;
- (void)setupWithData:(id)a3 transparentBackground:(BOOL)a4;
@end

@implementation ExtensionViewController

- (void)dealloc
{
  if (*((unsigned char *)&self->super.super.super.isa
       + OBJC_IVAR____TtC8PaperKit23ExtensionViewController_hostRequestQueueSuspended) == 1)
  {
    v3 = *(NSObject **)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC8PaperKit23ExtensionViewController_hostRequestQueue);
    v4 = self;
    dispatch_resume(v3);
  }
  else
  {
    v5 = self;
  }
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ExtensionViewController();
  [(ExtensionViewController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23ExtensionViewController_paperTextCanvasView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23ExtensionViewController_paperCanvasView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23ExtensionViewController_paperViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23ExtensionViewController_paperDocumentViewController));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8PaperKit23ExtensionViewController_tool);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23ExtensionViewController_hostRequestQueue));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)loadPaper:(id)a3 paperURL:(id)a4 coherenceContextURL:(id)a5 encrypted:(BOOL)a6 userInterfaceState:(int64_t)a7
{
  uint64_t v23 = a7;
  BOOL v7 = a6;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v10 - 8);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for URL();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v19 = v18;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  if (a5)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v20 = 0;
  }
  else
  {
    uint64_t v20 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, v20, 1, v13);
  v21 = self;
  ExtensionViewController.loadPaper(_:paperURL:coherenceContextURL:encrypted:userInterfaceState:)(v17, v19, (uint64_t)v16, (uint64_t)v12, v7, v23);
  swift_bridgeObjectRelease();

  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)v12, &demangling cache variable for type metadata for URL?);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

- (void)loadPaper:(id)a3 paperBookmark:(id)a4 coherenceContextBookmark:(id)a5 encrypted:(BOOL)a6 userInterfaceState:(int64_t)a7
{
  BOOL v8 = a6;
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  id v15 = a4;
  uint64_t v23 = self;
  id v16 = a5;
  uint64_t v17 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v19 = v18;

  if (v16)
  {
    uint64_t v20 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v22 = v21;
  }
  else
  {
    uint64_t v20 = 0;
    uint64_t v22 = (char *)0xF000000000000000;
  }
  ExtensionViewController.loadPaper(_:paperBookmark:coherenceContextBookmark:encrypted:userInterfaceState:)(v12, v14, v17, v19, v20, v22, v8, a7);
  outlined consume of Data?(v20, (unint64_t)v22);
  outlined consume of Data._Representation(v17, v19);
  swift_bridgeObjectRelease();
}

- (void)loadBookmark:(id)a3 readOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v10 = self;
  uint64_t v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v9 = v8;

  ExtensionViewController.loadBookmark(_:readOnly:)(v7, v9, v4);
  outlined consume of Data._Representation(v7, v9);
}

- (void)receiveMulticastData:(id)a3
{
}

- (void)receiveLiveStreamData:(id)a3
{
}

- (void)setupWithData:(id)a3 transparentBackground:(BOOL)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v7 - 8);
  unint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = a3;
  uint64_t v11 = self;
  uint64_t v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v14 = v13;

  uint64_t v15 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v9, 1, 1, v15);
  type metadata accessor for MainActor();
  id v16 = v11;
  outlined copy of Data._Representation(v12, v14);
  uint64_t v17 = static MainActor.shared.getter();
  uint64_t v18 = swift_allocObject();
  uint64_t v19 = MEMORY[0x263F8F500];
  *(void *)(v18 + 16) = v17;
  *(void *)(v18 + 24) = v19;
  *(void *)(v18 + 32) = v16;
  *(unsigned char *)(v18 + 40) = a4;
  *(void *)(v18 + 48) = v12;
  *(void *)(v18 + 56) = v14;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v9, (uint64_t)&async function pointer to partial apply for closure #1 in ExtensionViewController.setupWithData(_:transparentBackground:), v18);
  swift_release();
  outlined consume of Data._Representation(v12, v14);
}

- (void)setTool:(id)a3
{
  id v5 = a3;
  BOOL v4 = self;
  ExtensionViewController.setTool(_:)((NSDictionary)v5);
}

- (void)setLinedPaperWithHorizontalLineSpacing:(double)a3 verticalLineSpacing:(double)a4 horizontalInset:(double)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  uint64_t v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  type metadata accessor for MainActor();
  unint64_t v14 = self;
  swift_retain();
  uint64_t v15 = static MainActor.shared.getter();
  uint64_t v16 = swift_allocObject();
  uint64_t v17 = MEMORY[0x263F8F500];
  *(void *)(v16 + 16) = v15;
  *(void *)(v16 + 24) = v17;
  *(void *)(v16 + 32) = v13;
  *(double *)(v16 + 40) = a3;
  *(double *)(v16 + 48) = a4;
  *(double *)(v16 + 56) = a5;
  swift_release();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v11, (uint64_t)&async function pointer to partial apply for closure #1 in ExtensionViewController.setLinedPaper(horizontalLineSpacing:verticalLineSpacing:horizontalInset:), v16);
  swift_release();
}

- (void)setHasLiveStreamMessenger:(BOOL)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  type metadata accessor for MainActor();
  uint64_t v9 = self;
  uint64_t v10 = static MainActor.shared.getter();
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = MEMORY[0x263F8F500];
  *(void *)(v11 + 16) = v10;
  *(void *)(v11 + 24) = v12;
  *(unsigned char *)(v11 + 32) = a3;
  *(void *)(v11 + 40) = v9;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v7, (uint64_t)&async function pointer to partial apply for closure #1 in ExtensionViewController.setHasLiveStreamMessenger(_:), v11);
  swift_release();
}

- (void)setCanvasContentMode:(int64_t)a3
{
}

- (void)setUserInterfaceStyleWithUserInterfaceStyle:(int64_t)a3
{
}

- (void)setPaperDocumentInlineThumbnailsVisible:(BOOL)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  type metadata accessor for MainActor();
  uint64_t v10 = self;
  swift_retain();
  uint64_t v11 = static MainActor.shared.getter();
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = MEMORY[0x263F8F500];
  *(void *)(v12 + 16) = v11;
  *(void *)(v12 + 24) = v13;
  *(void *)(v12 + 32) = v9;
  *(unsigned char *)(v12 + 40) = a3;
  swift_release();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCytSg_Tgm5((uint64_t)v7, (uint64_t)&async function pointer to partial apply for closure #1 in ExtensionViewController.setPaperDocumentInlineThumbnailsVisible(_:), v12);
  swift_release();
}

- (void)reportSafeAreaInsetsWithTop:(double)a3 left:(double)a4 bottom:(double)a5 right:(double)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  uint64_t v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  type metadata accessor for MainActor();
  uint64_t v16 = self;
  swift_retain();
  uint64_t v17 = static MainActor.shared.getter();
  uint64_t v18 = swift_allocObject();
  uint64_t v19 = MEMORY[0x263F8F500];
  *(void *)(v18 + 16) = v17;
  *(void *)(v18 + 24) = v19;
  *(double *)(v18 + 32) = a3;
  *(double *)(v18 + 40) = a4;
  *(double *)(v18 + 48) = a5;
  *(double *)(v18 + 56) = a6;
  *(void *)(v18 + 64) = v15;
  swift_release();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v13, (uint64_t)&async function pointer to partial apply for closure #1 in ExtensionViewController.reportSafeAreaInsets(top:left:bottom:right:), v18);
  swift_release();
}

- (void)revertAllChanges
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  type metadata accessor for MainActor();
  uint64_t v8 = self;
  swift_retain();
  uint64_t v9 = static MainActor.shared.getter();
  uint64_t v10 = (void *)swift_allocObject();
  uint64_t v11 = MEMORY[0x263F8F500];
  v10[2] = v9;
  v10[3] = v11;
  v10[4] = v7;
  swift_release();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v5, (uint64_t)&closure #1 in ExtensionViewController.revertAllChanges()partial apply, (uint64_t)v10);
  swift_release();
}

- (void)setMathDocument:(id)a3
{
  id v4 = a3;
  uint64_t v8 = self;
  uint64_t v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;

  ExtensionViewController.setMathDocument(_:)();
  outlined consume of Data._Representation(v5, v7);
}

- (void)setMathResult:(id)a3 expressionUUID:(id)a4
{
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = self;
  ExtensionViewController.setMathResult(_:expressionUUID:)(v9, v11, (uint64_t)v8);
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)setMathEnabled:(BOOL)a3
{
  id v4 = self;
  ExtensionViewController.setMathEnabled(_:)(a3);
}

- (void)searchFor:(id)a3 ignoreCase:(BOOL)a4 wholeWords:(BOOL)a5 reply:(id)a6
{
  uint64_t v9 = _Block_copy(a6);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  _Block_copy(v9);
  uint64_t v13 = self;
  specialized ExtensionViewController.search(for:ignoreCase:wholeWords:reply:)(v10, v12, a4, a5, (char *)v13, (void (**)(void, void))v9);
  _Block_release(v9);
  _Block_release(v9);
  swift_bridgeObjectRelease();
}

- (void)endSearch
{
  v2 = self;
  ExtensionViewController.endSearch()();
}

- (void)searchFrameFor:(int64_t)a3 reply:(id)a4
{
}

- (void)searchScrollToVisible:(int64_t)a3
{
  id v4 = self;
  ExtensionViewController.searchScrollToVisible(_:)(a3);
}

- (void)searchDrawImageFor:(int64_t)a3 reply:(id)a4
{
}

- (void)handleLink:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = self;
  ExtensionViewController.handleLink(_:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC8PaperKit23ExtensionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC8PaperKit23ExtensionViewController *)ExtensionViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC8PaperKit23ExtensionViewController)initWithCoder:(id)a3
{
  return (_TtC8PaperKit23ExtensionViewController *)ExtensionViewController.init(coder:)(a3);
}

@end