@interface PLCloudPhotoLibraryError
+ (id)createErrorWithType:(int64_t)a3;
+ (id)createErrorWithType:(int64_t)a3 withDebugMessage:(id)a4;
+ (id)userMessageForErrorType:(int64_t)a3;
@end

@implementation PLCloudPhotoLibraryError

+ (id)createErrorWithType:(int64_t)a3 withDebugMessage:(id)a4
{
  id v5 = a4;
  v6 = +[PLCloudPhotoLibraryError userMessageForErrorType:a3];
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  [v7 setValue:v6 forKey:*MEMORY[0x1E4F28568]];
  if (v5) {
    [v7 setValue:v5 forKey:*MEMORY[0x1E4F28228]];
  }
  v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PLCloudPhotoLibraryErrorDomain" code:a3 userInfo:v7];

  return v8;
}

+ (id)createErrorWithType:(int64_t)a3
{
  return +[PLCloudPhotoLibraryError createErrorWithType:a3 withDebugMessage:0];
}

+ (id)userMessageForErrorType:(int64_t)a3
{
  v3 = PLServicesLocalizedFrameworkStringForAssetsd();
  return v3;
}

@end