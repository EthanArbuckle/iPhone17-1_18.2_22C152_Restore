@interface ICNoteSearchSnapshot
- (BOOL)includesCannedSuggestionToken;
- (BOOL)integratesSuggestions;
- (BOOL)isCompactSize;
- (ICNoteSearchSnapshot)initWithDiffableDataSource:(id)a3 containerViewMode:(int64_t)a4 collectionView:(id)a5 searchContext:(id)a6;
- (ICNoteSearchSnapshotDelegate)delegate;
- (ICSearchSuggestionsContext)searchContext;
- (NSArray)currentSuggestions;
- (NSDiffableDataSourceSnapshot)currentSnapshot;
- (SearchResults)searchResults;
- (UICollectionView)collectionView;
- (UICollectionViewDiffableDataSource)diffableDataSource;
- (id)currentSnapshotClearingPreviousResults:(BOOL)a3;
- (int64_t)behavior;
- (int64_t)containerViewMode;
- (unint64_t)mode;
- (void)applyAndUpdateHeaders:(BOOL)a3 animated:(BOOL)a4;
- (void)clear;
- (void)insertItems:(id)a3 intoSection:(id)a4 snapshot:(id)a5;
- (void)performBlockAndUpdateHeaders:(BOOL)a3 animated:(BOOL)a4 block:(id)a5;
- (void)prepareSearchWithCannedSuggestionToken:(BOOL)a3;
- (void)setBehavior:(int64_t)a3;
- (void)setCollectionView:(id)a3;
- (void)setContainerViewMode:(int64_t)a3;
- (void)setCurrentSnapshot:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setIncludesCannedSuggestionToken:(BOOL)a3;
- (void)setIsCompactSize:(BOOL)a3;
- (void)setMode:(unint64_t)a3;
- (void)setSearchContext:(id)a3;
- (void)setSearchResults:(id)a3;
- (void)setVisibleSearchSuggestions:(id)a3;
- (void)switchToMode:(unint64_t)a3;
- (void)switchToMode:(unint64_t)a3 force:(BOOL)a4;
- (void)updateHeaderView:(id)a3 forIndexPath:(id)a4;
- (void)updateHeaderView:(id)a3 forIndexPath:(id)a4 usingSnapshot:(id)a5;
- (void)updateWithResults:(id)a3;
@end

@implementation ICNoteSearchSnapshot

- (ICNoteSearchSnapshot)initWithDiffableDataSource:(id)a3 containerViewMode:(int64_t)a4 collectionView:(id)a5 searchContext:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ICNoteSearchSnapshot;
  v14 = [(ICNoteSearchSnapshot *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_diffableDataSource, a3);
    v15->_containerViewMode = a4;
    objc_storeStrong((id *)&v15->_collectionView, a5);
    objc_storeWeak((id *)&v15->_searchContext, v13);
    v15->_mode = +[ICSearchSuggestionsContext supportsSearchSuggestions];
    v15->_includesCannedSuggestionToken = 0;
    uint64_t v16 = [(ICNoteSearchSnapshot *)v15 currentSnapshotClearingPreviousResults:0];
    currentSnapshot = v15->_currentSnapshot;
    v15->_currentSnapshot = (NSDiffableDataSourceSnapshot *)v16;
  }
  return v15;
}

- (BOOL)isCompactSize
{
  v2 = [(ICNoteSearchSnapshot *)self collectionView];
  unsigned __int8 v3 = [v2 ic_hasCompactSize];

  return v3;
}

- (BOOL)integratesSuggestions
{
  unsigned __int8 v3 = [(ICNoteSearchSnapshot *)self isCompactSize];
  unsigned int v4 = +[ICSearchSuggestionsContext supportsSearchSuggestions];
  BOOL result = v3 & v4;
  if ((v3 & 1) == 0)
  {
    if (v4) {
      return [(ICNoteSearchSnapshot *)self containerViewMode] == 0;
    }
  }
  return result;
}

