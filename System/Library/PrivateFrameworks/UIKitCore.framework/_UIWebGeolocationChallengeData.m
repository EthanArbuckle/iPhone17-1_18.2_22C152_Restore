@interface _UIWebGeolocationChallengeData
- (NSString)token;
- (NSString)userVisibleDomain;
- (NSURL)requestingURL;
- (UIView)view;
- (WebAllowDenyPolicyListener)listener;
- (void)dealloc;
- (void)setListener:(id)a3;
- (void)setRequestingURL:(id)a3;
- (void)setToken:(id)a3;
- (void)setUserVisibleDomain:(id)a3;
- (void)setView:(id)a3;
@end

@implementation _UIWebGeolocationChallengeData

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_UIWebGeolocationChallengeData;
  [(_UIWebGeolocationChallengeData *)&v3 dealloc];
}

- (NSString)userVisibleDomain
{
  return self->_userVisibleDomain;
}

- (void)setUserVisibleDomain:(id)a3
{
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (NSURL)requestingURL
{
  return self->_requestingURL;
}

- (void)setRequestingURL:(id)a3
{
}

- (UIView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
}

- (WebAllowDenyPolicyListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

@end