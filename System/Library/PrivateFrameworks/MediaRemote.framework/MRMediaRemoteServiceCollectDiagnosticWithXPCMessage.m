@interface MRMediaRemoteServiceCollectDiagnosticWithXPCMessage
@end

@implementation MRMediaRemoteServiceCollectDiagnosticWithXPCMessage

void ___MRMediaRemoteServiceCollectDiagnosticWithXPCMessage_block_invoke(uint64_t a1, void *a2)
{
  v4 = (void *)MEMORY[0x1E4F14520];
  id v5 = a2;
  v6 = v5;
  if (a2 == v4 || a2 == (void *)MEMORY[0x1E4F14528])
  {
    _MRServiceLogReplyError();

    Error = (void *)MRMediaRemoteCreateError(1);
    id v9 = 0;
  }
  else
  {
    id v9 = (id)MRCreateDiagnosticFromXPCMessage(v5);
    Error = (void *)MRCreateClientErrorFromXPCMessage(v6);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end