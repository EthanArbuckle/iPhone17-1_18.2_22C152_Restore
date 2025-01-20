@interface NSXPCConnection(PGAdditions)
- (id)PG_remoteObjectProxyWithDebugMethodAndPointerProem:()PGAdditions errorHandler:;
- (uint64_t)PG_hasScreenSharingEntitlement;
- (uint64_t)PG_remoteObjectProxyWithDebugMethodAndPointerProem:()PGAdditions;
@end

@implementation NSXPCConnection(PGAdditions)

- (uint64_t)PG_remoteObjectProxyWithDebugMethodAndPointerProem:()PGAdditions
{
  return objc_msgSend(a1, "PG_remoteObjectProxyWithDebugMethodAndPointerProem:errorHandler:", a3, 0);
}

- (id)PG_remoteObjectProxyWithDebugMethodAndPointerProem:()PGAdditions errorHandler:
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __96__NSXPCConnection_PGAdditions__PG_remoteObjectProxyWithDebugMethodAndPointerProem_errorHandler___block_invoke;
  v12[3] = &unk_1E610DB98;
  id v13 = v6;
  v14 = a1;
  id v15 = v7;
  id v8 = v7;
  id v9 = v6;
  v10 = [a1 remoteObjectProxyWithErrorHandler:v12];

  return v10;
}

- (uint64_t)PG_hasScreenSharingEntitlement
{
  v1 = [a1 valueForEntitlement:@"com.apple.pegasus.canShowScreenSharing"];
  uint64_t v2 = [v1 isEqualToNumber:MEMORY[0x1E4F1CC38]];

  return v2;
}

@end