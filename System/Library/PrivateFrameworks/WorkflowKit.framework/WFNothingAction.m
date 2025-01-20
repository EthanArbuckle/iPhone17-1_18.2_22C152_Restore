@interface WFNothingAction
- (BOOL)shouldBeSuggestedAfterAction:(id)a3 inWorkflow:(id)a4;
@end

@implementation WFNothingAction

- (BOOL)shouldBeSuggestedAfterAction:(id)a3 inWorkflow:(id)a4
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 outputContentClasses];
    if ([v6 count]) {
      char v7 = 1;
    }
    else {
      char v7 = [v5 inputPassthrough];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

@end