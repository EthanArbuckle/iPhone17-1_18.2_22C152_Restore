@interface SBPhysicalButtonBehaviorRequest
- (BOOL)isEqual:(id)a3;
- (BSAuditToken)requestingProcessAuditToken;
- (FBScene)scene;
- (SBPhysicalButtonBehaviorRequest)initWithPhysicalButtonConfiguration:(id)a3 generation:(unint64_t)a4 identifier:(unint64_t)a5 scene:(id)a6;
- (unint64_t)generation;
- (unint64_t)identifier;
- (unint64_t)physicalButtonBehavior;
@end

@implementation SBPhysicalButtonBehaviorRequest

- (unint64_t)physicalButtonBehavior
{
  return self->_physicalButtonBehavior;
}

- (FBScene)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (FBScene *)WeakRetained;
}

- (SBPhysicalButtonBehaviorRequest)initWithPhysicalButtonConfiguration:(id)a3 generation:(unint64_t)a4 identifier:(unint64_t)a5 scene:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SBPhysicalButtonBehaviorRequest;
  v12 = [(SBPhysicalButtonBehaviorRequest *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_scene, v11);
    v13->_identifier = a5;
    v13->_generation = a4;
    v13->_physicalButtonBehavior = [v10 _behavior];
    uint64_t v14 = [v10 _auditToken];
    requestingProcessAuditToken = v13->_requestingProcessAuditToken;
    v13->_requestingProcessAuditToken = (BSAuditToken *)v14;
  }
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBPhysicalButtonBehaviorRequest *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    v6 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        v7 = v6;
      }
      else {
        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
    }
    v9 = v7;

    if (v9 && self->_physicalButtonBehavior == v9[1] && self->_generation == v9[3])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
      id v11 = objc_loadWeakRetained(v9 + 4);
      if (BSEqualObjects()) {
        char v8 = BSEqualObjects();
      }
      else {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestingProcessAuditToken, 0);
  objc_destroyWeak((id *)&self->_scene);
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (unint64_t)generation
{
  return self->_generation;
}

- (BSAuditToken)requestingProcessAuditToken
{
  return self->_requestingProcessAuditToken;
}

@end