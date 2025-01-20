@interface SPMLLogging
+ (id)candidateLogsURL;
+ (id)dateFormatter;
+ (id)logURLForCurrentTime;
+ (id)submittedLogsURL;
+ (id)submitttedSpotlightReportsError:(id *)a3;
@end

@implementation SPMLLogging

+ (id)submitttedSpotlightReportsError:(id *)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  v4 = [MEMORY[0x263F08850] defaultManager];
  v5 = +[SPMLLogging submittedLogsURL];
  v11[0] = *MEMORY[0x263EFFFB8];
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  id v10 = 0;
  v7 = [v4 contentsOfDirectoryAtURL:v5 includingPropertiesForKeys:v6 options:0 error:&v10];
  id v8 = v10;

  if (a3 && v8) {
    *a3 = v8;
  }

  return v7;
}

+ (id)logURLForCurrentTime
{
  v2 = +[SPMLLogging candidateLogsURL];
  v3 = NSString;
  v4 = +[SPMLLogging dateFormatter];
  v5 = [MEMORY[0x263EFF910] date];
  v6 = [v4 stringFromDate:v5];
  v7 = [v3 stringWithFormat:@"searchd-%@", v6];

  id v8 = [v2 URLByAppendingPathComponent:v7];
  v9 = [v8 URLByAppendingPathExtension:@"json"];

  return v9;
}

+ (id)submittedLogsURL
{
  v2 = NSHomeDirectory();
  v3 = [v2 stringByAppendingString:@"/Library/Spotlight/Diagnostics/SubmittedReports"];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__SPMLLogging_submittedLogsURL__block_invoke;
  block[3] = &unk_2644B2A50;
  id v9 = v3;
  uint64_t v4 = submittedLogsURL_onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&submittedLogsURL_onceToken, block);
  }
  v6 = [NSURL fileURLWithPath:v5 isDirectory:1 relativeToURL:0];

  return v6;
}

void __31__SPMLLogging_submittedLogsURL__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08850] defaultManager];
  if (([v2 fileExistsAtPath:*(void *)(a1 + 32)] & 1) == 0) {
    [v2 createDirectoryAtPath:*(void *)(a1 + 32) withIntermediateDirectories:1 attributes:0 error:0];
  }
}

+ (id)candidateLogsURL
{
  id v2 = NSHomeDirectory();
  v3 = [v2 stringByAppendingString:@"/Library/Spotlight/Diagnostics/CandidateReports"];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__SPMLLogging_candidateLogsURL__block_invoke;
  block[3] = &unk_2644B2A50;
  id v9 = v3;
  uint64_t v4 = candidateLogsURL_onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&candidateLogsURL_onceToken, block);
  }
  v6 = [NSURL fileURLWithPath:v5 isDirectory:1 relativeToURL:0];

  return v6;
}

void __31__SPMLLogging_candidateLogsURL__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08850] defaultManager];
  if (([v2 fileExistsAtPath:*(void *)(a1 + 32)] & 1) == 0) {
    [v2 createDirectoryAtPath:*(void *)(a1 + 32) withIntermediateDirectories:1 attributes:0 error:0];
  }
}

+ (id)dateFormatter
{
  id v2 = objc_opt_new();
  [v2 setDateFormat:@"yyyy-MM-dd"];
  v3 = [MEMORY[0x263EFFA18] timeZoneWithAbbreviation:@"GMT"];
  [v2 setTimeZone:v3];

  return v2;
}

@end