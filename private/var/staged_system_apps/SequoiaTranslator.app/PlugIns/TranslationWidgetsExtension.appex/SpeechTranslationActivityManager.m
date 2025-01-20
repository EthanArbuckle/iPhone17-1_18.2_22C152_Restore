@interface SpeechTranslationActivityManager
- (_TtC27TranslationWidgetsExtension32SpeechTranslationActivityManager)init;
@end

@implementation SpeechTranslationActivityManager

- (_TtC27TranslationWidgetsExtension32SpeechTranslationActivityManager)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC27TranslationWidgetsExtension32SpeechTranslationActivityManager_currentActivity) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC27TranslationWidgetsExtension32SpeechTranslationActivityManager_assertion) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SpeechTranslationActivityManager();
  return [(SpeechTranslationActivityManager *)&v3 init];
}

- (void).cxx_destruct
{
  swift_release();
  objc_super v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC27TranslationWidgetsExtension32SpeechTranslationActivityManager_assertion);
}

@end