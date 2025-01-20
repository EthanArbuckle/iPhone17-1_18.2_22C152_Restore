@interface LinkEditorViewController
- (BOOL)languageHasSpaces;
- (ICLinkAcceleratorController)linkAcceleratorController;
- (ICLinkEditorDelegate)delegate;
- (ICNAEventReporter)eventReporter;
- (ICNote)note;
- (LinkEditorViewController)initWithCoder:(id)a3;
- (LinkEditorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (NSArray)keyCommands;
- (NSString)currentQueryString;
- (NSString)searchString;
- (UIView)acceleratorHostingView;
- (UIView)urlTextFieldView;
- (_NSRange)lastSelectedRangeForAccelerator;
- (int64_t)addApproach;
- (int64_t)writingDirection;
- (void)acceleratorOriginNeedsUpdate;
- (void)cancelAction:(id)a3;
- (void)didSelectNoteSuggestionWithIdentifier:(id)a3 title:(id)a4;
- (void)doneAction;
- (void)handleArrowDown:(id)a3;
- (void)handleArrowUp:(id)a3;
- (void)handleEscape:(id)a3;
- (void)handleKeyboardDidHide;
- (void)handleKeyboardWillShow;
- (void)handleReturnKey:(id)a3;
- (void)hideAccelerator;
- (void)horizontalSizeClassDidChange;
- (void)insertAndDismissWithCompletion:(id)a3;
- (void)presentAcceleratorIfNecessary;
- (void)removeLink;
- (void)selectedSuggestionWithSelection:(id)a3;
- (void)selectedURLWithSelection:(id)a3;
- (void)setAddApproach:(int64_t)a3;
- (void)setCurrentQueryString:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLinkAcceleratorController:(id)a3;
- (void)setupObservers;
- (void)validateSelection;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation LinkEditorViewController

- (UIView)urlTextFieldView
{
  v2 = self;
  v3 = (void *)sub_20C0021B8();

  return (UIView *)v3;
}

- (ICLinkEditorDelegate)delegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return (ICLinkEditorDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  v4 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___LinkEditorViewController_delegate);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (int64_t)addApproach
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___LinkEditorViewController_addApproach);
  swift_beginAccess();
  return *v2;
}

- (void)setAddApproach:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___LinkEditorViewController_addApproach);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (ICLinkAcceleratorController)linkAcceleratorController
{
  return (ICLinkAcceleratorController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                + OBJC_IVAR___LinkEditorViewController_linkAcceleratorController));
}

- (void)setLinkAcceleratorController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___LinkEditorViewController_linkAcceleratorController);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___LinkEditorViewController_linkAcceleratorController) = (Class)a3;
  id v3 = a3;
}

- (NSString)currentQueryString
{
  if (*(void *)((char *)&self->super.super._responderFlags + OBJC_IVAR___LinkEditorViewController_currentQueryString))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_20C162A80();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setCurrentQueryString:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_20C162AC0();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___LinkEditorViewController_currentQueryString);
  uint64_t *v6 = v4;
  v6[1] = v5;

  swift_bridgeObjectRelease();
}

- (LinkEditorViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20C00B28C();
}

- (void)setupObservers
{
  v2 = self;
  sub_20C002B74();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_20C00538C();
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v3 = self;
  sub_20C00B94C();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_20C005924();
}

- (void)handleKeyboardDidHide
{
  v2 = self;
  sub_20C005BAC();
}

- (void)handleKeyboardWillShow
{
  v2 = self;
  sub_20C005DF0();
}

- (void)handleArrowDown:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_20C00B9C8();
}

- (void)handleArrowUp:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_20C00BB38();
}

- (void)handleReturnKey:(id)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___LinkEditorViewController_linkAcceleratorController);
  if (v3)
  {
    v6 = *(void **)(v3 + OBJC_IVAR___ICLinkAcceleratorController_viewController);
    type metadata accessor for iOSLinkAcceleratorViewController();
    if (swift_dynamicCastClass())
    {
      id v7 = a3;
      v8 = self;
      id v9 = v6;
      sub_20BFF8B90();
    }
  }
}

- (void)handleEscape:(id)a3
{
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___LinkEditorViewController_linkAcceleratorController);
  if (v3)
  {
    id v5 = a3;
    v6 = self;
    id v7 = v3;
    LinkAcceleratorController.hideAccelerator()();
  }
}

- (void)hideAccelerator
{
  v2 = self;
  sub_20C006498();
}

- (void)presentAcceleratorIfNecessary
{
  v2 = self;
  sub_20C006570();
}

- (NSArray)keyCommands
{
  if (sub_20C00BD60())
  {
    sub_20BFCEE58(0, &qword_2676BC7F0);
    v2 = (void *)sub_20C162CE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSArray *)v2;
}

- (void)insertAndDismissWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    id v4 = sub_20BFD9168;
    v9[4] = sub_20BFD9168;
    v9[5] = v5;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 1107296256;
    v9[2] = sub_20BF982EC;
    v9[3] = &block_descriptor_116;
    v6 = _Block_copy(v9);
    id v7 = self;
    swift_retain();
    swift_release();
  }
  else
  {
    v8 = self;
    v6 = 0;
  }
  [(LinkEditorViewController *)self dismissViewControllerAnimated:1 completion:v6];
  _Block_release(v6);
  sub_20BFCDA14((uint64_t)v4);
}

