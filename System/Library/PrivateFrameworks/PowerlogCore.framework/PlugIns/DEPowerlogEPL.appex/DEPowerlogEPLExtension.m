@interface DEPowerlogEPLExtension
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
- (id)generateBatteryUIPlistFile;
- (id)getArchives;
- (id)getBatteryUIPlists;
- (id)getPowerlog;
- (id)getQuarantinedPowerlogs;
- (id)getTimestampString:(id)a3;
- (id)getUpgradeLogs;
@end

@implementation DEPowerlogEPLExtension

- (id)attachmentList
{
  return &__NSArray0__struct;
}

- (id)getTimestampString:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSDateFormatter);
  id v5 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:@"en_US_POSIX"];
  [v4 setDateFormat:@"yyyy-MM-dd-HH-mm"];
  v6 = +[NSTimeZone systemTimeZone];
  [v4 setTimeZone:v6];

  v7 = [v5 objectForKey:NSLocaleCalendar];
  [v4 setCalendar:v7];

  [v4 setLocale:v5];
  v8 = [v4 stringFromDate:v3];

  return v8;
}

- (id)getBatteryUIPlists
{
  CFStringRef v14 = @"folder";
  id v3 = NSTemporaryDirectory();
  v15 = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];

  id v5 = PLQueryRegistered();
  v6 = v5;
  if (v5
    && ([v5 objectForKeyedSubscript:@"folder"],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    v8 = +[NSString stringWithFormat:@"^(%@)", @"BatteryUI", v14];
    v9 = +[NSRegularExpression regularExpressionWithPattern:v8 options:1 error:0];
    v10 = [v6 objectForKeyedSubscript:@"folder"];
    v11 = +[NSURL fileURLWithPath:v10];
    v12 = [(DEPowerlogEPLExtension *)self filesInDir:v11 matchingPattern:v9 excludingPattern:0];
  }
  else
  {
    v8 = PLLogDE();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100005DC0();
    }
    v12 = &__NSArray0__struct;
  }

  return v12;
}

- (id)getUpgradeLogs
{
  CFStringRef v14 = @"folder";
  id v3 = NSTemporaryDirectory();
  v15 = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];

  id v5 = PLQueryRegistered();
  v6 = v5;
  if (v5
    && ([v5 objectForKeyedSubscript:@"folder"],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    v8 = +[NSString stringWithFormat:@"^(%@_)", @"UpgradeLogs", v14];
    v9 = +[NSRegularExpression regularExpressionWithPattern:v8 options:1 error:0];
    v10 = [v6 objectForKeyedSubscript:@"folder"];
    v11 = +[NSURL fileURLWithPath:v10];
    v12 = [(DEPowerlogEPLExtension *)self filesInDir:v11 matchingPattern:v9 excludingPattern:0];
  }
  else
  {
    v8 = PLLogDE();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100005E28();
    }
    v12 = &__NSArray0__struct;
  }

  return v12;
}

- (id)generateBatteryUIPlistFile
{
  PLTalkToPowerlogHelper();
  id v3 = PLQueryRegistered();
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKeyedSubscript:@"PLBatteryUIQueryTime"];
    [v5 doubleValue];
    v6 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");

    if (v6)
    {
      v7 = [(DEPowerlogEPLExtension *)self getTimestampString:v6];
      v8 = +[NSString stringWithFormat:@"/tmp/BatteryUI-EPL-%@.plist", v7];
      unsigned __int8 v9 = [v4 writeToFile:v8 atomically:1];
      v10 = PLLogDE();
      v11 = v10;
      if (v9)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_100005F18();
        }

        PLTalkToPowerlogHelper();
        id v12 = v8;
      }
      else
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_100005F80();
        }

        PLTalkToPowerlogHelper();
        id v12 = 0;
      }
    }
    else
    {
      CFStringRef v14 = PLLogDE();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100005ED4(v14);
      }

      PLTalkToPowerlogHelper();
      id v12 = 0;
    }
  }
  else
  {
    v13 = PLLogDE();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100005E90(v13);
    }

    PLTalkToPowerlogHelper();
    id v12 = 0;
  }

  return v12;
}

- (id)getArchives
{
  CFStringRef v15 = @"folder";
  id v3 = NSTemporaryDirectory();
  v16 = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];

  id v5 = PLQueryRegistered();
  v6 = v5;
  if (v5
    && ([v5 objectForKeyedSubscript:@"folder"],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    v8 = +[NSString stringWithFormat:@"%@%@", @".PLSQL", @".gz"];
    unsigned __int8 v9 = +[NSString stringWithFormat:@"(%@)$", v8];
    v10 = +[NSRegularExpression regularExpressionWithPattern:v9 options:1 error:0];
    v11 = [v6 objectForKeyedSubscript:@"folder"];
    id v12 = +[NSURL fileURLWithPath:v11];
    v13 = [(DEPowerlogEPLExtension *)self filesInDir:v12 matchingPattern:v10 excludingPattern:0];
  }
  else
  {
    v8 = PLLogDE();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100005FE8();
    }
    v13 = &__NSArray0__struct;
  }

  return v13;
}

- (id)getPowerlog
{
  CFStringRef v6 = @"folder";
  v2 = NSTemporaryDirectory();
  v7 = v2;
  id v3 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];

  id v4 = PLQueryRegistered();

  return v4;
}

