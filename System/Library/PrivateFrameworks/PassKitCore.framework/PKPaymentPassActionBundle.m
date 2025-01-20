@interface PKPaymentPassActionBundle
- (NSArray)actionGroups;
- (NSArray)actions;
- (id)actionsMatchingTypes:(id)a3;
- (void)setActionGroups:(id)a3;
- (void)setActions:(id)a3;
- (void)setOrAddActionGroups:(id)a3;
- (void)setOrAddActions:(id)a3;
@end

@implementation PKPaymentPassActionBundle

- (id)actionsMatchingTypes:(id)a3
{
  v4 = [MEMORY[0x1E4F1CAD0] setWithArray:a3];
  actions = self->_actions;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__PKPaymentPassActionBundle_actionsMatchingTypes___block_invoke;
  v9[3] = &unk_1E56ED638;
  id v10 = v4;
  id v6 = v4;
  v7 = [(NSArray *)actions pk_objectsPassingTest:v9];

  return v7;
}

uint64_t __50__PKPaymentPassActionBundle_actionsMatchingTypes___block_invoke(uint64_t a1, void *a2)
{
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a2, "type"));
  uint64_t v4 = [*(id *)(a1 + 32) containsObject:v3];

  return v4;
}

- (void)setOrAddActions:(id)a3
{
  id v9 = a3;
  actions = self->_actions;
  if (actions)
  {
    v5 = (NSArray *)[(NSArray *)actions mutableCopy];
    [(NSArray *)v5 addObjectsFromArray:v9];
    id v6 = (NSArray *)[(NSArray *)v5 copy];
    v7 = self->_actions;
    self->_actions = v6;
  }
  else
  {
    v8 = (NSArray *)v9;
    v5 = self->_actions;
    self->_actions = v8;
  }
}

- (void)setOrAddActionGroups:(id)a3
{
  id v9 = a3;
  actionGroups = self->_actionGroups;
  if (actionGroups)
  {
    v5 = (NSArray *)[(NSArray *)actionGroups mutableCopy];
    [(NSArray *)v5 addObjectsFromArray:v9];
    id v6 = (NSArray *)[(NSArray *)v5 copy];
    v7 = self->_actionGroups;
    self->_actionGroups = v6;
  }
  else
  {
    v8 = (NSArray *)v9;
    v5 = self->_actionGroups;
    self->_actionGroups = v8;
  }
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (NSArray)actionGroups
{
  return self->_actionGroups;
}

- (void)setActionGroups:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionGroups, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

@end