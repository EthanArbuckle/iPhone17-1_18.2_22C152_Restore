@interface PXSurveyQuestionsDataSource
- (BOOL)didAnswerQuestionForGadgetIdentifier:(id)a3;
- (NSPredicate)predicate;
- (PHPhotoLibrary)photoLibrary;
- (PXSurveyQuestionsDataSource)init;
- (PXSurveyQuestionsDataSource)initWithPhotoLibrary:(id)a3 predicate:(id)a4;
- (id)_fetchOptionsForShouldPrefetchCount:(BOOL)a3;
- (id)fetchSortedAllUnansweredQuestionsWithLimit:(unint64_t)a3;
- (id)mostRecentQuestionCreationDate;
- (unint64_t)fetchTotalNumberOfAnsweredYesOrNoQuestions;
- (unint64_t)fetchTotalNumberOfUnansweredQuestions;
- (unint64_t)numberOfQuestionsRemainingToBeAnswered;
- (void)didGenerateNumberOfGadgets:(unint64_t)a3;
- (void)invalidateQuestions:(id)a3;
- (void)resetGeneratedQuestions;
@end

@implementation PXSurveyQuestionsDataSource

- (id)mostRecentQuestionCreationDate
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v2 = [(PXSurveyQuestionsDataSource *)self _fetchOptionsForShouldPrefetchCount:0];
  v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v10[0] = v3;
  v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
  v10[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  [v2 setSortDescriptors:v5];

  [v2 setFetchLimit:1];
  v6 = [MEMORY[0x1E4F39250] fetchQuestionsWithOptions:v2 validQuestionsOnly:0];
  v7 = [v6 firstObject];

  v8 = [v7 creationDate];

  return v8;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXSurveyQuestionsDataSource)initWithPhotoLibrary:(id)a3 predicate:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXSurveyQuestionsDataSource.m", 39, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)PXSurveyQuestionsDataSource;
  v10 = [(PXSurveyQuestionsDataSource *)&v18 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_photoLibrary, a3);
    uint64_t v12 = [v9 copy];
    predicate = v11->_predicate;
    v11->_predicate = (NSPredicate *)v12;

    v11->_numberOfQuestionsGenerated = 0;
    uint64_t v14 = [MEMORY[0x1E4F1CA80] set];
    answeredGadgetIdentifiers = v11->_answeredGadgetIdentifiers;
    v11->_answeredGadgetIdentifiers = (NSMutableSet *)v14;
  }
  return v11;
}

- (id)_fetchOptionsForShouldPrefetchCount:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  [v5 setPredicate:self->_predicate];
  [v5 setShouldPrefetchCount:v3];
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_answeredGadgetIdentifiers, 0);
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)invalidateQuestions:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    photoLibrary = self->_photoLibrary;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51__PXSurveyQuestionsDataSource_invalidateQuestions___block_invoke;
    v6[3] = &unk_1E5DD36F8;
    id v7 = v4;
    [(PHPhotoLibrary *)photoLibrary performChangesAndWait:v6 error:0];
  }
}

void __51__PXSurveyQuestionsDataSource_invalidateQuestions___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        v6 = objc_msgSend(MEMORY[0x1E4F39258], "changeRequestForQuestion:", *(void *)(*((void *)&v7 + 1) + 8 * v5), (void)v7);
        [v6 setState:4];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (unint64_t)fetchTotalNumberOfAnsweredYesOrNoQuestions
{
  uint64_t v2 = [(PXSurveyQuestionsDataSource *)self _fetchOptionsForShouldPrefetchCount:1];
  uint64_t v3 = [MEMORY[0x1E4F39250] fetchAnsweredYesOrNoQuestionsWithOptions:v2 validQuestionsOnly:0];
  unint64_t v4 = [v3 count];

  return v4;
}

- (unint64_t)fetchTotalNumberOfUnansweredQuestions
{
  uint64_t v2 = [(PXSurveyQuestionsDataSource *)self _fetchOptionsForShouldPrefetchCount:1];
  uint64_t v3 = [MEMORY[0x1E4F39250] fetchUnansweredQuestionsWithOptions:v2 validQuestionsOnly:0];
  unint64_t v4 = [v3 count];

  return v4;
}

