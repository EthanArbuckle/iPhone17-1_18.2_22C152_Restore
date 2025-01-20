@interface SXLinkTapEvent
- (NSURL)destinationURL;
- (SXJSONDictionary)analytics;
- (SXLinkTapEvent)initWithDestinationURL:(id)a3 analytics:(id)a4;
@end

@implementation SXLinkTapEvent

- (SXLinkTapEvent)initWithDestinationURL:(id)a3 analytics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXLinkTapEvent;
  v8 = [(SXAnalyticsEvent *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    destinationURL = v8->_destinationURL;
    v8->_destinationURL = (NSURL *)v9;

    objc_storeStrong((id *)&v8->_analytics, a4);
  }

  return v8;
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (SXJSONDictionary)analytics
{
  return self->_analytics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
}

@end