@interface SUUIIndexBarEntryDescriptor
+ (id)entryDescriptorWithArtwork:(id)a3;
+ (id)entryDescriptorWithAttributedString:(id)a3;
+ (id)entryDescriptorWithImage:(id)a3;
+ (id)placeholderEntryDescriptorWithSize:(CGSize)a3;
- (BOOL)isEqual:(id)a3;
- (CGSize)size;
- (NSAttributedString)attributedString;
- (SUUIArtwork)artwork;
- (UIEdgeInsets)contentEdgeInsets;
- (UIImage)image;
- (int64_t)entryDescriptorType;
- (int64_t)visibilityPriority;
- (unint64_t)hash;
- (void)setArtwork:(id)a3;
- (void)setAttributedString:(id)a3;
- (void)setContentEdgeInsets:(UIEdgeInsets)a3;
- (void)setEntryDescriptorType:(int64_t)a3;
- (void)setImage:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setVisibilityPriority:(int64_t)a3;
@end

@implementation SUUIIndexBarEntryDescriptor

- (unint64_t)hash
{
  int64_t entryDescriptorType = self->_entryDescriptorType;
  unint64_t v4 = [(SUUIArtwork *)self->_artwork hash] ^ entryDescriptorType;
  uint64_t v5 = [(NSAttributedString *)self->_attributedString hash];
  return v4 ^ v5 ^ [(UIImage *)self->_image hash] ^ (unint64_t)(self->_size.width * 1000.0) ^ (unint64_t)(self->_size.height * 10000.0);
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (SUUIIndexBarEntryDescriptor *)a3;
  if (v4 == self) {
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || v4->_entryDescriptorType != self->_entryDescriptorType
    || (v4->_size.width == self->_size.width ? (BOOL v5 = v4->_size.height == self->_size.height) : (BOOL v5 = 0),
        !v5
     || (image = v4->_image, image != self->_image) && !-[UIImage isEqual:](image, "isEqual:")
     || (attributedString = v4->_attributedString, attributedString != self->_attributedString)
     && !-[NSAttributedString isEqualToAttributedString:](attributedString, "isEqualToAttributedString:")))
  {
    char v9 = 0;
    goto LABEL_17;
  }
  artwork = v4->_artwork;
  if (artwork == self->_artwork)
  {
LABEL_16:
    char v9 = 1;
    goto LABEL_17;
  }
  char v9 = -[SUUIArtwork isEqual:](artwork, "isEqual:");
LABEL_17:

  return v9;
}

+ (id)entryDescriptorWithArtwork:(id)a3
{
  id v3 = a3;
  unint64_t v4 = objc_alloc_init(SUUIIndexBarEntryDescriptor);
  [(SUUIIndexBarEntryDescriptor *)v4 setEntryDescriptorType:2];
  [(SUUIIndexBarEntryDescriptor *)v4 setArtwork:v3];

  return v4;
}

+ (id)entryDescriptorWithAttributedString:(id)a3
{
  id v3 = a3;
  unint64_t v4 = objc_alloc_init(SUUIIndexBarEntryDescriptor);
  [(SUUIIndexBarEntryDescriptor *)v4 setEntryDescriptorType:1];
  [(SUUIIndexBarEntryDescriptor *)v4 setAttributedString:v3];

  return v4;
}

+ (id)entryDescriptorWithImage:(id)a3
{
  id v3 = a3;
  unint64_t v4 = objc_alloc_init(SUUIIndexBarEntryDescriptor);
  [(SUUIIndexBarEntryDescriptor *)v4 setEntryDescriptorType:3];
  [(SUUIIndexBarEntryDescriptor *)v4 setImage:v3];

  return v4;
}

+ (id)placeholderEntryDescriptorWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  BOOL v5 = objc_alloc_init(SUUIIndexBarEntryDescriptor);
  [(SUUIIndexBarEntryDescriptor *)v5 setEntryDescriptorType:0];
  -[SUUIIndexBarEntryDescriptor setSize:](v5, "setSize:", width, height);
  return v5;
}

- (void)setArtwork:(id)a3
{
  id v5 = a3;
  uint64_t artwork = (uint64_t)self->_artwork;
  if ((id)artwork != v5)
  {
    id v9 = v5;
    uint64_t artwork = [(id)artwork isEqual:v5];
    id v5 = v9;
    if ((artwork & 1) == 0)
    {
      objc_storeStrong((id *)&self->_artwork, a3);
      uint64_t artwork = [(SUUIArtwork *)self->_artwork size];
      id v5 = v9;
      self->_size.double width = v7;
      self->_size.double height = v8;
    }
  }
  MEMORY[0x270F9A758](artwork, v5);
}

- (void)setAttributedString:(id)a3
{
  id v4 = a3;
  uint64_t attributedString = (uint64_t)self->_attributedString;
  if ((id)attributedString != v4)
  {
    v10 = v4;
    uint64_t attributedString = [(id)attributedString isEqualToAttributedString:v4];
    id v4 = v10;
    if ((attributedString & 1) == 0)
    {
      v6 = (NSAttributedString *)[v10 copy];
      CGFloat v7 = self->_attributedString;
      self->_uint64_t attributedString = v6;

      uint64_t attributedString = [(NSAttributedString *)self->_attributedString size];
      id v4 = v10;
      self->_size.double width = v8;
      self->_size.double height = v9;
    }
  }
  MEMORY[0x270F9A758](attributedString, v4);
}

- (void)setImage:(id)a3
{
  id v5 = a3;
  uint64_t image = (uint64_t)self->_image;
  if ((id)image != v5)
  {
    id v9 = v5;
    uint64_t image = [(id)image isEqual:v5];
    id v5 = v9;
    if ((image & 1) == 0)
    {
      objc_storeStrong((id *)&self->_image, a3);
      uint64_t image = [(UIImage *)self->_image size];
      id v5 = v9;
      self->_size.double width = v7;
      self->_size.double height = v8;
    }
  }
  MEMORY[0x270F9A758](image, v5);
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

- (SUUIArtwork)artwork
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

@end