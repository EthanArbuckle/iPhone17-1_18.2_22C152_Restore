@interface WBSURLCompletionHistorySnapshot
- (WBSURLCompletionHistorySnapshot)init;
- (WBSURLCompletionHistorySnapshot)initWithItems:()unique_ptr<std:(std::default_delete<std::vector<WTF::RefPtr<SafariShared::HistoryURLCompletionItem>>>>)a3 :vector<WTF::RefPtr<SafariShared::HistoryURLCompletionItem>>;
- (id).cxx_construct;
- (id)_matchSnapshotForCompletionMatch:(id)a3;
- (id)fakeBookmarkMatchDataWithURLString:(id)a3 title:(id)a4 shouldPreload:(BOOL)a5;
- (void)getBestMatchesForTypedString:(id)a3 limit:(unint64_t)a4 forQueryID:(int64_t)a5 withSearchParameters:(id)a6 filterResultsUsingProfileIdentifier:(id)a7 completionHandler:(id)a8;
@end

@implementation WBSURLCompletionHistorySnapshot

- (WBSURLCompletionHistorySnapshot)init
{
  return 0;
}

- (WBSURLCompletionHistorySnapshot)initWithItems:()unique_ptr<std:(std::default_delete<std::vector<WTF::RefPtr<SafariShared::HistoryURLCompletionItem>>>>)a3 :vector<WTF::RefPtr<SafariShared::HistoryURLCompletionItem>>
{
  v13.receiver = self;
  v13.super_class = (Class)WBSURLCompletionHistorySnapshot;
  id v4 = [(WBSURLCompletionHistorySnapshot *)&v13 init];
  v5 = (WBSURLCompletionHistorySnapshot *)v4;
  if (v4)
  {
    v6 = *(void ***)a3.__ptr_.__value_;
    *(void *)a3.__ptr_.__value_ = 0;
    std::unique_ptr<std::vector<WTF::RefPtr<SafariShared::HistoryURLCompletionItem,WTF::RawPtrTraits<SafariShared::HistoryURLCompletionItem>,WTF::DefaultRefDerefTraits<SafariShared::HistoryURLCompletionItem>>>>::reset[abi:sn180100]((void ***)v4 + 3, v6);
    v7 = objc_alloc_init(WBSURLCompletionDatabase);
    completionDatabase = v5->_completionDatabase;
    v5->_completionDatabase = v7;

    [(WBSURLCompletionDatabase *)v5->_completionDatabase setDataSource:v5];
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.SafariShared.WBSHistoryURLCompletionSnapshot", 0);
    completionDatabaseQueue = v5->_completionDatabaseQueue;
    v5->_completionDatabaseQueue = (OS_dispatch_queue *)v9;

    v11 = v5;
  }

  return v5;
}

- (id)_matchSnapshotForCompletionMatch:(id)a3
{
  id v3 = a3;
  if ([v3 matchLocation] == 4)
  {
    id v4 = 0;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CB10];
    v6 = [v3 originalURLString];
    v7 = objc_msgSend(v5, "safari_URLWithDataAsString:", v6);

    uint64_t matched = _SSURLCompletionMatchLocationForWBSURLCompletionMatchLocation([v3 matchLocation]);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      dispatch_queue_t v9 = [v3 data];
      v10 = (void *)MEMORY[0x1E4F1C9C8];
      [v9 lastVisitedTimeInterval];
      v11 = objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");
      if (objc_opt_respondsToSelector()) {
        uint64_t v12 = [v9 visitCount];
      }
      else {
        uint64_t v12 = 0;
      }
    }
    else
    {
      uint64_t v12 = 0;
      v11 = 0;
    }
    objc_super v13 = [WBSURLCompletionMatchSnapshot alloc];
    v14 = [v3 title];
    id v4 = -[WBSURLCompletionMatchSnapshot initWithURL:title:matchLocation:isTopHit:isSynthesizedTopHit:isTopHitDueToTriggerMatch:visitCount:lastVisitTime:](v13, "initWithURL:title:matchLocation:isTopHit:isSynthesizedTopHit:isTopHitDueToTriggerMatch:visitCount:lastVisitTime:", v7, v14, matched, [v3 isTopHit], 0, 0, v12, v11);
  }
  return v4;
}

