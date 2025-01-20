@interface WBSWebExtensionPendingWebsiteRequest
- (NSDate)expirationDate;
- (NSSet)urls;
- (NSString)apiName;
- (id)completionHandler;
- (void)setApiName:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setUrls:(id)a3;
@end

@implementation WBSWebExtensionPendingWebsiteRequest

- (NSSet)urls
{
  return self->_urls;
}

- (void)setUrls:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSString)apiName
{
  return self->_apiName;
}

- (void)setApiName:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_apiName, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_urls, 0);
}

@end