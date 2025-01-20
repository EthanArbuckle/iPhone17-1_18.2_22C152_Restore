@interface BSUIAppleIDImageURLProtocol
+ (BOOL)canInitWithRequest:(id)a3;
+ (id)canonicalRequestForRequest:(id)a3;
- (void)startLoading;
@end

@implementation BSUIAppleIDImageURLProtocol

+ (BOOL)canInitWithRequest:(id)a3
{
  v3 = [a3 URL];
  v4 = [v3 scheme];
  unsigned __int8 v5 = [v4 isEqualToString:@"x-apple-identity-image"];

  return v5;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  id v3 = a3;

  return v3;
}

- (void)startLoading
{
  id v3 = [(BSUIAppleIDImageURLProtocol *)self request];
  id v8 = [v3 URL];

  BSUIGetFamilyMemberImage(v8);
  v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
  unsigned __int8 v5 = [(BSUIAppleIDImageURLProtocol *)self client];
  if (v4)
  {
    v6 = UIImagePNGRepresentation(v4);
    id v7 = [objc_alloc((Class)NSURLResponse) initWithURL:v8 MIMEType:@"image/png" expectedContentLength:[v6 length] textEncodingName:0];
    [v5 URLProtocol:self didReceiveResponse:v7 cacheStoragePolicy:1];
    [v5 URLProtocol:self didLoadData:v6];
    [v5 URLProtocolDidFinishLoading:self];
  }
  else
  {
    v6 = +[NSError errorWithDomain:@"kBSUIAppleIDImageURLProtocolErrorDomain" code:0 userInfo:0];
    [v5 URLProtocol:self didFailWithError:v6];
  }
}

@end