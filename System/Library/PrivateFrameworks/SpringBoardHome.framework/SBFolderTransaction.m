@interface SBFolderTransaction
- (NSSet)addedIcons;
- (NSSet)movedIcons;
- (NSSet)removedIcons;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)assertionCount;
- (void)addAssertion:(id)a3;
- (void)iconList:(id)a3 didAddIcon:(id)a4;
- (void)iconList:(id)a3 didRemoveIcon:(id)a4;
- (void)removeAssertion:(id)a3;
@end

@implementation SBFolderTransaction

- (void)removeAssertion:(id)a3
{
  id v8 = a3;
  NSUInteger v4 = [(NSPointerArray *)self->_coalesceChangesAssertions count];
  if (v4)
  {
    NSUInteger v5 = v4;
    uint64_t v6 = 0;
    while (1)
    {
      id v7 = [(NSPointerArray *)self->_coalesceChangesAssertions pointerAtIndex:v6];
      if (v7 == v8) {
        break;
      }

      if (v5 == ++v6) {
        goto LABEL_7;
      }
    }
    [(NSPointerArray *)self->_coalesceChangesAssertions removePointerAtIndex:v6];
  }
LABEL_7:
}

- (unint64_t)assertionCount
{
  return [(NSPointerArray *)self->_coalesceChangesAssertions count];
}

- (void)addAssertion:(id)a3
{
  id v4 = a3;
  coalesceChangesAssertions = self->_coalesceChangesAssertions;
  id v8 = v4;
  if (!coalesceChangesAssertions)
  {
    uint64_t v6 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    id v7 = self->_coalesceChangesAssertions;
    self->_coalesceChangesAssertions = v6;

    id v4 = v8;
    coalesceChangesAssertions = self->_coalesceChangesAssertions;
  }
  [(NSPointerArray *)coalesceChangesAssertions addPointer:v4];
}

- (NSSet)removedIcons
{
  if (self->_removedIcons)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v4 = [(NSMapTable *)self->_removedIcons keyEnumerator];
    uint64_t v5 = [v4 nextObject];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      do
      {
        [v3 addObject:v6];
        uint64_t v7 = [v4 nextObject];

        uint64_t v6 = (void *)v7;
      }
      while (v7);
    }
  }
  else
  {
    id v3 = 0;
  }
  return (NSSet *)v3;
}

- (NSSet)movedIcons
{
  return &self->_movedIcons->super;
}

- (NSSet)addedIcons
{
  return &self->_addedIcons->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalesceChangesAssertions, 0);
  objc_storeStrong((id *)&self->_removedIcons, 0);
  objc_storeStrong((id *)&self->_movedIcons, 0);
  objc_storeStrong((id *)&self->_addedIcons, 0);
}

- (void)iconList:(id)a3 didAddIcon:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [(NSMapTable *)self->_removedIcons objectForKey:v6];
  if (!v7)
  {
    addedIcons = self->_addedIcons;
    p_addedIcons = &self->_addedIcons;
    id v8 = addedIcons;
    if (addedIcons) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  [(NSMapTable *)self->_removedIcons removeObjectForKey:v6];
  if (v7 == v14) {
    goto LABEL_6;
  }
  movedIcons = self->_movedIcons;
  p_addedIcons = &self->_movedIcons;
  id v8 = movedIcons;
  if (!movedIcons)
  {
LABEL_4:
    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v12 = *p_addedIcons;
    *p_addedIcons = v11;

    id v8 = *p_addedIcons;
  }
LABEL_5:
  [(NSMutableSet *)v8 addObject:v6];
LABEL_6:
}

- (void)iconList:(id)a3 didRemoveIcon:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if ([(NSMutableSet *)self->_addedIcons containsObject:v6])
  {
    [(NSMutableSet *)self->_addedIcons removeObject:v6];
  }
  else
  {
    removedIcons = self->_removedIcons;
    if (!removedIcons)
    {
      id v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      v9 = self->_removedIcons;
      self->_removedIcons = v8;

      removedIcons = self->_removedIcons;
    }
    [(NSMapTable *)removedIcons setObject:v10 forKey:v6];
  }
}

- (id)description
{
  return [(SBFolderTransaction *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBFolderTransaction *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBFolderTransaction *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBFolderTransaction *)self succinctDescriptionBuilder];
  uint64_t v5 = [(SBFolderTransaction *)self addedIcons];
  id v6 = (id)[v4 appendObject:v5 withName:@"addedIcons"];

  id v7 = [(SBFolderTransaction *)self removedIcons];
  id v8 = (id)[v4 appendObject:v7 withName:@"removedIcons"];

  v9 = [(SBFolderTransaction *)self movedIcons];
  id v10 = (id)[v4 appendObject:v9 withName:@"movedIcons"];

  v11 = [(NSPointerArray *)self->_coalesceChangesAssertions allObjects];
  v12 = objc_msgSend(v11, "bs_compactMap:", &__block_literal_global_850);

  id v13 = (id)[v4 appendObject:v12 withName:@"reasons"];
  return v4;
}

uint64_t __61__SBFolderTransaction_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1, void *a2)
{
  return [a2 reason];
}

@end