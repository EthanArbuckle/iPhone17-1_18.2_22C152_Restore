@interface PhoneSessionLandscapeSummaryViewController
- (_TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (uint64_t)handleGuidedRunButtonTapped;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateViewConstraints;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PhoneSessionLandscapeSummaryViewController

- (_TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A6625BC();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_23A65C088(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_23A65C3DC(a3);
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PhoneSessionLandscapeSummaryViewController();
  id v2 = v3.receiver;
  [(PhoneSessionLandscapeSummaryViewController *)&v3 viewDidLayoutSubviews];
  sub_23A65E5E0();
}

- (void)updateViewConstraints
{
  id v2 = self;
  sub_23A65E0C4();
  sub_23A65E5E0();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for PhoneSessionLandscapeSummaryViewController();
  [(PhoneSessionLandscapeSummaryViewController *)&v3 updateViewConstraints];
}

- (_TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_storefrontLocalizer);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_contentSummaryView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_scrollViewSizingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_leadingStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_gridView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_upNextSummaryView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_queueCompleteView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_trailingStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_doneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_cooldownButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_stateOfMindLoggingButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_ttrButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_activityRingsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_activityRingsToScrollViewBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_burnBarView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_burnBarToContentSummaryLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_burnBarToActivityRingsTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_burnBarLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_burnBarToGridViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_burnBarToScrollViewBottomConstraint));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_trailingStackViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_gridViewHeight));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_gridViewWidth));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_gridViewTopSpacing));
  sub_239C25128((uint64_t)self + OBJC_IVAR____TtC9SeymourUI42PhoneSessionLandscapeSummaryViewController_summary, &qword_268A11928);

  swift_bridgeObjectRelease();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_23A660504(a3);
}

- (uint64_t)handleGuidedRunButtonTapped
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF5F090);
  MEMORY[0x270FA5388](v0 - 8);
  id v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_23A7F6548();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
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