@interface THSearchTableViewDataSource
- (BOOL)indexPathCorrespondsToSearchResultRow:(id)a3;
- (BOOL)indexPathCorrespondsToSeeAllResultsRow:(id)a3;
- (BOOL)p_onlyTopResults;
- (BOOL)showMediaResults;
- (BOOL)showTextResults;
- (NSArray)suggestions;
- (THSearchController)searchController;
- (THSearchTableViewDataSource)initWithSearchController:(id)a3 searchViewMode:(int)a4;
- (id)p_resultsForSection:(int64_t)a3;
- (id)p_resultsForSection:(int64_t)a3 onlyTop:(BOOL)a4;
- (id)searchResultForTableIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 searchViewController:(id)a5;
- (id)titleForHeaderInSection:(int64_t)a3;
- (int)p_resultKindForSection:(int64_t)a3;
- (int)searchViewMode;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)p_numberOfSections;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)numberOfResultsInSection:(int64_t)a3;
- (void)setSuggestions:(id)a3;
- (void)updateForResultsKind:(int)a3;
@end

@implementation THSearchTableViewDataSource

- (THSearchTableViewDataSource)initWithSearchController:(id)a3 searchViewMode:(int)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)THSearchTableViewDataSource;
  v8 = [(THSearchTableViewDataSource *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_searchController, a3);
    v9->_searchViewMode = a4;
    *(_WORD *)&v9->_showTextResults = 257;
  }

  return v9;
}

- (void)updateForResultsKind:(int)a3
{
  if (a3)
  {
    if (a3 != 1) {
      return;
    }
    BOOL v3 = 0;
    BOOL v4 = 1;
  }
  else
  {
    BOOL v4 = 0;
    BOOL v3 = 1;
  }
  self->_showTextResults = v3;
  self->_showMediaResults = v4;
}

- (int64_t)p_numberOfSections
{
  if ([(THSearchTableViewDataSource *)self searchViewMode] == 2) {
    return self->_showMediaResults + (unint64_t)self->_showTextResults;
  }
  else {
    return 1;
  }
}

- (BOOL)p_onlyTopResults
{
  return self->_showTextResults && self->_showMediaResults;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(THSearchTableViewDataSource *)self p_numberOfSections];
}

- (int)p_resultKindForSection:(int64_t)a3
{
  return a3 || !self->_showTextResults;
}

- (id)p_resultsForSection:(int64_t)a3 onlyTop:(BOOL)a4
{
  unsigned int v7 = [(THSearchTableViewDataSource *)self searchViewMode];
  if (v7 == 2)
  {
    unsigned int v14 = [(THSearchTableViewDataSource *)self p_resultKindForSection:a3];
    if (v14 == 1)
    {
      v18 = [(THSearchTableViewDataSource *)self searchController];
      v16 = v18;
      if (a4) {
        [v18 topMediaSearchResults];
      }
      else {
        [v18 mediaSearchResults];
      }
    }
    else
    {
      if (v14) {
        goto LABEL_13;
      }
      v15 = [(THSearchTableViewDataSource *)self searchController];
      v16 = v15;
      if (a4) {
        [v15 topTextSearchResults];
      }
      else {
        [v15 textSearchResults];
      }
    uint64_t v17 = };
    v8 = (void *)v17;

    goto LABEL_19;
  }
  if (v7 == 1)
  {
    v8 = [(THSearchTableViewDataSource *)self suggestions];
    goto LABEL_19;
  }
  if (v7)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_19;
  }
  v8 = +[NSMutableArray array];
  v9 = [(THSearchTableViewDataSource *)self searchController];
  v10 = (char *)[v9 recentSearchCount];

  if ((uint64_t)v10 >= 1)
  {
    for (i = 0; i != v10; ++i)
    {
      v12 = [(THSearchTableViewDataSource *)self searchController];
      v13 = [v12 recentSearchQueryAtIndex:i];
      [v8 addObject:v13];
    }
  }
LABEL_19:

  return v8;
}

- (id)p_resultsForSection:(int64_t)a3
{
  BOOL v5 = [(THSearchTableViewDataSource *)self p_onlyTopResults];

  return [(THSearchTableViewDataSource *)self p_resultsForSection:a3 onlyTop:v5];
}

