@interface WBSLeadImageCacheRequest
+ (id)requestWithURL:(id)a3;
@end

@implementation WBSLeadImageCacheRequest

+ (id)requestWithURL:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithURL:v4 extraInfo:0];

  return v5;
}

@end