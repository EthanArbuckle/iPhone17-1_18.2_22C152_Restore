@interface CRNextCardCommand(CRKCardViewControllerCommandHandling)
- (uint64_t)handleForCardViewController:()CRKCardViewControllerCommandHandling cardViewControllerDelegate:;
@end

@implementation CRNextCardCommand(CRKCardViewControllerCommandHandling)

- (uint64_t)handleForCardViewController:()CRKCardViewControllerCommandHandling cardViewControllerDelegate:
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v8 = objc_alloc_init(MEMORY[0x263F31640]);
    v9 = [v6 card];
    v10 = [a1 nextCard];
    [v8 setBaseCard:v9];
    [v8 setRequestedCard:v10];
    [v7 controllerForCard:v9 didRequestAsyncCard:v10 withAsyncCardRequestFeedback:v8];
  }
  v17.receiver = a1;
  v17.super_class = (Class)&off_26DFA2970;
  unsigned int v11 = objc_msgSendSuper2(&v17, sel_handleForCardViewController_cardViewControllerDelegate_, v6, v7);
  v12 = [a1 nextCard];
  if (objc_opt_respondsToSelector())
  {
    v13 = [a1 nextCard];
    int v14 = [v13 asynchronous];
  }
  else
  {
    int v14 = 0;
  }

  uint64_t v15 = v14 & v11;
  if ((v14 & 1) == 0 && ((v11 ^ 1) & 1) == 0)
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v15 = [v7 performNextCardCommand:a1 forCardViewController:v6];
    }
    else {
      uint64_t v15 = 0;
    }
  }

  return v15;
}

@end