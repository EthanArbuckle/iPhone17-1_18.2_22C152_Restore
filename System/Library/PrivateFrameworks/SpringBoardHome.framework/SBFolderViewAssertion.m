@interface SBFolderViewAssertion
- (BOOL)isInvalidated;
- (NSDictionary)extraInfo;
- (NSString)description;
- (SBFolderView)folderView;
- (SBFolderViewAssertion)initWithAssertionType:(int64_t)a3 folderView:(id)a4 extraInfo:(id)a5;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)assertionType;
- (void)dealloc;
- (void)invalidate;
- (void)setInvalidated:(BOOL)a3;
@end

@implementation SBFolderViewAssertion

- (SBFolderViewAssertion)initWithAssertionType:(int64_t)a3 folderView:(id)a4 extraInfo:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SBFolderViewAssertion;
  v11 = [(SBFolderViewAssertion *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_assertionType = a3;
    objc_storeStrong((id *)&v11->_folderView, a4);
    uint64_t v13 = [v10 copy];
    extraInfo = v12->_extraInfo;
    v12->_extraInfo = (NSDictionary *)v13;
  }
  return v12;
}

- (void)dealloc
{
  if (![(SBFolderViewAssertion *)self isInvalidated])
  {
    v3 = SBLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_INFO, "SBFolderViewAssertion deallocated but not invalidated!", buf, 2u);
    }

    [(SBFolderViewAssertion *)self invalidate];
  }
  v4.receiver = self;
  v4.super_class = (Class)SBFolderViewAssertion;
  [(SBFolderViewAssertion *)&v4 dealloc];
}

- (void)invalidate
{
  if (![(SBFolderViewAssertion *)self isInvalidated])
  {
    v3 = [(SBFolderViewAssertion *)self folderView];
    [v3 removeAssertion:self];

    [(SBFolderViewAssertion *)self setInvalidated:1];
  }
}

- (NSString)description
{
  return (NSString *)[(SBFolderViewAssertion *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBFolderViewAssertion *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBFolderViewAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  objc_super v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  objc_super v4 = [(SBFolderViewAssertion *)self succinctDescriptionBuilder];
  id v5 = (id)objc_msgSend(v4, "appendInteger:withName:", -[SBFolderViewAssertion assertionType](self, "assertionType"), @"assertionType");
  v6 = [(SBFolderViewAssertion *)self extraInfo];
  id v7 = (id)[v4 appendObject:v6 withName:@"extraInfo"];

  v8 = [(SBFolderViewAssertion *)self folderView];
  id v9 = (id)[v4 appendPointer:v8 withName:@"folderView"];

  return v4;
}

- (int64_t)assertionType
{
  return self->_assertionType;
}

- (SBFolderView)folderView
{
  return self->_folderView;
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
  objc_storeStrong((id *)&self->_folderView, 0);
}

@end