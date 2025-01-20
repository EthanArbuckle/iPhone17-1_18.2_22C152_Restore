@interface SBXXSetTypingActive
@end

@implementation SBXXSetTypingActive

uint64_t ___SBXXSetTypingActive_block_invoke(uint64_t a1)
{
  BOOL v1 = *(unsigned char *)(a1 + 64) != 0;
  long long v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return [(id)SBApp setTypingActive:v1 auditToken:v4];
}

@end