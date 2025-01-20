@interface TRAPreferencesTreeNode
- (BOOL)debugLastSettingsWereValidated;
- (NSArray)children;
- (NSString)debugLastOrientationSettingsValidationFailureReason;
- (NSString)role;
- (NSString)uniqueIdentifier;
- (TRAParticipant)participant;
- (TRAPreferencesTreeNode)initWithParticipant:(id)a3;
- (TRAPreferencesTreeNode)parent;
- (double)order;
- (id)_participant;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)settingsUpdater;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)addChild:(id)a3;
- (void)setChildren:(id)a3;
- (void)setDebugLastOrientationSettingsValidationFailureReason:(id)a3;
- (void)setDebugLastSettingsWereValidated:(BOOL)a3;
- (void)setOrder:(double)a3;
- (void)setParent:(id)a3;
@end

@implementation TRAPreferencesTreeNode

- (id)settingsUpdater
{
  return self->_participant;
}

- (TRAPreferencesTreeNode)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (TRAPreferencesTreeNode *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_participant, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_role, 0);
}

- (TRAParticipant)participant
{
  return self->_participant;
}

uint64_t __35__TRAPreferencesTreeNode_addChild___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a3;
  [a2 order];
  v6 = objc_msgSend(v4, "numberWithDouble:");
  v7 = NSNumber;
  [v5 order];
  double v9 = v8;

  v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

- (double)order
{
  return self->_order;
}

- (void)setOrder:(double)a3
{
  self->_order = a3;
}

- (TRAPreferencesTreeNode)initWithParticipant:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TRAPreferencesTreeNode;
  v6 = [(TRAPreferencesTreeNode *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [v5 uniqueIdentifier];
    uniqueIdentifier = v6->_uniqueIdentifier;
    v6->_uniqueIdentifier = (NSString *)v7;

    objc_storeStrong((id *)&v6->_participant, a3);
    uint64_t v9 = [v5 role];
    role = v6->_role;
    v6->_role = (NSString *)v9;
  }
  return v6;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)addChild:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (!v5)
  {
    double v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRAPreferencesTree.m", 49, @"Invalid parameter not satisfying: %@", @"child" object file lineNumber description];

    id v5 = 0;
  }
  [v5 setParent:self];
  v6 = [MEMORY[0x263EFF980] arrayWithArray:self->_children];
  [(NSArray *)v6 addObject:v9];
  [(NSArray *)v6 sortUsingComparator:&__block_literal_global_0];
  children = self->_children;
  self->_children = v6;
}

- (NSArray)children
{
  return self->_children;
}

- (void)setParent:(id)a3
{
}

- (void)setDebugLastSettingsWereValidated:(BOOL)a3
{
}

- (void)setDebugLastOrientationSettingsValidationFailureReason:(id)a3
{
}

- (void)setChildren:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRAPreferencesTree.m", 61, @"Invalid parameter not satisfying: %@", @"children" object file lineNumber description];
  }
  v6 = [MEMORY[0x263EFF980] arrayWithArray:self->_children];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_super v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        [v12 setParent:self];
        [(NSArray *)v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  [(NSArray *)v6 sortUsingComparator:&__block_literal_global_14];
  children = self->_children;
  self->_children = v6;
}

uint64_t __38__TRAPreferencesTreeNode_setChildren___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a3;
  [a2 order];
  v6 = objc_msgSend(v4, "numberWithDouble:");
  id v7 = NSNumber;
  [v5 order];
  double v9 = v8;

  uint64_t v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

- (BOOL)debugLastSettingsWereValidated
{
  return [(TRAParticipant *)self->_participant _debugDelegateDidValidateLastSettings];
}

- (NSString)debugLastOrientationSettingsValidationFailureReason
{
  return [(TRAParticipant *)self->_participant _debugLastOrientationValidationFailureReason];
}

- (id)_participant
{
  return self->_participant;
}

- (id)succinctDescription
{
  v2 = [(TRAPreferencesTreeNode *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [v3 appendString:self->_uniqueIdentifier withName:@"uniqueIdentifier"];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(TRAPreferencesTreeNode *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (NSString)role
{
  return self->_role;
}

@end