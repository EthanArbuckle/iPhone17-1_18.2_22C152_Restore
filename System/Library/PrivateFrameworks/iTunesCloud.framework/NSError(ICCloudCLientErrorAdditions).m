@interface NSError(ICCloudCLientErrorAdditions)
+ (uint64_t)ic_cloudClientErrorWithCode:()ICCloudCLientErrorAdditions userInfo:;
+ (uint64_t)ic_cloudClientLibraryUploadErrorWithCode:()ICCloudCLientErrorAdditions userInfo:;
@end

@implementation NSError(ICCloudCLientErrorAdditions)

+ (uint64_t)ic_cloudClientErrorWithCode:()ICCloudCLientErrorAdditions userInfo:
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"ICCloudClientErrorDomain" code:a3 userInfo:a4];
}

+ (uint64_t)ic_cloudClientLibraryUploadErrorWithCode:()ICCloudCLientErrorAdditions userInfo:
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"ICCloudClientLibraryUploadErrorDomain" code:a3 userInfo:a4];
}

@end