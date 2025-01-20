@interface GetContactQuickActionButtonsViewModel
- (_TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel)init;
- (void)dealloc;
@end

@implementation GetContactQuickActionButtonsViewModel

- (void)dealloc
{
  v2 = self;
  sub_25C6CDBC4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_contact));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_dataSource));
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_dialRequestPerformer);
  sub_25C6D58C0();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3();
  v3();
  sub_25C6D5600();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3();
  v4();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_lock));
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A5C6930);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3();
  v5();
  v6 = (char *)self + OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel__groupedAudioActions;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5C6928);
  v9 = *(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v9)((void *)(v7 - 8), v6, v7);
  v9((char *)self + OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel__groupedMessageActions, v7);
  v8 = (char *)self + OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel__groupedVideoActions;

  v9(v8, v7);
}

- (_TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel)init
{
}

@end