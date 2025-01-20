@interface PAAccessRecordCoalescingWindowRolledOverState
- (NSMutableDictionary)groupedRecordsByMatcher;
- (id)initByEndingPreviousWindow:(id)a3 reversed:(BOOL)a4 withInitialAccessRecord:(id)a5 forNewEpoch:(int64_t)a6;
- (id)recordsToRepublish;
- (int64_t)epoch;
@end

@implementation PAAccessRecordCoalescingWindowRolledOverState

- (id)initByEndingPreviousWindow:(id)a3 reversed:(BOOL)a4 withInitialAccessRecord:(id)a5 forNewEpoch:(int64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PAAccessRecordCoalescingWindowRolledOverState;
  v12 = [(PAAccessRecordCoalescingWindowRolledOverState *)&v23 init];
  if (v12)
  {
    v13 = [v10 groupedRecordsByMatcher];
    uint64_t v14 = [v13 allValues];
    groupedRecordsToRepublish = v12->_groupedRecordsToRepublish;
    v12->_groupedRecordsToRepublish = (NSArray *)v14;

    v12->_reversed = a4;
    v12->_epoch = a6;
    v16 = [v11 access];
    v17 = +[PAAccessMatcher coalescingMatcherForAccess:v16];

    v18 = (void *)MEMORY[0x1E4F1CA60];
    v19 = [MEMORY[0x1E4F1CA48] arrayWithObject:v11];
    uint64_t v20 = [v18 dictionaryWithObject:v19 forKey:v17];
    groupedRecordsByMatcher = v12->_groupedRecordsByMatcher;
    v12->_groupedRecordsByMatcher = (NSMutableDictionary *)v20;
  }
  return v12;
}

- (id)recordsToRepublish
{
  return coalesceGroupedRecordsToRepublish(self->_groupedRecordsToRepublish, self->_reversed);
}

- (int64_t)epoch
{
  return self->_epoch;
}

- (NSMutableDictionary)groupedRecordsByMatcher
{
  return self->_groupedRecordsByMatcher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupedRecordsByMatcher, 0);

  objc_storeStrong((id *)&self->_groupedRecordsToRepublish, 0);
}

@end