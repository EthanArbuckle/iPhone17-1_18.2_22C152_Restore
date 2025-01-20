@interface UMGenerationCache
@end

@implementation UMGenerationCache

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetcher, 0);
  objc_storeStrong((id *)&self->_se, 0);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end