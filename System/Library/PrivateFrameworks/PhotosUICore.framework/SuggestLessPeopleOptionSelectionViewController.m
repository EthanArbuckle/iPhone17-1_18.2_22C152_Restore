@interface SuggestLessPeopleOptionSelectionViewController
- (_TtC12PhotosUICore46SuggestLessPeopleOptionSelectionViewController)initWithCoder:(id)a3;
- (_TtC12PhotosUICore46SuggestLessPeopleOptionSelectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC12PhotosUICore46SuggestLessPeopleOptionSelectionViewController)initWithPeople:(id)a3 delegate:(id)a4 completionHandler:(id)a5;
- (void)setupOptionSelectionView;
- (void)viewDidLoad;
@end

@implementation SuggestLessPeopleOptionSelectionViewController

- (_TtC12PhotosUICore46SuggestLessPeopleOptionSelectionViewController)initWithPeople:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  v6 = _Block_copy(a5);
  sub_1A9B21070(0, (unint64_t *)&qword_1E981B820);
  uint64_t v7 = sub_1AB23AADC();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  swift_unknownObjectRetain();
  v9 = (_TtC12PhotosUICore46SuggestLessPeopleOptionSelectionViewController *)sub_1AA3A7768(v7, (uint64_t)a4, (uint64_t)sub_1A9D5E1DC, v8);
  swift_unknownObjectRelease();
  swift_release();
  return v9;
}

- (_TtC12PhotosUICore46SuggestLessPeopleOptionSelectionViewController)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12PhotosUICore46SuggestLessPeopleOptionSelectionViewController_completionHandler);
  void *v5 = 0;
  v5[1] = 0;
  id v6 = a3;

  result = (_TtC12PhotosUICore46SuggestLessPeopleOptionSelectionViewController *)sub_1AB23C1FC();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SuggestLessPeopleOptionSelectionViewController();
  id v2 = v3.receiver;
  [(SuggestLessPeopleOptionSelectionViewController *)&v3 viewDidLoad];
  objc_msgSend(v2, sel_setupOptionSelectionView, v3.receiver, v3.super_class);
}

- (void)setupOptionSelectionView
{
}

- (_TtC12PhotosUICore46SuggestLessPeopleOptionSelectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12PhotosUICore46SuggestLessPeopleOptionSelectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A9D6D380((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore46SuggestLessPeopleOptionSelectionViewController_delegate);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC12PhotosUICore46SuggestLessPeopleOptionSelectionViewController_completionHandler);
  sub_1A9BB8934(v3);
}

@end