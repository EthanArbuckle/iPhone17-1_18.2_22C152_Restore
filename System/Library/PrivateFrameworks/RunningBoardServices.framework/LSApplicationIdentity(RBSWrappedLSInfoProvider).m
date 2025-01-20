@interface LSApplicationIdentity(RBSWrappedLSInfoProvider)
- (id)fetchWrappedInfoWithError:()RBSWrappedLSInfoProvider;
@end

@implementation LSApplicationIdentity(RBSWrappedLSInfoProvider)

- (id)fetchWrappedInfoWithError:()RBSWrappedLSInfoProvider
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend(a1, "findApplicationRecordWithError:");
  v6 = v5;
  if (v5)
  {
    v7 = [v5 bundleIdentifier];
    v8 = [a1 personaUniqueString];
    v9 = [v6 jobLabel];
    v10 = +[RBSWrappedLSInfo infoWithBundleID:personaString:persistentJobLabel:platform:bundleInode:execInode:](RBSWrappedLSInfo, "infoWithBundleID:personaString:persistentJobLabel:platform:bundleInode:execInode:", v7, v8, v9, [v6 platform], 0, 0);
  }
  else
  {
    v11 = rbs_general_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      if (a3)
      {
        v12 = [*a3 description];
      }
      else
      {
        v12 = @"<>";
      }
      int v14 = 138543362;
      v15 = v12;
      _os_log_impl(&dword_191FE8000, v11, OS_LOG_TYPE_INFO, "fetchWrappedInfoWithError failed due to %{public}@", (uint8_t *)&v14, 0xCu);
      if (a3) {
    }
      }
    v10 = 0;
  }

  return v10;
}

@end