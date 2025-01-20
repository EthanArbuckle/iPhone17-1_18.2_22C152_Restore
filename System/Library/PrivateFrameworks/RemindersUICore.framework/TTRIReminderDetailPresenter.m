@interface TTRIReminderDetailPresenter
- (_TtC15RemindersUICore27TTRIReminderDetailPresenter)init;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
@end

@implementation TTRIReminderDetailPresenter

- (_TtC15RemindersUICore27TTRIReminderDetailPresenter)init
{
  result = (_TtC15RemindersUICore27TTRIReminderDetailPresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore27TTRIReminderDetailPresenter_attachmentImportingController));
  swift_release();
  swift_release();
  sub_1B90CCA68((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore27TTRIReminderDetailPresenter_lastHashtagEditorModuleState, &qword_1E9F00CA8);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_1B95A1DFC(*(void **)((char *)&self->super.isa+ OBJC_IVAR____TtC15RemindersUICore27TTRIReminderDetailPresenter_sectionPickerVisibility), *(void *)&self->delegate[OBJC_IVAR____TtC15RemindersUICore27TTRIReminderDetailPresenter_sectionPickerVisibility], *(void *)&self->delegate[OBJC_IVAR____TtC15RemindersUICore27TTRIReminderDetailPresenter_sectionPickerVisibility+ 8], *(void *)&self->moduleDelegate[OBJC_IVAR____TtC15RemindersUICore27TTRIReminderDetailPresenter_sectionPickerVisibility], *(void *)&self->moduleDelegate[OBJC_IVAR____TtC15RemindersUICore27TTRIReminderDetailPresenter_sectionPickerVisibility+ 8], self->interactor[OBJC_IVAR____TtC15RemindersUICore27TTRIReminderDetailPresenter_sectionPickerVisibility]);
  sub_1B95A1DFC(*(void **)((char *)&self->super.isa+ OBJC_IVAR____TtC15RemindersUICore27TTRIReminderDetailPresenter_initialSectionPickerVisibility), *(void *)&self->delegate[OBJC_IVAR____TtC15RemindersUICore27TTRIReminderDetailPresenter_initialSectionPickerVisibility], *(void *)&self->delegate[OBJC_IVAR____TtC15RemindersUICore27TTRIReminderDetailPresenter_initialSectionPickerVisibility+ 8], *(void *)&self->moduleDelegate[OBJC_IVAR____TtC15RemindersUICore27TTRIReminderDetailPresenter_initialSectionPickerVisibility], *(void *)&self->moduleDelegate[OBJC_IVAR____TtC15RemindersUICore27TTRIReminderDetailPresenter_initialSectionPickerVisibility+ 8], self->interactor[OBJC_IVAR____TtC15RemindersUICore27TTRIReminderDetailPresenter_initialSectionPickerVisibility]);
  swift_release();
  sub_1B90CCA68((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore27TTRIReminderDetailPresenter_frozenViewModelBeforeCancelingChanges, &qword_1E9F036F8);
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1B9616F00(v7);
}

@end