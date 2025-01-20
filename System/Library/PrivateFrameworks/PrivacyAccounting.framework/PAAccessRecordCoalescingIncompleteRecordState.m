@interface PAAccessRecordCoalescingIncompleteRecordState
- (PAAccessRecordCoalescingIncompleteRecordState)initWithPreviousState:(id)a3 recordToRepublish:(id)a4;
- (PAAccessRecordCoalescingState)previousState;
- (id)recordsToRepublish;
@end

@implementation PAAccessRecordCoalescingIncompleteRecordState

- (PAAccessRecordCoalescingIncompleteRecordState)initWithPreviousState:(id)a3 recordToRepublish:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PAAccessRecordCoalescingIncompleteRecordState;
  v9 = [(PAAccessRecordCoalescingIncompleteRecordState *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_previousState, a3);
    objc_storeStrong((id *)&v10->_recordToRepublish, a4);
  }

  return v10;
}

- (id)recordsToRepublish
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self->_recordToRepublish;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (PAAccessRecordCoalescingState)previousState
{
  return self->_previousState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousState, 0);

  objc_storeStrong((id *)&self->_recordToRepublish, 0);
}

@end