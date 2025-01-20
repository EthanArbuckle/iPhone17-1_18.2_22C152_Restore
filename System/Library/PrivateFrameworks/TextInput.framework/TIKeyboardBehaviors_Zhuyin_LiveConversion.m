@interface TIKeyboardBehaviors_Zhuyin_LiveConversion
- (id)keyBehaviorsForState:(id)a3;
@end

@implementation TIKeyboardBehaviors_Zhuyin_LiveConversion

- (id)keyBehaviorsForState:(id)a3
{
  id v3 = a3;
  if ([v3 hasInput])
  {
    if ([v3 followsZhuyin])
    {
      uint64_t v4 = 100;
      uint64_t v5 = 2;
LABEL_17:
      uint64_t v9 = +[TIKeyboardKeyBehaviors behaviorForSpaceKey:v4 forReturnKey:v5];
      goto LABEL_18;
    }
    if ([v3 hasCandidateSelected]) {
      uint64_t v8 = 4;
    }
    else {
      uint64_t v8 = 12;
    }
    if ([v3 hasCandidateSelected]) {
      uint64_t v7 = 4;
    }
    else {
      uint64_t v7 = 3;
    }
    uint64_t v6 = v8;
  }
  else
  {
    if (![v3 hasCandidates])
    {
      v10 = 0;
      goto LABEL_19;
    }
    if (![v3 hasCandidateSelected])
    {
      uint64_t v4 = 7;
      uint64_t v5 = 9;
      goto LABEL_17;
    }
    uint64_t v6 = 4;
    uint64_t v7 = 4;
  }
  uint64_t v9 = +[TIKeyboardKeyBehaviors behaviorForSpaceKey:v6 forReturnKey:2 forTabKey:v7];
LABEL_18:
  v10 = (void *)v9;
LABEL_19:

  return v10;
}

@end