- (id)fetchSortedAllUnansweredQuestionsWithLimit:(unint64_t)a3
{
  v41[2] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (_os_feature_enabled_impl())
  {
    v6 = [(PXSurveyQuestionsDataSource *)self _fetchOptionsForShouldPrefetchCount:0];
    long long v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"type", 30);
    [v6 setPredicate:v7];

    long long v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"score" ascending:0];
    v41[0] = v8;
    long long v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
    v41[1] = v9;
    long long v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
    [v6 setSortDescriptors:v10];

    [v6 setFetchLimit:a3];
    v11 = [MEMORY[0x1E4F39250] fetchUnansweredQuestionsWithOptions:v6 validQuestionsOnly:0];
    uint64_t v12 = [v11 fetchedObjects];
    [v5 addObjectsFromArray:v12];

    a3 -= [v11 count];
    if (!a3) {
      goto LABEL_7;
    }
  }
  v6 = [(PXSurveyQuestionsDataSource *)self _fetchOptionsForShouldPrefetchCount:0];
  v13 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d OR %K == %d", @"type", 20, @"type", 23);
  [v6 setPredicate:v13];

  uint64_t v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v40[0] = v14;
  v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"score" ascending:0];
  v40[1] = v15;
  v16 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
  v40[2] = v16;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:3];
  objc_super v18 = v17 = self;
  [v6 setSortDescriptors:v18];

  [v6 setFetchLimit:a3];
  v11 = [MEMORY[0x1E4F39250] fetchUnansweredQuestionsWithOptions:v6 validQuestionsOnly:0];
  v19 = [v11 fetchedObjects];
  [v5 addObjectsFromArray:v19];

  uint64_t v20 = [v11 count];
  if (a3 == v20)
  {
    self = v17;
  }
  else
  {
    v36 = v17;
    unint64_t v34 = a3 - v20;
    v21 = [(PXSurveyQuestionsDataSource *)v17 _fetchOptionsForShouldPrefetchCount:0];

    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v35 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d AND %K != %d", @"type", 20, @"type", 23);
    [v22 addObject:v35];
    v23 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"type", 30);
    [v22 addObject:v23];
    v24 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v22];
    [v21 setPredicate:v24];

    v25 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
    v39[0] = v25;
    [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"score" ascending:0];
    v27 = v26 = v5;
    v39[1] = v27;
    v28 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
    v39[2] = v28;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:3];
    [v21 setSortDescriptors:v29];

    id v5 = v26;
    [v21 setFetchLimit:v34];
    v30 = [MEMORY[0x1E4F39250] fetchUnansweredQuestionsWithOptions:v21 validQuestionsOnly:0];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __74__PXSurveyQuestionsDataSource_fetchSortedAllUnansweredQuestionsWithLimit___block_invoke;
    v37[3] = &unk_1E5DAF5E8;
    id v38 = v26;
    [v30 enumerateObjectsUsingBlock:v37];

    v6 = v21;
    self = v36;
  }
LABEL_7:
  id v31 = objc_alloc(MEMORY[0x1E4F39150]);
  v32 = (void *)[v31 initWithObjects:v5 photoLibrary:self->_photoLibrary fetchType:*MEMORY[0x1E4F39678] fetchPropertySets:0 identifier:0 registerIfNeeded:0];

  return v32;
}

void __74__PXSurveyQuestionsDataSource_fetchSortedAllUnansweredQuestionsWithLimit___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] != 30 || _os_feature_enabled_impl()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (unint64_t)numberOfQuestionsRemainingToBeAnswered
{
  unint64_t numberOfQuestionsGenerated = self->_numberOfQuestionsGenerated;
  return numberOfQuestionsGenerated - [(NSMutableSet *)self->_answeredGadgetIdentifiers count];
}

- (BOOL)didAnswerQuestionForGadgetIdentifier:(id)a3
{
  id v4 = a3;
  char v5 = [(NSMutableSet *)self->_answeredGadgetIdentifiers containsObject:v4];
  if ((v5 & 1) == 0) {
    [(NSMutableSet *)self->_answeredGadgetIdentifiers addObject:v4];
  }

  return v5 ^ 1;
}

- (void)didGenerateNumberOfGadgets:(unint64_t)a3
{
  self->_numberOfQuestionsGenerated += a3;
}

- (void)resetGeneratedQuestions
{
  self->_unint64_t numberOfQuestionsGenerated = 0;
  id v3 = [MEMORY[0x1E4F1CA80] set];
  answeredGadgetIdentifiers = self->_answeredGadgetIdentifiers;
  self->_answeredGadgetIdentifiers = v3;
}

- (PXSurveyQuestionsDataSource)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSurveyQuestionsDataSource.m", 35, @"%s is not available as initializer", "-[PXSurveyQuestionsDataSource init]");

  abort();
}

@end