@interface AddToHomeScreenCollectionViewController
- (_TtC10WorkflowUI39AddToHomeScreenCollectionViewController)initWithCoder:(id)a3;
- (_TtC10WorkflowUI39AddToHomeScreenCollectionViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC10WorkflowUI39AddToHomeScreenCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)scrollViewDidScroll:(id)a3;
@end

@implementation AddToHomeScreenCollectionViewController

- (_TtC10WorkflowUI39AddToHomeScreenCollectionViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22DA3FB30();
}

- (void)dealloc
{
  v2 = self;
  AddToHomeScreenCollectionViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  sub_22DA42FC4(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10WorkflowUI39AddToHomeScreenCollectionViewController____lazy_storage___characterBinding), *(void *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC10WorkflowUI39AddToHomeScreenCollectionViewController____lazy_storage___characterBinding));
  sub_22D9CC550((uint64_t)self+ OBJC_IVAR____TtC10WorkflowUI39AddToHomeScreenCollectionViewController____lazy_storage___colorSchemeBinding, &qword_2685947D8);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI39AddToHomeScreenCollectionViewController_dataSource));
  swift_unknownObjectWeakDestroy();
  swift_release();
}

- (_TtC10WorkflowUI39AddToHomeScreenCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  AddToHomeScreenCollectionViewController.init(collectionViewLayout:)();
}

- (_TtC10WorkflowUI39AddToHomeScreenCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  }
  id v5 = a4;
  AddToHomeScreenCollectionViewController.init(nibName:bundle:)();
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_22DC8F2E8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22DC8F298();
  id v10 = a3;
  v11 = self;
  AddToHomeScreenCollectionViewController.collectionView(_:didSelectItemAt:)();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_22DC8F2E8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22DC8F298();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  AddToHomeScreenCollectionViewController.collectionView(_:willDisplay:forItemAt:)((int)v14, v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)scrollViewDidScroll:(id)a3
{
  v4 = (UIScrollView *)a3;
  id v5 = self;
  AddToHomeScreenCollectionViewController.scrollViewDidScroll(_:)(v4);
}

@end