- (NSArray)currentSuggestions
{
  v2 = [(ICNoteSearchSnapshot *)self searchResults];
  unsigned __int8 v3 = [v2 suggestions];
  id v4 = [v3 copy];
  v5 = v4;
  if (!v4) {
    id v4 = &__NSArray0__struct;
  }
  v6 = (NSArray *)v4;

  return v6;
}

- (void)prepareSearchWithCannedSuggestionToken:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(ICNoteSearchSnapshot *)self currentSnapshot];
  CFStringRef v9 = @"ICNoteSearchDataSourceSuggestionsSectionIdentifier";
  v6 = +[NSArray arrayWithObjects:&v9 count:1];
  [v5 deleteSectionsWithIdentifiers:v6];

  [(ICNoteSearchSnapshot *)self applyAndUpdateHeaders:1 animated:0];
  v7 = [(ICNoteSearchSnapshot *)self currentSnapshotClearingPreviousResults:1];
  [(ICNoteSearchSnapshot *)self setCurrentSnapshot:v7];

  [(ICNoteSearchSnapshot *)self setIncludesCannedSuggestionToken:v3];
  v8 = objc_alloc_init(SearchResults);
  [(ICNoteSearchSnapshot *)self setSearchResults:v8];
}

- (id)currentSnapshotClearingPreviousResults:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ICNoteSearchSnapshot *)self diffableDataSource];
  v5 = [v4 snapshot];

  if (v3) {
    [v5 deleteAllItems];
  }

  return v5;
}

- (void)insertItems:(id)a3 intoSection:(id)a4 snapshot:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (![v9 numberOfSections]
    || [v9 indexOfSectionIdentifier:v8] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = v8;
    v10 = +[NSArray arrayWithObjects:&v12 count:1];
    [v9 appendSectionsWithIdentifiers:v10];
  }
  if (v7 && [v7 count])
  {
    id v11 = [v7 copy];
    [v9 appendItemsWithIdentifiers:v11 intoSectionWithIdentifier:v8];
  }
}

- (void)updateWithResults:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v8);
        if ((id)[(ICNoteSearchSnapshot *)self behavior] != (id)1
          || [v9 isMathNote])
        {
          v10 = [(ICNoteSearchSnapshot *)self searchResults];
          [v10 addResult:v9];
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  [(ICNoteSearchSnapshot *)self switchToMode:[(ICNoteSearchSnapshot *)self mode] force:1];
}

- (void)clear
{
  BOOL v3 = [(ICNoteSearchSnapshot *)self currentSnapshotClearingPreviousResults:1];
  [(ICNoteSearchSnapshot *)self setCurrentSnapshot:v3];

  id v4 = objc_alloc_init(SearchResults);
  [(ICNoteSearchSnapshot *)self setSearchResults:v4];

  if ([(ICNoteSearchSnapshot *)self integratesSuggestions])
  {
    id v5 = +[ICSearchSuggestion orderedDefaultSearchSuggestions];
    id v6 = [(ICNoteSearchSnapshot *)self currentSnapshot];
    [(ICNoteSearchSnapshot *)self insertItems:v5 intoSection:@"ICNoteSearchDataSourceSuggestionsSectionIdentifier" snapshot:v6];
  }

  [(ICNoteSearchSnapshot *)self applyAndUpdateHeaders:0 animated:0];
}

- (void)performBlockAndUpdateHeaders:(BOOL)a3 animated:(BOOL)a4 block:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  long long v13 = sub_1000E6300;
  long long v14 = sub_1000E6310;
  id v15 = [(ICNoteSearchSnapshot *)self currentSnapshot];
  id v9 = v8;
  performBlockOnMainThreadAndWait();
  -[ICNoteSearchSnapshot setCurrentSnapshot:](self, "setCurrentSnapshot:", v11[5], _NSConcreteStackBlock, 3221225472, sub_1000E6318, &unk_1006298B0);
  [(ICNoteSearchSnapshot *)self applyAndUpdateHeaders:v6 animated:v5];

  _Block_object_dispose(&v10, 8);
}

