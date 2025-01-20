@interface QLPreviewProvider
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)providePreviewForFileRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation QLPreviewProvider

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26C8F9DC0]) {
    [v4 setPreviewProvider:self];
  }
}

- (void)providePreviewForFileRequest:(id)a3 completionHandler:(id)a4
{
}

@end