@interface SUUIEditorialLinkLayoutRequest
- (Class)layoutClass;
- (NSArray)links;
- (double)width;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setLinks:(id)a3;
- (void)setWidth:(double)a3;
@end

@implementation SUUIEditorialLinkLayoutRequest

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setLinks:self->_links];
  [v4 setWidth:self->_width];
  return v4;
}

- (NSArray)links
{
  return self->_links;
}

- (void)setLinks:(id)a3
{
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (void).cxx_destruct
{
}

@end