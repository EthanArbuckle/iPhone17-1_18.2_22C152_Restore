@interface ICSystemPaperViewController
+ (id)newSystemPaperViewController;
+ (id)newSystemPaperViewControllerWithIncomingLink:(id)a3 incomingImageData:(id)a4;
- (BOOL)canSwipeInDirection:(int64_t)a3;
- (BOOL)shouldShowModernAccountAlert;
- (ICNote)currentNote;
- (ICNoteEditorViewController)currentNoteEditorViewController;
- (ICSystemPaperViewController)initWithCoder:(id)a3;
- (ICSystemPaperViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (ICViewControllerManager)viewControllerManager;
- (UIButton)backToNotesButton;
- (UIButton)doneButton;
- (UIButton)moreButton;
- (UIButton)newNoteButton;
- (UIButton)paletteButton;
- (UIImageView)launchImageView;
- (UIPageControl)pageControl;
- (UIView)pageContainerView;
- (id)inkPaletteButtonViewWithInkPaletteController:(id)a3;
- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4;
- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4;
- (void)backToNotesWithKeyboard;
- (void)deleteCurrentNote;
- (void)didTapAddNoteButton:(id)a3 event:(id)a4;
- (void)didTapBackToNotes:(id)a3;
- (void)didTapDoneButton:(id)a3;
- (void)didTapPaletteButton:(id)a3;
- (void)didTapScreenshotButton:(id)a3;
- (void)indexer:(id)a3 didChangeContentWithDifference:(id)a4 controller:(id)a5;
- (void)openNotesSettings:(id)a3;
- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6;
- (void)pageViewController:(id)a3 willTransitionToViewControllers:(id)a4;
- (void)prepareForSegue:(id)a3 sender:(id)a4;
- (void)setBackToNotesButton:(id)a3;
- (void)setCurrentNote:(id)a3;
- (void)setCurrentNote:(id)a3 animated:(BOOL)a4 direction:(int64_t)a5 setEditing:(BOOL)a6 showInkPicker:(BOOL)a7;
- (void)setCurrentNoteEditorViewController:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)setLaunchImageView:(id)a3;
- (void)setMoreButton:(id)a3;
- (void)setNewNoteButton:(id)a3;
- (void)setPageContainerView:(id)a3;
- (void)setPageControl:(id)a3;
- (void)setPaletteButton:(id)a3;
- (void)setShouldShowModernAccountAlert:(BOOL)a3;
- (void)setViewControllerManager:(id)a3;
- (void)synthesizeSwipeForDirection:(int64_t)a3;
- (void)toolPickerVisibilityDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ICSystemPaperViewController

- (ICSystemPaperViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (ICSystemPaperViewController *)sub_1003A7788(v5, v7, a4);
}

- (ICSystemPaperViewController)initWithCoder:(id)a3
{
  return (ICSystemPaperViewController *)sub_1003A7DE0(a3);
}

+ (id)newSystemPaperViewController
{
  return (id)sub_1003B8194(0, (uint64_t)_swiftEmptyArrayStorage);
}

+ (id)newSystemPaperViewControllerWithIncomingLink:(id)a3 incomingImageData:(id)a4
{
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a3;
  uint64_t v7 = (void *)sub_1003B8194(a3, v5);

  swift_bridgeObjectRelease();
  return v7;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1003A9208();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1003AAC98(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1003AADEC(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1003AB6F0(a3);
}

- (void)deleteCurrentNote
{
  v2 = self;
  sub_1003ACA0C();
}

- (BOOL)shouldShowModernAccountAlert
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_shouldShowModernAccountAlert);
}

- (void)setShouldShowModernAccountAlert:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_shouldShowModernAccountAlert) = a3;
}

- (ICNote)currentNote
{
  id v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___ICSystemPaperViewController_currentNoteEditorViewController);
  if (v2) {
    id v2 = [v2 note];
  }

  return (ICNote *)v2;
}

- (void)setCurrentNote:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  sub_1003ADBE8(a3, 0, 0, 0, 0);
}

- (void)setCurrentNote:(id)a3 animated:(BOOL)a4 direction:(int64_t)a5 setEditing:(BOOL)a6 showInkPicker:(BOOL)a7
{
  BOOL v8 = a6;
  BOOL v10 = a4;
  id v13 = a3;
  v14 = self;
  sub_1003ADBE8(a3, v10, a5, v8, a7);
}

- (ICNoteEditorViewController)currentNoteEditorViewController
{
  return (ICNoteEditorViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                               + OBJC_IVAR___ICSystemPaperViewController_currentNoteEditorViewController));
}

- (void)setCurrentNoteEditorViewController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___ICSystemPaperViewController_currentNoteEditorViewController);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___ICSystemPaperViewController_currentNoteEditorViewController) = (Class)a3;
  id v3 = a3;
}

- (ICViewControllerManager)viewControllerManager
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (ICViewControllerManager *)Strong;
}

- (void)setViewControllerManager:(id)a3
{
}

- (UIImageView)launchImageView
{
  return (UIImageView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                + OBJC_IVAR___ICSystemPaperViewController_launchImageView));
}

- (void)setLaunchImageView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_launchImageView);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_launchImageView) = (Class)a3;
  id v3 = a3;
}

