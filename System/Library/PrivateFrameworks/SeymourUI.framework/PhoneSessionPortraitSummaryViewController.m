@interface PhoneSessionPortraitSummaryViewController
- (_TtC9SeymourUI41PhoneSessionPortraitSummaryViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI41PhoneSessionPortraitSummaryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (uint64_t)handleGuidedRunButtonTapped;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateViewConstraints;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PhoneSessionPortraitSummaryViewController

- (_TtC9SeymourUI41PhoneSessionPortraitSummaryViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A49BD64();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23A4976F0();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_23A4978BC(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_23A497C28(a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_23A498C90();
}

- (void)updateViewConstraints
{
  v2 = self;
  sub_23A499DE0();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for PhoneSessionPortraitSummaryViewController();
  [(PhoneSessionPortraitSummaryViewController *)&v3 updateViewConstraints];
}

- (_TtC9SeymourUI41PhoneSessionPortraitSummaryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI41PhoneSessionPortraitSummaryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41PhoneSessionPortraitSummaryViewController_contentSummaryView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI41PhoneSessionPortraitSummaryViewController_mediaTagStringBuilder);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41PhoneSessionPortraitSummaryViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41PhoneSessionPortraitSummaryViewController_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41PhoneSessionPortraitSummaryViewController_gridView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41PhoneSessionPortraitSummaryViewController_bottomStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41PhoneSessionPortraitSummaryViewController_doneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41PhoneSessionPortraitSummaryViewController_cooldownButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41PhoneSessionPortraitSummaryViewController_ttrButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41PhoneSessionPortraitSummaryViewController_activityRingsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41PhoneSessionPortraitSummaryViewController_activityRingsToScrollViewBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41PhoneSessionPortraitSummaryViewController_contentSummaryViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41PhoneSessionPortraitSummaryViewController_gridViewHeight));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41PhoneSessionPortraitSummaryViewController_gridViewWidth));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI41PhoneSessionPortraitSummaryViewController_gridViewTopSpacing));
  sub_239C25128((uint64_t)self + OBJC_IVAR____TtC9SeymourUI41PhoneSessionPortraitSummaryViewController_summary, &qword_268A11928);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_23A49A7AC(a3);
}

- (uint64_t)handleGuidedRunButtonTapped
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF5F090);
  MEMORY[0x270FA5388](v0 - 8);
  v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
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