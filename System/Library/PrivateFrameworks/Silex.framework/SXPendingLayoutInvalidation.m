@interface SXPendingLayoutInvalidation
- (NFPendingPromise)pendingPromise;
- (SXComponent)component;
- (SXLayoutOptions)layoutOptions;
- (SXPendingLayoutInvalidation)initWithComponent:(id)a3 pendingPromise:(id)a4 layoutOptions:(id)a5 invalidation:(id)a6;
- (id)invalidation;
@end

@implementation SXPendingLayoutInvalidation

- (SXPendingLayoutInvalidation)initWithComponent:(id)a3 pendingPromise:(id)a4 layoutOptions:(id)a5 invalidation:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SXPendingLayoutInvalidation;
  v15 = [(SXPendingLayoutInvalidation *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_component, a3);
    objc_storeStrong((id *)&v16->_pendingPromise, a4);
    objc_storeStrong((id *)&v16->_layoutOptions, a5);
    uint64_t v17 = MEMORY[0x223CA5030](v14);
    id invalidation = v16->_invalidation;
    v16->_id invalidation = (id)v17;
  }
  return v16;
}

- (SXComponent)component
{
  return self->_component;
}

- (NFPendingPromise)pendingPromise
{
  return self->_pendingPromise;
}

- (SXLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (id)invalidation
{
  return self->_invalidation;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidation, 0);
  objc_storeStrong((id *)&self->_layoutOptions, 0);
  objc_storeStrong((id *)&self->_pendingPromise, 0);
  objc_storeStrong((id *)&self->_component, 0);
}

@end