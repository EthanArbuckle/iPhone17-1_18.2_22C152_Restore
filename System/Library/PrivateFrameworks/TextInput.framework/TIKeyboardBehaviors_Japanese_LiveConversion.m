@interface TIKeyboardBehaviors_Japanese_LiveConversion
- (id)keyBehaviorsForState:(id)a3;
@end

@implementation TIKeyboardBehaviors_Japanese_LiveConversion

- (id)keyBehaviorsForState:(id)a3
{
  id v4 = a3;
  if (([v4 hasCandidates] & 1) != 0 || !objc_msgSend(v4, "hasInput"))
  {
    v8.receiver = self;
    v8.super_class = (Class)TIKeyboardBehaviors_Japanese_LiveConversion;
    uint64_t v5 = [(TIKeyboardBehaviors_Japanese *)&v8 keyBehaviorsForState:v4];
  }
  else
  {
    uint64_t v5 = +[TIKeyboardKeyBehaviors behaviorForSpaceKey:7 forReturnKey:10 forTabKey:3];
  }
  v6 = (void *)v5;

  return v6;
}

@end