@interface TabletSessionSummaryViewController
- (_TtC9SeymourUI34TabletSessionSummaryViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI34TabletSessionSummaryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (uint64_t)ttrButtonTapped;
- (void)scrollViewDidScroll:(id)a3;
- (void)shareButtonTapped;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateViewConstraints;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TabletSessionSummaryViewController

- (_TtC9SeymourUI34TabletSessionSummaryViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239E2F4CC();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_239E29BD8(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_239E29F2C(a3);
}

- (void)shareButtonTapped
{
  v2 = self;
  sub_23A1C8268();
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TabletSessionSummaryViewController();
  id v4 = v8.receiver;
  id v5 = a3;
  [(TabletSessionSummaryViewController *)&v8 traitCollectionDidChange:v5];
  id v6 = objc_msgSend(v4, sel_view, v8.receiver, v8.super_class);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, sel_setNeedsUpdateConstraints);
  }
  else
  {
    __break(1u);
  }
}

- (void)updateViewConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TabletSessionSummaryViewController();
  id v2 = v3.receiver;
  [(TabletSessionSummaryViewController *)&v3 updateViewConstraints];
  sub_239E2C350();
  sub_239E2C704();
}

- (_TtC9SeymourUI34TabletSessionSummaryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI34TabletSessionSummaryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_storefrontLocalizer);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_contentSummaryView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_gridView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_upNextSummaryView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_queueCompleteView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_buttonStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_doneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_cooldownButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_stateOfMindLoggingButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_ttrBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_shareBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_activityRingsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_activityRingsBottomPinningConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_burnBarView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_burnBarToContentSummaryLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_burnBarToActivityRingsTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_burnBarLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_burnBarToGridViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_burnBarBottomPinningConstraint));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_contentSummaryTrailingAnchor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_gridViewHeight));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_gridViewWidth));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_gridViewTopSpacing));
  sub_239C25128((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34TabletSessionSummaryViewController_summary, &qword_268A11928);

  swift_bridgeObjectRelease();
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_239E2ED64(v4);
}

- (uint64_t)ttrButtonTapped
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF5F090);
  MEMORY[0x270FA5388](v0 - 8);
  id v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_23A7F6548();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for FeedbackHandler();
  sub_23A744A28((uint64_t)v2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1) {
    return sub_239C25128((uint64_t)v2, &qword_26AF5F090);
  }
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
  id v8 = objc_msgSend(self, sel_defaultWorkspace);
  if (v8)
  {
    v9 = v8;
    v10 = (void *)sub_23A7F6498();
    objc_msgSend(v9, sel_openURL_configuration_completionHandler_, v10, 0, 0);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end