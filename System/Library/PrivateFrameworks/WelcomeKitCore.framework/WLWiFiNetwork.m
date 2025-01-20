@interface WLWiFiNetwork
- (NSString)ssid;
- (WLWiFiNetwork)initWithWiFiNetworkRef:(__WiFiNetwork *)a3;
- (__WiFiNetwork)ref;
- (int64_t)channel;
- (void)dealloc;
- (void)setChannel:(int64_t)a3;
- (void)setRef:(__WiFiNetwork *)a3;
@end

@implementation WLWiFiNetwork

- (WLWiFiNetwork)initWithWiFiNetworkRef:(__WiFiNetwork *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WLWiFiNetwork;
  v4 = [(WLWiFiNetwork *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(WLWiFiNetwork *)v4 setRef:a3];
    CFRetain([(WLWiFiNetwork *)v5 ref]);
    -[WLWiFiNetwork setChannel:](v5, "setChannel:", [(id)WiFiNetworkGetChannel() integerValue]);
  }
  return v5;
}

- (void)dealloc
{
  CFRelease([(WLWiFiNetwork *)self ref]);
  v3.receiver = self;
  v3.super_class = (Class)WLWiFiNetwork;
  [(WLWiFiNetwork *)&v3 dealloc];
}

- (NSString)ssid
{
  v2 = [(WLWiFiNetwork *)self ref];
  return (NSString *)MEMORY[0x270F4B780](v2);
}

- (__WiFiNetwork)ref
{
  return self->_ref;
}

- (void)setRef:(__WiFiNetwork *)a3
{
  self->_ref = a3;
}

- (int64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(int64_t)a3
{
  self->_channel = a3;
}

@end