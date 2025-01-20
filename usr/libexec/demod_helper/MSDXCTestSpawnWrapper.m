@interface MSDXCTestSpawnWrapper
+ (id)sharedInstance;
- (BOOL)executeTestScriptOfIdentifier:(id)a3;
- (NSArray)testScripts;
- (NSDate)testScriptsLastModified;
- (id)_parseTestScriptsFromXCTSpawnResultDictionary:(id)a3;
- (id)_testProductsPath;
- (id)listAllTestScripts;
- (void)setTestScripts:(id)a3;
- (void)setTestScriptsLastModified:(id)a3;
@end

@implementation MSDXCTestSpawnWrapper

+ (id)sharedInstance
{
  if (qword_100057E88 != -1) {
    dispatch_once(&qword_100057E88, &stru_10004D0C8);
  }
  v2 = (void *)qword_100057E80;

  return v2;
}

- (id)listAllTestScripts
{
  v3 = [(MSDXCTestSpawnWrapper *)self _testProductsPath];
  v4 = +[NSUUID UUID];
  v5 = [v4 UUIDString];
  v6 = +[NSString stringWithFormat:@"/var/tmp/%@.json", v5];

  v7 = sub_100027250();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v47 = v3;
    __int16 v48 = 2114;
    v49 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Listing all test scripts from input: %{public}@ output: %{public}@", buf, 0x16u);
  }

  v8 = +[NSURL fileURLWithPath:v3];
  id v45 = 0;
  id v44 = 0;
  unsigned __int8 v9 = [v8 getResourceValue:&v45 forKey:NSURLContentModificationDateKey error:&v44];
  id v10 = v45;
  id v11 = v44;

  if ((v9 & 1) == 0)
  {
    v12 = sub_100027250();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100032F10(v11);
    }
  }
  uint64_t v13 = [(MSDXCTestSpawnWrapper *)self testScripts];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(MSDXCTestSpawnWrapper *)self testScriptsLastModified];
    unsigned int v16 = [v15 isEqualToDate:v10];

    if (v16)
    {
      v17 = sub_100027250();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No change in test scripts. Returning cached results!", buf, 2u);
      }

      v18 = [(MSDXCTestSpawnWrapper *)self testScripts];
      goto LABEL_23;
    }
  }
  v19 = +[NSURL fileURLWithPath:@"/usr/local/bin/xctspawn"];
  id v43 = v11;
  unsigned __int8 v20 = [v19 checkResourceIsReachableAndReturnError:&v43];
  id v21 = v43;

  if ((v20 & 1) == 0)
  {
    v34 = sub_100027250();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_100032E8C(v21);
    }

    goto LABEL_22;
  }
  id v22 = objc_alloc_init((Class)NSTask);
  [v22 setLaunchPath:@"/usr/local/bin/xctspawn"];
  v23 = +[NSArray arrayWithObjects:v3, @"--enumerate-tests", @"--test-enumeration-format", @"json", @"--test-enumeration-output-path", v6, 0];
  [v22 setArguments:v23];

  [v22 setCurrentDirectoryPath:@"/var/tmp"];
  v24 = +[NSPipe pipe];
  [v22 setStandardOutput:v24];
  v25 = sub_100027250();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = [v22 launchPath];
    v27 = [v22 arguments];
    *(_DWORD *)buf = 138543618;
    v47 = v26;
    __int16 v48 = 2114;
    v49 = v27;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Launching %{public}@ with arguments: %{public}@", buf, 0x16u);
  }
  [v22 launch];
  [v22 waitUntilExit];
  unsigned int v28 = [v22 terminationStatus];
  if (v28)
  {
    int v29 = v28;
    v30 = [v24 fileHandleForReading];
    v31 = [v30 readDataToEndOfFile];

    id v32 = [objc_alloc((Class)NSString) initWithData:v31 encoding:4];
    v33 = sub_100027250();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_100032E04((uint64_t)v32, v29, v33);
    }

LABEL_22:
    v18 = 0;
    id v11 = v21;
    goto LABEL_23;
  }
  id v42 = v21;
  v36 = +[NSData dataWithContentsOfFile:v6 options:0 error:&v42];
  id v37 = v42;

  if (v36)
  {
    id v41 = v37;
    v38 = +[NSJSONSerialization JSONObjectWithData:v36 options:0 error:&v41];
    id v11 = v41;

    if (v38)
    {
      v39 = [(MSDXCTestSpawnWrapper *)self _parseTestScriptsFromXCTSpawnResultDictionary:v38];
      [(MSDXCTestSpawnWrapper *)self setTestScripts:v39];

      [(MSDXCTestSpawnWrapper *)self setTestScriptsLastModified:v10];
      v18 = [(MSDXCTestSpawnWrapper *)self testScripts];
    }
    else
    {
      v40 = sub_100027250();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        sub_100032D80(v11);
      }

      v18 = 0;
    }
  }
  else
  {
    v38 = sub_100027250();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      sub_100032CFC(v37);
    }
    v18 = 0;
    id v11 = v37;
  }

LABEL_23:

  return v18;
}

