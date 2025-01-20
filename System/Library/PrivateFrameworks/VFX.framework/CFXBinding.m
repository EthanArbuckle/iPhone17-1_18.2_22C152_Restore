@interface CFXBinding
- (NSDictionary)options;
- (NSString)keyPathDst;
- (NSString)keyPathSrc;
- (id)sourceObject;
- (void)dealloc;
- (void)setKeyPathDst:(id)a3;
- (void)setKeyPathSrc:(id)a3;
- (void)setOptions:(id)a3;
- (void)setSourceObject:(id)a3;
@end

@implementation CFXBinding

- (void)dealloc
{
  objc_msgSend_setSourceObject_(self, a2, 0, v2);
  objc_msgSend_setKeyPathSrc_(self, v4, 0, v5);
  objc_msgSend_setKeyPathDst_(self, v6, 0, v7);
  objc_msgSend_setOptions_(self, v8, 0, v9);
  v10.receiver = self;
  v10.super_class = (Class)CFXBinding;
  [(CFXBinding *)&v10 dealloc];
}

- (id)sourceObject
{
  return self->sourceObject;
}

- (void)setSourceObject:(id)a3
{
}

- (NSString)keyPathSrc
{
  return self->keyPathSrc;
}

- (void)setKeyPathSrc:(id)a3
{
}

- (NSString)keyPathDst
{
  return self->keyPathDst;
}

- (void)setKeyPathDst:(id)a3
{
}

- (NSDictionary)options
{
  return self->options;
}

- (void)setOptions:(id)a3
{
}

@end