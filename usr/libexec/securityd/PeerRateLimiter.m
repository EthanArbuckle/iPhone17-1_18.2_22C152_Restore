@interface PeerRateLimiter
- (NSMutableDictionary)accessGroupRateLimitState;
- (NSMutableDictionary)accessGroupToNextMessageToSend;
- (NSMutableDictionary)accessGroupToTimer;
- (NSString)peerID;
- (PeerRateLimiter)initWithPeer:(__OpaqueSOSPeer *)a3;
- (id)setUpConfigForPeer;
- (int)stateForAccessGroup:(id)a3;
- (void)setAccessGroupRateLimitState:(id)a3;
- (void)setAccessGroupToNextMessageToSend:(id)a3;
- (void)setAccessGroupToTimer:(id)a3;
- (void)setPeerID:(id)a3;
@end

@implementation PeerRateLimiter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessGroupToNextMessageToSend, 0);
  objc_storeStrong((id *)&self->_accessGroupToTimer, 0);
  objc_storeStrong((id *)&self->_accessGroupRateLimitState, 0);

  objc_storeStrong((id *)&self->peerID, 0);
}

- (void)setAccessGroupToNextMessageToSend:(id)a3
{
}

- (NSMutableDictionary)accessGroupToNextMessageToSend
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAccessGroupToTimer:(id)a3
{
}

- (NSMutableDictionary)accessGroupToTimer
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAccessGroupRateLimitState:(id)a3
{
}

- (NSMutableDictionary)accessGroupRateLimitState
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPeerID:(id)a3
{
}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (int)stateForAccessGroup:(id)a3
{
  id v4 = a3;
  v5 = [(PeerRateLimiter *)self accessGroupRateLimitState];
  v6 = [v5 objectForKey:v4];

  if (v6)
  {
    int v7 = [v6 intValue];
  }
  else
  {
    int v7 = 1;
    id v8 = [objc_alloc((Class)NSNumber) initWithLong:1];
    v9 = [(PeerRateLimiter *)self accessGroupRateLimitState];
    [v9 setObject:v8 forKey:v4];
  }
  return v7;
}

- (PeerRateLimiter)initWithPeer:(__OpaqueSOSPeer *)a3
{
  v5 = [(PeerRateLimiter *)self setUpConfigForPeer];
  v11.receiver = self;
  v11.super_class = (Class)PeerRateLimiter;
  v6 = [(RateLimiter *)&v11 initWithConfig:v5];

  if (v6)
  {
    [(PeerRateLimiter *)v6 setPeerID:*((void *)a3 + 2)];
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    [(PeerRateLimiter *)v6 setAccessGroupRateLimitState:v7];

    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    [(PeerRateLimiter *)v6 setAccessGroupToTimer:v8];

    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    [(PeerRateLimiter *)v6 setAccessGroupToNextMessageToSend:v9];
  }
  return v6;
}

- (id)setUpConfigForPeer
{
  v2 = [@"<?xml version=\"1.0\" encoding=\"UTF-8\"?>                          <!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">                          <plist version=\"1.0\">                          <dict>                          <key>general</key>                          <dict>                          <key>maxStateSize</key>                          <integer>250</integer>                          <key>maxItemAge</key>                          <integer>3600</integer>                          <key>overloadDuration</key>                          <integer>1800</integer>                          <key>name</key>                          <string>SOS</string>                          <key>MAType</key>                          <string></string>                          </dict>                          <key>groups</key>                          <array>                                <dict>                                    <key>property</key>                                    <string>global</string>                                    <key>capacity</key>                                    <integer>1000</integer>                                    <key>rate</key>                                    <integer>10</integer>                                    <key>badness</key>                                    <integer>1</integer>                                </dict>                                <dict>                                    <key>property</key>                                    <string>accessGroup</string>                                    <key>capacity</key>                                    <integer>50</integer>                                    <key>rate</key>                                    <integer>900</integer>                                    <key>badness</key>                                    <integer>3</integer>                                </dict>                          </array>                          </dict>                          </plist>                          " dataUsingEncoding:4];
  uint64_t v5 = 0;
  v3 = +[NSPropertyListSerialization propertyListWithData:v2 options:0 format:0 error:&v5];

  return v3;
}

@end