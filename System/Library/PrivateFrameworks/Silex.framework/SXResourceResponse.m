@interface SXResourceResponse
- (NSError)error;
- (NSString)resourceIdentifier;
- (NSURL)fileURL;
- (void)setError:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setResourceIdentifier:(id)a3;
@end

@implementation SXResourceResponse

- (NSString)resourceIdentifier
{
  return self->_resourceIdentifier;
}

- (void)setResourceIdentifier:(id)a3
{
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_resourceIdentifier, 0);
}

@end