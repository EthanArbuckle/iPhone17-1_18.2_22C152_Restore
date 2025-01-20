@interface _UISceneHostingActionClientToHost
- (int64_t)UIActionType;
- (void)performActionForSceneController:(id)a3;
@end

@implementation _UISceneHostingActionClientToHost

- (void)performActionForSceneController:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v7 handleFailureInMethod:a2, self, @"_UISceneHostingActionClientToHost.m", 16, @"_UISceneHostingActionClientToHost subclass <%@: %p> did not override -performActionForSceneController:", v6, self object file lineNumber description];
}

- (int64_t)UIActionType
{
  return 56;
}

@end