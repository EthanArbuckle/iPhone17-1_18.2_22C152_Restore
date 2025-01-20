@interface SKUIIndexBarEntryDescriptor
+ (id)entryDescriptorWithArtwork:(id)a3;
+ (id)entryDescriptorWithAttributedString:(id)a3;
+ (id)entryDescriptorWithImage:(id)a3;
+ (id)placeholderEntryDescriptorWithSize:(CGSize)a3;
- (BOOL)isEqual:(id)a3;
- (CGSize)size;
- (NSAttributedString)attributedString;
- (SKUIArtwork)artwork;
- (UIEdgeInsets)contentEdgeInsets;
- (UIImage)image;
- (int64_t)entryDescriptorType;
- (int64_t)visibilityPriority;
- (unint64_t)hash;
- (void)hash;
- (void)setArtwork:(id)a3;
- (void)setAttributedString:(id)a3;
- (void)setContentEdgeInsets:(UIEdgeInsets)a3;
- (void)setEntryDescriptorType:(int64_t)a3;
- (void)setImage:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setVisibilityPriority:(int64_t)a3;
@end

@implementation SKUIIndexBarEntryDescriptor

- (unint64_t)hash
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIIndexBarEntryDescriptor *)v3 hash];
      }
    }
  }
  int64_t entryDescriptorType = self->_entryDescriptorType;
  unint64_t v12 = [(SKUIArtwork *)self->_artwork hash] ^ entryDescriptorType;
  uint64_t v13 = [(NSAttributedString *)self->_attributedString hash];
  return v12 ^ v13 ^ [(UIImage *)self->_image hash] ^ (unint64_t)(self->_size.width * 1000.0) ^ (unint64_t)(self->_size.height * 10000.0);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SKUIIndexBarEntryDescriptor *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIIndexBarEntryDescriptor isEqual:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (v4 == self) {
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || v4->_entryDescriptorType != self->_entryDescriptorType
    || (v4->_size.width == self->_size.width ? (BOOL v13 = v4->_size.height == self->_size.height) : (BOOL v13 = 0),
        !v13
     || (image = v4->_image, image != self->_image) && !-[UIImage isEqual:](image, "isEqual:")
     || (attributedString = v4->_attributedString, attributedString != self->_attributedString)
     && !-[NSAttributedString isEqualToAttributedString:](attributedString, "isEqualToAttributedString:")))
  {
    char v17 = 0;
    goto LABEL_21;
  }
  artwork = v4->_artwork;
  if (artwork == self->_artwork)
  {
LABEL_20:
    char v17 = 1;
    goto LABEL_21;
  }
  char v17 = -[SKUIArtwork isEqual:](artwork, "isEqual:");
LABEL_21:

  return v17;
}

+ (id)entryDescriptorWithArtwork:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUIIndexBarEntryDescriptor entryDescriptorWithArtwork:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  uint64_t v12 = objc_alloc_init(SKUIIndexBarEntryDescriptor);
  [(SKUIIndexBarEntryDescriptor *)v12 setEntryDescriptorType:2];
  [(SKUIIndexBarEntryDescriptor *)v12 setArtwork:v3];

  return v12;
}

+ (id)entryDescriptorWithAttributedString:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUIIndexBarEntryDescriptor entryDescriptorWithAttributedString:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  uint64_t v12 = objc_alloc_init(SKUIIndexBarEntryDescriptor);
  [(SKUIIndexBarEntryDescriptor *)v12 setEntryDescriptorType:1];
  [(SKUIIndexBarEntryDescriptor *)v12 setAttributedString:v3];

  return v12;
}

+ (id)entryDescriptorWithImage:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUIIndexBarEntryDescriptor entryDescriptorWithImage:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  uint64_t v12 = objc_alloc_init(SKUIIndexBarEntryDescriptor);
  [(SKUIIndexBarEntryDescriptor *)v12 setEntryDescriptorType:3];
  [(SKUIIndexBarEntryDescriptor *)v12 setImage:v3];

  return v12;
}

+ (id)placeholderEntryDescriptorWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        +[SKUIIndexBarEntryDescriptor placeholderEntryDescriptorWithSize:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  BOOL v13 = objc_alloc_init(SKUIIndexBarEntryDescriptor);
  [(SKUIIndexBarEntryDescriptor *)v13 setEntryDescriptorType:0];
  -[SKUIIndexBarEntryDescriptor setSize:](v13, "setSize:", width, height);

  return v13;
}

- (void)setArtwork:(id)a3
{
  BOOL v5 = (SKUIArtwork *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIIndexBarEntryDescriptor setArtwork:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  artwork = self->_artwork;
  if (artwork != v5 && ![(SKUIArtwork *)artwork isEqual:v5])
  {
    objc_storeStrong((id *)&self->_artwork, a3);
    [(SKUIArtwork *)self->_artwork size];
    self->_size.double width = v15;
    self->_size.double height = v16;
  }
}

- (void)setAttributedString:(id)a3
{
  BOOL v4 = (NSAttributedString *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIIndexBarEntryDescriptor setAttributedString:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  attributedString = self->_attributedString;
  if (attributedString != v4
    && ![(NSAttributedString *)attributedString isEqualToAttributedString:v4])
  {
    v14 = (NSAttributedString *)[(NSAttributedString *)v4 copy];
    CGFloat v15 = self->_attributedString;
    self->_attributedString = v14;

    [(NSAttributedString *)self->_attributedString size];
    self->_size.double width = v16;
    self->_size.double height = v17;
  }
}

- (void)setImage:(id)a3
{
  BOOL v5 = (UIImage *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIIndexBarEntryDescriptor setImage:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  image = self->_image;
  if (image != v5 && ([(UIImage *)image isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_image, a3);
    [(UIImage *)self->_image size];
    self->_size.double width = v15;
    self->_size.double height = v16;
  }
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top = self->_contentEdgeInsets.top;
  double left = self->_contentEdgeInsets.left;
  double bottom = self->_contentEdgeInsets.bottom;
  double right = self->_contentEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  self->_contentEdgeInsets = a3;
}

- (int64_t)entryDescriptorType
{
  return self->_entryDescriptorType;
}

- (void)setEntryDescriptorType:(int64_t)a3
{
  self->_int64_t entryDescriptorType = a3;
}

- (SKUIArtwork)artwork
{
  return self->_artwork;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (UIImage)image
{
  return self->_image;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (int64_t)visibilityPriority
{
  return self->_visibilityPriority;
}

- (void)setVisibilityPriority:(int64_t)a3
{
  self->_visibilityPriority = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);

  objc_storeStrong((id *)&self->_artwork, 0);
}

- (void)hash
{
}

- (void)isEqual:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)entryDescriptorWithArtwork:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)entryDescriptorWithAttributedString:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)entryDescriptorWithImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)placeholderEntryDescriptorWithSize:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setArtwork:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setAttributedString:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end