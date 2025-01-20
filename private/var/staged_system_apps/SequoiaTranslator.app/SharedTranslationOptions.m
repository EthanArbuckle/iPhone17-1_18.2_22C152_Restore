@interface SharedTranslationOptions
- (_TtC17SequoiaTranslator24SharedTranslationOptions)init;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
@end

@implementation SharedTranslationOptions

- (_TtC17SequoiaTranslator24SharedTranslationOptions)init
{
  return (_TtC17SequoiaTranslator24SharedTranslationOptions *)sub_1001A5C18();
}

- (void).cxx_destruct
{
  v3 = (char *)self
     + OBJC_IVAR____TtC17SequoiaTranslator24SharedTranslationOptions__genderDisambiguationUserSettingEnabled;
  uint64_t v4 = sub_100007620((uint64_t *)&unk_1002FCB50);
  v6 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v6)((void *)(v4 - 8), v3, v4);
  v6((char *)self + OBJC_IVAR____TtC17SequoiaTranslator24SharedTranslationOptions__autodetectSpeechEnabled, v4);
  v6((char *)self + OBJC_IVAR____TtC17SequoiaTranslator24SharedTranslationOptions__autoTranslateEnabled, v4);
  v5 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator24SharedTranslationOptions__autoplayTTSEnabled;

  v6(v5, v4);
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  if (a4) {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  uint64_t v6 = qword_1002EE630;
  id v7 = a3;
  v8 = self;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  sub_100011554(v9, (uint64_t)qword_10030EA98);
  v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Notified of MCProfileConnection setting change, rechecking profanity filtering", v12, 2u);
    swift_slowDealloc();
  }

  sub_1001A6774();

  swift_bridgeObjectRelease();
}

@end