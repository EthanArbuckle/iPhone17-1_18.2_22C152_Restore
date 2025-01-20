@interface ICSCDPWebAccessStatusUpdateHook
- (id)changeControllerForAction:(id)a3;
@end

@implementation ICSCDPWebAccessStatusUpdateHook

- (id)changeControllerForAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"webaccess:enable"])
  {
    uint64_t v4 = 1;
LABEL_5:
    v5 = [MEMORY[0x263F34A28] controllerWithTargetWebAccessStatus:v4];
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"webaccess:disable"])
  {
    uint64_t v4 = 2;
    goto LABEL_5;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

@end