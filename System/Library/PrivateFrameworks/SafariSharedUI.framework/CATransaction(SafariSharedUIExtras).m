@interface CATransaction(SafariSharedUIExtras)
+ (uint64_t)safari_performWithActionsDisabled:()SafariSharedUIExtras;
@end

@implementation CATransaction(SafariSharedUIExtras)

+ (uint64_t)safari_performWithActionsDisabled:()SafariSharedUIExtras
{
  v4 = a3;
  [a1 begin];
  [a1 setDisableActions:1];
  v4[2](v4);

  return [a1 commit];
}

@end