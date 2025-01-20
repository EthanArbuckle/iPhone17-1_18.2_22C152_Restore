@interface _SBFolderControllerIconImageViewControllerKeepSnapshotAssertion
- (BOOL)isInvalidated;
- (NSIndexSet)pageIndexesToExclude;
- (NSString)reason;
- (SBFolderController)folderController;
- (_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion)initWithFolderController:(id)a3 snapshotType:(unint64_t)a4 pageIndexesToExclude:(id)a5 reason:(id)a6;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)snapshotType;
- (void)dealloc;
- (void)invalidate;
- (void)setInvalidated:(BOOL)a3;
@end

@implementation _SBFolderControllerIconImageViewControllerKeepSnapshotAssertion

- (_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion)initWithFolderController:(id)a3 snapshotType:(unint64_t)a4 pageIndexesToExclude:(id)a5 reason:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion;
  v13 = [(_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion *)&v20 init];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_folderController, v10);
    v14->_snapshotType = a4;
    uint64_t v15 = [v11 copy];
    pageIndexesToExclude = v14->_pageIndexesToExclude;
    v14->_pageIndexesToExclude = (NSIndexSet *)v15;

    uint64_t v17 = [v12 copy];
    reason = v14->_reason;
    v14->_reason = (NSString *)v17;
  }
  return v14;
}

- (void)dealloc
{
  if (![(_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion *)self isInvalidated]) {
    NSLog(&cfstr_AssertionRelea.isa);
  }
  [(_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion;
  [(_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion *)&v3 dealloc];
}

- (void)invalidate
{
  if (![(_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion *)self isInvalidated])
  {
    [(_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion *)self setInvalidated:1];
    id v3 = [(_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion *)self folderController];
    [v3 _removeIconImageViewControllerKeepStaticAssertion:self];
  }
}

- (id)succinctDescription
{
  v2 = [(_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion *)self succinctDescriptionBuilder];
  v5 = [(_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion *)self folderController];
  id v6 = (id)[v4 appendPointer:v5 withName:@"folderController"];

  v7 = [(_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion *)self pageIndexesToExclude];
  id v8 = (id)[v4 appendObject:v7 withName:@"pageIndexesToExclude"];

  v9 = [(_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion *)self reason];
  id v10 = (id)[v4 appendObject:v9 withName:@"reason"];

  id v11 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[_SBFolderControllerIconImageViewControllerKeepSnapshotAssertion isInvalidated](self, "isInvalidated"), @"isInvalidated", 1);
  return v4;
}

- (NSIndexSet)pageIndexesToExclude
{
  return self->_pageIndexesToExclude;
}

- (NSString)reason
{
  return self->_reason;
}

- (unint64_t)snapshotType
{
  return self->_snapshotType;
}

- (SBFolderController)folderController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_folderController);
  return (SBFolderController *)WeakRetained;
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
  objc_storeStrong((id *)&self->_pageIndexesToExclude, 0);
}

@end