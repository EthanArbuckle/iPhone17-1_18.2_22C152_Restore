@interface WBSHistoryServiceURLCompletionMatchData
- (BOOL)containsBookmark;
- (BOOL)lastVisitWasFailure;
- (BOOL)matchesAutocompleteTrigger:(id)a3 isStrengthened:(BOOL)a4;
- (BOOL)shouldPreload;
- (BOOL)visitWasClientError;
- (NSArray)entries;
- (NSString)originalURLString;
- (WBSHistoryServiceURLCompletionMatchData)init;
- (WBSHistoryServiceURLCompletionMatchData)initWithLastVisitWasFailure:(BOOL)a3 visitWasFromThisDevice:(BOOL)a4 visitWasClientError:(BOOL)a5;
- (WBSHistoryServiceURLCompletionMatchData)initWithStreamData:(void *)a3 entries:(id)a4;
- (_HistoryStreamedMatchData)streamData;
- (double)lastVisitedTimeInterval;
- (float)topSitesScoreForPageTitleAtTime:(double)a3;
- (float)topSitesScoreForURLStringAtIndex:(unint64_t)a3 atTime:(double)a4;
- (id).cxx_construct;
- (id)pageTitleAtIndex:(unint64_t)a3;
- (id)userVisibleURLStringAtIndex:(unint64_t)a3;
- (int64_t)visitCount;
- (int64_t)visitCountScore;
- (int64_t)visitCountScoreForPageTitleAtTime;
- (int64_t)visitCountScoreForURLStringAtIndex:(unint64_t)a3;
- (void)enumeratePageTitlesAndUserVisibleURLsUsingBlock:(id)a3;
- (void)enumeratePageTitlesUsingBlock:(id)a3;
- (void)enumerateUserVisibleURLsUsingBlock:(id)a3;
- (void)setAutocompleteTriggers:(const void *)a3 length:(unint64_t)a4;
- (void)setEntries:(id)a3;
- (void)setLastVisitedTimeInterval:(double)a3;
- (void)setVisitCount:(int64_t)a3;
- (void)setVisitCountScore:(int64_t)a3;
@end

@implementation WBSHistoryServiceURLCompletionMatchData

- (WBSHistoryServiceURLCompletionMatchData)init
{
  return 0;
}

- (WBSHistoryServiceURLCompletionMatchData)initWithLastVisitWasFailure:(BOOL)a3 visitWasFromThisDevice:(BOOL)a4 visitWasClientError:(BOOL)a5
{
  v13.receiver = self;
  v13.super_class = (Class)WBSHistoryServiceURLCompletionMatchData;
  v8 = [(WBSHistoryServiceURLCompletionMatchData *)&v13 init];
  if (v8)
  {
    p_var0 = operator new(0x38uLL);
    p_var0[6] = 0;
    *((_OWORD *)p_var0 + 1) = 0u;
    *((_OWORD *)p_var0 + 2) = 0u;
    *(_OWORD *)p_var0 = 0u;
    value = v8->_streamData.__ptr_.__value_;
    v8->_streamData.__ptr_.__value_ = (_HistoryStreamedMatchData *)p_var0;
    if (value)
    {
      MEMORY[0x1AD0C4750](value, 0x10C0C40CCADEA1DLL);
      p_var0 = &v8->_streamData.__ptr_.__value_->var0;
    }
    void *p_var0 = 0x3800000006;
    *((unsigned char *)p_var0 + 48) = a3;
    *((unsigned char *)p_var0 + 49) = a4;
    *((unsigned char *)p_var0 + 50) = a5;
    v11 = v8;
  }

  return v8;
}

- (WBSHistoryServiceURLCompletionMatchData)initWithStreamData:(void *)a3 entries:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WBSHistoryServiceURLCompletionMatchData;
  v7 = [(WBSHistoryServiceURLCompletionMatchData *)&v14 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    entries = v7->_entries;
    v7->_entries = (NSArray *)v8;

    v10 = *(_HistoryStreamedMatchData **)a3;
    *(void *)a3 = 0;
    value = v7->_streamData.__ptr_.__value_;
    v7->_streamData.__ptr_.__value_ = v10;
    if (value) {
      MEMORY[0x1AD0C4750](value, 0x10C0C40CCADEA1DLL);
    }
    v12 = v7;
  }

  return v7;
}

