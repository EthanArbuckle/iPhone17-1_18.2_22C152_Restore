@interface PDBalanceManager
- (BOOL)passTileManager:(id)a3 isRelevantForPass:(id)a4 tileDescriptor:(id)a5 descriptorState:(id)a6;
- (BOOL)passTileManager:(id)a3 wantsUpdateDescriptorStateForPass:(id)a4 tileDescriptor:(id)a5 descriptorState:(id)a6;
- (unint64_t)passTileManager:(id)a3 isTileSupportedForPass:(id)a4 tileDescriptor:(id)a5 descriptorState:(id)a6;
@end

@implementation PDBalanceManager

- (BOOL)passTileManager:(id)a3 isRelevantForPass:(id)a4 tileDescriptor:(id)a5 descriptorState:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  if ([a4 passType] == (id)1)
  {
    v11 = sub_1003D92C4(self, v9, v10);
    v12 = v11;
    if (v11)
    {
      v13 = [v11 title];
      v14 = [v13 valueTypeForeignReference];
      if ([v14 foreignReferenceType] == (id)1)
      {
        BOOL v15 = 1;
      }
      else
      {
        v16 = [v12 body];
        v17 = [v16 valueTypeForeignReference];
        if ([v17 foreignReferenceType] == (id)1)
        {
          BOOL v15 = 1;
        }
        else
        {
          v18 = [v12 footer];
          v19 = [v18 valueTypeForeignReference];
          BOOL v15 = [v19 foreignReferenceType] == (id)1;
        }
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (unint64_t)passTileManager:(id)a3 isTileSupportedForPass:(id)a4 tileDescriptor:(id)a5 descriptorState:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (![(PDBalanceManager *)self passTileManager:a3 isRelevantForPass:v10 tileDescriptor:v11 descriptorState:v12])
  {
    unint64_t v15 = 0;
    goto LABEL_16;
  }
  v13 = [v10 secureElementPass];
  id v14 = [v13 passActivationState];

  if (!v14)
  {
    databaseManager = self->_databaseManager;
    v17 = [v10 uniqueID];
    v18 = [(PDDatabaseManager *)databaseManager paymentBalancesForPassUniqueIdentifier:v17];

    v19 = sub_1003D92C4(self, v11, v12);
    v20 = [v19 title];
    uint64_t v21 = sub_1003D954C((uint64_t)self, v20, v18);

    BOOL v22 = v21 == 1;
    if (v21 != 2)
    {
      v23 = [v19 body];
      unint64_t v15 = sub_1003D954C((uint64_t)self, v23, v18);

      if (v15 == 1)
      {
        BOOL v22 = 1;
      }
      else if (v15 == 2)
      {
        goto LABEL_15;
      }
      v24 = [v19 footer];
      unint64_t v15 = sub_1003D954C((uint64_t)self, v24, v18);

      if (v15 == 1) {
        goto LABEL_14;
      }
      if (v15 == 2) {
        goto LABEL_15;
      }
      if (v22)
      {
LABEL_14:
        unint64_t v15 = 1;
        goto LABEL_15;
      }
    }
    unint64_t v15 = 2;
LABEL_15:

    goto LABEL_16;
  }
  unint64_t v15 = 2;
LABEL_16:

  return v15;
}

- (BOOL)passTileManager:(id)a3 wantsUpdateDescriptorStateForPass:(id)a4 tileDescriptor:(id)a5 descriptorState:(id)a6
{
  return 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_passTileManager);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

@end