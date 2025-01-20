@interface TVSessionSummaryViewController
- (NSArray)preferredFocusEnvironments;
- (_TtC9SeymourUI30TVSessionSummaryViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI30TVSessionSummaryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)menuButtonTapped;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVSessionSummaryViewController

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  sub_23A5EAF78();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A0E2A0);
  v3 = (void *)sub_23A7FFC58();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (_TtC9SeymourUI30TVSessionSummaryViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A5EFE04();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_23A5EC040(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_23A5EC374(a3);
}

- (void)menuButtonTapped
{
  v2 = (void (*)(uint64_t))(*(void **)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_presenter))[4];
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_239D03E2C((uint64_t)v2);
    v2(v3);
    sub_239C25118((uint64_t)v2);
  }
}

- (_TtC9SeymourUI30TVSessionSummaryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI30TVSessionSummaryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_storefrontLocalizer);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_footerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_metricGridView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_burnBarView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_activityRingsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_upNextSummaryView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_queueCompleteView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_topPaddingLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_bottomPaddingLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_gridViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_gridViewBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_gridViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_activityRingsTopPinningConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_activityRingsBottomPinningConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_burnBarTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_burnBarLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_burnBarTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_activityRingsTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_activityRingsTrailingConstraint));
  sub_239C25128((uint64_t)self + OBJC_IVAR____TtC9SeymourUI30TVSessionSummaryViewController_summary, &qword_268A11928);

  swift_bridgeObjectRelease();
}

@end