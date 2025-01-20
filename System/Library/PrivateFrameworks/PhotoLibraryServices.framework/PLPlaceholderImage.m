@interface PLPlaceholderImage
+ (id)sharedManager;
- (CGImage)newPlaceholderImageWithSize:(CGSize)a3;
- (PLPlaceholderImage)init;
@end

@implementation PLPlaceholderImage

- (void).cxx_destruct
{
}

- (CGImage)newPlaceholderImageWithSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v6 = DCIM_resolvedPlaceholderImageColor();
  v7 = NSString;
  v14.CGFloat width = width;
  v14.CGFloat height = height;
  v8 = NSStringFromSize(v14);
  v9 = [v7 stringWithFormat:@"%@~%lu", v8, objc_msgSend(v6, "hash")];

  v10 = [(NSCache *)self->_dumbCache objectForKey:v9];
  if (!v10)
  {
    uint64_t v11 = DCIM_imageWithColor();
    if (!v11)
    {
      v12 = 0;
      goto LABEL_5;
    }
    v10 = (void *)v11;
    [(NSCache *)self->_dumbCache setObject:v11 forKey:v9];
  }
  v12 = (CGImage *)DCIM_CGImageRefFromPLImage();
  CGImageRetain(v12);

LABEL_5:
  return v12;
}

- (PLPlaceholderImage)init
{
  v6.receiver = self;
  v6.super_class = (Class)PLPlaceholderImage;
  v2 = [(PLPlaceholderImage *)&v6 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    dumbCache = v2->_dumbCache;
    v2->_dumbCache = v3;
  }
  return v2;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_84274 != -1) {
    dispatch_once(&sharedManager_onceToken_84274, &__block_literal_global_84275);
  }
  v2 = (void *)sharedManager_placeholderMaker;
  return v2;
}

void __35__PLPlaceholderImage_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(PLPlaceholderImage);
  v1 = (void *)sharedManager_placeholderMaker;
  sharedManager_placeholderMaker = (uint64_t)v0;
}

@end