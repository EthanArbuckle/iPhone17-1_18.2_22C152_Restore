@interface NSProgress
- (BOOL)isDownloadingOperation;
- (BOOL)isUploadingOperation;
@end

@implementation NSProgress

- (BOOL)isDownloadingOperation
{
  return sub_100403354(self, (uint64_t)a2, (void **)&NSProgressFileOperationKindDownloading);
}

- (BOOL)isUploadingOperation
{
  return sub_100403354(self, (uint64_t)a2, (void **)&NSProgressFileOperationKindUploading);
}

@end