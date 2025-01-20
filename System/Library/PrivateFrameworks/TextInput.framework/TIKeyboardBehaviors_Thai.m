@interface TIKeyboardBehaviors_Thai
- (id)keyBehaviorsForState:(id)a3;
@end

@implementation TIKeyboardBehaviors_Thai

- (id)keyBehaviorsForState:(id)a3
{
  id v3 = a3;
  if ([v3 hasAutocorrection])
  {
    if ([v3 isContinuousPathUnderway]) {
      uint64_t v4 = 7;
    }
    else {
      uint64_t v4 = 2;
    }
  }
  else
  {
    uint64_t v4 = 7;
  }
  v5 = +[TIKeyboardKeyBehaviors behaviorForSpaceKey:v4 forReturnKey:0];

  return v5;
}

@end