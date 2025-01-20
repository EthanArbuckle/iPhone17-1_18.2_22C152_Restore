@interface PAAccessRecordCoalescingInWindowState
- (NSMutableDictionary)groupedRecordsByMatcher;
- (PAAccessRecordCoalescingInWindowState)initWithFirstAccessRecord:(id)a3 forEpoch:(int64_t)a4;
- (id)initByContinuingWindow:(id)a3 withAccessRecord:(id)a4;
- (id)recordsToRepublish;
- (int64_t)epoch;
@end

@implementation PAAccessRecordCoalescingInWindowState

- (PAAccessRecordCoalescingInWindowState)initWithFirstAccessRecord:(id)a3 forEpoch:(int64_t)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PAAccessRecordCoalescingInWindowState;
  v7 = [(PAAccessRecordCoalescingInWindowState *)&v16 init];
  v8 = v7;
  if (v7)
  {
    v7->_epoch = a4;
    v9 = [v6 access];
    v10 = +[PAAccessMatcher coalescingMatcherForAccess:v9];

    v11 = (void *)MEMORY[0x1E4F1CA60];
    v12 = [MEMORY[0x1E4F1CA48] arrayWithObject:v6];
    uint64_t v13 = [v11 dictionaryWithObject:v12 forKey:v10];
    groupedRecordsByMatcher = v8->_groupedRecordsByMatcher;
    v8->_groupedRecordsByMatcher = (NSMutableDictionary *)v13;
  }
  return v8;
}

- (id)initByContinuingWindow:(id)a3 withAccessRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PAAccessRecordCoalescingInWindowState;
  v8 = [(PAAccessRecordCoalescingInWindowState *)&v18 init];
  if (v8)
  {
    v8->_epoch = [v6 epoch];
    v9 = [v7 access];
    v10 = +[PAAccessMatcher coalescingMatcherForAccess:v9];

    v11 = [v6 groupedRecordsByMatcher];
    v12 = [v11 objectForKeyedSubscript:v10];

    if (v12)
    {
      [v12 addObject:v7];
    }
    else
    {
      uint64_t v13 = [MEMORY[0x1E4F1CA48] arrayWithObject:v7];
      v14 = [v6 groupedRecordsByMatcher];
      [v14 setObject:v13 forKeyedSubscript:v10];
    }
    uint64_t v15 = [v6 groupedRecordsByMatcher];
    groupedRecordsByMatcher = v8->_groupedRecordsByMatcher;
    v8->_groupedRecordsByMatcher = (NSMutableDictionary *)v15;
  }
  return v8;
}

- (id)recordsToRepublish
{
  return (id)MEMORY[0x1E4F1CBF0];
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
}

@end