@interface CRLPKImageRendererContainer
- (BOOL)isCandidateForSize:(CGSize)a3 sixChannelBlending:(BOOL)a4;
- (BOOL)sixChannelBlending;
- (BOOL)tryLockingRenderer;
- (CGSize)size;
- (CRLPKImageRendererContainer)initWithSize:(CGSize)a3 sixChannelBlending:(BOOL)a4;
- (PKImageRenderer)imageRenderer;
- (void)lockRenderer;
- (void)unlockRenderer;
@end

@implementation CRLPKImageRendererContainer

- (CRLPKImageRendererContainer)initWithSize:(CGSize)a3 sixChannelBlending:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)CRLPKImageRendererContainer;
  v7 = [(CRLPKImageRendererContainer *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_size.double width = width;
    v7->_size.double height = height;
    v7->_sixChannelBlending = v4;
    v9 = [objc_alloc((Class)PKImageRenderer) initWithSize:0 scale:v4 renderQueue:width height:1.0 sixChannelBlending:1];
    imageRenderer = v8->_imageRenderer;
    v8->_imageRenderer = v9;

    [(PKImageRenderer *)v8->_imageRenderer setInvertColors:0];
    v8->_rendererLock._os_unfair_lock_opaque = 0;
    __dmb(0xBu);
  }
  return v8;
}

- (PKImageRenderer)imageRenderer
{
  os_unfair_lock_assert_owner(&self->_rendererLock);
  imageRenderer = self->_imageRenderer;

  return imageRenderer;
}

- (BOOL)tryLockingRenderer
{
  return os_unfair_lock_trylock(&self->_rendererLock);
}

- (void)lockRenderer
{
}

- (void)unlockRenderer
{
}

- (BOOL)isCandidateForSize:(CGSize)a3 sixChannelBlending:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  [(CRLPKImageRendererContainer *)self size];
  double v9 = v8;
  double v11 = v10;
  int v12 = sub_100065BC8(v8, v10);
  BOOL result = 0;
  if (v12)
  {
    if (v9 >= width && v11 >= height) {
      return [(CRLPKImageRendererContainer *)self sixChannelBlending] ^ a4 ^ 1;
    }
  }
  return result;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)sixChannelBlending
{
  return self->_sixChannelBlending;
}

- (void).cxx_destruct
{
}

@end