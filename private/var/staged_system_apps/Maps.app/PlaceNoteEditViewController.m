@interface PlaceNoteEditViewController
+ (BOOL)wantsDefaultHeaderContentViews;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (_TtC4Maps27PlaceNoteEditViewController)initWithCoder:(id)a3;
- (_TtC4Maps27PlaceNoteEditViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC4Maps27PlaceNoteEditViewController)initWithNote:(id)a3;
- (id)dismissHandler;
- (void)cancelTapped;
- (void)doneTapped;
- (void)setDismissHandler:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation PlaceNoteEditViewController

- (id)dismissHandler
{
  v2 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC4Maps27PlaceNoteEditViewController_dismissHandler);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1002D4818;
    aBlock[3] = &unk_1012E25D0;
    v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setDismissHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1002528DC;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps27PlaceNoteEditViewController_dismissHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_10006C5D8(v7);
}

- (_TtC4Maps27PlaceNoteEditViewController)initWithNote:(id)a3
{
  if (a3)
  {
    uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
  }
  return (_TtC4Maps27PlaceNoteEditViewController *)PlaceNoteEditViewController.init(note:)(v3, v4);
}

- (_TtC4Maps27PlaceNoteEditViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002D6DE8();
}

- (void)viewDidLoad
{
  v2 = self;
  PlaceNoteEditViewController.viewDidLoad()();
}

- (void)cancelTapped
{
  id v3 = (char *)self + OBJC_IVAR____TtC4Maps27PlaceNoteEditViewController_dismissHandler;
  swift_beginAccess();
  unint64_t v4 = *(void (**)(void, void, void))v3;
  if (*(void *)v3)
  {
    uint64_t v5 = self;
    sub_1000F4F24((uint64_t)v4);
    v4(0, 0, 0);
    sub_10006C5D8((uint64_t)v4);
  }
}

- (void)doneTapped
{
  v2 = self;
  sub_1002D6970();
}

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;
  id v12 = a3;
  v13 = self;
  LOBYTE(length) = _s4Maps30MacPlaceNoteEditViewControllerC04textF0_18shouldChangeTextIn011replacementK0SbSo06UITextF0C_So8_NSRangeVSStF_0(v12, location, length, v9, v11);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  unint64_t v11 = self;
  id v5 = [v4 text];
  if (v5)
  {
    v6 = v5;
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  unint64_t v10 = (uint64_t *)((char *)v11 + OBJC_IVAR____TtC4Maps27PlaceNoteEditViewController_note);
  *unint64_t v10 = v7;
  v10[1] = v9;
  swift_bridgeObjectRelease();
  sub_1002D4C58();
}

- (_TtC4Maps27PlaceNoteEditViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC4Maps27PlaceNoteEditViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10006C5D8(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC4Maps27PlaceNoteEditViewController_dismissHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27PlaceNoteEditViewController____lazy_storage___modalHeaderView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27PlaceNoteEditViewController____lazy_storage___textContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps27PlaceNoteEditViewController____lazy_storage___textView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC4Maps27PlaceNoteEditViewController_deleteSectionView);
}

@end