@interface SSFeatureEnablerMigrator
+ (void)migrate;
@end

@implementation SSFeatureEnablerMigrator

+ (void)migrate
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MGCopyAnswer();
  CFPreferencesAppSynchronize(@"com.apple.springboard");
  v3 = (void *)CFPreferencesCopyAppValue(@"SBLastSystemVersion", @"com.apple.springboard");
  if (!v3)
  {
    CFPreferencesAppSynchronize(@"com.apple.migration");
    v3 = (void *)CFPreferencesCopyAppValue(@"LastSystemVersion", @"com.apple.migration");
  }
  v4 = +[SSLogConfig sharedFeatureEnablerMigrationConfig];
  if (!v4)
  {
    v4 = +[SSLogConfig sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
    v6 &= 2u;
  }
  if (!v6) {
    goto LABEL_13;
  }
  *(_DWORD *)v53 = 138543874;
  *(void *)&v53[4] = objc_opt_class();
  *(_WORD *)&v53[12] = 2114;
  *(void *)&v53[14] = v3;
  *(_WORD *)&v53[22] = 2114;
  v54 = v2;
  id v8 = *(id *)&v53[4];
  LODWORD(v52) = 32;
  v51 = v53;
  v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, v53, v52, *(_OWORD *)v53, *(void *)&v53[16], v54);
    free(v9);
    SSFileLog(v4, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v7);
LABEL_13:
  }
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    uint64_t v16 = [v3 integerValue];
    if (v16 != [v2 integerValue])
    {
      CFPreferencesSetAppValue(@"com.apple.storeservices.itfe", 0, @"com.apple.itunesstored");
      CFPreferencesAppSynchronize(@"com.apple.storeservices.itfe");
      v17 = +[SSLogConfig sharedFeatureEnablerMigrationConfig];
      if (!v17)
      {
        v17 = +[SSLogConfig sharedConfig];
      }
      int v18 = objc_msgSend(v17, "shouldLog", v51);
      if ([v17 shouldLogToDisk]) {
        int v19 = v18 | 2;
      }
      else {
        int v19 = v18;
      }
      v20 = [v17 OSLogObject];
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        v19 &= 2u;
      }
      if (v19)
      {
        v21 = objc_opt_class();
        *(_DWORD *)v53 = 138543362;
        *(void *)&v53[4] = v21;
        id v22 = v21;
        LODWORD(v52) = 12;
        v51 = v53;
        v23 = (void *)_os_log_send_and_compose_impl();

        if (!v23)
        {
LABEL_28:

          v30 = [MEMORY[0x1E4F74230] sharedConnection];
          [v30 removeProfileWithIdentifier:@"com.apple.storeservices-itfe"];

          goto LABEL_29;
        }
        v20 = objc_msgSend(NSString, "stringWithCString:encoding:", v23, 4, v53, v52);
        free(v23);
        SSFileLog(v17, @"%@", v24, v25, v26, v27, v28, v29, (uint64_t)v20);
      }

      goto LABEL_28;
    }
  }
LABEL_29:
  if (v3) {
    CFRelease(v3);
  }
  v31 = +[SSDevice currentDevice];
  v32 = [v31 productVersion];

  v33 = (void *)CFPreferencesCopyAppValue(@"performedMigration11", @"com.apple.storeservices.itfe");
  if (SSIsInternalBuild() && [v32 isEqualToString:@"11.0"] && !v33)
  {
    v34 = (void *)CFPreferencesCopyAppValue(@"features", @"com.apple.storeservices.itfe");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v35 = (id)[v34 mutableCopy];
    }
    else {
      id v35 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    v36 = v35;
    v37 = (const void *)MEMORY[0x1E4F1CC38];
    [v35 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"amf"];
    CFPreferencesSetAppValue(@"features", v36, @"com.apple.storeservices.itfe");
    CFPreferencesSetAppValue(@"performedMigration11", v37, @"com.apple.storeservices.itfe");
    CFPreferencesAppSynchronize(@"com.apple.storeservices.itfe");
    v38 = +[SSLogConfig sharedFeatureEnablerMigrationConfig];
    if (!v38)
    {
      v38 = +[SSLogConfig sharedConfig];
    }
    int v39 = [v38 shouldLog];
    if ([v38 shouldLogToDisk]) {
      int v40 = v39 | 2;
    }
    else {
      int v40 = v39;
    }
    v41 = [v38 OSLogObject];
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT)) {
      v40 &= 2u;
    }
    if (v40)
    {
      v42 = objc_opt_class();
      *(_DWORD *)v53 = 138543362;
      *(void *)&v53[4] = v42;
      id v43 = v42;
      LODWORD(v52) = 12;
      v44 = (void *)_os_log_send_and_compose_impl();

      if (!v44)
      {
LABEL_48:

        goto LABEL_49;
      }
      v41 = objc_msgSend(NSString, "stringWithCString:encoding:", v44, 4, v53, v52);
      free(v44);
      SSFileLog(v38, @"%@", v45, v46, v47, v48, v49, v50, (uint64_t)v41);
    }

    goto LABEL_48;
  }
LABEL_49:
}

@end