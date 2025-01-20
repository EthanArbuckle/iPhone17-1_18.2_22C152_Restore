@interface SegmentedViewController
- (_TtC5TeaUI23SegmentedViewController)initWithCoder:(id)a3;
- (_TtC5TeaUI23SegmentedViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)doSegmentChange;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SegmentedViewController

- (_TtC5TeaUI23SegmentedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_1B61B20F0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC5TeaUI23SegmentedViewController *)SegmentedViewController.init(nibName:bundle:)((uint64_t)a4, v6, a4);
}

- (_TtC5TeaUI23SegmentedViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  SegmentedViewController.init(coder:)();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1B61566C0(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI23SegmentedViewController_segmentedControl));
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC5TeaUI23SegmentedViewController_preservedSearchText;
  sub_1B61572D0();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

- (void)doSegmentChange
{
  v2 = self;
  sub_1B61568A4();
}

@end