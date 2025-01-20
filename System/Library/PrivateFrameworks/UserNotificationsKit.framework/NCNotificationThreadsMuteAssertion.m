@interface NCNotificationThreadsMuteAssertion
+ (id)threadsMuteAssertionWithMutedThreadIDs:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (id)_initWithMutedThreadIDs:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)activeMuteAssertionLevelForThreadIdentifier:(id)a3;
- (unint64_t)hash;
@end

@implementation NCNotificationThreadsMuteAssertion

+ (id)threadsMuteAssertionWithMutedThreadIDs:(id)a3
{
  id v3 = a3;
  id v4 = [[NCNotificationThreadsMuteAssertion alloc] _initWithMutedThreadIDs:v3];

  return v4;
}

- (id)_initWithMutedThreadIDs:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NCNotificationThreadsMuteAssertion;
  v6 = [(NCNotificationThreadsMuteAssertion *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mutedThreadIDs, a3);
  }

  return v7;
}

- (unint64_t)activeMuteAssertionLevelForThreadIdentifier:(id)a3
{
  if (a3) {
    return -[NSSet containsObject:](self->_mutedThreadIDs, "containsObject:");
  }
  else {
    return 0;
  }
}

- (unint64_t)hash
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 1;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = 31;
  mutedThreadIDs = self->_mutedThreadIDs;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__NCNotificationThreadsMuteAssertion_hash__block_invoke;
  v5[3] = &unk_264559EA0;
  v5[4] = &v7;
  v5[5] = v6;
  [(NSSet *)mutedThreadIDs enumerateObjectsUsingBlock:v5];
  unint64_t v3 = v8[3];
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __42__NCNotificationThreadsMuteAssertion_hash__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t result = [a2 hash];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result + v4 * v3;
  return result;
}

- (NSString)debugDescription
{
  return (NSString *)[(NCNotificationThreadsMuteAssertion *)self descriptionWithMultilinePrefix:0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    && (id v5 = (void **)v4) != 0)
  {
    v6 = v5;
    char v7 = NCIsEqualToSet(self->_mutedThreadIDs, v5[1]);
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(NCNotificationThreadsMuteAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = (void *)MEMORY[0x263F29C40];
  id v5 = a3;
  v6 = [v4 builderWithObject:self];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __76__NCNotificationThreadsMuteAssertion_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_264559E60;
  id v7 = v6;
  id v11 = v7;
  v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v10];

  id v8 = v7;
  return v8;
}

id __76__NCNotificationThreadsMuteAssertion_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"mutedThreadIDs"];
}

- (id)succinctDescription
{
  v2 = [(NCNotificationThreadsMuteAssertion *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x263F29C40] builderWithObject:self];
}

- (void).cxx_destruct
{
}

@end