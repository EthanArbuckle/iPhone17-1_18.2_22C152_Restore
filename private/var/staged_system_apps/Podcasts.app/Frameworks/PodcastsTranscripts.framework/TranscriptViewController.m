@interface TranscriptViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (NSArray)keyCommands;
- (_TtC19PodcastsTranscripts24TranscriptViewController)initWithCoder:(id)a3;
- (_TtC19PodcastsTranscripts24TranscriptViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)findInteraction:(id)a3 sessionForView:(id)a4;
- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5;
- (void)commandFKeyboardSearch;
- (void)didTapEmptySpace;
- (void)findInteraction:(id)a3 didBeginFindSession:(id)a4;
- (void)findInteraction:(id)a3 didEndFindSession:(id)a4;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewDidScrollToTop:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation TranscriptViewController

- (_TtC19PodcastsTranscripts24TranscriptViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_64448();
}

- (void)viewDidLoad
{
  v2 = self;
  TranscriptViewController.viewDidLoad()();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  TranscriptViewController.viewWillLayoutSubviews()();
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(TranscriptViewController *)&v3 viewDidLayoutSubviews];
  sub_51C7C();
  sub_522CC(2u);
  sub_52BEC();
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)_bridgedUpdateContentUnavailableConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_75B80();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_75B70();
  v8 = self;
  TranscriptViewController.updateContentUnavailableConfiguration(using:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC19PodcastsTranscripts24TranscriptViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC19PodcastsTranscripts24TranscriptViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19PodcastsTranscripts24TranscriptViewController____lazy_storage___dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19PodcastsTranscripts24TranscriptViewController____lazy_storage___collectionViewWrapper));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19PodcastsTranscripts24TranscriptViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19PodcastsTranscripts24TranscriptViewController____lazy_storage___searchButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19PodcastsTranscripts24TranscriptViewController____lazy_storage___topGradientMask));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19PodcastsTranscripts24TranscriptViewController____lazy_storage___topGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19PodcastsTranscripts24TranscriptViewController____lazy_storage___bottomGradientMask));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19PodcastsTranscripts24TranscriptViewController____lazy_storage___bottomGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19PodcastsTranscripts24TranscriptViewController_searchQueue));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC19PodcastsTranscripts24TranscriptViewController_libraryActionController);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19PodcastsTranscripts24TranscriptViewController____lazy_storage___timestampView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19PodcastsTranscripts24TranscriptViewController____lazy_storage___collectionViewBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19PodcastsTranscripts24TranscriptViewController____lazy_storage___findInteraction));

  swift_release();
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_75190();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_75140();
  id v10 = a3;
  v11 = self;
  TranscriptViewController.collectionView(_:didSelectItemAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_75190();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_75140();
  id v10 = a3;
  v11 = self;
  if (sub_755E0())
  {
  }
  else
  {
    *(unsigned char *)(sub_50398() + 16) = 0;
    sub_285D4();

    swift_release();
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_75190();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_75140();
  id v10 = a3;
  v11 = self;
  uint64_t v12 = sub_4CA30();
  if (v12)
  {
    unint64_t v13 = *(void *)(v12 + 16);

    swift_release();
    if (v13 >> 62) {
      BOOL v14 = v13 >> 62 == 3;
    }
    else {
      BOOL v14 = 1;
    }
    BOOL v15 = v14;
  }
  else
  {

    BOOL v15 = 0;
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v15;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_75190();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_75140();
  id v12 = a3;
  id v13 = a4;
  BOOL v14 = self;
  sub_65150(v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_75190();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_75140();
  id v12 = a3;
  id v13 = a4;
  BOOL v14 = self;
  sub_653C0();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  *(unsigned char *)(sub_50398() + 16) = 3;
  sub_285D4();

  swift_release();
  return 1;
}

- (void)scrollViewDidScrollToTop:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  *(unsigned char *)(sub_50398() + 16) = 12;
  sub_285D4();

  swift_release();
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  *(unsigned char *)(sub_50398() + 16) = 3;
  sub_285D4();

  swift_release();
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a3;
  uint64_t v9 = self;
  _s19PodcastsTranscripts24TranscriptViewControllerC06scrollD15WillEndDragging_12withVelocity19targetContentOffsetySo08UIScrollD0C_So7CGPointVSpyAJGtF_0(x, y);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  *(unsigned char *)(sub_50398() + 16) = 12;
  sub_285D4();

  swift_release();
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  TranscriptViewController.scrollViewDidScroll(_:)((UIScrollView)v4);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  sub_75190();
  uint64_t v7 = sub_769D0();
  id v8 = a3;
  uint64_t v9 = self;
  id v10 = _s19PodcastsTranscripts24TranscriptViewControllerC010collectionD0_34contextMenuConfigurationForItemsAt5pointSo09UIContexthI0CSgSo012UICollectionD0C_Say10Foundation9IndexPathVGSo7CGPointVtF_0(v8, v7);

  swift_bridgeObjectRelease();

  return v10;
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  uint64_t v9 = self;
  *(unsigned char *)(sub_50398() + 16) = 8;
  sub_285D4();

  swift_unknownObjectRelease();

  swift_release();
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  uint64_t v9 = self;
  *(unsigned char *)(sub_50398() + 16) = 9;
  sub_285D4();

  swift_unknownObjectRelease();

  swift_release();
}

- (id)findInteraction:(id)a3 sessionForView:(id)a4
{
  swift_getObjectType();
  sub_FAEC(0, &qword_99FA0);
  sub_64288(&qword_99FA8, v5, (void (*)(uint64_t))type metadata accessor for TranscriptViewController);
  uint64_t v6 = self;
  id v7 = (void *)sub_76D90();

  return v7;
}

- (void)findInteraction:(id)a3 didBeginFindSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  *(unsigned char *)(sub_50398() + 16) = 7;
  sub_285D4();

  swift_release();
}

- (void)findInteraction:(id)a3 didEndFindSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  _s19PodcastsTranscripts24TranscriptViewControllerC15findInteraction_6didEndySo06UIFindG0C_So0J7SessionCtF_0(v6);
}

- (void)commandFKeyboardSearch
{
  uint64_t v5 = self;
  id v2 = [(TranscriptViewController *)v5 view];
  if (v2)
  {
    objc_super v3 = v2;
    [v2 becomeFirstResponder];

    id v4 = sub_4D948();
    [v4 presentFindNavigatorShowingReplace:0];

    sub_5D61C();
  }
  else
  {
    __break(1u);
  }
}

- (NSArray)keyCommands
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_99FB0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_79870;
  id v4 = self;
  NSString v5 = sub_768D0();
  id v6 = [self keyCommandWithInput:v5 modifierFlags:0x100000 action:"commandFKeyboardSearch"];

  *(void *)(v3 + 32) = v6;
  sub_769F0();

  sub_FAEC(0, &qword_9A1A8);
  v7.super.isa = sub_769C0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v7.super.isa;
}

- (void)didTapEmptySpace
{
  id v2 = self;
  *(unsigned char *)(sub_50398() + 16) = 10;
  sub_285D4();

  swift_release();
}

@end