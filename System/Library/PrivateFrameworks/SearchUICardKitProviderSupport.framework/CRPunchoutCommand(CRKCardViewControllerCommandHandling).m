@interface CRPunchoutCommand(CRKCardViewControllerCommandHandling)
- (uint64_t)handleForCardViewController:()CRKCardViewControllerCommandHandling cardViewControllerDelegate:;
@end

@implementation CRPunchoutCommand(CRKCardViewControllerCommandHandling)

- (uint64_t)handleForCardViewController:()CRKCardViewControllerCommandHandling cardViewControllerDelegate:
{
  id v6 = a3;
  id v7 = a4;
  v10.receiver = a1;
  v10.super_class = (Class)&off_26DFA2B80;
  if (objc_msgSendSuper2(&v10, sel_handleForCardViewController_cardViewControllerDelegate_, v6, v7)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v8 = [v7 performPunchoutCommand:a1 forCardViewController:v6];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

@end