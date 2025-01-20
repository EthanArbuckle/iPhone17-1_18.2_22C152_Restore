@interface _UIMatchingExtensionsResult
- (NSArray)extensions;
- (NSError)error;
- (void)setError:(id)a3;
- (void)setExtensions:(id)a3;
@end

@implementation _UIMatchingExtensionsResult

- (NSArray)extensions
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setExtensions:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
}

@end