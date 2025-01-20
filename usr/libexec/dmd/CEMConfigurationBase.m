@interface CEMConfigurationBase
- (id)dmf_installSynthesizedProfileRequestWithAssetProviders:(id)a3 error:(id *)a4;
- (id)dmf_removeSynthesizedProfileRequestWithError:(id *)a3;
@end

@implementation CEMConfigurationBase

- (id)dmf_installSynthesizedProfileRequestWithAssetProviders:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[NSMutableDictionary dictionaryWithCapacity:2];
  v8 = [(CEMConfigurationBase *)self synthesizeProfileOutUUIDs:v7 withOldUUIDs:0 assetProviders:v6];

  v9 = DMFConfigurationEngineLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10007E800();
  }

  v10 = [v8 objectForKeyedSubscript:@"PayloadContent"];
  id v11 = [v10 count];

  if (!v11)
  {
    id v12 = (id)objc_opt_new();
    [v12 setType:0];
    [v12 setProfile:v8];
    id v19 = 0;
    unsigned __int8 v16 = +[DMDRemoveConfigurationOperation validateRequest:v12 error:&v19];
    id v14 = v19;
    if ((v16 & 1) == 0)
    {
      v15 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10007E6F8(v14);
      }
      goto LABEL_11;
    }
LABEL_8:
    id v12 = v12;
    v17 = v12;
    goto LABEL_14;
  }
  id v12 = (id)objc_opt_new();
  [v12 setProfile:v8];
  [v12 setType:0];
  id v20 = 0;
  unsigned __int8 v13 = +[DMDInstallConfigurationOperation validateRequest:v12 error:&v20];
  id v14 = v20;
  if (v13) {
    goto LABEL_8;
  }
  v15 = DMFConfigurationEngineLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_10007E77C(v14);
  }
LABEL_11:

  if (a4)
  {
    id v14 = v14;
    v17 = 0;
    *a4 = v14;
  }
  else
  {
    v17 = 0;
  }
LABEL_14:

  return v17;
}

- (id)dmf_removeSynthesizedProfileRequestWithError:(id *)a3
{
  v5 = +[NSMutableDictionary dictionaryWithCapacity:2];
  id v6 = [(CEMConfigurationBase *)self synthesizeProfileOutUUIDs:v5 withOldUUIDs:0 assetProviders:&__NSDictionary0__struct];
  v7 = DMFConfigurationEngineLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10007E800();
  }

  v8 = objc_opt_new();
  [v8 setType:0];
  [v8 setProfile:v6];
  id v14 = 0;
  unsigned __int8 v9 = +[DMDRemoveConfigurationOperation validateRequest:v8 error:&v14];
  id v10 = v14;
  if (v9)
  {
    id v11 = v8;
  }
  else
  {
    id v12 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10007E6F8(v10);
    }

    id v11 = 0;
    if (a3) {
      *a3 = v10;
    }
  }

  return v11;
}

@end