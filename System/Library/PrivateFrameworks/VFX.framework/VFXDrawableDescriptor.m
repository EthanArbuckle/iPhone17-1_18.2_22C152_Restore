@interface VFXDrawableDescriptor
+ (NSString)drawableAttachment;
- (MTLTextureDescriptor)metalDescriptor;
- (int64_t)height;
- (int64_t)width;
- (unint64_t)pixelFormat;
- (void)setHeight:(int64_t)a3;
- (void)setPixelFormat:(unint64_t)a3;
- (void)setWidth:(int64_t)a3;
@end

@implementation VFXDrawableDescriptor

+ (NSString)drawableAttachment
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9DDB2F8, memory_order_acquire) & 1) == 0)
  {
    v3 = (CFX::RG::ResourceIdentifier *)__cxa_guard_acquire(&qword_1E9DDB2F8);
    if (v3)
    {
      uint64_t v4 = RGResourceIdentifierFinalColor(v3);
      qword_1E9DDB2F0 = (uint64_t)RGResourceIdentifierGetPath(v4);
      __cxa_guard_release(&qword_1E9DDB2F8);
    }
  }
  return (NSString *)qword_1E9DDB2F0;
}

- (MTLTextureDescriptor)metalDescriptor
{
  return (MTLTextureDescriptor *)objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x1E4F35330], a2, self->pixelFormat, self->width, self->height, 0);
}

- (int64_t)width
{
  return self->width;
}

- (void)setWidth:(int64_t)a3
{
  self->width = a3;
}

- (int64_t)height
{
  return self->height;
}

- (void)setHeight:(int64_t)a3
{
  self->height = a3;
}

- (unint64_t)pixelFormat
{
  return self->pixelFormat;
}

- (void)setPixelFormat:(unint64_t)a3
{
  self->pixelFormat = a3;
}

@end