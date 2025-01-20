@interface MRMediaRemoteServiceProtobuf
@end

@implementation MRMediaRemoteServiceProtobuf

void ___MRMediaRemoteServiceProtobuf_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v5)
  {
    v6 = [[MRProtocolMessage alloc] initWithUnderlyingCodableMessage:0 error:v5];
  }
  else
  {
    MRCreateProtobufFromXPCMessage(v9);
    v6 = (MRProtocolMessage *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, MRProtocolMessage *))(v8 + 16))(v8, v7);
  }
}

@end