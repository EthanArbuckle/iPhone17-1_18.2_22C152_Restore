@interface TUILayoutContainer
- (BOOL)invalidChildren;
- (BOOL)isDescendentOfLayout:(id)a3;
- (BOOL)isLayout;
- (BOOL)layoutIsInvalid;
- (BOOL)shouldAutoInvalidateRenderModelOnChildInvalidate;
- (NSArray)containers;
- (TUILayoutContainer)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5;
- (TUILayoutContaining)parent;
- (TUILayoutController)controller;
- (TUIModelLayoutable)model;
- (id)layout;
- (void)enumerateChildren:(id)a3;
- (void)notifyChildrenScaleDidChange;
- (void)onChildInvalidate:(id)a3;
- (void)onChildInvalidateIntrinsicSize:(id)a3;
- (void)onChildRenderModelInvalidate:(id)a3;
- (void)onChildTransformedSizeDidChange:(id)a3;
- (void)onContainersUpdated;
- (void)setContainers:(id)a3;
- (void)setInvalidChildren:(BOOL)a3;
- (void)updateParent:(id)a3;
@end

@implementation TUILayoutContainer

- (TUILayoutContainer)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TUILayoutContainer;
  v12 = [(TUILayoutContainer *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_model, a3);
    objc_storeWeak((id *)&v13->_parent, v10);
    objc_storeWeak((id *)&v13->_controller, v11);
  }

  return v13;
}

- (void)updateParent:(id)a3
{
}

- (BOOL)isLayout
{
  return 0;
}

- (id)layout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  v3 = [WeakRetained layout];

  return v3;
}

- (void)onContainersUpdated
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  [WeakRetained onContainersUpdated];
}

- (void)onChildInvalidate:(id)a3
{
  p_parent = &self->_parent;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_parent);
  [WeakRetained onChildInvalidate:v4];
}

- (void)onChildRenderModelInvalidate:(id)a3
{
  p_parent = &self->_parent;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_parent);
  [WeakRetained onChildRenderModelInvalidate:v4];
}

- (BOOL)shouldAutoInvalidateRenderModelOnChildInvalidate
{
  return 1;
}

- (void)onChildInvalidateIntrinsicSize:(id)a3
{
  p_parent = &self->_parent;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_parent);
  [WeakRetained onChildInvalidateIntrinsicSize:v4];
}

- (void)onChildTransformedSizeDidChange:(id)a3
{
  p_parent = &self->_parent;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_parent);
  [WeakRetained onChildTransformedSizeDidChange:v4];
}

- (BOOL)isDescendentOfLayout:(id)a3
{
  id v4 = a3;
  id v5 = [(TUILayoutContainer *)self parent];
  if (v5 == v4)
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    v6 = [(TUILayoutContainer *)self parent];
    unsigned __int8 v7 = [v6 isDescendentOfLayout:v4];
  }
  return v7;
}

- (void)notifyChildrenScaleDidChange
{
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v2 = self->_containers;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      id v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * (void)v5) onComputedScaleDidChange:(void)v6];
        id v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)enumerateChildren:(id)a3
{
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_containers;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      long long v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) enumerateLayout:v4];
        long long v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (TUIModelLayoutable)model
{
  return self->_model;
}

- (TUILayoutContaining)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  return (TUILayoutContaining *)WeakRetained;
}

- (TUILayoutController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (TUILayoutController *)WeakRetained;
}

- (BOOL)invalidChildren
{
  return self->_invalidChildren;
}

- (void)setInvalidChildren:(BOOL)a3
{
  self->_invalidChildren = a3;
}

- (BOOL)layoutIsInvalid
{
  return self->_layoutIsInvalid;
}

- (NSArray)containers
{
  return self->_containers;
}

- (void)setContainers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containers, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_destroyWeak((id *)&self->_parent);

  objc_storeStrong((id *)&self->_model, 0);
}

@end