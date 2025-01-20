@interface VKVectorOverlayData
- (VKVectorOverlayData)init;
- (VKVectorOverlayDelegate)_delegate;
- (int64_t)blendMode;
- (void)_setDelegate:(id)a3;
- (void)setBlendMode:(int64_t)a3;
@end

@implementation VKVectorOverlayData

- (void).cxx_destruct
{
}

- (void)_setDelegate:(id)a3
{
}

- (VKVectorOverlayDelegate)_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VKVectorOverlayDelegate *)WeakRetained;
}

- (void)setBlendMode:(int64_t)a3
{
  self->_blendMode = a3;
}

- (int64_t)blendMode
{
  return self->_blendMode;
}

- (VKVectorOverlayData)init
{
  v6.receiver = self;
  v6.super_class = (Class)VKVectorOverlayData;
  v2 = [(VKVectorOverlayData *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_blendMode = 0;
    v4 = v2;
  }

  return v3;
}

@end