- (_HistoryStreamedMatchData)streamData
{
  return self->_streamData.__ptr_.__value_;
}

- (BOOL)containsBookmark
{
  return 0;
}

- (BOOL)lastVisitWasFailure
{
  return self->_streamData.__ptr_.__value_->var6 != 0;
}

- (double)lastVisitedTimeInterval
{
  return self->_streamData.__ptr_.__value_->var1;
}

- (void)setLastVisitedTimeInterval:(double)a3
{
  self->_streamData.__ptr_.__value_->var1 = a3;
}

- (int64_t)visitCount
{
  return self->_streamData.__ptr_.__value_->var4;
}

- (int64_t)visitCountScore
{
  return self->_streamData.__ptr_.__value_->var5;
}

- (BOOL)visitWasClientError
{
  return self->_streamData.__ptr_.__value_->var8 != 0;
}

- (BOOL)shouldPreload
{
  return self->_streamData.__ptr_.__value_->var7 != 0;
}

- (void)setVisitCount:(int64_t)a3
{
  self->_streamData.__ptr_.__value_->var4 = a3;
}

- (void)setVisitCountScore:(int64_t)a3
{
  self->_streamData.__ptr_.__value_->var5 = a3;
}

- (void)setAutocompleteTriggers:(const void *)a3 length:(unint64_t)a4
{
  size_t v4 = a4;
  v7 = (_HistoryStreamedMatchData *)operator new(a4 + 56);
  uint64_t v8 = v7;
  value = self->_streamData.__ptr_.__value_;
  long long v11 = *(_OWORD *)&value->var2;
  long long v10 = *(_OWORD *)&value->var4;
  long long v12 = *(_OWORD *)&value->var0.var0;
  *(void *)&v7->var6 = *(void *)&value->var6;
  *(_OWORD *)&v7->var2 = v11;
  *(_OWORD *)&v7->var4 = v10;
  *(_OWORD *)&v7->var0.var0 = v12;
  if (a3)
  {
    objc_super v13 = v7 + 1;
    memcpy(&v7[1], a3, v4);
  }
  else
  {
    objc_super v13 = 0;
    size_t v4 = 0;
  }
  v8->var2 = v13;
  v8->var3 = v4;
  self->_streamData.__ptr_.__value_ = v8;
  JUMPOUT(0x1AD0C4750);
}

- (void)enumeratePageTitlesUsingBlock:(id)a3
{
  size_t v4 = (void (**)(id, void *, void, char *))a3;
  v5 = [(NSArray *)self->_entries firstObject];
  char v8 = 0;
  id v6 = [v5 title];

  if (v6)
  {
    v7 = [v5 title];
    v4[2](v4, v7, 0, &v8);
  }
}

- (id)pageTitleAtIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_entries count])
  {
    size_t v4 = [(NSArray *)self->_entries firstObject];
    v5 = [v4 title];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)enumerateUserVisibleURLsUsingBlock:(id)a3
{
  id v4 = a3;
  entries = self->_entries;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__WBSHistoryServiceURLCompletionMatchData_enumerateUserVisibleURLsUsingBlock___block_invoke;
  v7[3] = &unk_1E5C9D778;
  id v8 = v4;
  id v6 = v4;
  [(NSArray *)entries enumerateObjectsUsingBlock:v7];
}

void __78__WBSHistoryServiceURLCompletionMatchData_enumerateUserVisibleURLsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = [a2 url];
  v7 = objc_msgSend(v8, "safari_userVisibleURL");
  (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v6 + 16))(v6, v7, a3, a4);
}

