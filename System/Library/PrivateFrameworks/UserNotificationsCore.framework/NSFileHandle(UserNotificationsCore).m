@interface NSFileHandle(UserNotificationsCore)
- (id)unc_secureFileURL;
@end

@implementation NSFileHandle(UserNotificationsCore)

- (id)unc_secureFileURL
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (fcntl([a1 fileDescriptor], 50, v4))
  {
    v1 = 0;
  }
  else
  {
    v2 = [NSString stringWithUTF8String:v4];
    v1 = [NSURL fileURLWithPath:v2];
  }

  return v1;
}

@end