@interface GenerateSharedLibrarySuggestionsQuestions
@end

@implementation GenerateSharedLibrarySuggestionsQuestions

uint64_t ___GenerateSharedLibrarySuggestionsQuestions_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  v4 = +[PXViewControllerPresenter defaultPresenterWithViewController:v3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = ___GenerateSharedLibrarySuggestionsQuestions_block_invoke_2;
  v8[3] = &unk_1E5DD3158;
  id v9 = v3;
  id v5 = v3;
  PXGenerateSurveyQuestionsWithOptions(0x80000, 50, v4, v8);
  v6 = +[PXUserDefaults standardUserDefaults];
  [v6 setSurveyQuestionsHideDate:0];

  return 1;
}

void ___GenerateSharedLibrarySuggestionsQuestions_block_invoke_2(uint64_t a1, int a2)
{
  if (a2) {
    _PresentAlert(@"Shared Library Suggestion Questions", @"Generated new Photos Challenges questions, available in the For You tab.", *(void **)(a1 + 32));
  }
}

@end