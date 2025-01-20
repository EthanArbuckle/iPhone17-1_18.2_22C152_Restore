@interface ACAccount(StocksCore)
- (uint64_t)sc_isEnabledForStocksDataclass;
@end

@implementation ACAccount(StocksCore)

- (uint64_t)sc_isEnabledForStocksDataclass
{
  return [a1 isEnabledForDataclass:*MEMORY[0x1E4F17638]];
}

@end