@interface SDHotspotClient
- (BOOL)browsing;
- (NSString)bundleID;
- (SFRemoteHotspotClient)clientProxy;
- (void)setBrowsing:(BOOL)a3;
- (void)setBundleID:(id)a3;
- (void)setClientProxy:(id)a3;
@end

@implementation SDHotspotClient

- (BOOL)browsing
{
  return self->_browsing;
}

- (void)setBrowsing:(BOOL)a3
{
  self->_browsing = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (SFRemoteHotspotClient)clientProxy
{
  return self->_clientProxy;
}

- (void)setClientProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientProxy, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end