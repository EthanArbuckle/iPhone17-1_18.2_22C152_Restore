@interface ISStoreVersion
- (ISStoreVersion)initWithDictionary:(id)a3;
- (NSURL)redirectURL;
- (void)dealloc;
- (void)setRedirectURL:(id)a3;
@end

@implementation ISStoreVersion

- (ISStoreVersion)initWithDictionary:(id)a3
{
  v4 = [(ISStoreVersion *)self init];
  if (v4)
  {
    uint64_t v5 = [a3 objectForKey:@"redirect-url"];
    if (v5) {
      v4->_redirectURL = (NSURL *)[objc_alloc(NSURL) initWithString:v5];
    }
  }
  return v4;
}

- (void)dealloc
{
  self->_redirectURL = 0;
  v3.receiver = self;
  v3.super_class = (Class)ISStoreVersion;
  [(ISStoreVersion *)&v3 dealloc];
}

- (NSURL)redirectURL
{
  return self->_redirectURL;
}

- (void)setRedirectURL:(id)a3
{
}

@end