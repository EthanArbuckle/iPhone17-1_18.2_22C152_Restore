@interface _SBIconImageViewDisableUpdatesAssertion
- (BOOL)isInvalidated;
- (NSString)description;
- (NSString)reason;
- (SBIconImageView)iconImageView;
- (_SBIconImageViewDisableUpdatesAssertion)initWithIconImageView:(id)a3 reason:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)dealloc;
- (void)invalidate;
- (void)setInvalidated:(BOOL)a3;
@end

@implementation _SBIconImageViewDisableUpdatesAssertion

- (_SBIconImageViewDisableUpdatesAssertion)initWithIconImageView:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_SBIconImageViewDisableUpdatesAssertion;
  v8 = [(_SBIconImageViewDisableUpdatesAssertion *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_iconImageView, v6);
    uint64_t v10 = [v7 copy];
    reason = v9->_reason;
    v9->_reason = (NSString *)v10;
  }
  return v9;
}

- (void)invalidate
{
  if (![(_SBIconImageViewDisableUpdatesAssertion *)self isInvalidated])
  {
    [(_SBIconImageViewDisableUpdatesAssertion *)self setInvalidated:1];
    id v3 = [(_SBIconImageViewDisableUpdatesAssertion *)self iconImageView];
    [v3 invalidateImageUpdatesAssertion:self];
  }
}

- (void)dealloc
{
  [(_SBIconImageViewDisableUpdatesAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_SBIconImageViewDisableUpdatesAssertion;
  [(_SBIconImageViewDisableUpdatesAssertion *)&v3 dealloc];
}

- (NSString)description
{
  return (NSString *)[(_SBIconImageViewDisableUpdatesAssertion *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(_SBIconImageViewDisableUpdatesAssertion *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(_SBIconImageViewDisableUpdatesAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(_SBIconImageViewDisableUpdatesAssertion *)self succinctDescriptionBuilder];
  v5 = [(_SBIconImageViewDisableUpdatesAssertion *)self iconImageView];
  id v6 = (id)[v4 appendPointer:v5 withName:@"iconImageView"];

  id v7 = [(_SBIconImageViewDisableUpdatesAssertion *)self reason];
  id v8 = (id)[v4 appendObject:v7 withName:@"reason"];

  id v9 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[_SBIconImageViewDisableUpdatesAssertion isInvalidated](self, "isInvalidated"), @"isInvalidated", 1);
  return v4;
}

- (SBIconImageView)iconImageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconImageView);
  return (SBIconImageView *)WeakRetained;
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
  objc_destroyWeak((id *)&self->_iconImageView);
}

@end