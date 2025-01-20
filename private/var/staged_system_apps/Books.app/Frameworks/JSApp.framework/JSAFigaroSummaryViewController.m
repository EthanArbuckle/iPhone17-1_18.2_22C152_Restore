@interface JSAFigaroSummaryViewController
- (JSAFigaroSummaryViewController)init;
- (JSAFigaroSummaryViewController)initWithCoder:(id)a3;
- (JSAFigaroSummaryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (JSAFigaroSummaryViewController)initWithStyle:(int64_t)a3;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)infoTapped:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)trashTapped:(id)a3;
- (void)valueChanged:(id)a3;
- (void)viewDidLoad;
@end

@implementation JSAFigaroSummaryViewController

- (JSAFigaroSummaryViewController)init
{
  return (JSAFigaroSummaryViewController *)FigaroSummaryViewController.init()();
}

- (JSAFigaroSummaryViewController)initWithCoder:(id)a3
{
  result = (JSAFigaroSummaryViewController *)sub_86F70();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_7F614();
}

- (void)infoTapped:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_80AB0();
}

- (void)trashTapped:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_80BE4();
}

- (void)valueChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = [(JSAFigaroSummaryViewController *)v5 tableView];
  if (v6)
  {
    id v7 = v6;
    [v6 reloadData];
  }
  else
  {
    __break(1u);
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  v5 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___JSAFigaroSummaryViewController_toolbar);
  id v6 = a3;
  id v7 = self;
  [v5 frame];
  double Height = CGRectGetHeight(v10);

  return Height;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                 + OBJC_IVAR___JSAFigaroSummaryViewController_toolbar));
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = a3;
  id v6 = self;
  int64_t v7 = sub_80D40();

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_86010();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_85FE0();
  id v10 = a3;
  v11 = self;
  v12 = (void *)sub_7FE54(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_86010();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_85FE0();
  id v10 = a3;
  v11 = self;
  sub_800E4(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (JSAFigaroSummaryViewController)initWithStyle:(int64_t)a3
{
  result = (JSAFigaroSummaryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (JSAFigaroSummaryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (JSAFigaroSummaryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___JSAFigaroSummaryViewController_segmentedControl));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___JSAFigaroSummaryViewController_toolbar);
}

@end