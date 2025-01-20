@interface SXWebContentComponentExposureEvent
- (NSString)componentIdentifier;
- (NSString)exposureIdentifier;
- (NSURL)URL;
- (SXWebContentComponentExposureEvent)initWithComponent:(id)a3;
@end

@implementation SXWebContentComponentExposureEvent

- (SXWebContentComponentExposureEvent)initWithComponent:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SXWebContentComponentExposureEvent;
  v5 = [(SXAnalyticsEvent *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 identifier];
    componentIdentifier = v5->_componentIdentifier;
    v5->_componentIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 URL];
    URL = v5->_URL;
    v5->_URL = (NSURL *)v8;

    v10 = [MEMORY[0x263F08C38] UUID];
    uint64_t v11 = [v10 UUIDString];
    exposureIdentifier = v5->_exposureIdentifier;
    v5->_exposureIdentifier = (NSString *)v11;
  }
  return v5;
}

- (NSString)componentIdentifier
{
  return self->_componentIdentifier;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSString)exposureIdentifier
{
  return self->_exposureIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exposureIdentifier, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_componentIdentifier, 0);
}

@end