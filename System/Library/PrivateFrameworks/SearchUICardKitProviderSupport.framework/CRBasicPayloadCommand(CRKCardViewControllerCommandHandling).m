@interface CRBasicPayloadCommand(CRKCardViewControllerCommandHandling)
- (uint64_t)handleForCardViewController:()CRKCardViewControllerCommandHandling cardViewControllerDelegate:;
@end

@implementation CRBasicPayloadCommand(CRKCardViewControllerCommandHandling)

- (uint64_t)handleForCardViewController:()CRKCardViewControllerCommandHandling cardViewControllerDelegate:
{
  return 1;
}

@end