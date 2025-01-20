@interface PKQuotaNotification
- (NSURL)quotaURL;
- (void)_interpretResult:(unint64_t)a3 responseDict:(id)a4;
- (void)setQuotaURL:(id)a3;
@end

@implementation PKQuotaNotification

- (void)_interpretResult:(unint64_t)a3 responseDict:(id)a4
{
}

- (NSURL)quotaURL
{
  return (NSURL *)objc_getProperty(self, a2, 88, 1);
}

- (void)setQuotaURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end