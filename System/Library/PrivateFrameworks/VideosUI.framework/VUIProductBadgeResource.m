@interface VUIProductBadgeResource
- (BOOL)isTemplated;
- (NSString)name;
- (VUIProductBadgeResource)init;
- (void)setName:(id)a3;
- (void)setTemplated:(BOOL)a3;
@end

@implementation VUIProductBadgeResource

- (VUIProductBadgeResource)init
{
  v3.receiver = self;
  v3.super_class = (Class)VUIProductBadgeResource;
  result = [(VUIProductBadgeResource *)&v3 init];
  if (result) {
    result->_templated = 1;
  }
  return result;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)isTemplated
{
  return self->_templated;
}

- (void)setTemplated:(BOOL)a3
{
  self->_templated = a3;
}

- (void).cxx_destruct
{
}

@end