@interface SUPolicyDocumentationDownload
- (int)downloadTimeoutSecs;
@end

@implementation SUPolicyDocumentationDownload

- (int)downloadTimeoutSecs
{
  return 30;
}

@end