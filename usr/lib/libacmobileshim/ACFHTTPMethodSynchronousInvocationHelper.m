@interface ACFHTTPMethodSynchronousInvocationHelper
- (NSData)result;
- (NSError)error;
- (void)dealloc;
- (void)httpMethodInvocation:(id)a3 didFailWithError:(id)a4;
- (void)httpMethodInvocation:(id)a3 didFinishWithResult:(id)a4;
- (void)setError:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation ACFHTTPMethodSynchronousInvocationHelper

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ACFHTTPMethodSynchronousInvocationHelper;
  [(ACFHTTPMethodSynchronousInvocationHelper *)&v3 dealloc];
}

- (void)httpMethodInvocation:(id)a3 didFinishWithResult:(id)a4
{
}

- (void)httpMethodInvocation:(id)a3 didFailWithError:(id)a4
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 8, 1);
}

- (void)setError:(id)a3
{
}

- (NSData)result
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setResult:(id)a3
{
}

@end