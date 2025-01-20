@interface PAAccessRecordCoalescingDoneState
- (id)initByEndingLastWindow:(id)a3 reversed:(BOOL)a4;
- (id)recordsToRepublish;
@end

@implementation PAAccessRecordCoalescingDoneState

- (id)initByEndingLastWindow:(id)a3 reversed:(BOOL)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PAAccessRecordCoalescingDoneState;
  v7 = [(PAAccessRecordCoalescingDoneState *)&v12 init];
  if (v7)
  {
    if ([v6 conformsToProtocol:&unk_1EFF85260])
    {
      v8 = [v6 groupedRecordsByMatcher];
      uint64_t v9 = [v8 allValues];
      groupedRecordsToRepublish = v7->_groupedRecordsToRepublish;
      v7->_groupedRecordsToRepublish = (NSArray *)v9;
    }
    else
    {
      v8 = v7->_groupedRecordsToRepublish;
      v7->_groupedRecordsToRepublish = (NSArray *)MEMORY[0x1E4F1CBF0];
    }

    v7->_reversed = a4;
  }

  return v7;
}

- (id)recordsToRepublish
{
  return coalesceGroupedRecordsToRepublish(self->_groupedRecordsToRepublish, self->_reversed);
}

- (void).cxx_destruct
{
}

@end