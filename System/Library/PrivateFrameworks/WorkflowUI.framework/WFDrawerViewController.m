@interface WFDrawerViewController
- (_TtC10WorkflowUI22WFDrawerViewController)initWithCoder:(id)a3;
- (_TtC10WorkflowUI22WFDrawerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dealloc;
- (void)scrollViewDidScroll:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonWillHide:(id)a3;
- (void)searchBarDidBeginEditing:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation WFDrawerViewController

- (_TtC10WorkflowUI22WFDrawerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22DACB734();
}

- (void)dealloc
{
  v2 = self;
  sub_22DACB8E0();
}

- (void).cxx_destruct
{
  sub_22D9ADBA0((uint64_t)self + OBJC_IVAR____TtC10WorkflowUI22WFDrawerViewController_delegate);
  sub_22DADA910(*(void **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10WorkflowUI22WFDrawerViewController_mode), *(void *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC10WorkflowUI22WFDrawerViewController_mode), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC10WorkflowUI22WFDrawerViewController_mode), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC10WorkflowUI22WFDrawerViewController_mode), (char)*(UIView **)((char *)&self->super._view + OBJC_IVAR____TtC10WorkflowUI22WFDrawerViewController_mode), *(uint64_t *)((char *)&self->super._tabBarItem + OBJC_IVAR____TtC10WorkflowUI22WFDrawerViewController_mode), *(uint64_t *)((char *)&self->super._tab + OBJC_IVAR____TtC10WorkflowUI22WFDrawerViewController_mode));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI22WFDrawerViewController_searchBar));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI22WFDrawerViewController_tokenScrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI22WFDrawerViewController_headerSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI22WFDrawerViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUI22WFDrawerViewController_contentContainer));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_22DACBA68();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_22DACC120();
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_22DC8F2E8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22DC8F298();
  id v10 = a3;
  v11 = self;
  sub_22DAD1030();
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return sub_22DAD1AD0();
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return sub_22DAD1B08((uint64_t)self, a4);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  id v6 = a3;
  uint64_t v7 = self;
  sub_22DAD1C8C();

  swift_bridgeObjectRelease();
}

- (void)searchBarDidBeginEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22DAD1D5C();
}

- (void)searchBarCancelButtonWillHide:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22DAD1E18();
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_22DAD1E7C(v6, a4);
  v9 = v8;

  return v9;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  sub_22DAD1FBC((uint64_t)self, a4);
  return result;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_22DC8F2E8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22DC8F298();
  id v10 = a3;
  v11 = self;
  sub_22DAD209C();
  double v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_22DC8F2E8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22DC8F298();
  id v10 = a3;
  v11 = self;
  sub_22DAD235C();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = sub_22DC8F2E8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22DC8F298();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  sub_22DAD27F8();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22DAD2C74();
}

- (_TtC10WorkflowUI22WFDrawerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  }
  id v5 = a4;
  sub_22DAD2CD8();
}

@end