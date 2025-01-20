@interface BKLinkRotorInfo
- (NSURL)url;
- (id)type;
- (void)setUrl:(id)a3;
@end

@implementation BKLinkRotorInfo

- (id)type
{
  return @"Link";
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
}

@end