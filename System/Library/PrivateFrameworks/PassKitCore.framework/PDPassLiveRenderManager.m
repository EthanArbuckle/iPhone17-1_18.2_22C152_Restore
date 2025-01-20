@interface PDPassLiveRenderManager
- (PDPassLiveRenderManager)init;
- (PDPassLiveRenderManager)initWithDatabaseManager:(id)a3 dynamicStateManager:(id)a4;
- (id)liveRenderForPassUniqueID:(id)a3;
- (unint64_t)updateLiveRenderingEnabled:(BOOL)a3 forPassUniqueID:(id)a4;
@end

@implementation PDPassLiveRenderManager

- (PDPassLiveRenderManager)init
{
  return 0;
}

- (PDPassLiveRenderManager)initWithDatabaseManager:(id)a3 dynamicStateManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PDPassLiveRenderManager;
  v9 = [(PDPassLiveRenderManager *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_databaseManager, a3);
    objc_storeStrong((id *)&v10->_dynamicStateManager, a4);
  }

  return v10;
}

- (id)liveRenderForPassUniqueID:(id)a3
{
  id result = a3;
  if (result)
  {
    id v5 = result;
    v6 = [(PDDatabaseManager *)self->_databaseManager passLiveRenderForPassUniqueIdentifier:result];

    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (unint64_t)updateLiveRenderingEnabled:(BOOL)a3 forPassUniqueID:(id)a4
{
  BOOL v4 = a3;
  unint64_t result = (unint64_t)a4;
  if (result)
  {
    id v7 = (void *)result;
    id v8 = [(PDDatabaseManager *)self->_databaseManager insertOrUpdateLiveRenderEnabled:v4 forPassWithUniqueIdentifier:result];
    if (v8)
    {
      [(PDPassDynamicStateManager *)self->_dynamicStateManager setDidUpdateDynamicStateForPassUniqueID:v7];
      unint64_t v9 = 2;
    }
    else
    {
      unint64_t v9 = 1;
    }

    return v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicStateManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

@end