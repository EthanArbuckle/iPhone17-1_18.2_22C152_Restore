@interface NSFileManager(TSUAdditions)
- (uint64_t)tsu_linkOrCopyItemAtURL:()TSUAdditions toURL:error:;
@end

@implementation NSFileManager(TSUAdditions)

- (uint64_t)tsu_linkOrCopyItemAtURL:()TSUAdditions toURL:error:
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v16 = [NSString stringWithUTF8String:"-[NSFileManager(TSUAdditions) tsu_linkOrCopyItemAtURL:toURL:error:]"];
  v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSFileManager_TSUAdditions.m"];
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 16, 0, "Invalid parameter not satisfying: %{public}s", "srcURL");

  +[OITSUAssertionHandler logBacktraceThrottled];
  if (!v10)
  {
LABEL_3:
    v11 = [NSString stringWithUTF8String:"-[NSFileManager(TSUAdditions) tsu_linkOrCopyItemAtURL:toURL:error:]"];
    v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSFileManager_TSUAdditions.m"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 17, 0, "Invalid parameter not satisfying: %{public}s", "dstURL");

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
LABEL_4:
  if (objc_msgSend(v8, "tsu_isOnAPFSVolume") && (objc_msgSend(v8, "tsu_isOnSameVolumeAs:", v10) & 1) != 0
    || ([a1 linkItemAtURL:v8 toURL:v10 error:0] & 1) == 0)
  {
    id v18 = 0;
    uint64_t v14 = [a1 copyItemAtURL:v8 toURL:v10 error:&v18];
    id v13 = v18;
    if (a5 && (v14 & 1) == 0)
    {
      id v13 = v13;
      uint64_t v14 = 0;
      *a5 = v13;
    }
  }
  else
  {
    id v13 = 0;
    uint64_t v14 = 1;
  }

  return v14;
}

@end