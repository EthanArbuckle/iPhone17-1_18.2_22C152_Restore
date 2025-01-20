@interface CanvasGenerationTool
- (BOOL)canBecomeFirstResponder;
- (NSUndoManager)undoManager;
- (UIView)magicGenerativeViewForHitTesting;
- (_TtC8PaperKit20CanvasGenerationTool)initWithCoder:(id)a3;
- (_TtC8PaperKit20CanvasGenerationTool)initWithFrame:(CGRect)a3;
- (void)authenticateWithCompletion:(id)a3;
- (void)didMoveToWindow;
- (void)generationTool:(id)a3;
- (void)gestureRecognizerBegan:(id)a3;
- (void)gestureRecognizerCanceledOrFailed:(id)a3;
- (void)gestureRecognizerChanged:(id)a3;
- (void)gestureRecognizerEnded:(id)a3;
- (void)handleToolPickerVisibilityDidChange:(id)a3;
- (void)keyboardWillHideNotification:(id)a3;
- (void)keyboardWillShowNotification:(id)a3;
- (void)magicPaperViewController:(id)a3 didGenerateImage:(id)a4;
- (void)magicPaperViewControllerDidCancel:(id)a3;
- (void)updateBlobAnimation;
@end

@implementation CanvasGenerationTool

- (void)magicPaperViewController:(id)a3 didGenerateImage:(id)a4
{
  v6 = (PPKGPInProcessMagicPaperViewController *)a3;
  id v7 = a4;
  v8 = self;
  CanvasGenerationTool.magicPaperViewController(_:didGenerate:)(v6, (UIImage)v7);
}

- (void)magicPaperViewControllerDidCancel:(id)a3
{
  id v4 = a3;
  v5 = self;
  specialized CanvasGenerationTool.magicPaperViewControllerDidCancel(_:)();
}

- (void)generationTool:(id)a3
{
  id v4 = (UIGestureRecognizer *)a3;
  v5 = self;
  CanvasGenerationTool.generationTool(_:)(v4);
}

- (void)gestureRecognizerBegan:(id)a3
{
  id v4 = a3;
  v5 = self;
  CanvasGenerationTool.gestureRecognizerBegan(_:)(v4);
}

- (void)gestureRecognizerChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  CanvasGenerationTool.gestureRecognizerChanged(_:)(v4);
}

- (void)gestureRecognizerEnded:(id)a3
{
  id v4 = a3;
  v5 = self;
  CanvasGenerationTool.gestureRecognizerEnded(_:)(v4);
}

- (void)gestureRecognizerCanceledOrFailed:(id)a3
{
  id v4 = a3;
  v5 = self;
  CanvasGenerationTool.gestureRecognizerCanceledOrFailed(_:)(v4);
}

- (void)keyboardWillShowNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  CanvasGenerationTool.keyboardWillShowNotification(_:)((NSNotification)v4);
}

- (void)keyboardWillHideNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  CanvasGenerationTool.keyboardWillHideNotification(_:)((NSNotification)v4);
}

- (UIView)magicGenerativeViewForHitTesting
{
  return (UIView *)@objc CanvasGenerationTool.magicGenerativeViewForHitTesting.getter((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_viewIfLoaded);
}

- (_TtC8PaperKit20CanvasGenerationTool)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized CanvasGenerationTool.init(coder:)();
}

- (NSUndoManager)undoManager
{
  return (NSUndoManager *)@objc CanvasGenerationTool.magicGenerativeViewForHitTesting.getter((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_undoManager);
}

- (void)didMoveToWindow
{
  v2 = self;
  CanvasGenerationTool.didMoveToWindow()();
}

- (void)updateBlobAnimation
{
  v2 = self;
  CanvasGenerationTool.updateBlobAnimation()();
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)handleToolPickerVisibilityDidChange:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  CanvasGenerationTool.handleToolPickerVisibilityDidChange(_:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC8PaperKit20CanvasGenerationTool)initWithFrame:(CGRect)a3
{
  result = (_TtC8PaperKit20CanvasGenerationTool *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20CanvasGenerationTool_eatTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20CanvasGenerationTool_eatPanGestureRecognizer));

  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20CanvasGenerationTool_magicGenerativeBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20CanvasGenerationTool_containerScrollView));
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit20CanvasGenerationTool_canvasGenerationToolDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20CanvasGenerationTool_magicGenerativeVC));
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)self + OBJC_IVAR____TtC8PaperKit20CanvasGenerationTool_continuation, &demangling cache variable for type metadata for CheckedContinuation<ImageWithEncodedRecipe, Error>?);
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8PaperKit20CanvasGenerationTool_backgroundViewTopAnchorConstraint);
}

- (void)authenticateWithCompletion:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v5 - 8);
  id v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &async function pointer to partial apply for @objc closure #1 in CanvasGenerationTool.authenticate();
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &_sIeghH_IeAgH_TRTATu;
  v12[5] = v11;
  v13 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v7, (uint64_t)&_sIeAgH_ytIeAgHr_TRTATu, (uint64_t)v12);
  swift_release();
}

@end