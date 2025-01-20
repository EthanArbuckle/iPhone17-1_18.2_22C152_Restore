@interface NSURL(DownloadItem)
+ (uint64_t)canHandleDownloadTask:()DownloadItem;
+ (void)downloadManager:()DownloadItem task:didFinishDownloadingToURL:;
- (id)downloadTaskDescription;
- (uint64_t)totalBytesExpectedToBeDownloaded;
@end

@implementation NSURL(DownloadItem)

- (id)downloadTaskDescription
{
  v1 = NSString;
  v2 = [a1 absoluteString];
  v3 = [v1 stringWithFormat:@"%@%@", @"File:", v2];

  return v3;
}

- (uint64_t)totalBytesExpectedToBeDownloaded
{
  return 0;
}

+ (uint64_t)canHandleDownloadTask:()DownloadItem
{
  v3 = [a3 taskDescription];
  uint64_t v4 = [v3 hasPrefix:@"File:"];

  return v4;
}

+ (void)downloadManager:()DownloadItem task:didFinishDownloadingToURL:
{
  id v7 = a5;
  id v8 = a3;
  v9 = [a4 originalRequest];
  v10 = [v9 URL];

  v11 = [v8 downloadInboxDirectory];

  v12 = [v10 lastPathComponent];
  v13 = [v11 URLByAppendingPathComponent:v12];

  v14 = [MEMORY[0x263F08850] defaultManager];
  [v14 removeItemAtURL:v13 error:0];
  if (([v14 linkItemAtURL:v7 toURL:v13 error:0] & 1) == 0)
  {
    id v21 = 0;
    char v15 = [v14 copyItemAtURL:v7 toURL:v13 error:&v21];
    id v20 = v21;
    if ((v15 & 1) == 0) {
      TSULogErrorInFunction((uint64_t)"+[NSURL(DownloadItem) downloadManager:task:didFinishDownloadingToURL:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/NSURL_DownloadItem.m", 50, @"Failed to move downloaded file from %@ to %@: %@", v16, v17, v18, v19, (uint64_t)v7);
    }
  }
}

@end