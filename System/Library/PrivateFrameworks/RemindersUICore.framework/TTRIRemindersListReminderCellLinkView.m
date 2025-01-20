@interface TTRIRemindersListReminderCellLinkView
- (BOOL)isLayoutSizeDependentOnPerpendicularAxis;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView)initWithFrame:(CGRect)a3;
- (_TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView)initWithMetadata:(id)a3;
- (_TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView)initWithMetadataLoadedFromRequest:(id)a3;
- (_TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView)initWithMetadataLoadedFromURL:(id)a3;
- (_TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView)initWithPresentationProperties:(id)a3;
- (_TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView)initWithPresentationProperties:(id)a3 URL:(id)a4;
- (_TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView)initWithURL:(id)a3;
@end

@implementation TTRIRemindersListReminderCellLinkView

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  return 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  [(TTRIRemindersListReminderCellLinkView *)v3 maximumLayoutSize];
  double v5 = v4;
  double v7 = v6;
  v14.receiver = v3;
  v14.super_class = (Class)type metadata accessor for TTRIRemindersListReminderCellLinkView();
  -[LPLinkView sizeThatFits:](&v14, sel_sizeThatFits_, v5, v7);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (_TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView)initWithURL:(id)a3
{
}

- (_TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView)initWithMetadata:(id)a3
{
  id v3 = a3;
  CGSize result = (_TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView)initWithPresentationProperties:(id)a3
{
  swift_unknownObjectRetain();
  CGSize result = (_TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView)initWithPresentationProperties:(id)a3 URL:(id)a4
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9B1A70);
  MEMORY[0x1F4188790](v5 - 8);
  double v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_1B996A520();
    uint64_t v8 = sub_1B996A580();
    uint64_t v10 = 0;
    double v9 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
  }
  else
  {
    uint64_t v8 = sub_1B996A580();
    double v9 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
    uint64_t v10 = 1;
  }
  (*v9)(v7, v10, 1, v8);
  swift_unknownObjectRetain();
  CGSize result = (_TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView)initWithMetadataLoadedFromURL:(id)a3
{
}

- (_TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView)initWithMetadataLoadedFromRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore37TTRIRemindersListReminderCellLinkView_attachmentID));
}

@end