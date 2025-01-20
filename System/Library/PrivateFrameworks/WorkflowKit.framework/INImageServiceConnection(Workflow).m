@interface INImageServiceConnection(Workflow)
- (void)wf_accessBundleContentForBundleIdentifiers:()Workflow withBlock:;
@end

@implementation INImageServiceConnection(Workflow)

- (void)wf_accessBundleContentForBundleIdentifiers:()Workflow withBlock:
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v6 = a4;
  id v9 = 0;
  LOBYTE(a1) = [a1 accessBundleContentForBundleIdentifiers:a3 withBlock:v6 error:&v9];
  id v7 = v9;
  if ((a1 & 1) == 0)
  {
    v8 = getWFIntentExecutionLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[INImageServiceConnection(Workflow) wf_accessBundleContentForBundleIdentifiers:withBlock:]";
      __int16 v12 = 2114;
      id v13 = v7;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_ERROR, "%s -[INImageServiceConnection wf_accessBundleContentForBundleIdentifiers] failed with error: %{public}@", buf, 0x16u);
    }

    v6[2](v6);
  }
}

@end