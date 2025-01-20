@interface _UIColorSampler
- (BOOL)floatEyedropperOnStart;
- (_UIColorSampler)init;
- (void)_createServerProxyIfNeeded;
- (void)dismissEyedropper;
- (void)eyedropperDidSelectColor:(id)a3;
- (void)floatEyedropper;
- (void)invokeEyedropper;
- (void)setFloatEyedropperOnStart:(BOOL)a3;
- (void)showSamplerWithSelectionHandler:(id)a3;
@end

@implementation _UIColorSampler

- (_UIColorSampler)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIColorSampler;
  result = [(_UIColorSampler *)&v3 init];
  if (result) {
    result->_floatEyedropperOnStart = 1;
  }
  return result;
}

- (void)showSamplerWithSelectionHandler:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51___UIColorSampler_showSamplerWithSelectionHandler___block_invoke;
  aBlock[3] = &unk_1E53088B8;
  id v5 = v4;
  id v9 = v5;
  v6 = _Block_copy(aBlock);
  id eyeDropperSelectionBlock = self->_eyeDropperSelectionBlock;
  self->_id eyeDropperSelectionBlock = v6;

  [(_UIColorSampler *)self invokeEyedropper];
  if ([(_UIColorSampler *)self floatEyedropperOnStart]) {
    [(_UIColorSampler *)self floatEyedropper];
  }
}

- (void)setFloatEyedropperOnStart:(BOOL)a3
{
  self->_floatEyedropperOnStart = a3;
}

- (BOOL)floatEyedropperOnStart
{
  return self->_floatEyedropperOnStart;
}

- (void)_createServerProxyIfNeeded
{
  if (!self->_eyeDropperServerProxy)
  {
    objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.uikit.eyedropperd.service" options:0];
    objc_storeStrong((id *)&self->_eyeDropperConnection, v3);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __45___UIColorSampler__createServerProxyIfNeeded__block_invoke;
    v12[3] = &unk_1E52D9F70;
    id v4 = v3;
    id v13 = v4;
    [(NSXPCConnection *)self->_eyeDropperConnection setInterruptionHandler:v12];
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __45___UIColorSampler__createServerProxyIfNeeded__block_invoke_2;
    v9[3] = &unk_1E52DC308;
    objc_copyWeak(&v10, &location);
    [(NSXPCConnection *)self->_eyeDropperConnection setInvalidationHandler:v9];
    id v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED701600];
    [(NSXPCConnection *)self->_eyeDropperConnection setRemoteObjectInterface:v5];

    v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED701660];
    [(NSXPCConnection *)self->_eyeDropperConnection setExportedInterface:v6];

    [(NSXPCConnection *)self->_eyeDropperConnection setExportedObject:self];
    [(NSXPCConnection *)self->_eyeDropperConnection resume];
    v7 = [(NSXPCConnection *)self->_eyeDropperConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_60_2];
    eyeDropperServerProxy = self->_eyeDropperServerProxy;
    self->_eyeDropperServerProxy = v7;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)invokeEyedropper
{
  [(_UIColorSampler *)self _createServerProxyIfNeeded];
  eyeDropperServerProxy = self->_eyeDropperServerProxy;
  id v6 = +[UIScreen mainScreen];
  id v4 = [v6 displayConfiguration];
  id v5 = [v4 hardwareIdentifier];
  [(EDServiceServer *)eyeDropperServerProxy beginShowingEyeDropper:v5];
}

- (void)floatEyedropper
{
  [(_UIColorSampler *)self _createServerProxyIfNeeded];
  eyeDropperServerProxy = self->_eyeDropperServerProxy;
  [(EDServiceServer *)eyeDropperServerProxy floatEyeDropper];
}

- (void)dismissEyedropper
{
  [(_UIColorSampler *)self _createServerProxyIfNeeded];
  eyeDropperServerProxy = self->_eyeDropperServerProxy;
  [(EDServiceServer *)eyeDropperServerProxy cancelShowingEyeDropper];
}

- (void)eyedropperDidSelectColor:(id)a3
{
  id eyeDropperSelectionBlock = (void (**)(id, id))self->_eyeDropperSelectionBlock;
  if (eyeDropperSelectionBlock) {
    eyeDropperSelectionBlock[2](eyeDropperSelectionBlock, a3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eyeDropperSelectionBlock, 0);
  objc_storeStrong((id *)&self->_eyeDropperConnection, 0);
  objc_storeStrong((id *)&self->_eyeDropperServerProxy, 0);
}

@end