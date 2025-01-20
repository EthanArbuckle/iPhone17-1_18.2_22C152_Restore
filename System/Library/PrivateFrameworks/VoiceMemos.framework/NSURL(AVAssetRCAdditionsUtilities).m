@interface NSURL(AVAssetRCAdditionsUtilities)
- (id)temporaryMovieLink:()AVAssetRCAdditionsUtilities;
- (uint64_t)isQuickTime;
@end

@implementation NSURL(AVAssetRCAdditionsUtilities)

- (id)temporaryMovieLink:()AVAssetRCAdditionsUtilities
{
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  v6 = [v5 URLForDirectory:99 inDomain:1 appropriateForURL:a1 create:1 error:a3];
  if (v6)
  {
    v7 = [a1 lastPathComponent];
    v8 = [v6 URLByAppendingPathComponent:v7];
    v9 = objc_msgSend(v8, "rc_URLByReplacingPathExtensionWithExtension:", @"qt");

    if ([v5 linkItemAtURL:a1 toURL:v9 error:a3]) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    id v11 = v10;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (uint64_t)isQuickTime
{
  v1 = [a1 pathExtension];
  if ([v1 isEqualToString:@"qta"]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 isEqualToString:@"qt"];
  }

  return v2;
}

@end