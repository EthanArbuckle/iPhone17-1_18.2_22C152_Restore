@interface PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource
- (BOOL)canSelectReason:(id)a3;
- (NSArray)otherReasons;
- (NSArray)promotedReasons;
- (NSMutableSet)currentlySelectedReasons;
- (PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource)initWithReasons:(id)a3 currentlySelected:(id)a4;
- (id)selectedReasons;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)selectedReasonsCount;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)deselect:(id)a3;
- (void)select:(id)a3;
- (void)setupOtherReasons:(id)a3;
- (void)setupPromotedReasons:(id)a3;
@end

@implementation PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentlySelectedReasons, 0);
  objc_storeStrong((id *)&self->_otherReasons, 0);
  objc_storeStrong((id *)&self->_promotedReasons, 0);
}

- (NSMutableSet)currentlySelectedReasons
{
  return self->_currentlySelectedReasons;
}

- (NSArray)otherReasons
{
  return self->_otherReasons;
}

- (NSArray)promotedReasons
{
  return self->_promotedReasons;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4FB1D08]);
  if ([v7 section])
  {
    if ([v7 section] != 1) {
      PXAssertGetLog();
    }
    v9 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource *)self otherReasons];
  }
  else
  {
    v9 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource *)self promotedReasons];
  }
  v10 = v9;
  v11 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));

  v12 = [v8 textLabel];
  [v12 setText:v11];

  if ([v11 isEqualToString:@"None of These Options"])
  {
    v13 = [MEMORY[0x1E4FB1618] systemRedColor];
    v14 = [v8 textLabel];
    [v14 setTextColor:v13];
  }
  v15 = [v6 indexPathsForSelectedRows];
  if ([v15 containsObject:v7])
  {

LABEL_10:
    [v6 selectRowAtIndexPath:v7 animated:1 scrollPosition:0];
    uint64_t v18 = 3;
    goto LABEL_13;
  }
  v16 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource *)self currentlySelectedReasons];
  int v17 = [v16 containsObject:v11];

  if (v17) {
    goto LABEL_10;
  }
  uint64_t v18 = 0;
LABEL_13:
  [v8 setAccessoryType:v18];
  id v19 = v8;

  return v19;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5 = a3;
  if (a4 == 1)
  {
    id v6 = @"PXInternalPhotosChallengeAdditionalReasonExhaustiveMomentLabelingAllOptions";
  }
  else
  {
    if (a4) {
      PXAssertGetLog();
    }
    id v6 = @"PXInternalPhotosChallengeAdditionalReasonExhaustiveMomentLabelingTopHits";
  }
  id v7 = PXLocalizedStringFromTable(v6, @"PhotosUICore");

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    id v7 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource *)self otherReasons];
  }
  else
  {
    if (a4) {
      PXAssertGetLog();
    }
    id v7 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource *)self promotedReasons];
  }
  id v8 = v7;
  int64_t v9 = [v7 count];

  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (void)deselect:(id)a3
{
  id v4 = a3;
  id v5 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource *)self currentlySelectedReasons];
  [v5 removeObject:v4];
}

- (void)select:(id)a3
{
  id v4 = a3;
  int v5 = [v4 isEqualToString:@"None of These Options"];
  id v6 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource *)self currentlySelectedReasons];
  id v7 = v6;
  if (v5) {
    [v6 removeAllObjects];
  }
  else {
    [v6 removeObject:@"None of These Options"];
  }

  id v8 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource *)self currentlySelectedReasons];
  [v8 addObject:v4];
}

- (BOOL)canSelectReason:(id)a3
{
  int v4 = [a3 isEqualToString:@"None of These Options"];
  int v5 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource *)self currentlySelectedReasons];
  id v6 = v5;
  if (v4) {
    LOBYTE(v7) = [v5 count] == 0;
  }
  else {
    int v7 = [v5 containsObject:@"None of These Options"] ^ 1;
  }

  return v7;
}

- (int64_t)selectedReasonsCount
{
  v2 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource *)self currentlySelectedReasons];
  int64_t v3 = [v2 count];

  return v3;
}

- (id)selectedReasons
{
  v2 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource *)self currentlySelectedReasons];
  int64_t v3 = [v2 allObjects];

  return v3;
}

- (void)setupOtherReasons:(id)a3
{
  int v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithArray:v5];

  [v6 removeObject:@"None of These Options"];
  id v7 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v8 = [v6 sortedArrayUsingSelector:sel_compare_];
  int64_t v9 = (NSArray *)[v7 initWithArray:v8];

  [(NSArray *)v9 addObject:@"None of These Options"];
  otherReasons = self->_otherReasons;
  self->_otherReasons = v9;
}

- (void)setupPromotedReasons:(id)a3
{
  id v6 = a3;
  if ((unint64_t)[v6 count] < 5)
  {
    promotedReasons = self->_promotedReasons;
    self->_promotedReasons = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    objc_msgSend(v6, "subarrayWithRange:", 0, 4);
    int v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    promotedReasons = self->_promotedReasons;
    self->_promotedReasons = v4;
  }
}

- (PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource)initWithReasons:(id)a3 currentlySelected:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource;
  id v8 = [(PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource *)&v11 init];
  int64_t v9 = v8;
  if (v8)
  {
    [(PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource *)v8 setupPromotedReasons:v6];
    [(PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource *)v9 setupOtherReasons:v6];
    objc_storeStrong((id *)&v9->_currentlySelectedReasons, a4);
  }

  return v9;
}

@end