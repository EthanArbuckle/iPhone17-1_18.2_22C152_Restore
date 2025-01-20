@interface DCIMDirectoryUtilities
+ (id)nebuladkeepalivepath;
+ (id)photoDCIMDirectory;
+ (id)photoDataDirectory;
+ (id)photoDataMiscDirectory;
+ (id)takingPhotoIndicatorFilePath;
+ (id)takingVideoIndicatorFilePath;
@end

@implementation DCIMDirectoryUtilities

+ (id)photoDataMiscDirectory
{
  return +[PLFileUtilities defaultSystemPhotoDataMiscDirectory];
}

+ (id)photoDCIMDirectory
{
  return +[PLFileUtilities defaultSystemPhotoDCIMDirectory];
}

+ (id)takingVideoIndicatorFilePath
{
  v2 = [a1 photoDataDirectory];
  v3 = [v2 stringByAppendingPathComponent:@"takingvideo"];

  return v3;
}

+ (id)takingPhotoIndicatorFilePath
{
  v2 = [a1 photoDataDirectory];
  v3 = [v2 stringByAppendingPathComponent:@"takingphoto"];

  return v3;
}

+ (id)nebuladkeepalivepath
{
  v2 = [a1 photoDCIMDirectory];
  v3 = [v2 stringByAppendingPathComponent:@".MISC"];
  v4 = [v3 stringByAppendingPathComponent:@"nebuladkeepalive"];

  return v4;
}

+ (id)photoDataDirectory
{
  return +[PLFileUtilities defaultSystemPhotoDataDirectory];
}

@end