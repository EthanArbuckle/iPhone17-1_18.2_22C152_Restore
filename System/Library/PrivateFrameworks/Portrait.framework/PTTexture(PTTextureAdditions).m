@interface PTTexture(PTTextureAdditions)
- (void)isRGB;
@end

@implementation PTTexture(PTTextureAdditions)

- (void)isRGB
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "PTTexture does not support this directly: Should be overridden in PTTextureRGBA or PTTextureYUV", v1, 2u);
}

@end