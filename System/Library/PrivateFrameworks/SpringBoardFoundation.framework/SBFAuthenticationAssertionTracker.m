@interface SBFAuthenticationAssertionTracker
- (BOOL)hasActiveAssertions;
- (BOOL)isAssertionValid:(id)a3;
- (NSString)description;
- (SBFAuthenticationAssertionTracker)init;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mkbAssertionOptions;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)addAssertion:(id)a3;
- (void)dealloc;
- (void)removeAssertion:(id)a3;
@end

@implementation SBFAuthenticationAssertionTracker

- (SBFAuthenticationAssertionTracker)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBFAuthenticationAssertionTracker;
  v2 = [(SBFAuthenticationAssertionTracker *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    assertions = v2->_assertions;
    v2->_assertions = (NSHashTable *)v3;

    v2->_mkbAssertion = 0;
  }
  return v2;
}

- (void)dealloc
{
  mkbAssertion = self->_mkbAssertion;
  if (mkbAssertion)
  {
    CFRelease(mkbAssertion);
    self->_mkbAssertion = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBFAuthenticationAssertionTracker;
  [(SBFAuthenticationAssertionTracker *)&v4 dealloc];
}

- (void)addAssertion:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_mkbAssertion)
  {
    v5 = [(SBFAuthenticationAssertionTracker *)self mkbAssertionOptions];
    if (v5)
    {
      CFTypeRef cf = 0;
      MKBDeviceLockAssertion = _get_MKBDeviceLockAssertion();
      self->_mkbAssertion = (__MKBAssertion *)MKBDeviceLockAssertion((uint64_t)v5, (uint64_t)&cf);
      if (cf)
      {
        v7 = SBLogAuthenticationAssertions();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v8 = [(id)cf code];
          *(_DWORD *)buf = 138412802;
          id v12 = v4;
          __int16 v13 = 1024;
          int v14 = v8;
          __int16 v15 = 2112;
          CFTypeRef v16 = cf;
          _os_log_impl(&dword_18B52E000, v7, OS_LOG_TYPE_DEFAULT, "Failed to take MKBDeviceLockAssertion (%@) due to error: %d - %@", buf, 0x1Cu);
        }

        CFRelease(cf);
        mkbAssertion = self->_mkbAssertion;
        if (mkbAssertion)
        {
          CFRelease(mkbAssertion);
          self->_mkbAssertion = 0;
        }
      }
    }
  }
  [(NSHashTable *)self->_assertions addObject:v4];
}

- (void)removeAssertion:(id)a3
{
  [(NSHashTable *)self->_assertions removeObject:a3];
  if (![(NSHashTable *)self->_assertions count])
  {
    mkbAssertion = self->_mkbAssertion;
    if (mkbAssertion)
    {
      CFRelease(mkbAssertion);
      self->_mkbAssertion = 0;
    }
  }
}

- (BOOL)hasActiveAssertions
{
  return [(NSHashTable *)self->_assertions count] != 0;
}

- (BOOL)isAssertionValid:(id)a3
{
  return [(NSHashTable *)self->_assertions containsObject:a3];
}

- (id)mkbAssertionOptions
{
  return 0;
}

- (NSString)description
{
  return (NSString *)[(SBFAuthenticationAssertionTracker *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBFAuthenticationAssertionTracker *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[NSHashTable count](self->_assertions, "count"), @"assertionCount");
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBFAuthenticationAssertionTracker *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = [(SBFAuthenticationAssertionTracker *)self succinctDescriptionBuilder];
  if (self->_mkbAssertion || [(NSHashTable *)self->_assertions count])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __75__SBFAuthenticationAssertionTracker_descriptionBuilderWithMultilinePrefix___block_invoke;
    v7[3] = &unk_1E548CBA0;
    id v8 = v5;
    v9 = self;
    [v8 appendBodySectionWithName:0 multilinePrefix:v4 block:v7];
  }
  return v5;
}

void __75__SBFAuthenticationAssertionTracker_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"mkbAssertion" skipIfNil:1];
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(*(void *)(a1 + 40) + 16) allObjects];
  [v3 appendArraySection:v4 withName:@"assertions" skipIfEmpty:1];
}

- (void).cxx_destruct
{
}

@end