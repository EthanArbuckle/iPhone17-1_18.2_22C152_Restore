@interface VFXSimplePathResolver
+ (id)resolverWithFolderURL:(id)a3;
- (VFXSimplePathResolver)initWithURL:(id)a3;
- (id)absoluteURLForAssetPath:(id)a3;
- (void)dealloc;
@end

@implementation VFXSimplePathResolver

- (VFXSimplePathResolver)initWithURL:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VFXSimplePathResolver;
  v4 = [(VFXSimplePathResolver *)&v6 init];
  if (v4) {
    v4->_url = (NSURL *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXSimplePathResolver;
  [(VFXSimplePathResolver *)&v3 dealloc];
}

+ (id)resolverWithFolderURL:(id)a3
{
  v4 = [VFXSimplePathResolver alloc];
  v7 = objc_msgSend_initWithURL_(v4, v5, (uint64_t)a3, v6);

  return v7;
}

- (id)absoluteURLForAssetPath:(id)a3
{
  return (id)objc_msgSend_URLByAppendingPathComponent_(self->_url, a2, (uint64_t)a3, v3);
}

@end