@interface SBIconListViewCaptureOnlyBackgroundAssertion
- (NSString)groupName;
- (SBIcon)icon;
- (SBIconListViewCaptureOnlyBackgroundAssertion)initWithIcon:(id)a3 groupName:(id)a4 invalidation:(id)a5;
- (void)invalidate;
@end

@implementation SBIconListViewCaptureOnlyBackgroundAssertion

- (SBIconListViewCaptureOnlyBackgroundAssertion)initWithIcon:(id)a3 groupName:(id)a4 invalidation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SBIconListViewCaptureOnlyBackgroundAssertion;
  v11 = [(SBIconListViewCaptureOnlyBackgroundAssertion *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_icon, v8);
    objc_storeStrong((id *)&v12->_groupName, a4);
    uint64_t v13 = [v10 copy];
    id invalidationBlock = v12->_invalidationBlock;
    v12->_id invalidationBlock = (id)v13;
  }
  return v12;
}

- (void)invalidate
{
  id invalidationBlock = self->_invalidationBlock;
  if (invalidationBlock)
  {
    v5 = (void (**)(id, SBIconListViewCaptureOnlyBackgroundAssertion *))_Block_copy(invalidationBlock);
    id v4 = self->_invalidationBlock;
    self->_id invalidationBlock = 0;

    v5[2](v5, self);
  }
}

- (SBIcon)icon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icon);
  return (SBIcon *)WeakRetained;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_destroyWeak((id *)&self->_icon);
  objc_storeStrong(&self->_invalidationBlock, 0);
}

@end