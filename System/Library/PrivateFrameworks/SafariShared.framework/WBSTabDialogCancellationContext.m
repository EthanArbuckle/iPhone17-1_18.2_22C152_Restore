@interface WBSTabDialogCancellationContext
+ (id)cancellationContextWithReason:(id)a3 userInfo:(id)a4;
+ (id)committedNavigationContextWithURL:(id)a3;
+ (id)provisionalNavigationContext;
+ (id)tabClosedContext;
- (NSDictionary)userInfo;
- (NSString)reason;
- (WBSTabDialogCancellationContext)init;
- (WBSTabDialogCancellationContext)initWithReason:(id)a3 userInfo:(id)a4;
@end

@implementation WBSTabDialogCancellationContext

- (WBSTabDialogCancellationContext)init
{
  return 0;
}

- (WBSTabDialogCancellationContext)initWithReason:(id)a3 userInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WBSTabDialogCancellationContext;
  v9 = [(WBSTabDialogCancellationContext *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_reason, a3);
    uint64_t v11 = [v8 copy];
    v12 = (void *)v11;
    if (v11) {
      v13 = (void *)v11;
    }
    else {
      v13 = (void *)MEMORY[0x1E4F1CC08];
    }
    objc_storeStrong((id *)&v10->_userInfo, v13);

    v14 = v10;
  }

  return v10;
}

+ (id)cancellationContextWithReason:(id)a3 userInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithReason:v7 userInfo:v6];

  return v8;
}

+ (id)provisionalNavigationContext
{
  return (id)[a1 cancellationContextWithReason:@"WBSTabDialogCancellationReasonProvisionalNavigation" userInfo:0];
}

+ (id)committedNavigationContextWithURL:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v9 = @"WBSTabDialogCancellationReasonCommittedNavigationCurrentURLKey";
    v10[0] = a3;
    v4 = (void *)MEMORY[0x1E4F1C9E8];
    id v5 = a3;
    id v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = [a1 cancellationContextWithReason:@"WBSTabDialogCancellationReasonCommittedNavigation" userInfo:v6];

  return v7;
}

+ (id)tabClosedContext
{
  return (id)[a1 cancellationContextWithReason:@"WBSTabDialogCancellationReasonTabClosed" userInfo:0];
}

- (NSString)reason
{
  return self->_reason;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end