@interface TTRIRemindersListSmallImageAttachmentsView
- (_TtC15RemindersUICore42TTRIRemindersListSmallImageAttachmentsView)init;
- (_TtC15RemindersUICore42TTRIRemindersListSmallImageAttachmentsView)initWithContentView:(id)a3;
- (_TtC15RemindersUICore42TTRIRemindersListSmallImageAttachmentsView)initWithDocumentView:(id)a3;
- (_TtC15RemindersUICore42TTRIRemindersListSmallImageAttachmentsView)initWithFrame:(CGRect)a3;
- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4 uncroppedSourceFrame:(CGRect *)a5;
- (void)didTapImage:(id)a3;
@end

@implementation TTRIRemindersListSmallImageAttachmentsView

- (_TtC15RemindersUICore42TTRIRemindersListSmallImageAttachmentsView)init
{
  return (_TtC15RemindersUICore42TTRIRemindersListSmallImageAttachmentsView *)sub_1B94F10A4();
}

- (void)didTapImage:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B94F1868(v4);
}

- (_TtC15RemindersUICore42TTRIRemindersListSmallImageAttachmentsView)initWithDocumentView:(id)a3
{
}

- (_TtC15RemindersUICore42TTRIRemindersListSmallImageAttachmentsView)initWithContentView:(id)a3
{
}

- (_TtC15RemindersUICore42TTRIRemindersListSmallImageAttachmentsView)initWithFrame:(CGRect)a3
{
  result = (_TtC15RemindersUICore42TTRIRemindersListSmallImageAttachmentsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B90D88A0((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore42TTRIRemindersListSmallImageAttachmentsView_attachmentsDelegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore42TTRIRemindersListSmallImageAttachmentsView_stackView));

  swift_bridgeObjectRelease();
}

- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4 uncroppedSourceFrame:(CGRect *)a5
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v8 = self;
  v9 = sub_1B94F2384((uint64_t)a4, &a5->origin.x);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v9;
}

@end