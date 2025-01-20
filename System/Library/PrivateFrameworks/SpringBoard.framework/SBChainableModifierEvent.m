@interface SBChainableModifierEvent
- (BOOL)isHandled;
- (NSString)description;
- (NSString)handledReason;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)unhandledCopy;
- (void)handleWithReason:(id)a3;
@end

@implementation SBChainableModifierEvent

- (NSString)description
{
  return (NSString *)[(SBChainableModifierEvent *)self descriptionWithMultilinePrefix:0];
}

- (void).cxx_destruct
{
}

- (BOOL)isHandled
{
  return self->_handled;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = (id)[v4 appendBool:self->_handled withName:@"handled" ifEqualTo:1];
  [v4 appendString:self->_handledReason withName:@"reason" skipIfEmpty:1];
  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBChainableModifierEvent *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (void)handleWithReason:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self->_handled)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"SBChainableModifierEvent.m" lineNumber:18 description:@"Can't handle an event that has already been handled."];
  }
  self->_handled = 1;
  v6 = (NSString *)[v5 copy];
  handledReason = self->_handledReason;
  self->_handledReason = v6;

  v8 = [(SBChainableModifierEvent *)self loggingCategory];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = [(SBChainableModifierEvent *)self description];
    v10 = self->_handledReason;
    int v12 = 138412546;
    v13 = v9;
    __int16 v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "Handling event: %@ for reason: %@", (uint8_t *)&v12, 0x16u);
  }
}

- (id)unhandledCopy
{
  uint64_t v2 = [(SBChainableModifierEvent *)self copy];
  *(unsigned char *)(v2 + 8) = 0;
  v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  return (id)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[8] = self->_handled;
  uint64_t v5 = [(NSString *)self->_handledReason copy];
  v6 = (void *)*((void *)v4 + 2);
  *((void *)v4 + 2) = v5;

  return v4;
}

- (id)succinctDescription
{
  uint64_t v2 = [(SBChainableModifierEvent *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (NSString)handledReason
{
  return self->_handledReason;
}

@end