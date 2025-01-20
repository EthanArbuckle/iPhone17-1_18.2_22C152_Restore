@interface MBDomain
- (BOOL)_isSubPathOfRelativePathsToRestore:(id)a3;
- (BOOL)adjustNodeOwnershipAndPermissionsForDataMigratorPlugIn:(id *)a3 path:(id)a4;
@end

@implementation MBDomain

- (BOOL)_isSubPathOfRelativePathsToRestore:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(MBDomain *)self relativePathsToRestore];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * i) hasPrefix:v4])
        {
          BOOL v10 = 0;
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

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
    int v8 = WORD2(a3->var10) & 0xF000;
    if (v8 == 0x4000) {
      __int16 v9 = 16877;
    }
    else {
      __int16 v9 = v8 | 0x1A4;
    }
    WORD2(a3->var10) = v9;
  }
  else
  {
    if (a3->var1
      || (WORD2(a3->var10) & 0xF000) == 0xA000
      || ![(MBDomain *)self isCameraRollDomain]
      || (WORD2(a3->var10) & 0xF000) != 0x8000
      && ([(MBDomain *)self rootPath],
          long long v12 = objc_claimAutoreleasedReturnValue(),
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