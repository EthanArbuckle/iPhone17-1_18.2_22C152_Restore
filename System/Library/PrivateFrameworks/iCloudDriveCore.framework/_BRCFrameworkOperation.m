@interface _BRCFrameworkOperation
- (BOOL)ignoreMissingRemoteClientProxy;
- (BROperationClient)remoteClientProxy;
- (id)descriptionAdditionalStringWithContext:(id)a3;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)invalidate;
- (void)setIgnoreMissingRemoteClientProxy:(BOOL)a3;
- (void)setRemoteClientProxy:(id)a3;
- (void)start;
@end

@implementation _BRCFrameworkOperation

- (id)descriptionAdditionalStringWithContext:(id)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"remote:%p", self->_remoteClientProxy);
}

- (void)setRemoteClientProxy:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47___BRCFrameworkOperation_setRemoteClientProxy___block_invoke;
  v8[3] = &unk_26507EBD8;
  v8[4] = v5;
  uint64_t v6 = [v4 remoteObjectProxyWithErrorHandler:v8];
  remoteClientProxy = v5->_remoteClientProxy;
  v5->_remoteClientProxy = (BROperationClient *)v6;

  [(BROperationClient *)v5->_remoteClientProxy setRemoteOperationProxy:v5 userInfo:0];
  objc_sync_exit(v5);
}

- (void)invalidate
{
  if (!self->_startedFinish) {
    [(_BRCOperation *)self cancel];
  }
  [(_BRCFrameworkOperation *)self setRemoteClientProxy:0];
}

- (void)start
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _remoteClientProxy || _ignoreMissingRemoteClientProxy%@", v2, v3, v4, v5, v6);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  self->_startedFinish = 1;
  v5.receiver = self;
  v5.super_class = (Class)_BRCFrameworkOperation;
  [(_BRCOperation *)&v5 finishWithResult:a3 error:a4];
  [(_BRCFrameworkOperation *)self setRemoteClientProxy:0];
}

- (BROperationClient)remoteClientProxy
{
  return self->_remoteClientProxy;
}

- (BOOL)ignoreMissingRemoteClientProxy
{
  return self->_ignoreMissingRemoteClientProxy;
}

- (void)setIgnoreMissingRemoteClientProxy:(BOOL)a3
{
  self->_ignoreMissingRemoteClientProxy = a3;
}

- (void).cxx_destruct
{
}

@end