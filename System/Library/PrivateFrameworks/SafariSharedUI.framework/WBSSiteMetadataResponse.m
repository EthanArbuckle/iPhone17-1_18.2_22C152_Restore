@interface WBSSiteMetadataResponse
+ (id)responseWithURL:(id)a3;
- (NSURL)url;
- (WBSSiteMetadataResponse)init;
- (WBSSiteMetadataResponse)initWithURL:(id)a3;
@end

@implementation WBSSiteMetadataResponse

- (NSURL)url
{
  return self->_url;
}

- (WBSSiteMetadataResponse)initWithURL:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSSiteMetadataResponse;
  v6 = [(WBSSiteMetadataResponse *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v8 = v7;
  }

  return v7;
}

- (void).cxx_destruct
{
}

+ (id)responseWithURL:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithURL:v4];

  return v5;
}

- (WBSSiteMetadataResponse)init
{
  return [(WBSSiteMetadataResponse *)self initWithURL:0];
}

@end