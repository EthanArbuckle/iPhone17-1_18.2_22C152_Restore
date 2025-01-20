@interface WBSLeadImageCacheResponse
+ (id)responseWithURL:(id)a3 thumbnail:(id)a4;
- (UIImage)thumbnail;
- (WBSLeadImageCacheResponse)initWithURL:(id)a3;
- (WBSLeadImageCacheResponse)initWithURL:(id)a3 thumbnail:(id)a4;
@end

@implementation WBSLeadImageCacheResponse

+ (id)responseWithURL:(id)a3 thumbnail:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithURL:v7 thumbnail:v6];

  return v8;
}

- (WBSLeadImageCacheResponse)initWithURL:(id)a3
{
  return [(WBSLeadImageCacheResponse *)self initWithURL:a3 thumbnail:0];
}

- (WBSLeadImageCacheResponse)initWithURL:(id)a3 thumbnail:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WBSLeadImageCacheResponse;
  v8 = [(WBSSiteMetadataResponse *)&v12 initWithURL:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_thumbnail, a4);
    v10 = v9;
  }

  return v9;
}

- (UIImage)thumbnail
{
  return self->_thumbnail;
}

- (void).cxx_destruct
{
}

@end