- (id)getQuarantinedPowerlogs
{
  CFStringRef v15 = @"folder";
  id v3 = NSTemporaryDirectory();
  v16 = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];

  id v5 = PLQueryRegistered();
  CFStringRef v6 = v5;
  if (v5
    && ([v5 objectForKeyedSubscript:@"folder"],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    v8 = +[NSString stringWithFormat:@"%@", @".PLSQL", v15];
    unsigned __int8 v9 = +[NSString stringWithFormat:@"(%@)$", v8];
    v10 = +[NSRegularExpression regularExpressionWithPattern:v9 options:1 error:0];
    v11 = [v6 objectForKeyedSubscript:@"folder"];
    id v12 = +[NSURL fileURLWithPath:v11];
    v13 = [(DEPowerlogEPLExtension *)self filesInDir:v12 matchingPattern:v10 excludingPattern:0];
  }
  else
  {
    v13 = &__NSArray0__struct;
  }

  return v13;
}

- (id)attachmentsForParameters:(id)a3
{
  id v4 = +[NSMutableArray array];
  id v5 = [(DEPowerlogEPLExtension *)self getPowerlog];
  CFStringRef v6 = PLLogDE();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000064C8();
  }

  if (v5)
  {
    v7 = [v5 objectForKeyedSubscript:@"path"];

    if (v7)
    {
      v8 = [v5 objectForKeyedSubscript:@"path"];
      unsigned __int8 v9 = +[DEAttachmentItem attachmentWithPath:v8];

      [v9 setDeleteOnAttach:&__kCFBooleanTrue];
      [v9 setShouldCompress:&__kCFBooleanTrue];
      [v4 addObject:v9];
    }
  }
  v10 = PLLogDE();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100006460();
  }
  v55 = v5;

  v11 = [(DEPowerlogEPLExtension *)self getQuarantinedPowerlogs];
  id v12 = PLLogDE();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_1000063F8();
  }

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v13 = v11;
  id v14 = [v13 countByEnumeratingWithState:&v68 objects:v79 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v69;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v69 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v68 + 1) + 8 * i);
        [v18 setDeleteOnAttach:&__kCFBooleanTrue];
        [v18 setShouldCompress:&__kCFBooleanTrue];
        [v4 addObject:v18];
      }
      id v15 = [v13 countByEnumeratingWithState:&v68 objects:v79 count:16];
    }
    while (v15);
  }

  v19 = PLLogDE();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_100006390();
  }

  v20 = [(DEPowerlogEPLExtension *)self getArchives];
  v21 = PLLogDE();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    sub_100006328();
  }

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v22 = v20;
  id v23 = [v22 countByEnumeratingWithState:&v64 objects:v78 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v65;
    do
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(void *)v65 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v64 + 1) + 8 * (void)j);
        [v27 setDeleteOnAttach:&__kCFBooleanTrue];
        [v27 setShouldCompress:&__kCFBooleanTrue];
        [v4 addObject:v27];
      }
      id v24 = [v22 countByEnumeratingWithState:&v64 objects:v78 count:16];
    }
    while (v24);
  }

  v28 = PLLogDE();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    sub_1000062C0();
  }

  uint64_t v29 = [(DEPowerlogEPLExtension *)self generateBatteryUIPlistFile];
  v30 = PLLogDE();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
    sub_100006258();
  }

  if (v29)
  {
    v31 = +[DEAttachmentItem attachmentWithPath:v29];
    [v31 setDeleteOnAttach:&__kCFBooleanTrue];
    [v31 setShouldCompress:&__kCFBooleanTrue];
    [v4 addObject:v31];
  }
  v32 = PLLogDE();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
    sub_1000061F0();
  }
  v54 = (void *)v29;

  v33 = [(DEPowerlogEPLExtension *)self getBatteryUIPlists];
  v34 = PLLogDE();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
    sub_100006188();
  }

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v35 = v33;
  id v36 = [v35 countByEnumeratingWithState:&v60 objects:v77 count:16];
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v61;
    do
    {
      for (k = 0; k != v37; k = (char *)k + 1)
      {
        if (*(void *)v61 != v38) {
          objc_enumerationMutation(v35);
        }
        v40 = *(void **)(*((void *)&v60 + 1) + 8 * (void)k);
        objc_msgSend(v40, "setDeleteOnAttach:", &__kCFBooleanTrue, v54, v55);
        [v40 setShouldCompress:&__kCFBooleanTrue];
        [v4 addObject:v40];
      }
      id v37 = [v35 countByEnumeratingWithState:&v60 objects:v77 count:16];
    }
    while (v37);
  }

  v41 = PLLogDE();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
    sub_100006120();
  }

  v42 = [(DEPowerlogEPLExtension *)self getUpgradeLogs];
  v43 = PLLogDE();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
    sub_1000060B8();
  }

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v44 = v42;
  id v45 = [v44 countByEnumeratingWithState:&v56 objects:v76 count:16];
  if (v45)
  {
    id v46 = v45;
    uint64_t v47 = *(void *)v57;
    do
    {
      for (m = 0; m != v46; m = (char *)m + 1)
      {
        if (*(void *)v57 != v47) {
          objc_enumerationMutation(v44);
        }
        v49 = *(void **)(*((void *)&v56 + 1) + 8 * (void)m);
        objc_msgSend(v49, "setDeleteOnAttach:", &__kCFBooleanTrue, v54);
        [v49 setShouldCompress:&__kCFBooleanTrue];
        [v4 addObject:v49];
      }
      id v46 = [v44 countByEnumeratingWithState:&v56 objects:v76 count:16];
    }
    while (v46);
  }

  v50 = PLLogDE();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
    sub_100006050();
  }

  v51 = PLLogDE();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
  {
    id v52 = [v4 count];
    *(_DWORD *)buf = 134218242;
    id v73 = v52;
    __int16 v74 = 2112;
    v75 = v4;
    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "Attachment contents are %lu and as follows - %@", buf, 0x16u);
  }

  return v4;
}

@end