- (void)doneAction
{
  v2 = self;
  sub_20C007484();
}

- (void)removeLink
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = self;
  v6[4] = sub_20C00D74C;
  v6[5] = v3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 1107296256;
  v6[2] = sub_20BF982EC;
  v6[3] = &block_descriptor_110;
  id v4 = _Block_copy(v6);
  uint64_t v5 = self;
  swift_retain();
  swift_release();
  [(LinkEditorViewController *)v5 dismissViewControllerAnimated:1 completion:v4];
  _Block_release(v4);
  swift_release();
}

- (void)cancelAction:(id)a3
{
  uint64_t v3 = self;
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_20C1638F0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    uint64_t v5 = self;
  }
  v6 = *(char **)((char *)&v3->super.super.super.isa + OBJC_IVAR___LinkEditorViewController_linkAcceleratorController);
  if (v6 && (id v7 = &v6[OBJC_IVAR___ICLinkAcceleratorController_isShowing], swift_beginAccess(), *v7 == 1))
  {
    v8 = v6;
    LinkAcceleratorController.hideAccelerator()();

    uint64_t v3 = v8;
  }
  else
  {
    [(LinkEditorViewController *)v3 dismissViewControllerAnimated:1 completion:0];
  }

  sub_20BFCEDFC((uint64_t)v9, &qword_26AD81380);
}

- (void)selectedSuggestionWithSelection:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_20C008568(a3);
}

- (void)selectedURLWithSelection:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD808A0);
  MEMORY[0x270FA5388](v5 - 8);
  id v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_20C15F580();
    uint64_t v8 = sub_20C15F5D0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_20C15F5D0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  sub_20C0086D8((uint64_t)v7);

  sub_20BFCEDFC((uint64_t)v7, &qword_26AD808A0);
}

- (void)validateSelection
{
  v2 = self;
  id v3 = sub_20C008A60();
  swift_beginAccess();
  swift_retain();
  char v4 = sub_20C1606F0();
  swift_release();
  objc_msgSend(v3, sel_setEnabled_, v4 & 1);
}

- (void)horizontalSizeClassDidChange
{
  v2 = self;
  sub_20C008AFC();
}

- (LinkEditorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (LinkEditorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_20BFCEDFC((uint64_t)self + OBJC_IVAR___LinkEditorViewController_linkEditorView, &qword_2676BC6D8);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  sub_20C00D78C((uint64_t)self + OBJC_IVAR___LinkEditorViewController_textSelection, type metadata accessor for TextSelection);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___LinkEditorViewController_linkAcceleratorController));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___LinkEditorViewController____lazy_storage___cancelBarButtonItem));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___LinkEditorViewController____lazy_storage___doneBarButtonItem);
}

- (_NSRange)lastSelectedRangeForAccelerator
{
  swift_beginAccess();
  id v3 = self;
  swift_retain();
  sub_20C160740();
  swift_release();
  uint64_t v4 = sub_20C162B70();

  swift_bridgeObjectRelease();
  NSUInteger v5 = 0;
  NSUInteger v6 = v4;
  result.length = v6;
  result.location = v5;
  return result;
}

- (void)acceleratorOriginNeedsUpdate
{
  v2 = self;
  LinkEditorViewController.acceleratorOriginNeedsUpdate()();
}

- (BOOL)languageHasSpaces
{
  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___LinkEditorViewController_delegate);
  swift_beginAccess();
  if (*v2) {
    return objc_msgSend(*v2, sel_languageHasSpaces);
  }
  else {
    return 1;
  }
}

- (int64_t)writingDirection
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___LinkEditorViewController_delegate);
  swift_beginAccess();
  int64_t result = *v2;
  if (*v2) {
    return (int64_t)objc_msgSend((id)result, sel_writingDirection);
  }
  return result;
}

- (ICNote)note
{
  return (ICNote *)0;
}

- (UIView)acceleratorHostingView
{
  v2 = self;
  id v3 = (void *)LinkEditorViewController.acceleratorHostingView.getter();

  return (UIView *)v3;
}

- (ICNAEventReporter)eventReporter
{
  return (ICNAEventReporter *)0;
}

- (NSString)searchString
{
  swift_beginAccess();
  id v3 = self;
  swift_retain();
  uint64_t v4 = sub_20C160740();
  uint64_t v6 = v5;
  swift_release();
  sub_20C002A9C(v4, v6);

  swift_bridgeObjectRelease();
  id v7 = (void *)sub_20C162A80();
  swift_bridgeObjectRelease();

  return (NSString *)v7;
}

- (void)didSelectNoteSuggestionWithIdentifier:(id)a3 title:(id)a4
{
  uint64_t v5 = sub_20C162AC0();
  id v7 = v6;
  uint64_t v8 = sub_20C162AC0();
  v10 = v9;
  uint64_t v11 = self;
  v12._countAndFlagsBits = v5;
  v12._object = v7;
  v13._countAndFlagsBits = v8;
  v13._object = v10;
  LinkEditorViewController.didSelectNoteSuggestion(withIdentifier:title:)(v12, v13);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end