- (BOOL)executeTestScriptOfIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(MSDXCTestSpawnWrapper *)self _testProductsPath];
  v6 = +[NSUUID UUID];
  v7 = [v6 UUIDString];
  v8 = +[NSString stringWithFormat:@"/var/tmp/%@.xcresult", v7];

  if (os_variant_has_internal_content())
  {
    unsigned __int8 v9 = +[MSDTestPreferences sharedInstance];
    id v10 = [v9 pressDemoTestTarget];

    if (v10) {
      id v11 = v10;
    }
    else {
      id v11 = @"PressDemoScripts";
    }
  }
  else
  {
    id v11 = @"PressDemoScripts";
  }
  v12 = +[NSString stringWithFormat:@"%@/%@", v11, v4];
  uint64_t v13 = sub_100027250();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Exexcuting test script of identifier %{public}@", buf, 0xCu);
  }

  id v14 = objc_alloc_init((Class)NSTask);
  [v14 setLaunchPath:@"/usr/local/bin/xctspawn"];
  v15 = +[NSArray arrayWithObjects:v5, @"--result-bundle-path", v8, @"--only-testing", v12, 0];
  [v14 setArguments:v15];

  [v14 setCurrentDirectoryPath:@"/var/tmp"];
  unsigned int v16 = sub_100027250();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [v14 launchPath];
    v18 = [v14 arguments];
    *(_DWORD *)buf = 138543618;
    v23 = v17;
    __int16 v24 = 2114;
    v25 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Launching %{public}@ with arguments: %{public}@", buf, 0x16u);
  }
  [v14 launch];
  [v14 waitUntilExit];
  int v19 = [v14 terminationStatus];
  if (v19)
  {
    unsigned __int8 v20 = sub_100027250();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100032F94(v19, v20);
    }
  }
  return v19 == 0;
}

- (id)_testProductsPath
{
  v2 = +[MSDTestPreferences sharedInstance];
  v3 = [v2 pressDemoXCTestProductsPath];

  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = @"/var/mobile/XcodeBuiltProducts/Tests/PressDemoScripts.xctestproducts";
  }

  return v4;
}

- (id)_parseTestScriptsFromXCTSpawnResultDictionary:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"values"];
  id v4 = [v3 objectAtIndexedSubscript:0];

  v5 = sub_100027250();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [v4 objectForKeyedSubscript:@"name"];
      *(_DWORD *)buf = 138543362;
      uint64_t v49 = (uint64_t)v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Found test plan: %{public}@", buf, 0xCu);
    }
    v8 = [v4 objectForKeyedSubscript:@"children"];
    v6 = [v8 objectAtIndexedSubscript:0];

    unsigned __int8 v9 = sub_100027250();
    id v10 = v9;
    if (v6)
    {
      v33 = v4;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [v6 objectForKeyedSubscript:@"name"];
        *(_DWORD *)buf = 138543362;
        uint64_t v49 = (uint64_t)v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "> Found test target: %{public}@", buf, 0xCu);
      }
      id v32 = v6;
      v12 = [v6 objectForKeyedSubscript:@"children"];
      id v36 = [objc_alloc((Class)NSMutableArray) initWithCapacity:0];
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      obj = v12;
      id v37 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
      if (v37)
      {
        uint64_t v35 = *(void *)v45;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v45 != v35) {
              objc_enumerationMutation(obj);
            }
            uint64_t v39 = v13;
            id v14 = *(void **)(*((void *)&v44 + 1) + 8 * v13);
            uint64_t v15 = [v14 objectForKeyedSubscript:@"name"];
            unsigned int v16 = sub_100027250();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v49 = v15;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, ">> Found test case: %{public}@", buf, 0xCu);
            }
            v38 = (void *)v15;

            v17 = [v14 objectForKeyedSubscript:@"children"];
            id v18 = [objc_alloc((Class)NSMutableArray) initWithCapacity:0];
            long long v40 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            long long v43 = 0u;
            id v19 = v17;
            id v20 = [v19 countByEnumeratingWithState:&v40 objects:v52 count:16];
            if (v20)
            {
              id v21 = v20;
              uint64_t v22 = *(void *)v41;
              do
              {
                for (i = 0; i != v21; i = (char *)i + 1)
                {
                  if (*(void *)v41 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  __int16 v24 = *(void **)(*((void *)&v40 + 1) + 8 * i);
                  v25 = [v24 objectForKeyedSubscript:@"name"];
                  v26 = [v24 objectForKeyedSubscript:@"disabled"];
                  unsigned int v27 = [v26 BOOLValue];

                  unsigned int v28 = sub_100027250();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543618;
                    uint64_t v49 = (uint64_t)v25;
                    __int16 v50 = 1024;
                    unsigned int v51 = v27;
                    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, ">>> Found test method: %{public}@  Disabled: %{BOOL}d", buf, 0x12u);
                  }

                  if ((v27 & 1) == 0) {
                    [v18 addObject:v25];
                  }
                }
                id v21 = [v19 countByEnumeratingWithState:&v40 objects:v52 count:16];
              }
              while (v21);
            }

            int v29 = [[MSDKPeerDemoTestScript alloc] initWithName:v38 andMethods:v18];
            [v36 addObject:v29];

            uint64_t v13 = v39 + 1;
          }
          while ((id)(v39 + 1) != v37);
          id v37 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
        }
        while (v37);
      }
      id v10 = obj;

      v30 = +[NSArray arrayWithArray:v36];

      v6 = v32;
      id v4 = v33;
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100033050(v10);
      }
      v30 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10003300C(v6);
    }
    v30 = 0;
  }

  return v30;
}

- (NSArray)testScripts
{
  return self->_testScripts;
}

- (void)setTestScripts:(id)a3
{
}

- (NSDate)testScriptsLastModified
{
  return self->_testScriptsLastModified;
}

- (void)setTestScriptsLastModified:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testScriptsLastModified, 0);

  objc_storeStrong((id *)&self->_testScripts, 0);
}

@end