- (void)applyAndUpdateHeaders:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(ICNoteSearchSnapshot *)self currentSnapshot];

  if (!v7) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.currentSnapshot != ((void *)0)", "-[ICNoteSearchSnapshot applyAndUpdateHeaders:animated:]", 1, 0, @"Unexpected nil snapshot");
  }
  [(ICNoteSearchSnapshot *)self currentSnapshot];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000E6508;
  v17[3] = &unk_100625F50;
  BOOL v19 = a3;
  v17[4] = self;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = v8;
  id v9 = objc_retainBlock(v17);
  if (v4)
  {
    uint64_t v10 = v16;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    long long v11 = sub_1000E6698;
  }
  else
  {
    uint64_t v10 = v15;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    long long v11 = sub_1000E66F4;
  }
  v10[2] = v11;
  v10[3] = &unk_100625888;
  v10[4] = self;
  id v12 = v8;
  v10[5] = v12;
  v10[6] = v9;
  long long v13 = v9;
  performBlockOnMainThread();

  long long v14 = +[NSNotificationCenter defaultCenter];

  [v14 postNotificationName:ICDataSourceDataUpdateDidRenderNotification object:self];
}

- (void)updateHeaderView:(id)a3 forIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(ICNoteSearchSnapshot *)self diffableDataSource];
  id v8 = [v9 snapshot];
  [(ICNoteSearchSnapshot *)self updateHeaderView:v7 forIndexPath:v6 usingSnapshot:v8];
}

- (void)updateHeaderView:(id)a3 forIndexPath:(id)a4 usingSnapshot:(id)a5
{
  id v24 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 section];
  if ((uint64_t)v10 >= (uint64_t)[v9 numberOfSections])
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICNoteSearchSnapshot updateHeaderView:forIndexPath:usingSnapshot:]", 1, 0, @"Snapshot out of sync with collection view. Asked to update visible header view for section that doesn't exist in snapshot. Asking for section %ld, got %ld sections.", [v8 section], objc_msgSend(v9, "numberOfSections"));
    goto LABEL_19;
  }
  long long v11 = [v9 sectionIdentifiers];
  [v11 objectAtIndexedSubscript:[v8 section]];
  id v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v12 == @"ICNoteSearchDataSourceTopHitsSectionIdentifier")
  {
    if ([v9 indexOfSectionIdentifier:@"ICNoteSearchDataSourceTopHitsSectionIdentifier"] == (id)0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_17;
    }
    uint64_t v16 = +[NSBundle mainBundle];
    long long v14 = [v16 localizedStringForKey:@"Top Hits" value:&stru_10063F3D8 table:0];

    id v17 = [v9 numberOfItemsInSection:@"ICNoteSearchDataSourceTopHitsSectionIdentifier"];
    id v18 = +[NSBundle mainBundle];
    BOOL v19 = v18;
    CFStringRef v20 = @"%lu (Top_Hits) Found";
LABEL_14:
    v22 = [v18 localizedStringForKey:v20 value:&stru_10063F3D8 table:0];
    long long v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v22, v17);

