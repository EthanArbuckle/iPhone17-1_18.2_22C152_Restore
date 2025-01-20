@interface PKVirtualCard(PKIconAdditions)
- (id)cardIcon;
@end

@implementation PKVirtualCard(PKIconAdditions)

- (id)cardIcon
{
  if ([a1 type] == 1)
  {
    v1 = (void *)MEMORY[0x263F1C6B0];
    v2 = PKPassKitUIFoundationBundle();
    v3 = [v1 imageNamed:@"AppleCardAutoFillCreditCardIcon" inBundle:v2];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end