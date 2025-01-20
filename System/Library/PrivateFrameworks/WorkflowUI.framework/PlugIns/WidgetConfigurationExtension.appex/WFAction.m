@interface WFAction
- (id)configurableParameters;
@end

@implementation WFAction

- (id)configurableParameters
{
  v2 = [(WFAction *)self visibleParametersWithProcessing:1];
  v3 = objc_msgSend(v2, "if_objectsPassingTest:", &stru_10002D618);

  return v3;
}

@end