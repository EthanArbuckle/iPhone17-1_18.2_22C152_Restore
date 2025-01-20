@interface SBSystemApertureStateDumpService
- (SBSystemApertureStateDumpService)init;
- (id)_convertSystemApertureStateDumpToJSONString:(id)a3 error:(id *)a4;
- (id)_systemApertureStateDumpFilePath;
- (void)systemServiceServer:(id)a3 client:(id)a4 requestSystemApertureStateDumpWithCompletion:(id)a5;
- (void)systemServiceServer:(id)a3 client:(id)a4 requestToWriteSystemApertureStateDumpToFile:(id)a5;
@end

@implementation SBSystemApertureStateDumpService

- (SBSystemApertureStateDumpService)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBSystemApertureStateDumpService;
  v2 = [(SBSystemApertureStateDumpService *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.systemApertureStateDump"];
    clientAuthenticator = v2->_clientAuthenticator;
    v2->_clientAuthenticator = (FBServiceClientAuthenticator *)v3;

    v5 = +[SBSystemServiceServer sharedInstance];
    [v5 setSystemApertureStateDumpDelegate:v2];
  }
  return v2;
}

- (void)systemServiceServer:(id)a3 client:(id)a4 requestToWriteSystemApertureStateDumpToFile:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  objc_super v7 = [(id)SBApp systemApertureControllerForMainDisplay];
  v8 = [v7 systemApertureModelStateDump];

  if ([v8 count])
  {
    id v17 = 0;
    v9 = [(SBSystemApertureStateDumpService *)self _convertSystemApertureStateDumpToJSONString:v8 error:&v17];
    id v10 = v17;
    if (v6)
    {
      id v11 = v6;
    }
    else
    {
      id v11 = [(SBSystemApertureStateDumpService *)self _systemApertureStateDumpFilePath];
    }
    v13 = v11;
    id v16 = v10;
    [v9 writeToFile:v11 atomically:1 encoding:4 error:&v16];
    v12 = v16;

    if (v12)
    {
      v14 = SBLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = [v12 localizedDescription];
        *(_DWORD *)buf = 138543362;
        v19 = v15;
        _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "SystemApertureStateDump failed to write to file with error: %{public}@", buf, 0xCu);
      }
    }
  }
  else
  {
    v12 = SBLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "SystemApertureStateDump is empty", buf, 2u);
    }
  }
}

- (void)systemServiceServer:(id)a3 client:(id)a4 requestSystemApertureStateDumpWithCompletion:(id)a5
{
  id v6 = (void (**)(id, void *, void *))a5;
  objc_super v7 = [(id)SBApp systemApertureControllerForMainDisplay];
  v8 = [v7 systemApertureModelStateDump];

  if ([v8 count])
  {
    id v12 = 0;
    v9 = [(SBSystemApertureStateDumpService *)self _convertSystemApertureStateDumpToJSONString:v8 error:&v12];
    id v10 = v12;
    id v11 = [v10 localizedDescription];
    v6[2](v6, v9, v11);
  }
  else
  {
    id v10 = SBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "SystemApertureStateDump is empty", buf, 2u);
    }
  }
}

- (id)_convertSystemApertureStateDumpToJSONString:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 count])
  {
    id v6 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:1 error:a4];
    objc_super v7 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
  }
  else
  {
    v8 = SBLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "SystemAperture State Dump is empty.", v10, 2u);
    }

    objc_super v7 = 0;
  }

  return v7;
}

- (id)_systemApertureStateDumpFilePath
{
  v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  uint64_t v3 = [v2 objectAtIndex:0];

  v4 = [v3 stringByAppendingPathComponent:@"Logs"];
  id v5 = [v4 stringByAppendingPathComponent:@"SpringBoard"];
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v6 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:0];

  objc_super v7 = [v5 stringByAppendingPathComponent:@"SystemApertureStateDump.json"];

  return v7;
}

- (void).cxx_destruct
{
}

@end