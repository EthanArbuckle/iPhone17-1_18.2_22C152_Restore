@interface CKContainer(ScreenTimeCore)
+ (__CFString)remotemanagement_mirroringContainerIdentifier;
+ (id)remotemanagement_mirroringContainer;
@end

@implementation CKContainer(ScreenTimeCore)

+ (__CFString)remotemanagement_mirroringContainerIdentifier
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v1 = [v0 BOOLForKey:@"UseValidationContainer"];

  if (v1) {
    return @"com.apple.remotemanagement.encrypted.qa";
  }
  else {
    return @"com.apple.remotemanagement.encrypted";
  }
}

+ (id)remotemanagement_mirroringContainer
{
  int v1 = (void *)MEMORY[0x1E4F19EC8];
  v2 = objc_msgSend(a1, "remotemanagement_mirroringContainerIdentifier");
  v3 = [v1 containerWithIdentifier:v2];

  return v3;
}

@end