- (UIButton)doneButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR___ICSystemPaperViewController_doneButton));
}

- (void)setDoneButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_doneButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_doneButton) = (Class)a3;
  id v3 = a3;
}

- (UIButton)newNoteButton
{
  return (UIButton *)objc_retain(*(id *)((char *)&self->super.super.super.isa
                                       + OBJC_IVAR___ICSystemPaperViewController_newNoteButton));
}

- (void)setNewNoteButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_newNoteButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_newNoteButton) = (Class)a3;
  id v3 = a3;
}

- (UIButton)moreButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR___ICSystemPaperViewController_moreButton));
}

- (void)setMoreButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_moreButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_moreButton) = (Class)a3;
  id v3 = a3;
}

- (UIButton)backToNotesButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR___ICSystemPaperViewController_backToNotesButton));
}

- (void)setBackToNotesButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_backToNotesButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_backToNotesButton) = (Class)a3;
  id v3 = a3;
}

- (UIView)pageContainerView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR___ICSystemPaperViewController_pageContainerView));
}

- (void)setPageContainerView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_pageContainerView);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_pageContainerView) = (Class)a3;
  id v3 = a3;
}

- (UIPageControl)pageControl
{
  return (UIPageControl *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                  + OBJC_IVAR___ICSystemPaperViewController_pageControl));
}

- (void)setPageControl:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_pageControl);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_pageControl) = (Class)a3;
  id v3 = a3;
}

- (UIButton)paletteButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR___ICSystemPaperViewController_paletteButton));
}

- (void)setPaletteButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_paletteButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICSystemPaperViewController_paletteButton) = (Class)a3;
  id v3 = a3;
}

- (void)didTapScreenshotButton:(id)a3
{
}

- (void)didTapDoneButton:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1003B844C();
}

- (void)didTapPaletteButton:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1003B85C8();
}

- (void)backToNotesWithKeyboard
{
  uint64_t v2 = qword_10069AF68;
  uint64_t v7 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_10003293C(v3, (uint64_t)qword_1006A4F80);
  id v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Going back to notes with keyboard", v6, 2u);
    swift_slowDealloc();
  }

  sub_1003B4814();
}

- (void)didTapBackToNotes:(id)a3
{
  uint64_t v4 = qword_10069AF68;
  id v5 = a3;
  BOOL v10 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_10003293C(v6, (uint64_t)qword_1006A4F80);
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Tapped back to notes button", v9, 2u);
    swift_slowDealloc();
  }

  sub_1003B4814();
}

- (void)didTapAddNoteButton:(id)a3 event:(id)a4
{
  uint64_t v6 = qword_10069AF68;
  id v7 = a3;
  id v8 = a4;
  id v13 = self;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  sub_10003293C(v9, (uint64_t)qword_1006A4F80);
  BOOL v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Tapped add note button", v12, 2u);
    swift_slowDealloc();
  }

  sub_1003AD88C(v8);
}

- (void)openNotesSettings:(id)a3
{
}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    id v7 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v8 = a3;
    uint64_t v9 = self;
  }
  sub_1003B5B08(a3);

  sub_10002B754((uint64_t)v10, &qword_10069B4D0);
}

- (void)toolPickerVisibilityDidChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1003ABF6C();
  sub_1003AA5EC();
}

- (id)inkPaletteButtonViewWithInkPaletteController:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR___ICSystemPaperViewController_paletteButton));
}

- (BOOL)canSwipeInDirection:(int64_t)a3
{
  id v4 = self;
  LOBYTE(a3) = sub_1003B5E5C(a3);

  return a3 & 1;
}

- (void)synthesizeSwipeForDirection:(int64_t)a3
{
  id v4 = self;
  sub_1003B61B0(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSystemPaperViewController_pageControlFadeOutTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSystemPaperViewController_editorViewControllerUpdateDispatchQueue));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSystemPaperViewController_editorViewControllerUpdateSemaphore));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_10002B754((uint64_t)self + OBJC_IVAR___ICSystemPaperViewController_launchPreview, (uint64_t *)&unk_1006A52A0);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSystemPaperViewController____lazy_storage___indexer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSystemPaperViewController_currentNoteEditorViewController));
  swift_unknownObjectWeakDestroy();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSystemPaperViewController_toolPickerBackgroundView));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___ICSystemPaperViewController_toolPickerBackgroundViewBottomConstraint);
}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = sub_1003B8748(v7);

  return v9;
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = sub_1003B897C(v7);

  return v9;
}

- (void)pageViewController:(id)a3 willTransitionToViewControllers:(id)a4
{
  sub_100031418(0, &qword_1006A0070);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  id v8 = self;
  sub_1003B8BB0(v6);

  swift_bridgeObjectRelease();
}

- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6
{
  BOOL v7 = a4;
  sub_100031418(0, &qword_1006A0070);
  unint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  v12 = self;
  sub_1003B8EEC(v7, v10, a6);

  swift_bridgeObjectRelease();
}

- (void)indexer:(id)a3 didChangeContentWithDifference:(id)a4 controller:(id)a5
{
  uint64_t v8 = sub_10002F214((uint64_t *)&unk_1006A5230);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static CollectionDifference._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a5;
  v14 = self;
  sub_1003B9410();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

@end