- (void)getBestMatchesForTypedString:(id)a3 limit:(unint64_t)a4 forQueryID:(int64_t)a5 withSearchParameters:(id)a6 filterResultsUsingProfileIdentifier:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  completionDatabaseQueue = self->_completionDatabaseQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __156__WBSURLCompletionHistorySnapshot_getBestMatchesForTypedString_limit_forQueryID_withSearchParameters_filterResultsUsingProfileIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E5CA07C0;
  block[4] = self;
  id v24 = v14;
  unint64_t v28 = a4;
  int64_t v29 = a5;
  id v25 = v16;
  id v26 = v15;
  id v27 = v17;
  id v19 = v17;
  id v20 = v15;
  id v21 = v16;
  id v22 = v14;
  dispatch_async(completionDatabaseQueue, block);
}

void __156__WBSURLCompletionHistorySnapshot_getBestMatchesForTypedString_limit_forQueryID_withSearchParameters_filterResultsUsingProfileIdentifier_completionHandler___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  id v3 = *(void **)(a1[4] + 16);
  id v10 = 0;
  id v11 = 0;
  [v3 getBestMatchesForTypedString:v2 filterResultsUsingProfileIdentifier:a1[6] topHits:&v11 matches:&v10 limit:a1[9] forQueryID:a1[10] withSearchParameters:a1[7]];
  id v4 = v11;
  id v5 = v10;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __156__WBSURLCompletionHistorySnapshot_getBestMatchesForTypedString_limit_forQueryID_withSearchParameters_filterResultsUsingProfileIdentifier_completionHandler___block_invoke_2;
  v9[3] = &unk_1E5C9DAD8;
  v9[4] = a1[4];
  v6 = objc_msgSend(v4, "safari_mapObjectsUsingBlock:", v9);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __156__WBSURLCompletionHistorySnapshot_getBestMatchesForTypedString_limit_forQueryID_withSearchParameters_filterResultsUsingProfileIdentifier_completionHandler___block_invoke_3;
  v8[3] = &unk_1E5C9DAD8;
  v8[4] = a1[4];
  v7 = objc_msgSend(v5, "safari_mapObjectsUsingBlock:", v8);
  (*(void (**)(void))(a1[8] + 16))();
}

id __156__WBSURLCompletionHistorySnapshot_getBestMatchesForTypedString_limit_forQueryID_withSearchParameters_filterResultsUsingProfileIdentifier_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) _matchSnapshotForCompletionMatch:a2];
  return v2;
}

id __156__WBSURLCompletionHistorySnapshot_getBestMatchesForTypedString_limit_forQueryID_withSearchParameters_filterResultsUsingProfileIdentifier_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) _matchSnapshotForCompletionMatch:a2];
  return v2;
}

- (id)fakeBookmarkMatchDataWithURLString:(id)a3 title:(id)a4 shouldPreload:(BOOL)a5
{
  SafariShared::HistoryURLCompletionItem::create((SafariShared::HistoryURLCompletionItem *)a3, (NSString *)a4, (NSString *)1, &v8);
  id v5 = v8;
  v6 = [[WBSHistoryURLCompletionMatchData alloc] initWithCompletionItem:v8];
  if (v5) {
    WTF::ThreadSafeRefCounted<SafariShared::HistoryURLCompletionItem,(WTF::DestructionThread)0>::deref((uint64_t)v5);
  }
  return v6;
}

- (void).cxx_destruct
{
  std::unique_ptr<std::vector<WTF::RefPtr<SafariShared::HistoryURLCompletionItem,WTF::RawPtrTraits<SafariShared::HistoryURLCompletionItem>,WTF::DefaultRefDerefTraits<SafariShared::HistoryURLCompletionItem>>>>::reset[abi:sn180100]((void ***)&self->_items, 0);
  objc_storeStrong((id *)&self->_completionDatabase, 0);
  objc_storeStrong((id *)&self->_completionDatabaseQueue, 0);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  return self;
}

@end