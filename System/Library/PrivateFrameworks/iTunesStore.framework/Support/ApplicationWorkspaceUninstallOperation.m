@interface ApplicationWorkspaceUninstallOperation
- (void)runWithCompletionBlock:(id)a3;
@end

@implementation ApplicationWorkspaceUninstallOperation

- (void)runWithCompletionBlock:(id)a3
{
  +[ApplicationWorkspaceState completeNotificationForCanceledBundleIdentifier:[(ApplicationHandle *)[(ApplicationWorkspaceOperation *)self applicationHandle] bundleID]];
  if (a3)
  {
    v4 = (void (*)(id, uint64_t, void, void))*((void *)a3 + 2);
    v4(a3, 1, 0, 0);
  }
}

@end