@interface PLPublishAlbum
- (NSString)title;
- (int64_t)compare:(id)a3;
- (void)dealloc;
- (void)setTitle:(id)a3;
@end

@implementation PLPublishAlbum

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)compare:(id)a3
{
  return [(NSString *)self->_title localizedCaseInsensitiveCompare:*((void *)a3 + 1)];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PLPublishAlbum;
  [(PLPublishAlbum *)&v3 dealloc];
}

@end