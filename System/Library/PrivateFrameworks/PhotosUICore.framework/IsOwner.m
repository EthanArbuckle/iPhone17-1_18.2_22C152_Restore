@interface IsOwner
@end

@implementation IsOwner

void ___IsOwner_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  int v6 = [v8 role];
  v7 = v8;
  if (v6 == 1)
  {
    if ([v8 isCurrentUser]) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    }
    *a4 = 1;
    v7 = v8;
  }
}

@end