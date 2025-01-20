@interface VKImageDataRequirements
+ (VKImageDataRequirements)stickerRequirements;
+ (VKImageDataRequirements)stickerThumbnailRequirements;
- (NSString)uti;
- (unint64_t)maxDataLength;
- (unint64_t)maxLength;
- (unint64_t)minLength;
- (void)setMaxDataLength:(unint64_t)a3;
- (void)setMaxLength:(unint64_t)a3;
- (void)setMinLength:(unint64_t)a3;
- (void)setUti:(id)a3;
@end

@implementation VKImageDataRequirements

+ (VKImageDataRequirements)stickerRequirements
{
  v2 = objc_alloc_init(VKImageDataRequirements);
  v3 = [(id)*MEMORY[0x1E4F443E0] identifier];
  [(VKImageDataRequirements *)v2 setUti:v3];

  [(VKImageDataRequirements *)v2 setMaxLength:900];
  [(VKImageDataRequirements *)v2 setMinLength:300];
  [(VKImageDataRequirements *)v2 setMaxDataLength:500000];
  return v2;
}

+ (VKImageDataRequirements)stickerThumbnailRequirements
{
  v2 = objc_alloc_init(VKImageDataRequirements);
  v3 = [(id)*MEMORY[0x1E4F44460] identifier];
  [(VKImageDataRequirements *)v2 setUti:v3];

  [(VKImageDataRequirements *)v2 setMaxLength:100];
  [(VKImageDataRequirements *)v2 setMinLength:50];
  [(VKImageDataRequirements *)v2 setMaxDataLength:500000];
  return v2;
}

- (NSString)uti
{
  return self->_uti;
}

- (void)setUti:(id)a3
{
}

- (unint64_t)maxLength
{
  return self->_maxLength;
}

- (void)setMaxLength:(unint64_t)a3
{
  self->_maxLength = a3;
}

- (unint64_t)minLength
{
  return self->_minLength;
}

- (void)setMinLength:(unint64_t)a3
{
  self->_minLength = a3;
}

- (unint64_t)maxDataLength
{
  return self->_maxDataLength;
}

- (void)setMaxDataLength:(unint64_t)a3
{
  self->_maxDataLength = a3;
}

- (void).cxx_destruct
{
}

@end