@interface RBSProcessHandle(SpringBoard)
- (uint64_t)sb_canDrawWhileLocked;
- (uint64_t)sb_showsViewsWhileLockedForBundle:()SpringBoard;
@end

@implementation RBSProcessHandle(SpringBoard)

- (uint64_t)sb_canDrawWhileLocked
{
  v2 = [a1 bundle];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F4F6A8];
    [a1 auditToken];
    v4 = [v3 tokenFromAuditToken:&v8];
    int v5 = [v4 hasEntitlement:@"com.apple.QuartzCore.secure-mode"];
    uint64_t v6 = v5 & objc_msgSend(a1, "sb_showsViewsWhileLockedForBundle:", v2);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (uint64_t)sb_showsViewsWhileLockedForBundle:()SpringBoard
{
  id v4 = a3;
  objc_getAssociatedObject(a1, "com.apple.SpringBoardFramework.RBSProcess.showsViewsWhileLocked");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    uint64_t v6 = [v4 bundleInfoValueForKey:@"UIApplicationShowsViewsWhileLocked"];
    uint64_t v7 = objc_opt_class();
    id v8 = v6;
    if (v7)
    {
      if (objc_opt_isKindOfClass()) {
        v9 = v8;
      }
      else {
        v9 = 0;
      }
    }
    else
    {
      v9 = 0;
    }
    id v5 = v9;

    if (!v5)
    {
      uint64_t v10 = 0;
      goto LABEL_10;
    }
    objc_setAssociatedObject(a1, "com.apple.SpringBoardFramework.RBSProcess.showsViewsWhileLocked", v5, (void *)1);
  }
  uint64_t v10 = [v5 BOOLValue];

LABEL_10:
  return v10;
}

@end