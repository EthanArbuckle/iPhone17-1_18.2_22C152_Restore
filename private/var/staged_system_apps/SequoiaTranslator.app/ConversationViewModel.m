@interface ConversationViewModel
- (_TtC17SequoiaTranslator21ConversationViewModel)init;
@end

@implementation ConversationViewModel

- (_TtC17SequoiaTranslator21ConversationViewModel)init
{
  result = (_TtC17SequoiaTranslator21ConversationViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel_speechManager));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel_translationOptions));
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel__deviceOwnerLocale;
  uint64_t v4 = sub_100007620(&qword_1002F34A0);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel__partnerLocale, v4);
  v6 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel__disableMicrophone;
  uint64_t v7 = sub_100007620((uint64_t *)&unk_1002FCB50);
  v8 = *(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8);
  v8(v6, v7);
  v8((char *)self + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel__isListeningToPartner, v7);
  v8((char *)self + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel__isListeningToDeviceOwner, v7);
  v9 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel__partialSpeechResult;
  uint64_t v10 = sub_100007620(&qword_1002F31E0);
  (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  v11 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel__partialTextResult;
  uint64_t v12 = sub_100007620(&qword_1002F3980);
  (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  v13 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel__deviceOwnerText;
  uint64_t v14 = sub_100007620(&qword_1002EF7C8);
  v15 = *(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8);
  v15(v13, v14);
  v15((char *)self + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel__partnerText, v14);
  v16 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel__stateError;
  uint64_t v17 = sub_100007620(&qword_1002F2150);
  (*(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  v18 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel__transactionalError;
  uint64_t v19 = sub_100007620(&qword_1002F2148);
  (*(void (**)(char *, uint64_t))(*(void *)(v19 - 8) + 8))(v18, v19);
  v8((char *)self + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel__showErrorAlert, v7);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  sub_10000B070((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel_lastSourceLocale, (uint64_t *)&unk_1002F4110);
  sub_10000B070((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel_lastTargetLocale, (uint64_t *)&unk_1002F4110);
  sub_10000B070((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator21ConversationViewModel__selfAutoTranslateSessionId, (uint64_t *)&unk_1002F33E0);
}

@end