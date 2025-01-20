@interface NSURL(PhotosUICore)
+ (id)px_tempDirectoryFileURLWithFileName:()PhotosUICore subdirectory:fileExtension:;
+ (id)px_tempDirectoryFileURLWithSubdirectory:()PhotosUICore fileExtension:;
+ (uint64_t)px_openCameraAppURL;
- (id)px_URLByAppendingPathComponentFollowedByCurrentDateAndTime:()PhotosUICore;
@end

@implementation NSURL(PhotosUICore)

- (id)px_URLByAppendingPathComponentFollowedByCurrentDateAndTime:()PhotosUICore
{
  v4 = (objc_class *)MEMORY[0x1E4F28C10];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setDateFormat:@"yyyy-MM-dd-HHmmss"];
  v7 = [MEMORY[0x1E4F1C9C8] date];
  v8 = [v6 stringFromDate:v7];

  v9 = [NSString stringWithFormat:@"%@-%@", v5, v8];

  v10 = [a1 URLByAppendingPathComponent:v9];

  return v10;
}

+ (uint64_t)px_openCameraAppURL
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"camera://configuration?capturemode=photo&capturedevice=back"];
}

+ (id)px_tempDirectoryFileURLWithFileName:()PhotosUICore subdirectory:fileExtension:
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = NSTemporaryDirectory();
  v11 = [(id)v10 stringByAppendingPathComponent:v9];

  v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  LOBYTE(v10) = [v12 fileExistsAtPath:v11 isDirectory:0];

  if ((v10 & 1) == 0)
  {
    v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v13 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:0];
  }
  v14 = [v11 stringByAppendingPathComponent:v7];
  v15 = [v14 stringByAppendingPathExtension:v8];

  v16 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v15];

  return v16;
}

+ (id)px_tempDirectoryFileURLWithSubdirectory:()PhotosUICore fileExtension:
{
  id v6 = (void *)MEMORY[0x1E4F29128];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 UUID];
  uint64_t v10 = [v9 UUIDString];

  v11 = objc_msgSend(a1, "px_tempDirectoryFileURLWithFileName:subdirectory:fileExtension:", v10, v8, v7);

  return v11;
}

@end