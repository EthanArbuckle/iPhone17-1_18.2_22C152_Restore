@interface MRServiceCreateErrorHandlerBlock
@end

@implementation MRServiceCreateErrorHandlerBlock

void ___MRServiceCreateErrorHandlerBlock_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3 == (id)MEMORY[0x1E4F14520] || v3 == (id)MEMORY[0x1E4F14528];
  id v8 = v3;
  if (v4)
  {
    _MRServiceLogReplyError();
    uint64_t Error = MRMediaRemoteCreateError(1);
  }
  else
  {
    uint64_t Error = MRCreateClientErrorFromXPCMessage(v3);
  }
  v6 = (void *)Error;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);
  }
}

@end