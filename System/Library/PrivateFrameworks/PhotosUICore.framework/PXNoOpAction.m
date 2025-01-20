@interface PXNoOpAction
- (id)actionIdentifier;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation PXNoOpAction

- (void)performUndo:(id)a3
{
}

- (void)performAction:(id)a3
{
}

- (id)actionIdentifier
{
  return @"No-Op";
}

@end