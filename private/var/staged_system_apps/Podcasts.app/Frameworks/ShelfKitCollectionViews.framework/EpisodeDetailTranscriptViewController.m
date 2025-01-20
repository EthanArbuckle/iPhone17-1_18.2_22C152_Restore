@interface EpisodeDetailTranscriptViewController
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (_TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)textDraggableView:(id)a3 itemsForDrag:(id)a4;
- (id)textView:(id)a3 editMenuForTextInRange:(_NSRange)a4 suggestedActions:(id)a5;
- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3;
- (void)beginFindInteraction;
- (void)buildMenuWithBuilder:(id)a3;
- (void)copy:(id)a3;
- (void)customCopyAction;
- (void)dealloc;
- (void)highlightParagraph:(id)a3;
- (void)keyboardWillHide;
- (void)keyboardWillShow:(id)a3;
- (void)presentTranslation;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)textViewDidChangeSelection:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation EpisodeDetailTranscriptViewController

- (_TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_FEBD4();
}

- (void)dealloc
{
  v2 = self;
  sub_EFB5C();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController____lazy_storage___timestampView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController_lastSelectionStart));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController____lazy_storage___textView));
  sub_FFD98(*(id *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController____lazy_storage___footerText));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController____lazy_storage___textViewTapGesture));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController_highlightedParagraphButton));
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_EFD54();
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4 = self;
  sub_F056C(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_F11DC(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = (char *)v5.receiver;
  [(EpisodeDetailTranscriptViewController *)&v5 viewDidDisappear:v3];
  if (*(void *)(*(void *)&v4[OBJC_IVAR____TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController_viewModel]
                 + OBJC_IVAR____TtCC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController9ViewModel_menuBarProvider))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_380D10();

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_F174C();
}

- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_37D990();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_37D980();
  v8 = self;
  sub_F1A78();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)copy:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_385640();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    uint64_t v5 = self;
  }
  sub_F2994();

  sub_E544((uint64_t)v6, &qword_472710);
}

- (void)highlightParagraph:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_F3E68(a3);
}

- (_TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_F862C();
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_F8A44();
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v9 = sub_37AFA0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_37AF40();
  if (!a6)
  {
    v13 = self;
    id v14 = a3;
    v15 = self;
    id v16 = [v13 sharedApplication];
    sub_37AF30(v17);
    v19 = v18;
    sub_10D600((uint64_t)_swiftEmptyArrayStorage);
    type metadata accessor for OpenExternalURLOptionsKey(0);
    sub_FFCD0(&qword_470E90, 255, type metadata accessor for OpenExternalURLOptionsKey);
    Class isa = sub_384280().super.isa;
    swift_bridgeObjectRelease();
    [v16 openURL:v19 options:isa completionHandler:0];
  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return a6 != 0;
}

- (void)textViewDidChangeSelection:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_F8DA0(v4);
}

- (id)textView:(id)a3 editMenuForTextInRange:(_NSRange)a4 suggestedActions:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  sub_2E66C(0, (unint64_t *)&unk_475950);
  uint64_t v9 = sub_3845F0();
  id v10 = a3;
  uint64_t v11 = self;
  Class v12 = sub_F94A0(v10, location, length, v9);

  swift_bridgeObjectRelease();

  return v12;
}

- (void)buildMenuWithBuilder:(id)a3
{
  swift_unknownObjectRetain();
  id v5 = self;
  sub_F9A18(a3);
  swift_unknownObjectRelease();
}

- (id)textDraggableView:(id)a3 itemsForDrag:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  uint64_t v6 = self;
  sub_FEE08();

  swift_unknownObjectRelease();
  sub_2E66C(0, (unint64_t *)&unk_4759A0);
  v7.super.Class isa = sub_3845E0().super.isa;
  swift_bridgeObjectRelease();

  return v7.super.isa;
}

- (void)customCopyAction
{
  v2 = self;
  sub_F2994();
}

- (void)beginFindInteraction
{
  id v5 = self;
  id v2 = sub_EF17C();
  BOOL v3 = (_TtC23ShelfKitCollectionViews37EpisodeDetailTranscriptViewController *)[v2 findInteraction];

  if (v3)
  {
    [(EpisodeDetailTranscriptViewController *)v3 presentFindNavigatorShowingReplace:0];

    id v4 = v3;
  }
  else
  {
    id v4 = v5;
  }
}

- (void)presentTranslation
{
  id v2 = self;
  sub_FA7FC();
}

- (void)keyboardWillShow:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_FAB04(v4);
}

- (void)keyboardWillHide
{
  id v2 = self;
  id v3 = sub_EF17C();
  [v3 setContentInset:UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right];

  id v13 = sub_EF17C();
  id v4 = sub_EF17C();
  [v4 contentInset];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  [v13 setScrollIndicatorInsets:v6, v8, v10, v12];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  BOOL v9 = sub_FF634(v6);

  return v9;
}

@end