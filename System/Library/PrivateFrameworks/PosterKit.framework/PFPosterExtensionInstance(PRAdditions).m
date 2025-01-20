@interface PFPosterExtensionInstance(PRAdditions)
- (id)pr_assetUpdaterWithError:()PRAdditions;
- (id)pr_refreshConfigurationOperationQueue;
- (id)pr_refreshConfigurationOperations;
- (id)pr_reloadDescriptorOperationQueue;
- (id)pr_reloadDescriptorOperations;
- (void)pr_acquireAssetUpdaterWithBlock:()PRAdditions;
- (void)pr_addRefreshConfigurationOperation:()PRAdditions waitUntilFinished:;
- (void)pr_addReloadDescriptorOperation:()PRAdditions;
@end

@implementation PFPosterExtensionInstance(PRAdditions)

- (id)pr_reloadDescriptorOperationQueue
{
  key = a2;
  id v3 = a1;
  objc_sync_enter(v3);
  objc_getAssociatedObject(v3, a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = [v3 instanceIdentifier];
    v6 = [v5 UUIDString];

    v7 = [v3 processIdentity];
    id v4 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    v8 = [NSString stringWithFormat:@"com.apple.posterboard.reloadDescriptorsQueue-%@-%@", v6, v7];
    [v4 setName:v8];

    [v4 setQualityOfService:25];
    [v4 setMaxConcurrentOperationCount:1];
    objc_setAssociatedObject(v3, &key, v4, (void *)1);
  }
  objc_sync_exit(v3);

  return v4;
}

- (id)pr_refreshConfigurationOperationQueue
{
  key = a2;
  id v3 = a1;
  objc_sync_enter(v3);
  objc_getAssociatedObject(v3, a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = [v3 instanceIdentifier];
    v6 = [v5 UUIDString];

    v7 = [v3 processIdentity];
    id v4 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    v8 = [NSString stringWithFormat:@"com.apple.posterboard.refreshConfigurationQueue-%@-%@", v6, v7];
    [v4 setName:v8];

    [v4 setQualityOfService:25];
    [v4 setMaxConcurrentOperationCount:1];
    objc_setAssociatedObject(v3, &key, v4, (void *)1);
  }
  objc_sync_exit(v3);

  return v4;
}

- (id)pr_assetUpdaterWithError:()PRAdditions
{
  v2 = objc_msgSend(a1, "bootupExtensionInstanceWithError:");
  id v3 = v2;
  if (v2)
  {
    id v4 = (void *)MEMORY[0x1E4F4F6A8];
    [v2 auditToken];
    v5 = [v4 tokenFromAuditToken:&v11];
    v6 = (void *)MEMORY[0x1E4F96478];
    v7 = [a1 processIdentity];
    v8 = [v6 targetWithProcessIdentity:v7];

    v9 = +[PRUpdatingService updatingServiceWithProcess:v3 auditToken:v5 target:v8];
    [a1 addInstanceObserver:v9];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)pr_acquireAssetUpdaterWithBlock:()PRAdditions
{
  id v4 = a3;
  objc_initWeak(&location, a1);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__PFPosterExtensionInstance_PRAdditions__pr_acquireAssetUpdaterWithBlock___block_invoke;
  v6[3] = &unk_1E54DC170;
  id v5 = v4;
  v6[4] = a1;
  id v7 = v5;
  objc_copyWeak(&v8, &location);
  [a1 bootupExtensionInstance:v6];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

- (id)pr_reloadDescriptorOperations
{
  v1 = objc_msgSend(a1, "pr_reloadDescriptorOperationQueue");
  v2 = [v1 operations];

  return v2;
}

- (void)pr_addReloadDescriptorOperation:()PRAdditions
{
  id v4 = a3;
  objc_msgSend(a1, "pr_refreshConfigurationOperationQueue");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 addOperation:v4];
}

- (id)pr_refreshConfigurationOperations
{
  v1 = objc_msgSend(a1, "pr_refreshConfigurationOperationQueue");
  v2 = [v1 operations];

  return v2;
}

- (void)pr_addRefreshConfigurationOperation:()PRAdditions waitUntilFinished:
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_msgSend(a1, "pr_refreshConfigurationOperationQueue");
  v9[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  [v7 addOperations:v8 waitUntilFinished:a4];
}

@end