@interface TranslatePhraseIntentHandler
- (_TtC22SiriTranslationIntents28TranslatePhraseIntentHandler)init;
- (void)confirmTranslatePhrase:(id)a3 completion:(id)a4;
- (void)handleTranslatePhrase:(id)a3 completion:(id)a4;
- (void)resolvePhraseForTranslatePhrase:(id)a3 withCompletion:(id)a4;
- (void)resolveTargetLanguageForTranslatePhrase:(id)a3 withCompletion:(id)a4;
@end

@implementation TranslatePhraseIntentHandler

- (void)resolvePhraseForTranslatePhrase:(id)a3 withCompletion:(id)a4
{
}

- (void)resolveTargetLanguageForTranslatePhrase:(id)a3 withCompletion:(id)a4
{
}

- (void)confirmTranslatePhrase:(id)a3 completion:(id)a4
{
}

- (void)handleTranslatePhrase:(id)a3 completion:(id)a4
{
}

- (_TtC22SiriTranslationIntents28TranslatePhraseIntentHandler)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC22SiriTranslationIntents28TranslatePhraseIntentHandler_translationInteraction;
  sub_236FB2320();
  OUTLINED_FUNCTION_4_4();
  (*(void (**)(char *))(v4 + 8))(v3);
  swift_release();
  v5 = (char *)self + OBJC_IVAR____TtC22SiriTranslationIntents28TranslatePhraseIntentHandler_log;
  sub_236FB2800();
  OUTLINED_FUNCTION_4_4();
  (*(void (**)(char *))(v6 + 8))(v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC22SiriTranslationIntents28TranslatePhraseIntentHandler_deviceState);
}

@end