@interface TSKMockUIAlert
+ (void)setDismissalButtonIndex:(int64_t)a3;
- (TSKMockUIAlert)initWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 otherButtonTitle:(id)a6;
- (int64_t)cancelButtonIndex;
- (int64_t)firstOtherButtonIndex;
- (void)showWithDismissedByButtonBlock:(id)a3;
@end

@implementation TSKMockUIAlert

+ (void)setDismissalButtonIndex:(int64_t)a3
{
  gMockUIAlertDismissalButtonIndex = a3;
}

- (TSKMockUIAlert)initWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 otherButtonTitle:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)TSKMockUIAlert;
  return [(TSKAbstractAlert *)&v7 init];
}

- (int64_t)cancelButtonIndex
{
  return 0;
}

- (int64_t)firstOtherButtonIndex
{
  return -1;
}

- (void)showWithDismissedByButtonBlock:(id)a3
{
}

@end