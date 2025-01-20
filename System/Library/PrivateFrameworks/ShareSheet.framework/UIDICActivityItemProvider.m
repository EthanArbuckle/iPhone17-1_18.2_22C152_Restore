@interface UIDICActivityItemProvider
@end

@implementation UIDICActivityItemProvider

void __69___UIDICActivityItemProvider__shouldExecuteItemOperationForActivity___block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  _shouldExecuteItemOperationForActivity__executeInShareUI = [v0 BOOLForKey:@"UIOpenInByCopyPerformedInShareUI"];
}

@end