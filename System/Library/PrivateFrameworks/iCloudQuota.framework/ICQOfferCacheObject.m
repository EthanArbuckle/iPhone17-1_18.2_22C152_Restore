@interface ICQOfferCacheObject
- (ICQDaemonOffer)daemonOffer;
- (ICQOfferCacheObject)initWithDaemonOffer:(id)a3 bundleIdentifier:(id)a4;
- (NSString)bundleIdentifier;
- (id)offer;
- (void)setBundleIdentifier:(id)a3;
- (void)setDaemonOffer:(id)a3;
@end

@implementation ICQOfferCacheObject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_daemonOffer, 0);
}

- (ICQOfferCacheObject)initWithDaemonOffer:(id)a3 bundleIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICQOfferCacheObject;
  v9 = [(ICQOfferCacheObject *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_daemonOffer, a3);
    objc_storeStrong((id *)&v10->_bundleIdentifier, a4);
  }

  return v10;
}

- (id)offer
{
  v3 = [(ICQOfferCacheObject *)self daemonOffer];
  v4 = [(ICQOfferCacheObject *)self bundleIdentifier];
  if (v3)
  {
    v5 = objc_opt_class();
    [v5 isEqual:objc_opt_class()];
    id v6 = objc_alloc((Class)objc_opt_class());
    id v7 = [v3 serverDictionary];
    id v8 = [v3 accountAltDSID];
    v9 = [v3 notificationID];
    v10 = [v3 retrievalDate];
    [v3 callbackInterval];
    double v12 = v11;
    v13 = [v3 appLaunchLinkForBundleID:v4];
    v14 = (void *)[v6 initWithServerDictionary:v7 accountAltDSID:v8 notificationID:v9 retrievalDate:v10 callbackInterval:v13 appLaunchLink:v4 bundleIdentifier:v12];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (ICQDaemonOffer)daemonOffer
{
  return self->_daemonOffer;
}

- (void)setDaemonOffer:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

@end