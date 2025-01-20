@interface OITSUUIImage
+ (id)imageNamed:(id)a3;
+ (void)i_performBlockWithUIImageLock:(id)a3;
- (CGImage)CGImage;
- (CGImage)CGImageForSize:(CGSize)a3;
- (CGSize)size;
- (OITSUUIImage)initWithContentsOfFile:(id)a3;
- (OITSUUIImage)initWithUIImage:(id)a3;
- (double)scale;
- (id)UIImage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)p_initWithUIImage:(id)a3 needsGuard:(BOOL)a4;
- (int64_t)imageOrientation;
- (void)dealloc;
@end

@implementation OITSUUIImage

+ (void)i_performBlockWithUIImageLock:(id)a3
{
  if (i_performBlockWithUIImageLock__sOnce != -1) {
    dispatch_once(&i_performBlockWithUIImageLock__sOnce, &__block_literal_global_12);
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)i_performBlockWithUIImageLock__sLock, 0xFFFFFFFFFFFFFFFFLL);
  (*((void (**)(id))a3 + 2))(a3);
  v4 = i_performBlockWithUIImageLock__sLock;
  dispatch_semaphore_signal(v4);
}

dispatch_semaphore_t __46__OITSUUIImage_i_performBlockWithUIImageLock___block_invoke()
{
  dispatch_semaphore_t result = dispatch_semaphore_create(1);
  i_performBlockWithUIImageLock__sLock = (uint64_t)result;
  return result;
}

+ (id)imageNamed:(id)a3
{
  id v5 = +[TSUQuicklookResource imagePathForQuicklookResource:](TSUQuicklookResource, "imagePathForQuicklookResource:");
  if (!v5 || (id v6 = (id)[objc_alloc((Class)a1) initWithContentsOfFile:v5]) == 0)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x3052000000;
    v13 = __Block_byref_object_copy__4;
    v14 = __Block_byref_object_dispose__4;
    uint64_t v15 = 0;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __27__OITSUUIImage_imageNamed___block_invoke;
    v9[3] = &unk_264D61028;
    v9[4] = a3;
    v9[5] = &v10;
    objc_msgSend(a1, "i_performBlockWithUIImageLock:", v9);
    if (v11[5])
    {
      id v7 = objc_alloc((Class)a1);
      id v6 = (id)objc_msgSend(v7, "p_initWithUIImage:needsGuard:", v11[5], 1);
    }
    else
    {
      id v6 = 0;
    }
    _Block_object_dispose(&v10, 8);
  }
  return v6;
}

void __27__OITSUUIImage_imageNamed___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x23EC9A170]();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (id)[MEMORY[0x263F1C6B0] imageNamed:*(void *)(a1 + 32)];
}

- (id)p_initWithUIImage:(id)a3 needsGuard:(BOOL)a4
{
  BOOL v4 = a4;
  v11.receiver = self;
  v11.super_class = (Class)OITSUUIImage;
  id v6 = [(OITSUImage *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    if (a3)
    {
      v6->mUIImage = (UIImage *)a3;
      if (v4)
      {
        v8 = [[OITSUUIImageAutoreleasePoolGuard alloc] initWithUIImage:v7->mUIImage];
        v7->mGuard = v8;
        if (v8) {
          v9 = v8;
        }
      }
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (OITSUUIImage)initWithUIImage:(id)a3
{
  return (OITSUUIImage *)[(OITSUUIImage *)self p_initWithUIImage:a3 needsGuard:0];
}

- (OITSUUIImage)initWithContentsOfFile:(id)a3
{
  id v4 = (id)[objc_alloc(MEMORY[0x263F1C6B0]) initWithContentsOfFile:a3];
  return [(OITSUUIImage *)self initWithUIImage:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  mUIImage = self->mUIImage;
  return (id)[v4 initWithUIImage:mUIImage];
}

- (void)dealloc
{
  mGuard = self->mGuard;
  if (mGuard) {
    id v4 = mGuard;
  }
  else {

  }
  v5.receiver = self;
  v5.super_class = (Class)OITSUUIImage;
  [(OITSUImage *)&v5 dealloc];
}

- (id)UIImage
{
  mGuard = self->mGuard;
  if (mGuard) {
    id v4 = mGuard;
  }
  return self->mUIImage;
}

- (CGSize)size
{
  mGuard = self->mGuard;
  if (mGuard) {
    id v4 = mGuard;
  }
  mUIImage = self->mUIImage;
  [mUIImage size];
  result.height = v7;
  result.width = v6;
  return result;
}

- (double)scale
{
  mGuard = self->mGuard;
  if (mGuard) {
    id v4 = mGuard;
  }
  mUIImage = self->mUIImage;
  [mUIImage scale];
  return result;
}

- (CGImage)CGImage
{
  mGuard = self->mGuard;
  if (mGuard) {
    id v4 = mGuard;
  }
  mUIImage = self->mUIImage;
  return [mUIImage CGImage];
}

- (CGImage)CGImageForSize:(CGSize)a3
{
  mGuard = self->mGuard;
  if (mGuard) {
    objc_super v5 = mGuard;
  }
  mUIImage = self->mUIImage;
  return [mUIImage CGImage];
}

- (int64_t)imageOrientation
{
  mGuard = self->mGuard;
  if (mGuard) {
    id v4 = mGuard;
  }
  mUIImage = self->mUIImage;
  return [mUIImage imageOrientation];
}

@end