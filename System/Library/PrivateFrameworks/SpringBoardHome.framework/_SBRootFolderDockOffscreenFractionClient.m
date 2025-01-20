@interface _SBRootFolderDockOffscreenFractionClient
- (NSString)description;
- (NSString)reason;
- (SBRootFolderView)folderView;
- (_SBRootFolderDockOffscreenFractionClient)initWithFolderView:(id)a3 reason:(id)a4;
- (double)desiredOffscreenFraction;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)dealloc;
- (void)invalidate;
- (void)layoutIfNeededForDockOffscreenFractionChanged;
- (void)setDesiredOffscreenFraction:(double)a3;
- (void)setDockOffscreenFraction:(double)a3;
- (void)setFolderView:(id)a3;
@end

@implementation _SBRootFolderDockOffscreenFractionClient

- (_SBRootFolderDockOffscreenFractionClient)initWithFolderView:(id)a3 reason:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_SBRootFolderDockOffscreenFractionClient;
  v9 = [(_SBRootFolderDockOffscreenFractionClient *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_folderView, a3);
    uint64_t v11 = [v8 copy];
    reason = v10->_reason;
    v10->_reason = (NSString *)v11;
  }
  return v10;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_folderView)
  {
    v3 = SBLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      reason = self->_reason;
      *(_DWORD *)buf = 138543362;
      id v8 = reason;
      _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_INFO, "_SBRootFolderDockOffscreenFractionClient deallocated but not invalidated! Reason: %{public}@", buf, 0xCu);
    }

    folderView = self->_folderView;
  }
  else
  {
    folderView = 0;
  }
  [(SBRootFolderView *)folderView removeDockOffscreenFractionClient:self];
  v6.receiver = self;
  v6.super_class = (Class)_SBRootFolderDockOffscreenFractionClient;
  [(_SBRootFolderDockOffscreenFractionClient *)&v6 dealloc];
}

- (void)setDockOffscreenFraction:(double)a3
{
  [(_SBRootFolderDockOffscreenFractionClient *)self desiredOffscreenFraction];
  if (v5 != a3)
  {
    id v6 = [(_SBRootFolderDockOffscreenFractionClient *)self folderView];
    [(_SBRootFolderDockOffscreenFractionClient *)self setDesiredOffscreenFraction:a3];
    [v6 clientDidChangeDockOffScreenFraction:self];
  }
}

- (void)layoutIfNeededForDockOffscreenFractionChanged
{
}

- (void)invalidate
{
  v3 = [(_SBRootFolderDockOffscreenFractionClient *)self folderView];
  [v3 removeDockOffscreenFractionClient:self];

  [(_SBRootFolderDockOffscreenFractionClient *)self setFolderView:0];
}

- (NSString)description
{
  return (NSString *)[(_SBRootFolderDockOffscreenFractionClient *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(_SBRootFolderDockOffscreenFractionClient *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_SBRootFolderDockOffscreenFractionClient *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(_SBRootFolderDockOffscreenFractionClient *)self succinctDescriptionBuilder];
  double v5 = [(_SBRootFolderDockOffscreenFractionClient *)self reason];
  id v6 = (id)[v4 appendObject:v5 withName:@"reason"];

  [(_SBRootFolderDockOffscreenFractionClient *)self desiredOffscreenFraction];
  id v7 = (id)objc_msgSend(v4, "appendFloat:withName:", @"desiredOffscreenFraction");
  id v8 = [(_SBRootFolderDockOffscreenFractionClient *)self folderView];
  id v9 = (id)[v4 appendPointer:v8 withName:@"folderView"];

  return v4;
}

- (NSString)reason
{
  return self->_reason;
}

- (SBRootFolderView)folderView
{
  return self->_folderView;
}

- (void)setFolderView:(id)a3
{
}

- (double)desiredOffscreenFraction
{
  return self->_desiredOffscreenFraction;
}

- (void)setDesiredOffscreenFraction:(double)a3
{
  self->_desiredOffscreenFraction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderView, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end