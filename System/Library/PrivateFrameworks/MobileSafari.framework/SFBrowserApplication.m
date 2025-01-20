@interface SFBrowserApplication
+ (void)initialize;
- (SFBrowserApplicationProxy)proxy;
- (WBSTabEntityDataSource)tabEntityDataSource;
@end

@implementation SFBrowserApplication

+ (void)initialize
{
}

- (SFBrowserApplicationProxy)proxy
{
  return self->_proxy;
}

- (WBSTabEntityDataSource)tabEntityDataSource
{
  return self->_tabEntityDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabEntityDataSource, 0);

  objc_storeStrong((id *)&self->_proxy, 0);
}

@end