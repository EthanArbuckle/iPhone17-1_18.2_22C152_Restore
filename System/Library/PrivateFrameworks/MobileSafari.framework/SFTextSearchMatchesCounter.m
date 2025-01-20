@interface SFTextSearchMatchesCounter
- (BOOL)canSkipCountingMatchesForQueryString:(id)a3 wordMatchMethod:(int64_t)a4;
- (BOOL)searchTookTooLong;
- (NSOrderedSet)allFoundRanges;
- (NSString)queryString;
- (SFTextSearchMatchesCounter)initWithQueryString:(id)a3 completionHandler:(id)a4;
- (void)finishedSearching;
- (void)foundRange:(id)a3 forSearchString:(id)a4 inDocument:(id)a5;
- (void)invalidate;
- (void)invalidateFoundRange:(id)a3 inDocument:(id)a4;
@end

@implementation SFTextSearchMatchesCounter

- (SFTextSearchMatchesCounter)initWithQueryString:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SFTextSearchMatchesCounter;
  v8 = [(SFTextSearchMatchesCounter *)&v19 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] now];
    startDateOfSearch = v8->_startDateOfSearch;
    v8->_startDateOfSearch = (NSDate *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA70] orderedSet];
    allFoundRanges = v8->_allFoundRanges;
    v8->_allFoundRanges = (NSMutableOrderedSet *)v11;

    v13 = _Block_copy(v7);
    id completionHandler = v8->_completionHandler;
    v8->_id completionHandler = v13;

    uint64_t v15 = [v6 copy];
    queryString = v8->_queryString;
    v8->_queryString = (NSString *)v15;

    v8->_valid = 1;
    v17 = v8;
  }

  return v8;
}

- (BOOL)canSkipCountingMatchesForQueryString:(id)a3 wordMatchMethod:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 2 || self->_valid || [(NSMutableOrderedSet *)self->_allFoundRanges count]) {
    char v7 = 0;
  }
  else {
    char v7 = [v6 hasPrefix:self->_queryString];
  }

  return v7;
}

- (BOOL)searchTookTooLong
{
  endDateOfSearch = self->_endDateOfSearch;
  if (!endDateOfSearch) {
    return 1;
  }
  [(NSDate *)endDateOfSearch timeIntervalSinceDate:self->_startDateOfSearch];
  return v4 > 1.0;
}

- (void)invalidate
{
  self->_valid = 0;
}

- (NSOrderedSet)allFoundRanges
{
  v2 = (void *)[(NSMutableOrderedSet *)self->_allFoundRanges copy];

  return (NSOrderedSet *)v2;
}

- (void)foundRange:(id)a3 forSearchString:(id)a4 inDocument:(id)a5
{
  if (self->_valid) {
    -[NSMutableOrderedSet addObject:](self->_allFoundRanges, "addObject:", a3, a4, a5);
  }
}

- (void)invalidateFoundRange:(id)a3 inDocument:(id)a4
{
  if (self->_valid) {
    -[NSMutableOrderedSet removeObject:](self->_allFoundRanges, "removeObject:", a3, a4);
  }
}

- (void)finishedSearching
{
  v3 = [MEMORY[0x1E4F1C9C8] now];
  endDateOfSearch = self->_endDateOfSearch;
  self->_endDateOfSearch = v3;

  if (self->_valid)
  {
    BOOL v5 = [(SFTextSearchMatchesCounter *)self searchTookTooLong];
    id completionHandler = (void (**)(id, uint64_t))self->_completionHandler;
    if (v5) {
      uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v7 = [(NSMutableOrderedSet *)self->_allFoundRanges count];
    }
    completionHandler[2](completionHandler, v7);
    [(SFTextSearchMatchesCounter *)self invalidate];
  }
}

- (NSString)queryString
{
  return self->_queryString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_endDateOfSearch, 0);
  objc_storeStrong((id *)&self->_startDateOfSearch, 0);
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_allFoundRanges, 0);
}

@end