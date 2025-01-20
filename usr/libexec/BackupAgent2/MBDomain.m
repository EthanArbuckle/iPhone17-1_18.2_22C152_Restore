@interface MBDomain
- (BOOL)adjustNodeOwnershipAndPermissionsForDataMigratorPlugIn:(id *)a3 path:(id)a4;
@end

@implementation MBDomain

- (BOOL)adjustNodeOwnershipAndPermissionsForDataMigratorPlugIn:(id *)a3 path:(id)a4
{
  id v6 = a4;
  unsigned int v7 = MBMobileUID();
  if (([(MBDomain *)self isSystemContainerDomain] & 1) != 0
    || ([(MBDomain *)self isSystemSharedContainerDomain] & 1) != 0
    || [(MBDomain *)self isPlaceholderAppDomain])
  {
    a3->var1 = v7;
    a3->var2 = v7;
    if (sub_10008F414((uint64_t)a3))
    {
      v8 = a3;
      __int16 v9 = 493;
    }
    else
    {
      v8 = a3;
      __int16 v9 = 420;
    }
    sub_10008F45C((uint64_t)v8, v9);
  }
  else
  {
    if (a3->var1
      || sub_10008F43C((uint64_t)a3)
      || ![(MBDomain *)self isCameraRollDomain]
      || !sub_10008F428((uint64_t)a3)
      && ([(MBDomain *)self rootPath],
          v12 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v13 = [v12 isEqualToString:v6],
          v12,
          (v13 & 1) != 0))
    {
      BOOL v10 = 0;
      goto LABEL_9;
    }
    a3->var1 = v7;
    a3->var2 = v7;
  }
  BOOL v10 = 1;
LABEL_9:

  return v10;
}

@end