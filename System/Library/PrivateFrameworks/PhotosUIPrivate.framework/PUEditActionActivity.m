@interface PUEditActionActivity
+ (int64_t)activityCategory;
- (BOOL)_isDisabled;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (BOOL)disablesInsteadOfHides;
- (NSString)actionName;
- (NSString)internalActivityType;
- (NSString)systemImageName;
- (PUEditActionActivity)initWithActionName:(id)a3 activityType:(id)a4 systemImageName:(id)a5;
- (id)activityBlock;
- (id)activityTitle;
- (id)activityType;
- (id)canPerformActivityActionHandler;
- (id)performActivityActionHandler;
- (void)performActivity;
- (void)setActionName:(id)a3;
- (void)setActivityBlock:(id)a3;
- (void)setCanPerformActivityActionHandler:(id)a3;
- (void)setDisablesInsteadOfHides:(BOOL)a3;
- (void)setInternalActivityType:(id)a3;
- (void)setPerformActivityActionHandler:(id)a3;
- (void)setSystemImageName:(id)a3;
@end

@implementation PUEditActionActivity

- (void).cxx_destruct
{
  objc_storeStrong(&self->_activityBlock, 0);
  objc_storeStrong((id *)&self->_internalActivityType, 0);
  objc_storeStrong(&self->_canPerformActivityActionHandler, 0);
  objc_storeStrong(&self->_performActivityActionHandler, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_actionName, 0);
}

- (void)setActivityBlock:(id)a3
{
}

- (id)activityBlock
{
  return self->_activityBlock;
}

- (void)setInternalActivityType:(id)a3
{
}

- (NSString)internalActivityType
{
  return self->_internalActivityType;
}

- (void)setCanPerformActivityActionHandler:(id)a3
{
}

- (id)canPerformActivityActionHandler
{
  return self->_canPerformActivityActionHandler;
}

- (void)setPerformActivityActionHandler:(id)a3
{
}

- (id)performActivityActionHandler
{
  return self->_performActivityActionHandler;
}

- (void)setDisablesInsteadOfHides:(BOOL)a3
{
  self->_disablesInsteadOfHides = a3;
}

- (BOOL)disablesInsteadOfHides
{
  return self->_disablesInsteadOfHides;
}

- (void)setSystemImageName:(id)a3
{
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (void)setActionName:(id)a3
{
}

- (NSString)actionName
{
  return self->_actionName;
}

- (void)performActivity
{
  v3 = [(PUEditActionActivity *)self performActivityActionHandler];

  if (v3)
  {
    v4 = [(PUEditActionActivity *)self performActivityActionHandler];
    ((void (**)(void, PUEditActionActivity *))v4)[2](v4, self);
  }
  [(UIActivity *)self activityDidFinish:1];
}

- (BOOL)_isDisabled
{
  if ([(PUEditActionActivity *)self disablesInsteadOfHides])
  {
    v3 = [(PUEditActionActivity *)self canPerformActivityActionHandler];
    int v4 = ((uint64_t (**)(void, void, PUEditActionActivity *))v3)[2](v3, MEMORY[0x1E4F1CBF0], self) ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v4 = a3;
  v5 = [(PUEditActionActivity *)self canPerformActivityActionHandler];

  if (v5)
  {
    if ([(PUEditActionActivity *)self disablesInsteadOfHides])
    {
      char v6 = 1;
    }
    else
    {
      v7 = [(PUEditActionActivity *)self canPerformActivityActionHandler];
      char v6 = ((uint64_t (**)(void, id, PUEditActionActivity *))v7)[2](v7, v4, self);
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)activityTitle
{
  return self->_actionName;
}

- (id)activityType
{
  return self->_internalActivityType;
}

- (PUEditActionActivity)initWithActionName:(id)a3 activityType:(id)a4 systemImageName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PUEditActionActivity;
  v11 = [(UIActivity *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    actionName = v11->_actionName;
    v11->_actionName = (NSString *)v12;

    uint64_t v14 = [v10 copy];
    systemImageName = v11->_systemImageName;
    v11->_systemImageName = (NSString *)v14;

    objc_storeStrong((id *)&v11->_internalActivityType, a4);
  }

  return v11;
}

+ (int64_t)activityCategory
{
  return 0;
}

@end