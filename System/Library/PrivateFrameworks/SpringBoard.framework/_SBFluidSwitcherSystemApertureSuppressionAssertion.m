@interface _SBFluidSwitcherSystemApertureSuppressionAssertion
- (NSString)bundleID;
- (NSString)description;
- (NSString)sceneID;
- (_SBFluidSwitcherSystemApertureSuppressionAssertion)initWithSceneID:(id)a3 bundleID:(id)a4 invalidationBlock:(id)a5;
- (void)dealloc;
- (void)invalidate;
@end

@implementation _SBFluidSwitcherSystemApertureSuppressionAssertion

- (_SBFluidSwitcherSystemApertureSuppressionAssertion)initWithSceneID:(id)a3 bundleID:(id)a4 invalidationBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_SBFluidSwitcherSystemApertureSuppressionAssertion;
  v11 = [(_SBFluidSwitcherSystemApertureSuppressionAssertion *)&v20 init];
  v12 = v11;
  if (v11)
  {
    v11->_isValid = 1;
    uint64_t v13 = [v8 copy];
    sceneID = v12->_sceneID;
    v12->_sceneID = (NSString *)v13;

    uint64_t v15 = [v9 copy];
    bundleID = v12->_bundleID;
    v12->_bundleID = (NSString *)v15;

    uint64_t v17 = [v10 copy];
    id invalidationBlock = v12->_invalidationBlock;
    v12->_id invalidationBlock = (id)v17;
  }
  return v12;
}

- (void)dealloc
{
  if (self->_isValid)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"SBFluidSwitcherGestureManager.m" lineNumber:4082 description:@"Must be invalidated before deallocation"];
  }
  v5.receiver = self;
  v5.super_class = (Class)_SBFluidSwitcherSystemApertureSuppressionAssertion;
  [(_SBFluidSwitcherSystemApertureSuppressionAssertion *)&v5 dealloc];
}

- (NSString)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)_SBFluidSwitcherSystemApertureSuppressionAssertion;
  v4 = [(_SBFluidSwitcherSystemApertureSuppressionAssertion *)&v7 description];
  objc_super v5 = [v3 stringWithFormat:@"%@ sceneID: %@ bundleID: %@", v4, self->_sceneID, self->_bundleID];

  return (NSString *)v5;
}

- (NSString)sceneID
{
  return self->_sceneID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)invalidate
{
  self->_isValid = 0;
  id invalidationBlock = (void (**)(id, _SBFluidSwitcherSystemApertureSuppressionAssertion *))self->_invalidationBlock;
  if (invalidationBlock)
  {
    invalidationBlock[2](invalidationBlock, self);
    id v4 = self->_invalidationBlock;
    self->_id invalidationBlock = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationBlock, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_sceneID, 0);
}

@end