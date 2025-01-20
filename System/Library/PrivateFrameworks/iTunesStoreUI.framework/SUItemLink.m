@interface SUItemLink
- (NSString)title;
- (NSURL)URL;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)linkTarget;
- (int64_t)linkType;
- (void)dealloc;
- (void)setLinkTarget:(int64_t)a3;
- (void)setLinkType:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation SUItemLink

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUItemLink;
  [(SUItemLink *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5[1] = self->_linkTarget;
  v5[2] = self->_linkType;
  v5[3] = [(NSString *)self->_title copyWithZone:a3];
  v5[4] = self->_url;
  return v5;
}

- (int64_t)linkTarget
{
  return self->_linkTarget;
}

- (void)setLinkTarget:(int64_t)a3
{
  self->_linkTarget = a3;
}

- (int64_t)linkType
{
  return self->_linkType;
}

- (void)setLinkType:(int64_t)a3
{
  self->_linkType = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSURL)URL
{
  return self->_url;
}

- (void)setURL:(id)a3
{
}

@end