@interface WifiP2PControllerProperties
- (id)description;
@end

@implementation WifiP2PControllerProperties

- (id)description
{
  if (self)
  {
    uint64_t supportedBandsBitmap = self->_supportedBandsBitmap;
    v4 = self->_operatingChannel;
    uint64_t operatingClass = self->_operatingClass;
    supportedCiphterSuites = self->_supportedCiphterSuites;
  }
  else
  {
    uint64_t operatingClass = 0;
    uint64_t supportedBandsBitmap = 0;
    v4 = 0;
    supportedCiphterSuites = 0;
  }
  v7 = +[NSString stringWithFormat:@"{supportedBands=0x%x, channel=%@, operatingClass=%d, supportedCiphers=%@}", supportedBandsBitmap, v4, operatingClass, supportedCiphterSuites];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedCiphterSuites, 0);

  objc_storeStrong((id *)&self->_operatingChannel, 0);
}

@end