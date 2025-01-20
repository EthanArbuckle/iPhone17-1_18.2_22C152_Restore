@interface TIKeyboardBehaviors_Japanese
- (id)keyBehaviorsForState:(id)a3;
@end

@implementation TIKeyboardBehaviors_Japanese

- (id)keyBehaviorsForState:(id)a3
{
  id v3 = a3;
  if ([v3 hasCandidates])
  {
    if ([v3 followsIncompleteRomaji])
    {
      uint64_t v4 = 12;
    }
    else if ([v3 hasInput])
    {
      uint64_t v4 = 4;
    }
    else
    {
      uint64_t v4 = 11;
    }
    if ([v3 hasCandidateSelected])
    {
      uint64_t v7 = 2;
    }
    else if ([v3 hasInput])
    {
      uint64_t v7 = 10;
    }
    else
    {
      uint64_t v7 = 9;
    }
    if ([v3 hasInput]) {
      uint64_t v9 = 4;
    }
    else {
      uint64_t v9 = 1;
    }
    uint64_t v8 = +[TIKeyboardKeyBehaviors behaviorForSpaceKey:v4 forReturnKey:v7 forTabKey:v9];
  }
  else
  {
    if ([v3 hasInput])
    {
      uint64_t v5 = 8;
      uint64_t v6 = 10;
    }
    else
    {
      uint64_t v5 = 11;
      uint64_t v6 = 0;
    }
    uint64_t v8 = +[TIKeyboardKeyBehaviors behaviorForSpaceKey:v5 forReturnKey:v6];
  }
  v10 = (void *)v8;

  return v10;
}

@end