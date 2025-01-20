@interface NSBundle(NanoMediaRemote)
+ (id)nanoMediaRemoteBundle;
@end

@implementation NSBundle(NanoMediaRemote)

+ (id)nanoMediaRemoteBundle
{
  if (nanoMediaRemoteBundle_onceToken != -1) {
    dispatch_once(&nanoMediaRemoteBundle_onceToken, &__block_literal_global);
  }
  v0 = (void *)nanoMediaRemoteBundle_nanoMediaRemoteBundle;

  return v0;
}

@end