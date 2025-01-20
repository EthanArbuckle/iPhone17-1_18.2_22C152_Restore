@interface SBIconViewAssertion
- (BOOL)isInvalidated;
- (NSDictionary)extraInfo;
- (NSString)description;
- (SBIconView)iconView;
- (SBIconViewAssertion)initWithAssertionType:(int64_t)a3 iconView:(id)a4 extraInfo:(id)a5;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)assertionType;
- (void)dealloc;
- (void)invalidate;
- (void)setInvalidated:(BOOL)a3;
@end

@implementation SBIconViewAssertion

- (SBIconViewAssertion)initWithAssertionType:(int64_t)a3 iconView:(id)a4 extraInfo:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SBIconViewAssertion;
  v11 = [(SBIconViewAssertion *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_assertionType = a3;
    objc_storeStrong((id *)&v11->_iconView, a4);
    uint64_t v13 = [v10 copy];
    extraInfo = v12->_extraInfo;
    v12->_extraInfo = (NSDictionary *)v13;
  }
  return v12;
}

- (void)dealloc
{
  if (![(SBIconViewAssertion *)self isInvalidated])
  {
    v3 = SBLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_INFO, "SBIconViewAssertion deallocated but not invalidated!", buf, 2u);
    }

    [(SBIconViewAssertion *)self invalidate];
  }
  v4.receiver = self;
  v4.super_class = (Class)SBIconViewAssertion;
  [(SBIconViewAssertion *)&v4 dealloc];
}

- (void)invalidate
{
  if (![(SBIconViewAssertion *)self isInvalidated])
  {
    v3 = [(SBIconViewAssertion *)self iconView];
    [v3 removeAssertion:self];

    [(SBIconViewAssertion *)self setInvalidated:1];
  }
}

- (NSString)description
{
  return (NSString *)[(SBIconViewAssertion *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBIconViewAssertion *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBIconViewAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  objc_super v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  objc_super v4 = [(SBIconViewAssertion *)self succinctDescriptionBuilder];
  id v5 = (id)objc_msgSend(v4, "appendInteger:withName:", -[SBIconViewAssertion assertionType](self, "assertionType"), @"assertionType");
  v6 = [(SBIconViewAssertion *)self extraInfo];
  id v7 = (id)[v4 appendObject:v6 withName:@"extraInfo"];

  v8 = [(SBIconViewAssertion *)self iconView];
  id v9 = (id)[v4 appendPointer:v8 withName:@"iconView"];

  return v4;
}

- (int64_t)assertionType
{
  return self->_assertionType;
}

- (SBIconView)iconView
{
  return self->_iconView;
}

- (NSDictionary)extraInfo
{
  return self->_extraInfo;
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
  objc_storeStrong((id *)&self->_extraInfo, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end