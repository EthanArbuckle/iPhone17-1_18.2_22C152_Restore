@interface CRLiOSMediaReplacer
- (BOOL)isShowingUI;
- (_TtC8Freeform19CRLiOSMediaReplacer)init;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentPickerWasCancelled:(id)a3;
- (void)generativePlaygroundHelper:(id)a3 didCreateImageAt:(id)a4;
- (void)generativePlaygroundHelperDidCancel:(id)a3;
- (void)hideMediaReplacerWithCompletionBlock:(id)a3;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
- (void)insertStickerFromItemProvider:(id)a3 completionHandler:(id)a4;
- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5;
- (void)prepareForPopoverPresentation:(id)a3;
- (void)presentGenerativePlayground:(id)a3;
- (void)presentGenerativePlaygroundForCurrentSelection:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)showMediaReplacerForMediaReplacingRep:(id)a3;
@end

@implementation CRLiOSMediaReplacer

- (_TtC8Freeform19CRLiOSMediaReplacer)init
{
  result = (_TtC8Freeform19CRLiOSMediaReplacer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform19CRLiOSMediaReplacer_interactiveCanvasController));

  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform19CRLiOSMediaReplacer_photoPickerLoadingProgress));
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform19CRLiOSMediaReplacer_gpHelper);
}

- (void)showMediaReplacerForMediaReplacingRep:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1009C43E4(v4);
}

- (void)hideMediaReplacerWithCompletionBlock:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = sub_1005E2108;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  sub_1009C5C84((uint64_t)v7, v6);
  sub_1005174AC((uint64_t)v7);
}

- (BOOL)isShowingUI
{
  v2 = self;
  BOOL v3 = sub_1009C5F68();

  return v3;
}

- (void)presentGenerativePlayground:(id)a3
{
}

- (void)presentGenerativePlaygroundForCurrentSelection:(id)a3
{
}

- (void)generativePlaygroundHelper:(id)a3 didCreateImageAt:(id)a4
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  v12 = self;
  sub_1009CB008((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)generativePlaygroundHelperDidCancel:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8Freeform19CRLiOSMediaReplacer_gpHelper;
  uint64_t v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform19CRLiOSMediaReplacer_gpHelper);
  if (v6)
  {
    uint64_t v7 = *(void **)(v6 + OBJC_IVAR____TtC8Freeform29CRLGenerativePlaygroundHelper_viewController);
    id v8 = a3;
    uint64_t v9 = self;
    [v7 dismissViewControllerAnimated:1 completion:0];
    id v12 = *(Class *)((char *)&self->super.isa + v5);
  }
  else
  {
    id v10 = a3;
    id v11 = self;
    id v12 = 0;
  }
  *(Class *)((char *)&self->super.isa + v5) = 0;
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  type metadata accessor for URL();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  id v8 = self;
  sub_1009C74C0(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)documentPickerWasCancelled:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1009C7D8C(v4);
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1009C8018(v4);
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  type metadata accessor for InfoKey(0);
  sub_1009CC0B4(&qword_101671720, 255, type metadata accessor for InfoKey);
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  id v8 = self;
  sub_1009C82BC(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)prepareForPopoverPresentation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1009C9A68(v4);
}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = self;
  sub_1009CB20C(&a4->origin.x, a5);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1009C9E00(v4);
}

- (void)insertStickerFromItemProvider:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  id v8 = self;
  sub_1009CB4A4(v7, v8, v6);
  _Block_release(v6);
  _Block_release(v6);
}

@end