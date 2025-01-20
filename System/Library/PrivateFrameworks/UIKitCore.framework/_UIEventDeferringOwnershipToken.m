@interface _UIEventDeferringOwnershipToken
- (NSString)debugDescription;
- (_BYTE)_initWithOwner:(uint64_t)a3 scope:(void *)a4 environments:(void *)a5 target:(void *)a6 reason:(void *)a7 endDeferringBlock:;
- (_UIEventDeferringOwnershipToken)init;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)dealloc;
- (void)endEventDeferringWithReason:(uint64_t)a1;
@end

@implementation _UIEventDeferringOwnershipToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_environments, 0);
  objc_storeStrong((id *)&self->_ownerClass, 0);
  objc_storeStrong(&self->_endDeferringBlock, 0);
  objc_storeStrong((id *)&self->_environmentsPendingInvalidation, 0);
}

- (_BYTE)_initWithOwner:(uint64_t)a3 scope:(void *)a4 environments:(void *)a5 target:(void *)a6 reason:(void *)a7 endDeferringBlock:
{
  if (!a1) {
    return 0;
  }
  v23.receiver = a1;
  v23.super_class = (Class)_UIEventDeferringOwnershipToken;
  v13 = objc_msgSendSuper2(&v23, sel_init);
  v14 = v13;
  if (v13)
  {
    v13[24] = 0;
    v15 = (objc_class *)objc_opt_class();
    uint64_t v16 = NSStringFromClass(v15);
    v17 = (void *)*((void *)v14 + 4);
    *((void *)v14 + 4) = v16;

    *((void *)v14 + 5) = _UIEventDeferringInterfaceCategoryForOwningElement();
    *((void *)v14 + 6) = a2;
    *((void *)v14 + 7) = a3;
    objc_storeStrong((id *)v14 + 8, a4);
    uint64_t v18 = [a4 mutableCopy];
    v19 = (void *)*((void *)v14 + 1);
    *((void *)v14 + 1) = v18;

    objc_storeStrong((id *)v14 + 9, a5);
    objc_storeStrong((id *)v14 + 10, a6);
    uint64_t v20 = [a7 copy];
    v21 = (void *)*((void *)v14 + 2);
    *((void *)v14 + 2) = v20;
  }
  return v14;
}

- (void)dealloc
{
  if (!self->_hasInvalidated)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"_UIEventDeferringOwnershipToken.m", 105, @"Owner must request to end event deferring before dealloc: %@", self object file lineNumber description];
  }
  v5.receiver = self;
  v5.super_class = (Class)_UIEventDeferringOwnershipToken;
  [(_UIEventDeferringOwnershipToken *)&v5 dealloc];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_UIEventDeferringOwnershipToken *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  objc_super v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v5 setActiveMultilinePrefix:a3];
  id v6 = (id)[v5 appendBool:self->_hasInvalidated withName:@"invalidated"];
  v7 = _NSStringFromUIEventDeferringScope(self->_scope);
  id v8 = (id)[v5 appendObject:v7 withName:@"scope"];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73___UIEventDeferringOwnershipToken_descriptionBuilderWithMultilinePrefix___block_invoke;
  v13[3] = &unk_1E52D9F98;
  id v9 = v5;
  id v14 = v9;
  v15 = self;
  id v10 = (id)[v9 modifyBody:v13];
  id v11 = v9;

  return v11;
}

- (_UIEventDeferringOwnershipToken)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"_UIEventDeferringOwnershipToken.m" lineNumber:78 description:@"init is not allowed on _UIEventDeferringOwnershipToken"];

  return 0;
}

- (void)endEventDeferringWithReason:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v3 = *(void *)(a1 + 16);
    if (v3)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v3, a1, a2);
      v4 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = 0;
    }
  }
}

- (NSString)debugDescription
{
  return (NSString *)[(_UIEventDeferringOwnershipToken *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(_UIEventDeferringOwnershipToken *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendBool:self->_hasInvalidated withName:@"invalidated"];
  objc_super v5 = _NSStringFromUIEventDeferringScope(self->_scope);
  id v6 = (id)[v3 appendObject:v5 withName:@"scope"];

  id v7 = (id)[v3 appendObject:self->_ownerClass withName:@"ownerClass"];
  unint64_t owningInterfaceElementCategory = self->_owningInterfaceElementCategory;
  if (owningInterfaceElementCategory > 3) {
    id v9 = &stru_1ED0E84C0;
  }
  else {
    id v9 = off_1E52DD018[owningInterfaceElementCategory];
  }
  id v10 = (id)[v3 appendObject:v9 withName:@"owningInterfaceElementCategory"];
  id v11 = (id)[v3 appendPointer:self->_ownerPointer withName:@"ownerPointer"];
  id v12 = (id)[v3 appendObject:self->_reason withName:@"reason"];
  return v3;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(_UIEventDeferringOwnershipToken *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

@end