- (void)enumeratePageTitlesAndUserVisibleURLsUsingBlock:(id)a3
{
  id v4 = a3;
  entries = self->_entries;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __91__WBSHistoryServiceURLCompletionMatchData_enumeratePageTitlesAndUserVisibleURLsUsingBlock___block_invoke;
  v7[3] = &unk_1E5C9D7A0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSArray *)entries enumerateObjectsUsingBlock:v7];
}

void __91__WBSHistoryServiceURLCompletionMatchData_enumeratePageTitlesAndUserVisibleURLsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v12 = a2;
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = [*(id *)(*(void *)(a1 + 32) + 24) firstObject];
  v9 = [v8 title];
  long long v10 = [v12 url];
  long long v11 = objc_msgSend(v10, "safari_userVisibleURL");
  (*(void (**)(uint64_t, void *, void, void *, uint64_t, uint64_t))(v7 + 16))(v7, v9, 0, v11, a3, a4);
}

- (id)userVisibleURLStringAtIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_entries count] <= a3)
  {
    uint64_t v7 = 0;
  }
  else
  {
    v5 = [(NSArray *)self->_entries objectAtIndexedSubscript:a3];
    id v6 = [v5 url];
    uint64_t v7 = objc_msgSend(v6, "safari_userVisibleURL");
  }
  return v7;
}

- (NSString)originalURLString
{
  if ([(NSArray *)self->_entries count])
  {
    v3 = [(NSArray *)self->_entries firstObject];
    id v4 = [v3 url];
  }
  else
  {
    id v4 = 0;
  }
  return (NSString *)v4;
}

- (BOOL)matchesAutocompleteTrigger:(id)a3 isStrengthened:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (self->_streamData.__ptr_.__value_->var2)
  {
    if (!self->_autocompleteTriggersAsStringArray)
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F28F98];
      id v8 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
      v9 = [v7 propertyListWithData:v8 options:0 format:0 error:0];
      autocompleteTriggersAsStringArray = self->_autocompleteTriggersAsStringArray;
      self->_autocompleteTriggersAsStringArray = v9;
    }
    long long v11 = [(WBSHistoryServiceURLCompletionMatchData *)self pageTitleAtIndex:0];
    id v12 = [(WBSHistoryServiceURLCompletionMatchData *)self originalURLString];
    BOOL v13 = +[WBSURLCompletionMatchDataHelpers typedStringMatchesTitleAndURLAutocompleteTriggers:v6 title:v11 urlString:v12 autoCompleteTriggers:self->_autocompleteTriggersAsStringArray isStrengthened:v4];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (float)topSitesScoreForURLStringAtIndex:(unint64_t)a3 atTime:(double)a4
{
  float v6 = 0.0;
  if ([(NSArray *)self->_entries count] > a3)
  {
    uint64_t v7 = [(NSArray *)self->_entries objectAtIndexedSubscript:a3];
    [v7 topSitesScore];
    float v6 = v8;
  }
  return v6;
}

- (float)topSitesScoreForPageTitleAtTime:(double)a3
{
  if (![(NSArray *)self->_entries count]) {
    return 0.0;
  }
  BOOL v4 = [(NSArray *)self->_entries firstObject];
  [v4 topSitesScore];
  float v6 = v5;

  return v6;
}

- (int64_t)visitCountScoreForPageTitleAtTime
{
  if (![(NSArray *)self->_entries count]) {
    return -1;
  }
  v3 = [(NSArray *)self->_entries firstObject];
  int64_t v4 = [v3 visitCountScore];

  return v4;
}

- (int64_t)visitCountScoreForURLStringAtIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_entries count] <= a3) {
    return -1;
  }
  float v5 = [(NSArray *)self->_entries objectAtIndexedSubscript:a3];
  int64_t v6 = [v5 visitCountScore];

  return v6;
}

- (NSArray)entries
{
  return self->_entries;
}

- (void)setEntries:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_autocompleteTriggersAsStringArray, 0);
  value = self->_streamData.__ptr_.__value_;
  self->_streamData.__ptr_.__value_ = 0;
  if (value)
  {
    JUMPOUT(0x1AD0C4750);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end