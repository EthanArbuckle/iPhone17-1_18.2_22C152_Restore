@interface PKTransitPassProperties(NanoPassKit)
- (uint64_t)npkHasTransitBalance;
@end

@implementation PKTransitPassProperties(NanoPassKit)

- (uint64_t)npkHasTransitBalance
{
  v1 = [a1 balanceAmount];
  v2 = [v1 amount];

  if (v2)
  {
    v3 = [MEMORY[0x263F087B0] zero];
    uint64_t v4 = [v2 isEqualToNumber:v3] ^ 1;
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

@end