@interface SBAppPlatterDragPreviewDelayCleanupAssertion
- (BOOL)isInvalidated;
- (NSString)description;
- (NSString)reason;
- (SBAppPlatterDragPreview)dragPreview;
- (SBAppPlatterDragPreviewDelayCleanupAssertion)initWithDragPreview:(id)a3 reason:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)dealloc;
- (void)invalidate;
- (void)setInvalidated:(BOOL)a3;
@end

@implementation SBAppPlatterDragPreviewDelayCleanupAssertion

- (SBAppPlatterDragPreviewDelayCleanupAssertion)initWithDragPreview:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBAppPlatterDragPreviewDelayCleanupAssertion;
  v8 = [(SBAppPlatterDragPreviewDelayCleanupAssertion *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dragPreview, v6);
    uint64_t v10 = [v7 copy];
    reason = v9->_reason;
    v9->_reason = (NSString *)v10;
  }
  return v9;
}

- (void)dealloc
{
  [(SBAppPlatterDragPreviewDelayCleanupAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBAppPlatterDragPreviewDelayCleanupAssertion;
  [(SBAppPlatterDragPreviewDelayCleanupAssertion *)&v3 dealloc];
}

- (void)invalidate
{
  if (![(SBAppPlatterDragPreviewDelayCleanupAssertion *)self isInvalidated])
  {
    [(SBAppPlatterDragPreviewDelayCleanupAssertion *)self setInvalidated:1];
    id v3 = [(SBAppPlatterDragPreviewDelayCleanupAssertion *)self dragPreview];
    [v3 _removeDelayCleanupAssertion:self];
  }
}

- (NSString)description
{
  return (NSString *)[(SBAppPlatterDragPreviewDelayCleanupAssertion *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBAppPlatterDragPreviewDelayCleanupAssertion *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBAppPlatterDragPreviewDelayCleanupAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(SBAppPlatterDragPreviewDelayCleanupAssertion *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendObject:self->_reason withName:@"reason"];
  return v4;
}

- (SBAppPlatterDragPreview)dragPreview
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragPreview);
  return (SBAppPlatterDragPreview *)WeakRetained;
}

- (NSString)reason
{
  return self->_reason;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_destroyWeak((id *)&self->_dragPreview);
}

@end