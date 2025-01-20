@interface MIInstallableParallelPlaceholder
- (BOOL)performInstallationWithError:(id *)a3;
- (BOOL)shouldModifyExistingContainers;
@end

@implementation MIInstallableParallelPlaceholder

- (BOOL)shouldModifyExistingContainers
{
  return 0;
}

- (BOOL)performInstallationWithError:(id *)a3
{
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
    MOLogWrite();
  }
  v5 = [(MIInstallable *)self progressBlock];
  ((void (**)(void, const __CFString *, uint64_t))v5)[2](v5, @"InstallingApplication", 60);

  v6 = [(MIInstallableBundle *)self existingBundleContainer];
  v7 = [v6 parallelPlaceholderURL];

  v8 = +[MIFileManager defaultManager];
  [v8 removeItemAtURL:v7 error:0];

  v9 = +[MIFileManager defaultManager];
  v10 = [(MIInstallable *)self bundle];
  v11 = [v10 bundleURL];
  id v36 = 0;
  unsigned __int8 v12 = [v9 moveItemAtURL:v11 toURL:v7 error:&v36];
  id v13 = v36;

  if ((v12 & 1) == 0)
  {
    v29 = (void *)MIInstallerErrorDomain;
    v27 = [(MIInstallable *)self bundle];
    v30 = [v27 bundleURL];
    sub_100014A08((uint64_t)"-[MIInstallableParallelPlaceholder performInstallationWithError:]", 43, v29, 20, v13, &off_1000975B0, @"Could not move %@ to %@", v31, (uint64_t)v30);
    id v19 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v28 = 0;
LABEL_9:

    if (!a3) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  v14 = [(MIInstallableBundle *)self existingBundleContainer];
  v15 = [v14 bundle];
  [(MIInstallable *)self setBundle:v15];

  v16 = [(MIInstallableBundle *)self existingBundleContainer];
  [(MIInstallableBundle *)self setBundleContainer:v16];

  v17 = [(MIInstallable *)self bundle];
  id v35 = v13;
  v18 = [v17 frameworkBundlesWithError:&v35];
  id v19 = v35;

  [(MIInstallableBundle *)self setFrameworkBundles:v18];
  v20 = [(MIInstallableBundle *)self frameworkBundles];

  if (v20)
  {
    v21 = [(MIInstallable *)self bundle];
    id v34 = v19;
    v22 = [v21 driverKitExtensionBundlesWithError:&v34];
    id v23 = v34;

    [(MIInstallableBundle *)self setDriverKitExtensionBundles:v22];
    v24 = [(MIInstallableBundle *)self driverKitExtensionBundles];

    if (!v24)
    {
      BOOL v28 = 0;
      id v19 = v23;
      if (!a3) {
        goto LABEL_16;
      }
      goto LABEL_14;
    }
    v25 = [(MIInstallable *)self bundle];
    id v33 = v23;
    v26 = [v25 appExtensionBundlesWithError:&v33];
    id v19 = v33;

    [(MIInstallableBundle *)self setAppExtensionBundles:v26];
    v27 = [(MIInstallableBundle *)self appExtensionBundles];
    BOOL v28 = v27 != 0;
    goto LABEL_9;
  }
  BOOL v28 = 0;
  if (!a3) {
    goto LABEL_16;
  }
LABEL_14:
  if (!v28) {
    *a3 = v19;
  }
LABEL_16:

  return v28;
}

@end