@interface BottomPlayerTabViewController
- (_TtC5Music29BottomPlayerTabViewController)initWithCoder:(id)a3;
- (_TtC5Music29BottomPlayerTabViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_collectionView:(id)a3 orthogonalScrollViewDidScroll:(id)a4 section:(int64_t)a5;
- (void)_observeScrollViewDidEndDecelerating:(id)a3;
- (void)viewDidLoad;
@end

@implementation BottomPlayerTabViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1002630F0();
}

- (_TtC5Music29BottomPlayerTabViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC5Music29BottomPlayerTabViewController *)sub_1002662C8(v5, v7, a4);
}

- (_TtC5Music29BottomPlayerTabViewController)initWithCoder:(id)a3
{
  return (_TtC5Music29BottomPlayerTabViewController *)sub_100266444(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29BottomPlayerTabViewController_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29BottomPlayerTabViewController_dataSource));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29BottomPlayerTabViewController_orthogonalScrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music29BottomPlayerTabViewController_currentQueue));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music29BottomPlayerTabViewController_manager);
}

- (void)_collectionView:(id)a3 orthogonalScrollViewDidScroll:(id)a4 section:(int64_t)a5
{
  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Music29BottomPlayerTabViewController_orthogonalScrollView))
  {
    id v7 = a4;
    id v8 = a3;
    v9 = self;
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC5Music29BottomPlayerTabViewController_orthogonalScrollView) = (Class)a4;
    id v10 = a4;
    id v11 = a3;
    [v10 _addScrollViewScrollObserver:self];
  }
  sub_100265690();
}

- (void)_observeScrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1002666E8(v4);
}

@end