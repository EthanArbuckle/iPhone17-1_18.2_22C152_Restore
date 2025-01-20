@interface NUChannelPort
@end

@implementation NUChannelPort

uint64_t __26___NUChannelPort_subports__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 channel];
  v6 = [v5 name];
  v7 = [v4 channel];

  v8 = [v7 name];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

uint64_t __32___NUChannelPort_subportForKey___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 channel];
  id v4 = [v3 name];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

@end