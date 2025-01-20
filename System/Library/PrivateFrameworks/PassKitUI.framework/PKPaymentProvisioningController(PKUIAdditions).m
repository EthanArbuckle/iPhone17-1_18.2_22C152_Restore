@interface PKPaymentProvisioningController(PKUIAdditions)
- (id)alertForDisplayableError:()PKUIAdditions earlyExitHandler:;
- (uint64_t)alertForDisplayableError:()PKUIAdditions;
@end

@implementation PKPaymentProvisioningController(PKUIAdditions)

- (uint64_t)alertForDisplayableError:()PKUIAdditions
{
  return [a1 alertForDisplayableError:a3 earlyExitHandler:0];
}

- (id)alertForDisplayableError:()PKUIAdditions earlyExitHandler:
{
  return PKAlertForDisplayableErrorWithHandlers(a3, a4, 0, 0);
}

@end