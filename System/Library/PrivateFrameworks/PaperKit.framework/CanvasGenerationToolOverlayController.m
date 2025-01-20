@interface CanvasGenerationToolOverlayController
- (_TtC8PaperKit37CanvasGenerationToolOverlayController)init;
- (void)imageGenerationControllerShouldShowImageGenerationUIDidChange:(id)a3;
@end

@implementation CanvasGenerationToolOverlayController

- (void)imageGenerationControllerShouldShowImageGenerationUIDidChange:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  type metadata accessor for MainActor();
  v9 = self;
  id v10 = a3;
  uint64_t v11 = static MainActor.shared.getter();
  v12 = (void *)swift_allocObject();
  uint64_t v13 = MEMORY[0x263F8F500];
  v12[2] = v11;
  v12[3] = v13;
  v12[4] = v9;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v7, (uint64_t)&async function pointer to partial apply for closure #1 in CanvasGenerationToolOverlayController.imageGenerationControllerShouldShowImageGenerationUIDidChange(_:), (uint64_t)v12);

  swift_release();
}

- (_TtC8PaperKit37CanvasGenerationToolOverlayController)init
{
  result = (_TtC8PaperKit37CanvasGenerationToolOverlayController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8PaperKit37CanvasGenerationToolOverlayController_canvasGenerationToolController));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8PaperKit37CanvasGenerationToolOverlayController____lazy_storage___imageGenerationController);
}

@end