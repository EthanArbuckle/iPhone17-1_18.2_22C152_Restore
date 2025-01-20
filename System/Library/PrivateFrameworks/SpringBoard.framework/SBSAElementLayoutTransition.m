@interface SBSAElementLayoutTransition
- (BOOL)elementWithIdentityWasOrIsSensorAttached:(id)a3;
- (BOOL)isCollisionRequired;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLayoutChange;
- (BOOL)isSingleElementExpansion;
- (BOOL)isTransitionFromCustom;
- (BOOL)isTransitionToSingleCompact;
- (NSArray)initialElementContexts;
- (NSArray)targetElementContexts;
- (SBSAElementLayoutTransition)initWithInitialElementContexts:(id)a3 targetElementContext:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation SBSAElementLayoutTransition

- (SBSAElementLayoutTransition)initWithInitialElementContexts:(id)a3 targetElementContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBSAElementLayoutTransition;
  v8 = [(SBSAElementLayoutTransition *)&v15 init];
  v9 = v8;
  if (v8)
  {
    if (v6)
    {
      uint64_t v10 = [v6 copy];
      initialElementContexts = v9->_initialElementContexts;
      v9->_initialElementContexts = (NSArray *)v10;
    }
    else
    {
      initialElementContexts = v8->_initialElementContexts;
      v8->_initialElementContexts = (NSArray *)MEMORY[0x1E4F1CBF0];
    }

    if (v7)
    {
      uint64_t v12 = [v7 copy];
      targetElementContexts = v9->_targetElementContexts;
      v9->_targetElementContexts = (NSArray *)v12;
    }
    else
    {
      targetElementContexts = v9->_targetElementContexts;
      v9->_targetElementContexts = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
  }
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  initialElementContexts = self->_initialElementContexts;
  targetElementContexts = self->_targetElementContexts;
  return (id)[v4 initWithInitialElementContexts:initialElementContexts targetElementContext:targetElementContexts];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetElementContexts, 0);
  objc_storeStrong((id *)&self->_initialElementContexts, 0);
}

- (BOOL)isLayoutChange
{
  return !SBSAAreElementLayoutsEqualToLayouts(self->_initialElementContexts, self->_targetElementContexts);
}

BOOL __39__SBSAElementLayoutTransition_isEqual___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 8);
  v2 = [*(id *)(a1 + 40) initialElementContexts];
  BOOL v3 = SBSAAreElementLayoutsEqualToLayouts(v1, v2);

  return v3;
}

BOOL __39__SBSAElementLayoutTransition_isEqual___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 16);
  v2 = [*(id *)(a1 + 40) targetElementContexts];
  BOOL v3 = SBSAAreElementLayoutsEqualToLayouts(v1, v2);

  return v3;
}

- (NSArray)targetElementContexts
{
  return self->_targetElementContexts;
}

- (NSArray)initialElementContexts
{
  return self->_initialElementContexts;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __39__SBSAElementLayoutTransition_isEqual___block_invoke;
  v17[3] = &unk_1E6AF5420;
  v17[4] = self;
  id v18 = v4;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __39__SBSAElementLayoutTransition_isEqual___block_invoke_2;
  v14 = &unk_1E6AF5420;
  objc_super v15 = self;
  id v16 = v18;
  id v6 = v18;
  id v7 = (void *)MEMORY[0x1D948C7A0](&v11);
  v8 = objc_msgSend(v5, "appendEqualsBlocks:", v17, v7, 0, v11, v12, v13, v14, v15);
  char v9 = [v8 isEqual];

  return v9;
}

- (BOOL)isCollisionRequired
{
  NSUInteger v3 = [(NSArray *)self->_initialElementContexts count];
  NSUInteger v4 = [(NSArray *)self->_targetElementContexts count];
  int v5 = (v3 != 0) & ~SBSAAreElementLayoutsEqualToLayouts(self->_initialElementContexts, self->_targetElementContexts);
  if (v4) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6 && v3 == 1 && v4 == 1)
  {
    char v9 = [(NSArray *)self->_initialElementContexts firstObject];
    uint64_t v10 = [(NSArray *)self->_targetElementContexts firstObject];
    if (SAElementIdentityEqualToIdentity()) {
      LOBYTE(v6) = [v9 layoutMode] == 3 && objc_msgSend(v10, "layoutMode") != 3;
    }
    else {
      LOBYTE(v6) = 1;
    }
  }
  return v6;
}

- (BOOL)isSingleElementExpansion
{
  if ([(NSArray *)self->_initialElementContexts count] != 1
    || [(NSArray *)self->_targetElementContexts count] != 1)
  {
    return 0;
  }
  NSUInteger v3 = [(NSArray *)self->_initialElementContexts firstObject];
  NSUInteger v4 = [(NSArray *)self->_targetElementContexts firstObject];
  int v5 = SAElementIdentityEqualToIdentity();
  char v6 = SBSAIsElementLayoutEqualToLayout(v3, v4);
  BOOL v7 = 0;
  if (v5 && (v6 & 1) == 0) {
    BOOL v7 = [v4 layoutMode] == 3;
  }

  return v7;
}

- (BOOL)isTransitionFromCustom
{
  NSUInteger v3 = [(NSArray *)self->_initialElementContexts sbsa_onlyObjectOrNil];
  if ([v3 layoutMode] == 3) {
    BOOL v4 = !SBSAAreElementLayoutsEqualToLayouts(self->_initialElementContexts, self->_targetElementContexts);
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)isTransitionToSingleCompact
{
  if ([(NSArray *)self->_targetElementContexts count] != 1) {
    return 0;
  }
  NSUInteger v3 = [(NSArray *)self->_targetElementContexts firstObject];
  if ([(SBSAElementLayoutTransition *)self isLayoutChange]) {
    BOOL v4 = [v3 layoutMode] == 2;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)elementWithIdentityWasOrIsSensorAttached:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  int v5 = [(SBSAElementLayoutTransition *)self initialElementContexts];
  uint64_t v6 = SBSAElementIdentityOfSensorAttachedElementInCollection(v5);
  char v7 = SAElementIdentityEqualToIdentity();

  v8 = [(SBSAElementLayoutTransition *)self targetElementContexts];
  char v9 = SBSAElementIdentityOfSensorAttachedElementInCollection(v8);
  LOBYTE(v6) = SAElementIdentityEqualToIdentity();

  return v7 | v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [v3 appendObject:self->_initialElementContexts];
  int v5 = [v4 appendObject:self->_targetElementContexts];
  unint64_t v6 = [v5 hash];

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; initialElementContexts: %@; targetElementContexts: %@>",
               objc_opt_class(),
               self,
               self->_initialElementContexts,
               self->_targetElementContexts);
}

@end