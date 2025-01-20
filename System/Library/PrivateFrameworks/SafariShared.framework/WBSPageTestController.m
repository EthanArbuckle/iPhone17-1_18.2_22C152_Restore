@interface WBSPageTestController
- (BOOL)allowsContentJavaScript;
- (BOOL)allowsNetworkAccess;
- (WBSPageTestDelegate)delegate;
- (id)bundleFromNSBundle:(id)a3;
- (id)expectedResultsPathExtension;
- (unint64_t)pageTestType;
- (void)setDelegate:(id)a3;
@end

@implementation WBSPageTestController

- (id)expectedResultsPathExtension
{
  return @"txt";
}

- (id)bundleFromNSBundle:(id)a3
{
  v40 = self;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v51 = objc_alloc_init(WBSPageTestEvaluator);
  id v47 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v48 = v3;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v4 = [v3 infoDictionary];
  objc_msgSend(v4, "safari_arrayContainingObjectsOfClass:forKey:", objc_opt_class(), @"TestPages");
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v43 = [obj countByEnumeratingWithState:&v57 objects:v66 count:16];
  if (v43)
  {
    uint64_t v42 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v43; ++i)
      {
        if (*(void *)v58 != v42) {
          objc_enumerationMutation(obj);
        }
        v49 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        v46 = objc_msgSend(v49, "safari_stringForKey:", @"WebArchiveFileName", v40);
        v5 = (void *)MEMORY[0x1E4F1CB10];
        v6 = [v48 bundleURL];
        v50 = [v5 URLWithString:v46 relativeToURL:v6];

        v7 = objc_msgSend(v49, "safari_arrayContainingObjectsOfClass:forKey:", objc_opt_class(), @"Expectations");
        v44 = v7;
        if (v7)
        {
          long long v55 = 0u;
          long long v56 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          id v52 = v7;
          uint64_t v8 = [v52 countByEnumeratingWithState:&v53 objects:v65 count:16];
          if (v8)
          {
            uint64_t v9 = *(void *)v54;
            do
            {
              for (uint64_t j = 0; j != v8; ++j)
              {
                if (*(void *)v54 != v9) {
                  objc_enumerationMutation(v52);
                }
                v11 = *(void **)(*((void *)&v53 + 1) + 8 * j);
                v12 = objc_msgSend(v11, "safari_stringForKey:", @"ExpectedResults");
                if (v12)
                {
                  v13 = objc_msgSend(v11, "safari_stringForKey:", @"Identifier");
                  if (v13)
                  {
                    v14 = objc_msgSend(v11, "safari_stringForKey:", @"Condition");
                    v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:v14];
                    if ([v15 evaluateWithObject:v51])
                    {
                      v16 = [WBSPageTest alloc];
                      v17 = (void *)MEMORY[0x1E4F1CB10];
                      v18 = [v48 bundleURL];
                      v19 = [v17 URLWithString:v12 relativeToURL:v18];
                      v20 = [(WBSPageTest *)v16 initWithIdentifier:v13 pageURL:v50 expectedResultsURL:v19 dictionary:v49];
                      [v47 addObject:v20];
                    }
                    v21 = WBS_LOG_CHANNEL_PREFIXTest();
                    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138543618;
                      v62 = v12;
                      __int16 v63 = 2114;
                      v64 = v14;
                      _os_log_impl(&dword_1A6B5F000, v21, OS_LOG_TYPE_INFO, "Skipping expectation '%{public}@' because the current device didn't meet the condition '%{public}@'", buf, 0x16u);
                    }
                  }
                  else
                  {
                    v23 = WBS_LOG_CHANNEL_PREFIXTest();
                    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543362;
                      v62 = v46;
                      _os_log_error_impl(&dword_1A6B5F000, v23, OS_LOG_TYPE_ERROR, "Test for '%{public}@' is required to specify identifiers", buf, 0xCu);
                    }
                  }
                }
                else
                {
                  v22 = WBS_LOG_CHANNEL_PREFIXTest();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543362;
                    v62 = v46;
                    _os_log_error_impl(&dword_1A6B5F000, v22, OS_LOG_TYPE_ERROR, "Test for '%{public}@' is required to specify an expected result files", buf, 0xCu);
                  }
                }
              }
              uint64_t v8 = [v52 countByEnumeratingWithState:&v53 objects:v65 count:16];
            }
            while (v8);
          }
        }
        else
        {
          v24 = (void *)MEMORY[0x1E4F1CB10];
          v25 = [v50 URLByDeletingPathExtension];
          v26 = [v25 absoluteString];
          v27 = [v26 stringByAppendingString:@"-expected"];
          v28 = [v24 URLWithString:v27];
          v29 = [(WBSPageTestController *)v40 expectedResultsPathExtension];
          id v52 = [v28 URLByAppendingPathExtension:v29];

          v30 = [WBSPageTest alloc];
          v31 = [v50 URLByDeletingPathExtension];
          v32 = [v31 lastPathComponent];
          v33 = [(WBSPageTest *)v30 initWithIdentifier:v32 pageURL:v50 expectedResultsURL:v52 dictionary:v49];
          [v47 addObject:v33];
        }
      }
      uint64_t v43 = [obj countByEnumeratingWithState:&v57 objects:v66 count:16];
    }
    while (v43);
  }

  v34 = [v48 bundleIdentifier];
  if (!v34)
  {
    v35 = [v48 bundleURL];
    v36 = [v35 URLByDeletingPathExtension];
    v34 = [v36 lastPathComponent];
  }
  if (objc_msgSend(v47, "count", v40))
  {
    v37 = [[WBSPageTestBundle alloc] initWithIdentifier:v34 tests:v47];
  }
  else
  {
    v38 = WBS_LOG_CHANNEL_PREFIXTest();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v62 = v34;
      _os_log_impl(&dword_1A6B5F000, v38, OS_LOG_TYPE_INFO, "Skipping bundle '%{public}@' because they contained no runnable tests for current device", buf, 0xCu);
    }
    v37 = 0;
  }

  return v37;
}

- (unint64_t)pageTestType
{
  return 0;
}

- (WBSPageTestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSPageTestDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)allowsContentJavaScript
{
  return self->_allowsContentJavaScript;
}

- (BOOL)allowsNetworkAccess
{
  return self->_allowsNetworkAccess;
}

- (void).cxx_destruct
{
}

@end