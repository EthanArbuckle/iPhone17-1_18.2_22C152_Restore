@interface NSURLCredential(SafariCoreExtras)
+ (uint64_t)safari_credentialWithUser:()SafariCoreExtras password:persistence:;
@end

@implementation NSURLCredential(SafariCoreExtras)

+ (uint64_t)safari_credentialWithUser:()SafariCoreExtras password:persistence:
{
  if (!a3) {
    a3 = &stru_1F105D3F0;
  }
  return objc_msgSend(MEMORY[0x1E4F18D88], "credentialWithUser:password:persistence:", a3);
}

@end