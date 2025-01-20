@interface CanvasViewController
- (BOOL)accessibilityPerformEscape;
- (BOOL)canBecomeFirstResponder;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)textViewShouldBeginEditing:(id)a3;
- (_TtC7Journal20CanvasViewController)initWithCoder:(id)a3;
- (_TtC7Journal20CanvasViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)viewControllerForLargeContentViewerInteraction:(id)a3;
- (void)appWillEnterForeground;
- (void)bookmarkTapped;
- (void)dealloc;
- (void)doneTapped;
- (void)dynamicTypeTraitChanged;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
- (void)onEmptyRegionTapped:(id)a3;
- (void)overflowTapped:(id)a3;
- (void)picker:(id)a3 didFinishPicking:(id)a4;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
- (void)redoTapped:(id)a3;
- (void)restoreSuggestionSheetPostAppUnlock;
- (void)textView:(id)a3 didEndFormattingWithViewController:(id)a4;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidChangeSelection:(id)a3;
- (void)undoTapped:(id)a3;
- (void)videoStartedNotification:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CanvasViewController

- (void)restoreSuggestionSheetPostAppUnlock
{
  if ((*(unsigned char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal20CanvasViewController_coordinator))[OBJC_IVAR____TtC7Journal23CanvasLayoutCoordinator_focusedControl] == 2)
  {
    v2 = self;
    sub_100225D80();
  }
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  sub_10001B284(0, &qword_1008040A8);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = a3;
  v7 = self;
  sub_100416AB0(v6, v8);
  if (*(Class *)((char *)&v7->super.super.super.isa + OBJC_IVAR____TtC7Journal20CanvasViewController_canvasIdleTracker))
  {
    swift_retain();
    sub_10023ED44();

    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1002275FC(v4);
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  type metadata accessor for InfoKey(0);
  sub_10022A8D8();
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = a3;
  v7 = self;
  sub_1004179F0(v6, v8);
  if (*(Class *)((char *)&v7->super.super.super.isa + OBJC_IVAR____TtC7Journal20CanvasViewController_canvasIdleTracker))
  {
    swift_retain();
    sub_10023F034();

    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
}

- (_TtC7Journal20CanvasViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100453880();
}

- (void)dealloc
{
  v2 = self;
  sub_100441A6C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal20CanvasViewController_undoBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal20CanvasViewController_redoBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal20CanvasViewController_overflowBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal20CanvasViewController_doneBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal20CanvasViewController_bookmarkBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal20CanvasViewController_scrollContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal20CanvasViewController_slimAssetView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal20CanvasViewController_gridStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal20CanvasViewController_assetsGridView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal20CanvasViewController_bundleTitleView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal20CanvasViewController_titleDividerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal20CanvasViewController_gridTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal20CanvasViewController_gridHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal20CanvasViewController_bundleTitleTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal20CanvasViewController_bundleTitleHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal20CanvasViewController_bundleTitleBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal20CanvasViewController_slimAssetViewHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal20CanvasViewController_slimAssetViewTopConstraint));
  swift_bridgeObjectRelease();
  swift_release();
  sub_100454D04((uint64_t)self + OBJC_IVAR____TtC7Journal20CanvasViewController_startingState, (uint64_t (*)(void))type metadata accessor for CanvasStartingState);
  id v3 = (char *)self + OBJC_IVAR____TtC7Journal20CanvasViewController_titleDate;
  uint64_t v4 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  sub_10001457C((uint64_t)self + OBJC_IVAR____TtC7Journal20CanvasViewController_initialJournalState, &qword_10080CF60);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal20CanvasViewController_largeContentViewerHUDController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal20CanvasViewController_pickerToolbar));
  swift_release();
  swift_weakDestroy();
  swift_release();
  swift_release();
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7Journal20CanvasViewController_tipPopoverController);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100441E74();
}

- (void)dynamicTypeTraitChanged
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal20CanvasViewController_textView);
  uint64_t v4 = self;
  v5 = self;
  id v6 = [v4 currentTraitCollection];
  id v7 = [v3 attributedText];
  id v8 = (id)sub_100020C00(v6, v7, 0, 0.0);

  [v3 setAttributedText:v8];
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_100444068(a3);
}

- (void)viewIsAppearing:(BOOL)a3
{
  uint64_t v4 = self;
  sub_100444364(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_100444A20(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_100444FA8(a3);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal20CanvasViewController_coordinator);
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  v5 = self;

  if (Strong) {
    sub_100078D34(1, v3);
  }
  else {
    [(CanvasViewController *)v5 doneTapped];
  }

  return 1;
}

- (void)appWillEnterForeground
{
  v2 = self;
  sub_100446A1C();
}

- (void)videoStartedNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = self;
  sub_10044745C((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC7Journal20CanvasViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7Journal20CanvasViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)undoTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100453DDC((SEL *)&selRef_canUndo, "(undoTapped)", (SEL *)&selRef_undo, "(undoTapped) exiting early, undoManager: %s canUndo: %s");
}

- (void)redoTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100453DDC((SEL *)&selRef_canRedo, "(redoTapped)", (SEL *)&selRef_redo, "(redoTapped) exiting early, undoManager: %s canRedo: %s");
}

- (void)doneTapped
{
  uint64_t v3 = sub_100010218(&qword_1007FA1D0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  type metadata accessor for MainActor();
  id v7 = self;
  uint64_t v8 = static MainActor.shared.getter();
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = v8;
  v9[3] = &protocol witness table for MainActor;
  v9[4] = v7;
  sub_100328A60((uint64_t)v5, (uint64_t)&unk_10080CF48, (uint64_t)v9);

  swift_release();
}

- (void)onEmptyRegionTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10044F5A4(v4);
}

- (void)overflowTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  Class isa = sub_100449F38().super.super.isa;
  [v4 setMenu:isa];
}

- (void)bookmarkTapped
{
  uint64_t v3 = sub_100010218(&qword_1007FA1D0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  type metadata accessor for MainActor();
  uint64_t v8 = self;
  swift_retain();
  uint64_t v9 = static MainActor.shared.getter();
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = v9;
  v10[3] = &protocol witness table for MainActor;
  v10[4] = v7;
  swift_release();
  sub_100328A60((uint64_t)v5, (uint64_t)&unk_10080CF38, (uint64_t)v10);

  swift_release();
}

- (id)viewControllerForLargeContentViewerInteraction:(id)a3
{
  id result = *(Class *)((char *)&self->super.super.super.isa
                    + OBJC_IVAR____TtC7Journal20CanvasViewController_largeContentViewerHUDController);
  if (result) {
    return result;
  }
  __break(1u);
  return result;
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100075D90();

  return 1;
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100451E54();
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  location = (void *)a4.location;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;
  id v12 = a3;
  v13 = self;
  LOBYTE(length) = sub_100451F8C((uint64_t)v12, location, length, v9, v11);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void)textViewDidChangeSelection:(id)a3
{
  if (*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal20CanvasViewController_canvasIdleTracker))
  {
    id v4 = a3;
    uint64_t v5 = self;
    swift_retain();
    sub_10023ED44();

    swift_release();
  }
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100452328(v4);
}

- (void)textView:(id)a3 didEndFormattingWithViewController:(id)a4
{
  sub_10001B284(0, (unint64_t *)&unk_100800920);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal20CanvasViewController_textView);
  id v10 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  if (static NSObject.== infix(_:_:)()) {
    *(unsigned char *)(v7 + OBJC_IVAR____TtC7Journal14CanvasTextView_isShowingFormattingController) = 0;
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  char v9 = sub_1004542F8(v7);

  return v9 & 1;
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
}

@end