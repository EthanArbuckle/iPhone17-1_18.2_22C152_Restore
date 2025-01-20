@interface NSURLSessionTask
- (id)_nsurlsessionproxy_error;
- (void)_nsurlsessionproxy_cancelWithError:(id)a3;
- (void)_nsurlsessionproxy_clearError;
@end

@implementation NSURLSessionTask

- (id)_nsurlsessionproxy_error
{
  return objc_getAssociatedObject(self, "com.apple.nsurlsessionproxy.cancelError");
}

- (void)_nsurlsessionproxy_clearError
{
}

- (void)_nsurlsessionproxy_cancelWithError:(id)a3
{
  id v4 = a3;
  objc_setAssociatedObject(self, "com.apple.nsurlsessionproxy.cancelError", v4, (void *)0x301);
  [(NSURLSessionTask *)self cancel];
}

@end