@interface PGStoryPromptSuggestionQuestionFactory
- (PGStoryPromptSuggestionQuestionFactory)init;
- (PGStoryPromptSuggestionQuestionFactory)initWithWorkingContext:(id)a3 questionVersion:(signed __int16)a4;
- (id)generateQuestionsWithLimit:(int64_t)a3 progressBlock:(id)a4;
- (int64_t)questionOptions;
- (unsigned)questionType;
@end

@implementation PGStoryPromptSuggestionQuestionFactory

- (PGStoryPromptSuggestionQuestionFactory)initWithWorkingContext:(id)a3 questionVersion:(signed __int16)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGStoryPromptSuggestionQuestionFactory;
  return [(PGSurveyQuestionFactory *)&v5 initWithWorkingContext:a3 questionVersion:a4];
}

- (unsigned)questionType
{
  return 30;
}

- (int64_t)questionOptions
{
  return 0x10000000;
}

- (id)generateQuestionsWithLimit:(int64_t)a3 progressBlock:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  sub_1D181E8F4(a3, v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD49378);
  v8 = (void *)sub_1D1EBE190();
  swift_bridgeObjectRelease();
  return v8;
}

- (PGStoryPromptSuggestionQuestionFactory)init
{
  result = (PGStoryPromptSuggestionQuestionFactory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end