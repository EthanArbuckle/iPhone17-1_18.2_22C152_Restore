@interface QuickLookalikePaperViewController
- (NSUndoManager)undoManager;
- (_TtC11NotesEditor33QuickLookalikePaperViewController)initWithCoder:(id)a3;
- (_TtC11NotesEditor33QuickLookalikePaperViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC11NotesEditor33QuickLookalikePaperViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC11NotesEditor33QuickLookalikePaperViewController)initWithRootViewController:(id)a3;
- (void)done:(id)a3;
- (void)fillForm:(id)a3;
- (void)find:(id)a3;
- (void)findAndReplace:(id)a3;
- (void)findNext:(id)a3;
- (void)findPrevious:(id)a3;
- (void)findSessionDidBegin:(id)a3;
- (void)findSessionDidEnd:(id)a3;
- (void)markup:(id)a3;
- (void)print:(id)a3;
- (void)redo:(id)a3;
- (void)saveToFiles;
- (void)share:(id)a3;
- (void)toolPickerVisibilityDidChange:(id)a3;
- (void)undo:(id)a3;
- (void)updateBarButtonItems;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation QuickLookalikePaperViewController

- (NSUndoManager)undoManager
{
  return (NSUndoManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                  + OBJC_IVAR____TtC11NotesEditor33QuickLookalikePaperViewController__undoManager));
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (objc_class *)type metadata accessor for QuickLookalikePaperViewController();
  v8.receiver = self;
  v8.super_class = v5;
  v6 = self;
  [(QuickLookalikePaperViewController *)&v8 viewDidAppear:v3];
  if (*((unsigned char *)&v6->super.super.super.super.isa
       + OBJC_IVAR____TtC11NotesEditor33QuickLookalikePaperViewController_wantsToJumpIntoAutoFill) == 1)
  {
    v7[3] = v5;
    v7[0] = v6;
    v6 = v6;
    sub_20C08A6B0();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v7);
  }
}

- (void)undo:(id)a3
{
}

- (void)redo:(id)a3
{
}

- (_TtC11NotesEditor33QuickLookalikePaperViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20C08E6D0();
}

- (void)toolPickerVisibilityDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20C08BC58();
}

- (void)done:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_20C1638F0();
  swift_unknownObjectRelease();
  v5 = (uint64_t *)((char *)v4 + OBJC_IVAR____TtC11NotesEditor33QuickLookalikePaperViewController_dismissAction);
  v6 = *(void (**)(_TtC11NotesEditor33QuickLookalikePaperViewController *))((char *)&v4->super.super.super.super.isa
                                                                                     + OBJC_IVAR____TtC11NotesEditor33QuickLookalikePaperViewController_dismissAction);
  if (v6)
  {
    swift_retain();
    v6(v4);
    sub_20BFCDA14((uint64_t)v6);
    uint64_t v7 = *v5;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t *v5 = 0;
  v5[1] = 0;
  sub_20BFCDA14(v7);

  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v8);
}

- (void)fillForm:(id)a3
{
}

- (void)markup:(id)a3
{
}

- (void)share:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_20C1638F0();
  swift_unknownObjectRelease();
  id v5 = sub_20C08A2A8();
  id v6 = objc_msgSend(v5, sel_popoverPresentationController);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = objc_retain(*(id *)((char *)&v4->super.super.super.super.isa
                           + OBJC_IVAR____TtC11NotesEditor33QuickLookalikePaperViewController_shareButton));
    objc_msgSend(v7, sel_setBarButtonItem_, v8);
  }
  [(QuickLookalikePaperViewController *)v4 presentViewController:v5 animated:1 completion:0];

  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v9);
}

- (void)print:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_20C1638F0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v5 = self;
  }
  sub_20C08AC24();

  sub_20BFCEDFC((uint64_t)v6, &qword_26AD81380);
}

- (void)saveToFiles
{
  v2 = self;
  sub_20C08B064();
}

- (void)find:(id)a3
{
}

- (void)findNext:(id)a3
{
}

- (void)findPrevious:(id)a3
{
}

- (void)findAndReplace:(id)a3
{
}

- (void)findSessionDidBegin:(id)a3
{
}

- (void)findSessionDidEnd:(id)a3
{
}

- (void)updateBarButtonItems
{
  v2 = self;
  sub_20C08BC58();
}

- (_TtC11NotesEditor33QuickLookalikePaperViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (_TtC11NotesEditor33QuickLookalikePaperViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC11NotesEditor33QuickLookalikePaperViewController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (_TtC11NotesEditor33QuickLookalikePaperViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC11NotesEditor33QuickLookalikePaperViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC11NotesEditor33QuickLookalikePaperViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor33QuickLookalikePaperViewController_paperDocumentViewController));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor33QuickLookalikePaperViewController_markupButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor33QuickLookalikePaperViewController_findButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor33QuickLookalikePaperViewController_shareButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor33QuickLookalikePaperViewController_formFillingButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor33QuickLookalikePaperViewController_doneButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor33QuickLookalikePaperViewController_undoButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor33QuickLookalikePaperViewController_redoButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor33QuickLookalikePaperViewController__undoManager));
  sub_20BFCEB78((uint64_t)self + OBJC_IVAR____TtC11NotesEditor33QuickLookalikePaperViewController_dataSource);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC11NotesEditor33QuickLookalikePaperViewController_dismissAction);

  sub_20BFCDA14(v3);
}

@end