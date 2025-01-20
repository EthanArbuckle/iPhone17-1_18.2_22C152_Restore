@interface SBSystemActionSuppressionManagerState
- (BOOL)isEqual:(id)a3;
- (_BYTE)initWithSuppressionStatus:(char)a3 isEligibleForViewObstructionEvents:(char)a4 canUsePocketStateForSuppression:;
@end

@implementation SBSystemActionSuppressionManagerState

- (_BYTE)initWithSuppressionStatus:(char)a3 isEligibleForViewObstructionEvents:(char)a4 canUsePocketStateForSuppression:
{
  id v8 = a2;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)SBSystemActionSuppressionManagerState;
    id v9 = objc_msgSendSuper2(&v11, sel_init);
    a1 = v9;
    if (v9)
    {
      objc_storeStrong((id *)v9 + 2, a2);
      a1[8] = a3;
      a1[9] = a4;
    }
  }

  return a1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBSystemActionSuppressionManagerState *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = v6;
    if (v6->_isEligibleForViewObstructionEvents == self->_isEligibleForViewObstructionEvents
      && v6->_canUsePocketStateForSuppression == self->_canUsePocketStateForSuppression)
    {
      char v8 = BSEqualObjects();
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end