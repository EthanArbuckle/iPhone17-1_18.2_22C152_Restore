@interface SpotlightDiagnosticExtension
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation SpotlightDiagnosticExtension

- (id)attachmentList
{
  v3 = +[CSSearchableIndex defaultSearchableIndex];
  v4 = v3;
  if (v3) {
    [v3 _issueCommand:@"taptoradar" completionHandler:&stru_100004178];
  }
  v5 = objc_opt_new();
  v6 = +[NSFileManager defaultManager];
  unsigned int v7 = [v6 fileExistsAtPath:@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Search/Ranking"];

  if (v7)
  {
    v8 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Search/Ranking"];
    v9 = +[NSRegularExpression regularExpressionWithPattern:@"Spotlight_Ranking_Diagnostic_Dump_.*log$" options:0 error:0];
    v10 = [(SpotlightDiagnosticExtension *)self filesInDir:v8 matchingPattern:v9 excludingPattern:0];

    if ([v10 count]) {
      [v5 addObjectsFromArray:v10];
    }
  }

  return v5;
}

- (id)attachmentsForParameters:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"DEExtensionAttachmentsParamBundleIDKey"];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v5 firstObject];

      v5 = (void *)v6;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v5 = 0;
    }
  }
  NSLog(@"-[SpotlightDiagnosticExtension attachmentsForParameters:] - %@", v4);
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = sub_1000033F8;
  v39 = sub_100003408;
  id v40 = 0;
  id v40 = (id)objc_opt_new();
  unsigned int v7 = +[CSSearchableIndex defaultSearchableIndex];
  if (v7)
  {
    if ([v5 length])
    {
      v8 = [@"diagnose" stringByAppendingFormat:@":%@", v5];
    }
    else
    {
      v8 = @"diagnose";
    }
    v9 = dispatch_group_create();
    dispatch_group_enter(v9);
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    char v34 = 0;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100003410;
    v27[3] = &unk_1000041A0;
    v29 = &v31;
    v30 = &v35;
    v10 = v9;
    v28 = v10;
    [v7 _issueCommand:v8 completionHandler:v27];
    dispatch_time_t v11 = dispatch_time(0, 30000000000);
    dispatch_group_wait(v10, v11);
    *((unsigned char *)v32 + 24) = 1;

    _Block_object_dispose(&v31, 8);
  }
  v12 = +[NSFileManager defaultManager];
  unsigned int v13 = [v12 fileExistsAtPath:@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Search"];

  if (v13)
  {
    v14 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Search"];
    v15 = +[NSRegularExpression regularExpressionWithPattern:@".*log$" options:0 error:0];
    v16 = [(SpotlightDiagnosticExtension *)self filesInDir:v14 matchingPattern:v15 excludingPattern:0];

    if ([v16 count]) {
      [(id)v36[5] addObjectsFromArray:v16];
    }
  }
  v17 = +[NSFileManager defaultManager];
  unsigned int v18 = [v17 fileExistsAtPath:@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/com.apple.corespotlight.asl"];

  if (v18)
  {
    v19 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Search"];
    v20 = +[NSRegularExpression regularExpressionWithPattern:@".*asl$" options:0 error:0];
    v21 = [(SpotlightDiagnosticExtension *)self filesInDir:v19 matchingPattern:v20 excludingPattern:0];

    if ([v21 count]) {
      [(id)v36[5] addObjectsFromArray:v21];
    }
  }
  v22 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Logs/CrashReporter"];
  v23 = +[NSRegularExpression regularExpressionWithPattern:@"(searchd|Spotlight|CoreSpotlightService|com.apple.spotlight.IndexAgent|spotlightknowledged|CoreSpotlight*Importer*|Search).*(ips|ips.synced)$" options:0 error:0];
  v24 = [(SpotlightDiagnosticExtension *)self filesInDir:v22 matchingPattern:v23 excludingPattern:0];

  if ([v24 count]) {
    [(id)v36[5] addObjectsFromArray:v24];
  }
  id v25 = (id)v36[5];

  _Block_object_dispose(&v35, 8);

  return v25;
}

@end