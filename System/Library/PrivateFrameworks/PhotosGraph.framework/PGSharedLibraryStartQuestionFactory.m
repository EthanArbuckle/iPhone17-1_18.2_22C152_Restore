@interface PGSharedLibraryStartQuestionFactory
- (id)existingQuestion;
- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4;
- (int64_t)questionOptions;
- (unsigned)questionType;
@end

@implementation PGSharedLibraryStartQuestionFactory

- (id)existingQuestion
{
  v3 = [(PGSurveyQuestionFactory *)self workingContext];
  v4 = [v3 photoLibrary];
  v5 = [v4 librarySpecificFetchOptions];

  [v5 setFetchLimit:1];
  v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"type = %d AND entityType = %d", -[PGSharedLibraryStartQuestionFactory questionType](self, "questionType"), 4);
  [v5 setPredicate:v6];

  v7 = [MEMORY[0x1E4F39250] fetchQuestionsWithOptions:v5 validQuestionsOnly:0];
  v8 = [v7 firstObject];

  return v8;
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v4 = [(PGSharedLibraryStartQuestionFactory *)self existingQuestion];
    if (v4)
    {
      v5 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      v6 = objc_alloc_init(PGSharedLibraryStartQuestion);
      v8[0] = v6;
      v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

- (int64_t)questionOptions
{
  return 0x100000;
}

- (unsigned)questionType
{
  return 21;
}

@end