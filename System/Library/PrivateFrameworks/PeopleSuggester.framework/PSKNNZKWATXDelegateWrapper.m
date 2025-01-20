@interface PSKNNZKWATXDelegateWrapper
@end

@implementation PSKNNZKWATXDelegateWrapper

BOOL __79___PSKNNZKWATXDelegateWrapper__getInteractionFilterForPrimaryInteractionsModel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 recipients];
  unint64_t v4 = [v3 count];

  BOOL v5 = v4 >= 2 && [v2 mechanism] == 4;
  return v5;
}

@end