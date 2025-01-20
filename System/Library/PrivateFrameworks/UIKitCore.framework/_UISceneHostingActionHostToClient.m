@interface _UISceneHostingActionHostToClient
- (int64_t)UIActionType;
- (void)performActionForHostedWindowScene:(id)a3;
@end

@implementation _UISceneHostingActionHostToClient

- (void)performActionForHostedWindowScene:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v7 handleFailureInMethod:a2, self, @"_UISceneHostingActionHostToClient.m", 16, @"_UISceneHostingActionHostToClient subclass <%@: %p> did not override -performActionForHostedWindowScene:", v6, self object file lineNumber description];
}

- (int64_t)UIActionType
{
  return 57;
}

@end