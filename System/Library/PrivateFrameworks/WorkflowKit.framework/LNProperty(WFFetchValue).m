@interface LNProperty(WFFetchValue)
- (void)wf_getValueForEntity:()WFFetchValue entityMetadata:completionHandler:;
@end

@implementation LNProperty(WFFetchValue)

- (void)wf_getValueForEntity:()WFFetchValue entityMetadata:completionHandler:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v9 properties];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __82__LNProperty_WFFetchValue__wf_getValueForEntity_entityMetadata_completionHandler___block_invoke;
  v21[3] = &unk_1E6557128;
  v21[4] = a1;
  v12 = objc_msgSend(v11, "if_firstObjectPassingTest:", v21);

  if (([v12 capabilities] & 2) != 0)
  {
    v13 = [MEMORY[0x1E4F72BC8] policyWithEntityMetadata:v9];
    id v20 = 0;
    v14 = [v13 connectionWithError:&v20];
    id v15 = v20;
    if (v14)
    {
      v16 = [a1 identifier];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __82__LNProperty_WFFetchValue__wf_getValueForEntity_entityMetadata_completionHandler___block_invoke_158;
      v18[3] = &unk_1E6553FD8;
      v18[4] = a1;
      id v19 = v10;
      [v14 fetchValueForPropertyWithIdentifier:v16 entity:v8 completionHandler:v18];
    }
    else
    {
      v17 = getWFGeneralLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "-[LNProperty(WFFetchValue) wf_getValueForEntity:entityMetadata:completionHandler:]";
        __int16 v24 = 2112;
        id v25 = v15;
        _os_log_impl(&dword_1C7F0A000, v17, OS_LOG_TYPE_ERROR, "%s Unable to create connection: %@", buf, 0x16u);
      }

      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
  }
  else
  {
    v13 = [a1 value];
    (*((void (**)(id, void *))v10 + 2))(v10, v13);
  }
}

@end