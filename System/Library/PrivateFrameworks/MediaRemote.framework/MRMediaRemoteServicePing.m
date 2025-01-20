@interface MRMediaRemoteServicePing
@end

@implementation MRMediaRemoteServicePing

uint64_t ___MRMediaRemoteServicePing_block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSinceDate:*(void *)(a1 + 32)];
  unint64_t v4 = v3;

  v5 = *(uint64_t (**)(__n128))(*(void *)(a1 + 40) + 16);
  v6.n128_u64[0] = v4;

  return v5(v6);
}

@end