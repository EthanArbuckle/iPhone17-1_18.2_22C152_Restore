@interface SSVPlaybackLeaseResponse
- (BOOL)isOfflineSlotAvailable;
- (NSData)certificateData;
- (NSData)leaseInfoData;
- (NSData)subscriptionKeyBagData;
- (double)leaseDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)itemForItemIdentifier:(id)a3;
- (unint64_t)KDMovieIdentifier;
- (void)setCertificateData:(id)a3;
- (void)setKDMovieIdentifier:(unint64_t)a3;
@end

@implementation SSVPlaybackLeaseResponse

- (id)itemForItemIdentifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SSVPlaybackLeaseResponse;
  v3 = [(SSVPlaybackResponse *)&v5 itemForItemIdentifier:a3];
  return v3;
}

- (double)leaseDuration
{
  v2 = [(SSVPlaybackResponse *)self responseDictionary];
  v3 = [v2 objectForKey:@"leaseDurationInSeconds"];

  if (v3)
  {
    double v4 = 0.0;
    if (objc_opt_respondsToSelector())
    {
      [v3 doubleValue];
      double v4 = v5;
    }
  }
  else
  {
    double v4 = 600.0;
  }

  return v4;
}

- (BOOL)isOfflineSlotAvailable
{
  v2 = [(SSVPlaybackResponse *)self responseDictionary];
  v3 = [v2 objectForKey:@"offlineSlotAvailable"];

  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (NSData)leaseInfoData
{
  v2 = [(SSVPlaybackResponse *)self responseDictionary];
  v3 = [v2 objectForKey:@"ckc"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v3 options:0];
  }
  else {
    char v4 = 0;
  }

  return (NSData *)v4;
}

- (NSData)subscriptionKeyBagData
{
  v2 = [(SSVPlaybackResponse *)self responseDictionary];
  v3 = SSVSubscriptionBagForDictionary(v2);

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SSVPlaybackLeaseResponse;
  id v4 = [(SSVPlaybackResponse *)&v6 copyWithZone:a3];
  [v4 setCertificateData:self->_certificateData];
  [v4 setKDMovieIdentifier:self->_kdMovieIdentifier];
  return v4;
}

- (NSData)certificateData
{
  return self->_certificateData;
}

- (void)setCertificateData:(id)a3
{
}

- (unint64_t)KDMovieIdentifier
{
  return self->_kdMovieIdentifier;
}

- (void)setKDMovieIdentifier:(unint64_t)a3
{
  self->_kdMovieIdentifier = a3;
}

- (void).cxx_destruct
{
}

@end