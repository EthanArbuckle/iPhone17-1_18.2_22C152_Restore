@interface NSURLSessionConfiguration(Workflow)
+ (id)wf_defaultSessionConfiguration;
@end

@implementation NSURLSessionConfiguration(Workflow)

+ (id)wf_defaultSessionConfiguration
{
  v1 = [a1 defaultSessionConfiguration];
  objc_msgSend(v1, "set_sourceApplicationBundleIdentifier:", @"com.apple.shortcuts");
  return v1;
}

@end