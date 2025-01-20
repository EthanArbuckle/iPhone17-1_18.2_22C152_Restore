@interface LinkAcceleratorViewController
- (_TtC11NotesEditor29LinkAcceleratorViewController)init;
- (_TtC11NotesEditor29LinkAcceleratorViewController)initWithCoder:(id)a3;
- (_TtC11NotesEditor29LinkAcceleratorViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation LinkAcceleratorViewController

- (_TtC11NotesEditor29LinkAcceleratorViewController)init
{
  v3 = (char *)self + OBJC_IVAR____TtC11NotesEditor29LinkAcceleratorViewController_acceleratorView;
  uint64_t v4 = sub_20C1605E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11NotesEditor29LinkAcceleratorViewController_linkAcceleratorController) = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC11NotesEditor29LinkAcceleratorViewController_didSelectNoteLinkCompletion);
  void *v5 = 0;
  v5[1] = 0;
  v6 = (char *)self + OBJC_IVAR____TtC11NotesEditor29LinkAcceleratorViewController_currentSuggestionContainer;
  uint64_t v7 = sub_20C160880();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = (char *)self + OBJC_IVAR____TtC11NotesEditor29LinkAcceleratorViewController_currentSelection;
  uint64_t v9 = sub_20C15F950();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for LinkAcceleratorViewController();
  return [(LinkAcceleratorViewController *)&v11 initWithNibName:0 bundle:0];
}

- (_TtC11NotesEditor29LinkAcceleratorViewController)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC11NotesEditor29LinkAcceleratorViewController_acceleratorView;
  uint64_t v6 = sub_20C1605E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11NotesEditor29LinkAcceleratorViewController_linkAcceleratorController) = 0;
  uint64_t v7 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC11NotesEditor29LinkAcceleratorViewController_didSelectNoteLinkCompletion);
  *uint64_t v7 = 0;
  v7[1] = 0;
  v8 = (char *)self + OBJC_IVAR____TtC11NotesEditor29LinkAcceleratorViewController_currentSuggestionContainer;
  uint64_t v9 = sub_20C160880();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v10 = (char *)self + OBJC_IVAR____TtC11NotesEditor29LinkAcceleratorViewController_currentSelection;
  uint64_t v11 = sub_20C15F950();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  id v12 = a3;

  result = (_TtC11NotesEditor29LinkAcceleratorViewController *)sub_20C163BD0();
  __break(1u);
  return result;
}

- (_TtC11NotesEditor29LinkAcceleratorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC11NotesEditor29LinkAcceleratorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor29LinkAcceleratorViewController_linkAcceleratorController));
  sub_20BFCDA14(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11NotesEditor29LinkAcceleratorViewController_didSelectNoteLinkCompletion));
  sub_20BFCEDFC((uint64_t)self + OBJC_IVAR____TtC11NotesEditor29LinkAcceleratorViewController_currentSuggestionContainer, &qword_2676BC8A0);
  sub_20BFCEDFC((uint64_t)self + OBJC_IVAR____TtC11NotesEditor29LinkAcceleratorViewController_currentSelection, &qword_2676BC8E8);
}

@end