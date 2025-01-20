@interface SBSwitcherModifierStackSnapshot
- (NSArray)childSnapshots;
- (NSString)modifierDescription;
- (NSString)modifierName;
- (SBSwitcherModifierQuerySnapshot)querySnapshot;
- (SBSwitcherModifierStackSnapshot)initWithRootModifier:(id)a3;
- (unint64_t)countOfAllChildSnapshots;
- (void)_enumerateModifierSnapshots:(id)a3 stop:(BOOL *)a4;
- (void)enumerateModifierSnapshots:(id)a3;
@end

@implementation SBSwitcherModifierStackSnapshot

- (SBSwitcherModifierStackSnapshot)initWithRootModifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SBSwitcherModifierTimelineEntry.m", 134, @"Invalid parameter not satisfying: %@", @"rootModifier" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)SBSwitcherModifierStackSnapshot;
  v6 = [(SBSwitcherModifierStackSnapshot *)&v20 init];
  if (v6)
  {
    v7 = [v5 displayName];
    uint64_t v8 = [v7 copy];
    modifierName = v6->_modifierName;
    v6->_modifierName = (NSString *)v8;

    v10 = [v5 description];
    uint64_t v11 = [v10 copy];
    modifierDescription = v6->_modifierDescription;
    v6->_modifierDescription = (NSString *)v11;

    v13 = [[SBSwitcherModifierQuerySnapshot alloc] initWithModifier:v5];
    querySnapshot = v6->_querySnapshot;
    v6->_querySnapshot = v13;

    v15 = [v5 debugPotentialChildModifiers];
    uint64_t v16 = objc_msgSend(v15, "bs_map:", &__block_literal_global_377);
    childSnapshots = v6->_childSnapshots;
    v6->_childSnapshots = (NSArray *)v16;
  }
  return v6;
}

SBSwitcherModifierStackSnapshot *__56__SBSwitcherModifierStackSnapshot_initWithRootModifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[SBSwitcherModifierStackSnapshot alloc] initWithRootModifier:v2];

  return v3;
}

- (void)enumerateModifierSnapshots:(id)a3
{
  char v3 = 0;
  [(SBSwitcherModifierStackSnapshot *)self _enumerateModifierSnapshots:a3 stop:&v3];
}

- (void)_enumerateModifierSnapshots:(id)a3 stop:(BOOL *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (!*a4)
  {
    (*((void (**)(id, SBSwitcherModifierStackSnapshot *, BOOL *))v6 + 2))(v6, self, a4);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v8 = self->_childSnapshots;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "_enumerateModifierSnapshots:stop:", v7, a4, (void)v13);
        }
        while (v10 != v12);
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (unint64_t)countOfAllChildSnapshots
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__SBSwitcherModifierStackSnapshot_countOfAllChildSnapshots__block_invoke;
  v4[3] = &unk_1E6B0CA88;
  v4[4] = &v5;
  [(SBSwitcherModifierStackSnapshot *)self enumerateModifierSnapshots:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __59__SBSwitcherModifierStackSnapshot_countOfAllChildSnapshots__block_invoke(uint64_t result)
{
  return result;
}

- (NSString)modifierName
{
  return self->_modifierName;
}

- (NSString)modifierDescription
{
  return self->_modifierDescription;
}

- (SBSwitcherModifierQuerySnapshot)querySnapshot
{
  return self->_querySnapshot;
}

- (NSArray)childSnapshots
{
  return self->_childSnapshots;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childSnapshots, 0);
  objc_storeStrong((id *)&self->_querySnapshot, 0);
  objc_storeStrong((id *)&self->_modifierDescription, 0);
  objc_storeStrong((id *)&self->_modifierName, 0);
}

@end