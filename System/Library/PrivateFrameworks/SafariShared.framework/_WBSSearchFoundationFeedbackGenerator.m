@interface _WBSSearchFoundationFeedbackGenerator
- (SFRankingFeedback)rankingFeedback;
- (_WBSSearchFoundationFeedbackGenerator)init;
- (void)_commitPreviousSectionIfNecessary;
- (void)didAddItem:(id)a3 hidingOutrankedResults:(id)a4 hidingDuplicateResults:(id)a5;
- (void)didBeginRanking;
- (void)didBeginSectionWithBundleIdentifier:(id)a3;
- (void)didEncounterHiddenIgnoredSiriSuggestedSite:(id)a3;
- (void)didEndRanking;
- (void)removeAllSectionsAndItems;
@end

@implementation _WBSSearchFoundationFeedbackGenerator

- (_WBSSearchFoundationFeedbackGenerator)init
{
  v9.receiver = self;
  v9.super_class = (Class)_WBSSearchFoundationFeedbackGenerator;
  v2 = [(_WBSSearchFoundationFeedbackGenerator *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    sectionRankingFeedbackObjects = v2->_sectionRankingFeedbackObjects;
    v2->_sectionRankingFeedbackObjects = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    currentSectionResultRankingFeedbackObjects = v2->_currentSectionResultRankingFeedbackObjects;
    v2->_currentSectionResultRankingFeedbackObjects = (NSMutableArray *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)didBeginRanking
{
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  rankingStartDate = self->_rankingStartDate;
  self->_rankingStartDate = v3;
}

- (void)didEndRanking
{
  v10[1] = *MEMORY[0x1E4F143B8];
  [(_WBSSearchFoundationFeedbackGenerator *)self _commitPreviousSectionIfNecessary];
  id v3 = objc_alloc(MEMORY[0x1E4F9A318]);
  sectionRankingFeedbackObjects = self->_sectionRankingFeedbackObjects;
  [(NSDate *)self->_rankingStartDate timeIntervalSinceNow];
  v6 = (SFRankingFeedback *)[v3 initWithSections:sectionRankingFeedbackObjects blendingDuration:-v5];
  rankingFeedback = self->_rankingFeedback;
  self->_rankingFeedback = v6;

  if ((objc_opt_respondsToSelector() & 1) != 0 && self->_hiddenIgnoredSiriSuggestedWebsite)
  {
    v10[0] = self->_hiddenIgnoredSiriSuggestedWebsite;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [(SFRankingFeedback *)self->_rankingFeedback setHiddenResults:v8];
  }
  hiddenIgnoredSiriSuggestedWebsite = self->_hiddenIgnoredSiriSuggestedWebsite;
  self->_hiddenIgnoredSiriSuggestedWebsite = 0;
}

- (void)didBeginSectionWithBundleIdentifier:(id)a3
{
  v4 = (NSString *)a3;
  [(_WBSSearchFoundationFeedbackGenerator *)self _commitPreviousSectionIfNecessary];
  currentSectionBundleIdentifier = self->_currentSectionBundleIdentifier;
  self->_currentSectionBundleIdentifier = v4;
}

- (void)didEncounterHiddenIgnoredSiriSuggestedSite:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F9A398]);
    [v5 setHideReason:1];
    [v4 setSafariAttributes:v5];
  }
  hiddenIgnoredSiriSuggestedWebsite = self->_hiddenIgnoredSiriSuggestedWebsite;
  self->_hiddenIgnoredSiriSuggestedWebsite = (SFSearchResult *)v4;
}

- (void)didAddItem:(id)a3 hidingOutrankedResults:(id)a4 hidingDuplicateResults:(id)a5
{
  id v17 = a4;
  id v8 = a5;
  objc_super v9 = [a3 sfSearchResultValue];
  v10 = v9;
  if (v9)
  {
    v11 = (void *)[v9 copy];
    v12 = [v10 sectionBundleIdentifier];
    currentSectionBundleIdentifier = v12;
    if (!v12) {
      currentSectionBundleIdentifier = self->_currentSectionBundleIdentifier;
    }
    [v11 setSectionBundleIdentifier:currentSectionBundleIdentifier];

    v14 = objc_msgSend(v17, "safari_mapObjectsUsingBlock:", &__block_literal_global_0);
    v15 = objc_msgSend(v8, "safari_mapObjectsUsingBlock:", &__block_literal_global_88);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F9A360]), "initWithResult:hiddenResults:duplicateResults:localResultPosition:", v11, v14, v15, -[NSMutableArray count](self->_currentSectionResultRankingFeedbackObjects, "count"));
    if (v16) {
      [(NSMutableArray *)self->_currentSectionResultRankingFeedbackObjects addObject:v16];
    }
  }
}

- (void)removeAllSectionsAndItems
{
  [(NSMutableArray *)self->_sectionRankingFeedbackObjects removeAllObjects];
  [(NSMutableArray *)self->_currentSectionResultRankingFeedbackObjects removeAllObjects];
  currentSectionBundleIdentifier = self->_currentSectionBundleIdentifier;
  self->_currentSectionBundleIdentifier = 0;

  hiddenIgnoredSiriSuggestedWebsite = self->_hiddenIgnoredSiriSuggestedWebsite;
  self->_hiddenIgnoredSiriSuggestedWebsite = 0;
}

- (void)_commitPreviousSectionIfNecessary
{
  currentSectionBundleIdentifier = self->_currentSectionBundleIdentifier;
  if (currentSectionBundleIdentifier)
  {
    objc_super v9 = currentSectionBundleIdentifier;
    id v4 = (void *)[(NSMutableArray *)self->_currentSectionResultRankingFeedbackObjects copy];
    id v5 = self->_currentSectionBundleIdentifier;
    self->_currentSectionBundleIdentifier = 0;

    [(NSMutableArray *)self->_currentSectionResultRankingFeedbackObjects removeAllObjects];
    id v6 = objc_alloc_init(MEMORY[0x1E4F9A368]);
    v7 = v6;
    if (v6)
    {
      [v6 setBundleIdentifier:v9];
      id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F9A3F0]), "initWithResults:section:localSectionPosition:personalizationScore:", v4, v7, -[NSMutableArray count](self->_sectionRankingFeedbackObjects, "count"), 0.0);
      if (v8) {
        [(NSMutableArray *)self->_sectionRankingFeedbackObjects addObject:v8];
      }
    }
  }
}

- (SFRankingFeedback)rankingFeedback
{
  return self->_rankingFeedback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rankingFeedback, 0);
  objc_storeStrong((id *)&self->_hiddenIgnoredSiriSuggestedWebsite, 0);
  objc_storeStrong((id *)&self->_currentSectionResultRankingFeedbackObjects, 0);
  objc_storeStrong((id *)&self->_currentSectionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionRankingFeedbackObjects, 0);
  objc_storeStrong((id *)&self->_rankingStartDate, 0);
}

@end