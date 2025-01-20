@interface MNFilePaths
+ (BOOL)createFolderIfNotPresent:(id)a3 error:(id *)a4;
+ (NSString)customRouteCreationTraceExtension;
+ (NSString)navTempDirectoryPath;
+ (NSString)navTraceExtension;
+ (NSString)navTracesDirectoryPath;
+ (NSString)navdCacheDirectoryPath;
+ (NSString)routeCreationTracesDirectoryPath;
+ (NSString)routeHandleExtension;
+ (NSString)routePlanningTraceExtension;
+ (NSString)routePlanningTracesDirectoryPath;
+ (id)_cachesDirectoryPath;
+ (id)_homeDirectoryPath;
+ (id)_validFilenameForTraceName:(id)a3;
+ (id)tracePathForTraceName:(id)a3 extension:(id)a4 directoryPath:(id)a5;
@end

@implementation MNFilePaths

+ (NSString)navTempDirectoryPath
{
  if (qword_1EB59C1C0 != -1) {
    dispatch_once(&qword_1EB59C1C0, &__block_literal_global_29_0);
  }
  v2 = (void *)qword_1EB59C1B8;
  return (NSString *)v2;
}

+ (id)_homeDirectoryPath
{
  v2 = (void *)_homeDirectoryPath_homePath;
  _homeDirectoryPath_homePath = @"/var/mobile/";

  return @"/var/mobile/";
}

+ (id)_cachesDirectoryPath
{
  if (qword_1EB59C190 != -1) {
    dispatch_once(&qword_1EB59C190, &__block_literal_global_28);
  }
  v2 = (void *)_MergedGlobals_33;
  return v2;
}

void __35__MNFilePaths__cachesDirectoryPath__block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v0 = +[MNFilePaths _homeDirectoryPath];
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"Library/Caches/"];
  v2 = (void *)_MergedGlobals_33;
  _MergedGlobals_33 = v1;

  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138477827;
    uint64_t v5 = _MergedGlobals_33;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEBUG, "cachesDirectory: %{private}@", (uint8_t *)&v4, 0xCu);
  }
}

+ (NSString)navdCacheDirectoryPath
{
  if (qword_1EB59C1A0 != -1) {
    dispatch_once(&qword_1EB59C1A0, &__block_literal_global_13);
  }
  v2 = (void *)qword_1EB59C198;
  return (NSString *)v2;
}

void __37__MNFilePaths_navdCacheDirectoryPath__block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v0 = +[MNFilePaths _cachesDirectoryPath];
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"com.apple.navd"];
  v2 = (void *)qword_1EB59C198;
  qword_1EB59C198 = v1;

  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138477827;
    uint64_t v5 = qword_1EB59C198;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEBUG, "navdCacheDirectoryPath: %{private}@", (uint8_t *)&v4, 0xCu);
  }
}

+ (NSString)navTracesDirectoryPath
{
  if (qword_1EB59C1B0 != -1) {
    dispatch_once(&qword_1EB59C1B0, &__block_literal_global_18_0);
  }
  v2 = (void *)qword_1EB59C1A8;
  return (NSString *)v2;
}

void __37__MNFilePaths_navTracesDirectoryPath__block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v0 = +[MNFilePaths navdCacheDirectoryPath];
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"NavTraces"];
  v2 = (void *)qword_1EB59C1A8;
  qword_1EB59C1A8 = v1;

  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138477827;
    uint64_t v5 = qword_1EB59C1A8;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEBUG, "navTracesDirectoryPath: %{private}@", (uint8_t *)&v4, 0xCu);
  }
}

+ (NSString)routePlanningTracesDirectoryPath
{
  v2 = +[MNFilePaths navTracesDirectoryPath];
  v3 = [v2 stringByAppendingPathComponent:@"RoutePlanning"];

  return (NSString *)v3;
}

+ (NSString)routeCreationTracesDirectoryPath
{
  v2 = +[MNFilePaths navTracesDirectoryPath];
  v3 = [v2 stringByAppendingPathComponent:@"RouteCreation"];

  return (NSString *)v3;
}

void __35__MNFilePaths_navTempDirectoryPath__block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v0 = +[MNFilePaths navdCacheDirectoryPath];
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"tmp"];
  v2 = (void *)qword_1EB59C1B8;
  qword_1EB59C1B8 = v1;

  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138477827;
    uint64_t v5 = qword_1EB59C1B8;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEBUG, "navTracesDirectoryPath: %{private}@", (uint8_t *)&v4, 0xCu);
  }
}

+ (NSString)navTraceExtension
{
  return (NSString *)@"navtrace";
}

+ (NSString)routePlanningTraceExtension
{
  return (NSString *)@"rptrace";
}

+ (NSString)customRouteCreationTraceExtension
{
  return (NSString *)@"crctrace";
}

+ (NSString)routeHandleExtension
{
  return (NSString *)@"rstorage";
}

+ (BOOL)createFolderIfNotPresent:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v15 = 0;
  if (![v6 fileExistsAtPath:v5 isDirectory:&v15])
  {
    BOOL v7 = 1;
    if ([v6 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:a4]) {
      goto LABEL_11;
    }
    v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = *a4;
      *(_DWORD *)buf = 138412546;
      id v17 = v5;
      __int16 v18 = 2112;
      id v19 = v9;
      v10 = "Could not create trace directory at path: %@. Error: %@";
      v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 22;
LABEL_9:
      _os_log_impl(&dword_1B542B000, v11, v12, v10, buf, v13);
    }
LABEL_10:

    BOOL v7 = 0;
    goto LABEL_11;
  }
  if (!v15)
  {
    v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v5;
      v10 = "File exists in place of traces directory at path: %@. Please remove it.";
      v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
      uint32_t v13 = 12;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

+ (id)tracePathForTraceName:(id)a3 extension:(id)a4 directoryPath:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  id v9 = +[MNFilePaths _validFilenameForTraceName:a3];
  v10 = [v9 stringByAppendingPathExtension:v8];

  v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (([v11 fileExistsAtPath:v7 isDirectory:0] & 1) == 0)
  {
    id v17 = 0;
    int v12 = [v11 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v17];
    id v13 = v17;
    if (v12)
    {
      v14 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v13;
        _os_log_impl(&dword_1B542B000, v14, OS_LOG_TYPE_ERROR, "Couldn't create traces directory: %@", buf, 0xCu);
      }
    }
  }
  char v15 = [v7 stringByAppendingPathComponent:v10];

  return v15;
}

+ (id)_validFilenameForTraceName:(id)a3
{
  v3 = [a3 componentsSeparatedByString:@"\n"];
  int v4 = [v3 firstObject];

  id v5 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"[\x00/\\\\]+" options:0 error:0];
  uint64_t v6 = objc_msgSend(v5, "stringByReplacingMatchesInString:options:range:withTemplate:", v4, 0, 0, objc_msgSend(v4, "length"), @"_");

  return v6;
}

@end