LABEL_15:
    uint64_t v15 = 0;
    goto LABEL_18;
  }
  if (v12 == @"ICNoteSearchDataSourceNoteSectionIdentifier")
  {
    if ([v9 indexOfSectionIdentifier:@"ICNoteSearchDataSourceNoteSectionIdentifier"] == (id)0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_17;
    }
    v21 = +[NSBundle mainBundle];
    long long v14 = [v21 localizedStringForKey:@"Notes" value:&stru_10063F3D8 table:0];

    id v17 = [v9 numberOfItemsInSection:@"ICNoteSearchDataSourceNoteSectionIdentifier"];
    id v18 = +[NSBundle mainBundle];
    BOOL v19 = v18;
    CFStringRef v20 = @"%lu (Notes) Found";
    goto LABEL_14;
  }
  if (v12 == @"ICNoteSearchDataSourceSuggestionsSectionIdentifier")
  {
    if ([v9 indexOfSectionIdentifier:@"ICNoteSearchDataSourceSuggestionsSectionIdentifier"] != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v19 = +[NSBundle mainBundle];
      long long v14 = [v19 localizedStringForKey:@"Suggested" value:&stru_10063F3D8 table:0];
      long long v13 = 0;
      goto LABEL_15;
    }
LABEL_17:
    uint64_t v15 = 0;
    long long v13 = 0;
    long long v14 = 0;
    goto LABEL_18;
  }
  if (v12 != @"ICNoteSearchDataSourceAttachmentSectionIdentifier"
    || [v9 indexOfSectionIdentifier:@"ICNoteSearchDataSourceAttachmentSectionIdentifier"] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    goto LABEL_17;
  }
  if (![(ICNoteSearchSnapshot *)self includesCannedSuggestionToken])
  {
    v23 = +[NSBundle mainBundle];
    long long v14 = [v23 localizedStringForKey:@"Attachments" value:&stru_10063F3D8 table:0];

    id v17 = [v9 numberOfItemsInSection:@"ICNoteSearchDataSourceAttachmentSectionIdentifier"];
    id v18 = +[NSBundle mainBundle];
    BOOL v19 = v18;
    CFStringRef v20 = @"%lu (Attachments) Found";
    goto LABEL_14;
  }
  long long v13 = 0;
  long long v14 = 0;
  uint64_t v15 = 1;
LABEL_18:
  [v24 setHidden:v15];
  [v24 setTitle:v14 detail:v13];

LABEL_19:
}

- (void)switchToMode:(unint64_t)a3
{
}

- (void)switchToMode:(unint64_t)a3 force:(BOOL)a4
{
  if (a4 || self->_mode != a3)
  {
    self->_mode = a3;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000E6C58;
    v4[3] = &unk_1006298D8;
    v4[4] = self;
    v4[5] = a3;
    [(ICNoteSearchSnapshot *)self performBlockAndUpdateHeaders:1 animated:0 block:v4];
  }
}

- (void)setVisibleSearchSuggestions:(id)a3
{
  id v7 = a3;
  if ((id)[(ICNoteSearchSnapshot *)self behavior] != (id)1)
  {
    BOOL v4 = +[NSMutableArray arrayWithArray:v7];
    BOOL v5 = [(ICNoteSearchSnapshot *)self searchResults];
    [v5 setSuggestions:v4];

    id v6 = [(ICNoteSearchSnapshot *)self delegate];
    [v6 searchSnapshotDidUpdateSuggestions:self];
  }
}

- (int64_t)behavior
{
  return self->_behavior;
}

- (void)setBehavior:(int64_t)a3
{
  self->_behavior = a3;
}

- (ICNoteSearchSnapshotDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICNoteSearchSnapshotDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ICSearchSuggestionsContext)searchContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchContext);

  return (ICSearchSuggestionsContext *)WeakRetained;
}

- (void)setSearchContext:(id)a3
{
}

- (NSDiffableDataSourceSnapshot)currentSnapshot
{
  return self->_currentSnapshot;
}

- (void)setCurrentSnapshot:(id)a3
{
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (int64_t)containerViewMode
{
  return self->_containerViewMode;
}

- (void)setContainerViewMode:(int64_t)a3
{
  self->_containerViewMode = a3;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (void)setIsCompactSize:(BOOL)a3
{
  self->_isCompactSize = a3;
}

- (SearchResults)searchResults
{
  return self->_searchResults;
}

- (void)setSearchResults:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (BOOL)includesCannedSuggestionToken
{
  return self->_includesCannedSuggestionToken;
}

- (void)setIncludesCannedSuggestionToken:(BOOL)a3
{
  self->_includesCannedSuggestionToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_currentSnapshot, 0);
  objc_destroyWeak((id *)&self->_searchContext);

  objc_destroyWeak((id *)&self->_delegate);
}

@end