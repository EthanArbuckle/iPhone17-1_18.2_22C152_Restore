@interface _SBCameraOverlayRequest
- (BOOL)isEqual:(id)a3;
- (BSAuditToken)auditTokenOfProcessRequestingOverlay;
- (FBScene)sceneRequestingOverlay;
- (_SBCameraOverlayRequest)initWithObservation:(id)a3;
- (unint64_t)hash;
@end

@implementation _SBCameraOverlayRequest

- (_SBCameraOverlayRequest)initWithObservation:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SBCameraOverlayRequest;
  v5 = [(_SBCameraOverlayRequest *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 cameraBehaviorScene];
    sceneRequestingOverlay = v5->_sceneRequestingOverlay;
    v5->_sceneRequestingOverlay = (FBScene *)v6;

    uint64_t v8 = [v4 auditTokenForRequestingProcessOfCameraBehaviorScene];
    auditTokenOfProcessRequestingOverlay = v5->_auditTokenOfProcessRequestingOverlay;
    v5->_auditTokenOfProcessRequestingOverlay = (BSAuditToken *)v8;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  sceneRequestingOverlay = self->_sceneRequestingOverlay;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __35___SBCameraOverlayRequest_isEqual___block_invoke;
  v19[3] = &unk_1E6AF9E90;
  id v7 = v4;
  id v20 = v7;
  uint64_t v8 = [v5 appendObject:sceneRequestingOverlay counterpart:v19];
  auditTokenOfProcessRequestingOverlay = self->_auditTokenOfProcessRequestingOverlay;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __35___SBCameraOverlayRequest_isEqual___block_invoke_2;
  v17 = &unk_1E6AF9E90;
  id v18 = v7;
  id v10 = v7;
  objc_super v11 = [v8 appendObject:auditTokenOfProcessRequestingOverlay counterpart:&v14];
  char v12 = objc_msgSend(v11, "isEqual", v14, v15, v16, v17);

  return v12;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [v3 appendObject:self->_sceneRequestingOverlay];
  v5 = [v4 appendObject:self->_auditTokenOfProcessRequestingOverlay];
  unint64_t v6 = [v5 hash];

  return v6;
}

- (FBScene)sceneRequestingOverlay
{
  return self->_sceneRequestingOverlay;
}

- (BSAuditToken)auditTokenOfProcessRequestingOverlay
{
  return self->_auditTokenOfProcessRequestingOverlay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditTokenOfProcessRequestingOverlay, 0);
  objc_storeStrong((id *)&self->_sceneRequestingOverlay, 0);
}

@end