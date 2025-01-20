@interface SBRootFolderControllerShowDoneButtonAssertion
- (BOOL)isInvalidated;
- (NSString)reason;
- (SBRootFolderController)folderController;
- (SBRootFolderControllerShowDoneButtonAssertion)initWithFolderController:(id)a3 reason:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)dealloc;
- (void)invalidate;
- (void)setInvalidated:(BOOL)a3;
@end

@implementation SBRootFolderControllerShowDoneButtonAssertion

- (SBRootFolderControllerShowDoneButtonAssertion)initWithFolderController:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBRootFolderControllerShowDoneButtonAssertion;
  v8 = [(SBRootFolderControllerShowDoneButtonAssertion *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_folderController, v6);
    uint64_t v10 = [v7 copy];
    reason = v9->_reason;
    v9->_reason = (NSString *)v10;
  }
  return v9;
}

- (void)dealloc
{
  if (![(SBRootFolderControllerShowDoneButtonAssertion *)self isInvalidated]) {
    NSLog(&cfstr_AssertionRelea.isa);
  }
  [(SBRootFolderControllerShowDoneButtonAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBRootFolderControllerShowDoneButtonAssertion;
  [(SBRootFolderControllerShowDoneButtonAssertion *)&v3 dealloc];
}

- (void)invalidate
{
  if (![(SBRootFolderControllerShowDoneButtonAssertion *)self isInvalidated])
  {
    [(SBRootFolderControllerShowDoneButtonAssertion *)self setInvalidated:1];
    id v3 = [(SBRootFolderControllerShowDoneButtonAssertion *)self folderController];
    [v3 _removeShowDoneButtonAssertion:self];
  }
}

- (id)succinctDescription
{
  v2 = [(SBRootFolderControllerShowDoneButtonAssertion *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBRootFolderControllerShowDoneButtonAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(SBRootFolderControllerShowDoneButtonAssertion *)self succinctDescriptionBuilder];
  v5 = [(SBRootFolderControllerShowDoneButtonAssertion *)self folderController];
  id v6 = (id)[v4 appendPointer:v5 withName:@"folderController"];

  id v7 = [(SBRootFolderControllerShowDoneButtonAssertion *)self reason];
  id v8 = (id)[v4 appendObject:v7 withName:@"reason"];

  id v9 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBRootFolderControllerShowDoneButtonAssertion isInvalidated](self, "isInvalidated"), @"isInvalidated", 1);
  return v4;
}

- (NSString)reason
{
  return self->_reason;
}

- (SBRootFolderController)folderController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_folderController);
  return (SBRootFolderController *)WeakRetained;
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
  objc_destroyWeak((id *)&self->_folderController);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end