- (unint64_t)numberOfResultsInSection:(int64_t)a3
{
  BOOL v3 = [(THSearchTableViewDataSource *)self p_resultsForSection:a3];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (id)titleForHeaderInSection:(int64_t)a3
{
  unsigned int v5 = [(THSearchTableViewDataSource *)self searchViewMode];
  if (v5 == 2)
  {
    unsigned int v9 = [(THSearchTableViewDataSource *)self p_resultKindForSection:a3];
    if (v9 == 1)
    {
      v6 = THBundle();
      unsigned int v7 = v6;
      CFStringRef v8 = @"Media";
      goto LABEL_11;
    }
    if (!v9)
    {
      v6 = THBundle();
      unsigned int v7 = v6;
      CFStringRef v8 = @"Text";
      goto LABEL_11;
    }
LABEL_8:
    v10 = 0;
    goto LABEL_12;
  }
  if (v5 == 1)
  {
    v6 = THBundle();
    unsigned int v7 = v6;
    CFStringRef v8 = @"Suggestions";
    goto LABEL_11;
  }
  if (v5) {
    goto LABEL_8;
  }
  v6 = THBundle();
  unsigned int v7 = v6;
  CFStringRef v8 = @"Recent Searches";
LABEL_11:
  v10 = [v6 localizedStringForKey:v8 value:&stru_46D7E8 table:0];

LABEL_12:

  return v10;
}

- (id)searchResultForTableIndexPath:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[THSearchTableViewDataSource p_resultsForSection:](self, "p_resultsForSection:", [v4 section]);
  id v6 = [v5 count];

  if ((uint64_t)[v4 row] >= (uint64_t)v6)
  {
    CFStringRef v8 = 0;
  }
  else
  {
    unsigned int v7 = -[THSearchTableViewDataSource p_resultsForSection:](self, "p_resultsForSection:", [v4 section]);
    CFStringRef v8 = [v7 objectAtIndex:[v4 row]];
  }

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = [(THSearchTableViewDataSource *)self searchController];
  unsigned int v7 = [(THSearchTableViewDataSource *)self searchViewMode];
  if (v7 == 2)
  {
    unint64_t v9 = [(THSearchTableViewDataSource *)self numberOfResultsInSection:a4];
    v10 = [(THSearchTableViewDataSource *)self p_resultsForSection:a4 onlyTop:0];
    id v11 = [v10 count];

    unsigned int v12 = [(THSearchTableViewDataSource *)self p_onlyTopResults];
    if (v9) {
      BOOL v13 = v9 >= (unint64_t)v11;
    }
    else {
      BOOL v13 = 0;
    }
    if (v13) {
      unsigned int v14 = (void *)v9;
    }
    else {
      unsigned int v14 = (void *)(v9 + 1);
    }
    if (v12) {
      id v8 = v14;
    }
    else {
      id v8 = (id)v9;
    }
  }
  else if (v7 == 1)
  {
    v15 = [(THSearchTableViewDataSource *)self suggestions];
    id v8 = [v15 count];
  }
  else if (v7)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = [v6 recentSearchCount];
  }

  return (int64_t)v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v4 = objc_alloc_init((Class)UITableViewCell);

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 searchViewController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(THSearchTableViewDataSource *)self searchController];
  unsigned int v12 = [(THSearchTableViewDataSource *)self searchViewMode];
  switch(v12)
  {
    case 2u:
      unsigned int v14 = -[THSearchTableViewDataSource p_resultsForSection:](self, "p_resultsForSection:", [v9 section]);
      id v15 = [v14 count];

      BOOL v13 = [(THSearchTableViewDataSource *)self searchResultForTableIndexPath:v9];
      if (v13)
      {
        uint64_t v16 = [v10 tableView:v8 cellForSearchResult:v13];
      }
      else
      {
        uint64_t v25 = -[THSearchTableViewDataSource p_resultKindForSection:](self, "p_resultKindForSection:", [v9 section]);
        if (v15)
        {
          v26 = -[THSearchTableViewDataSource p_resultsForSection:onlyTop:](self, "p_resultsForSection:onlyTop:", [v9 section], 0);
          id v27 = [v26 count];

          [v10 tableView:v8 seeAllResultsCellWithKind:v25 count:v27];
        }
        else
        {
          [v10 tableView:v8 noResultsCellWithKind:v25];
        uint64_t v16 = };
      }
      goto LABEL_10;
    case 1u:
      uint64_t v17 = [(THSearchTableViewDataSource *)self suggestions];
      BOOL v13 = [v17 objectAtIndex:[v9 row]];

      if ([v11 isEncodedResultForPageNumber:v13])
      {
        v18 = [v11 displayNumberStringFromEncodedPageNumberResult:v13];
        v19 = THBundle();
        v20 = [v19 localizedStringForKey:@"Page %@" value:&stru_46D7E8 table:0];

        uint64_t v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v18);

        BOOL v13 = (void *)v21;
      }
      goto LABEL_9;
    case 0u:
      BOOL v13 = [v11 recentSearchQueryAtIndex:[v9 row]];
LABEL_9:
      uint64_t v16 = [v10 tableView:v8 cellForPlainString:v13];
LABEL_10:
      v22 = (void *)v16;

      goto LABEL_12;
  }
  v22 = 0;
LABEL_12:
  v23 = [v8 backgroundColor];
  [v22 setBackgroundColor:v23];

  return v22;
}

- (BOOL)indexPathCorrespondsToSeeAllResultsRow:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[THSearchTableViewDataSource p_resultsForSection:](self, "p_resultsForSection:", [v4 section]);
  id v6 = [v5 count];

  if ((uint64_t)[v4 row] >= (uint64_t)v6)
  {
    BOOL v8 = 1;
  }
  else
  {
    unsigned int v7 = [(THSearchTableViewDataSource *)self searchResultForTableIndexPath:v4];

    BOOL v8 = v7 == 0;
  }
  if (v6) {
    BOOL v9 = v8;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)indexPathCorrespondsToSearchResultRow:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[THSearchTableViewDataSource p_resultsForSection:](self, "p_resultsForSection:", [v4 section]);
  id v6 = [v5 count];

  if ((uint64_t)[v4 row] >= (uint64_t)v6)
  {
    BOOL v8 = 0;
  }
  else
  {
    unsigned int v7 = [(THSearchTableViewDataSource *)self searchResultForTableIndexPath:v4];

    BOOL v8 = v7 != 0;
  }

  return v8;
}

- (THSearchController)searchController
{
  return self->_searchController;
}

- (int)searchViewMode
{
  return self->_searchViewMode;
}

- (BOOL)showTextResults
{
  return self->_showTextResults;
}

- (BOOL)showMediaResults
{
  return self->_showMediaResults;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (void)setSuggestions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestions, 0);

  objc_storeStrong((id *)&self->_searchController, 0);
}

@end