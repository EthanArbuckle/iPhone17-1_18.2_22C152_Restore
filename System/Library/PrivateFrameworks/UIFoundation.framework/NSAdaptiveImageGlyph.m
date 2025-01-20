@interface NSAdaptiveImageGlyph
+ (BOOL)_readsAdaptiveImageGlyphFromDocumentFormats;
+ (BOOL)prefersEmojiImageTextAttachment;
+ (BOOL)prefersTextAttachment;
+ (BOOL)supportsSecureCoding;
+ (UTType)contentType;
+ (id)contentTypeIdentifier;
+ (id)contentTypeUTI;
+ (void)flushInstanceCache;
+ (void)setPrefersEmojiImageTextAttachment:(BOOL)a3;
+ (void)setPrefersTextAttachment:(BOOL)a3;
- (CGImage)imageForPointSize:(double)a3 scaleFactor:(double)a4 imageOffset:(CGPoint *)a5 imageSize:(CGSize *)a6;
- (CGImage)imageForProposedSize:(CGSize)a3 scaleFactor:(double)a4 imageOffset:(CGPoint *)a5 imageSize:(CGSize *)a6;
- (CGSize)_imageSizeForAttributes:(id)a3;
- (CTAdaptiveImageGlyph)_CTAdaptiveImageGlyph;
- (NSAdaptiveImageGlyph)initWithCTAdaptiveImageGlyph:(id)a3;
- (NSAdaptiveImageGlyph)initWithCoder:(id)a3;
- (NSAdaptiveImageGlyph)initWithContentIdentifier:(id)a3;
- (NSAdaptiveImageGlyph)initWithFileWrapper:(id)a3;
- (NSAdaptiveImageGlyph)initWithImageContent:(id)a3;
- (NSArray)strikes;
- (NSData)imageContent;
- (NSFileWrapper)_fallbackFileWrapper;
- (NSString)contentDescription;
- (NSString)contentIdentifier;
- (NSTextAttachment)nominalTextAttachment;
- (id)_configuredFileWrapperForAttributes:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSAdaptiveImageGlyph

+ (UTType)contentType
{
  return (UTType *)[MEMORY[0x1E4F24370] contentType];
}

+ (BOOL)prefersTextAttachment
{
  return [MEMORY[0x1E4F24370] prefersTextAttachment];
}

+ (void)setPrefersTextAttachment:(BOOL)a3
{
}

+ (BOOL)prefersEmojiImageTextAttachment
{
  return [MEMORY[0x1E4F24370] prefersEmojiImageTextAttachment];
}

+ (void)setPrefersEmojiImageTextAttachment:(BOOL)a3
{
}

+ (void)flushInstanceCache
{
}

+ (id)contentTypeIdentifier
{
  return (id)[MEMORY[0x1E4F24370] contentType];
}

+ (id)contentTypeUTI
{
  return (id)[MEMORY[0x1E4F24370] contentType];
}

- (NSAdaptiveImageGlyph)initWithImageContent:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NSAdaptiveImageGlyph;
  v5 = [(NSAdaptiveImageGlyph *)&v10 init];
  if (v5
    && (uint64_t v6 = [objc_alloc(MEMORY[0x1E4F24370]) initWithImageContent:v4],
        CTAdaptiveImageGlyph = v5->_CTAdaptiveImageGlyph,
        v5->_CTAdaptiveImageGlyph = (CTAdaptiveImageGlyph *)v6,
        CTAdaptiveImageGlyph,
        v5->_CTAdaptiveImageGlyph))
  {
    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSAdaptiveImageGlyph)initWithContentIdentifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NSAdaptiveImageGlyph;
  v5 = [(NSAdaptiveImageGlyph *)&v10 init];
  if (v5
    && (uint64_t v6 = [objc_alloc(MEMORY[0x1E4F24370]) initWithContentIdentifier:v4],
        CTAdaptiveImageGlyph = v5->_CTAdaptiveImageGlyph,
        v5->_CTAdaptiveImageGlyph = (CTAdaptiveImageGlyph *)v6,
        CTAdaptiveImageGlyph,
        v5->_CTAdaptiveImageGlyph))
  {
    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSAdaptiveImageGlyph)initWithCTAdaptiveImageGlyph:(id)a3
{
  id v4 = (CTAdaptiveImageGlyph *)a3;
  if (!v4) {
    -[NSAdaptiveImageGlyph initWithCTAdaptiveImageGlyph:]();
  }
  v5 = v4;
  v9.receiver = self;
  v9.super_class = (Class)NSAdaptiveImageGlyph;
  uint64_t v6 = [(NSAdaptiveImageGlyph *)&v9 init];
  CTAdaptiveImageGlyph = v6->_CTAdaptiveImageGlyph;
  v6->_CTAdaptiveImageGlyph = v5;

  return v6;
}

- (NSAdaptiveImageGlyph)initWithFileWrapper:(id)a3
{
  id v4 = a3;
  v5 = [v4 preferredFilename];
  uint64_t v6 = [v5 pathExtension];

  if (v6)
  {
    v7 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:v6];
    v8 = +[NSAdaptiveImageGlyph contentType];
    int v9 = [v7 isEqual:v8];

    if (!v9)
    {
      v12 = 0;
LABEL_11:

      goto LABEL_12;
    }
    objc_super v10 = [v4 regularFileContents];
    if (v10)
    {
      v11 = [(NSAdaptiveImageGlyph *)self initWithImageContent:v10];
      if (v11)
      {
        self = v11;
        v12 = self;
LABEL_10:

        goto LABEL_11;
      }
      self = 0;
    }
    v12 = 0;
    goto LABEL_10;
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (NSData)imageContent
{
  return (NSData *)[self->_CTAdaptiveImageGlyph imageContent];
}

- (NSString)contentIdentifier
{
  return (NSString *)[self->_CTAdaptiveImageGlyph contentIdentifier];
}

- (NSString)contentDescription
{
  return (NSString *)[self->_CTAdaptiveImageGlyph contentDescription];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [NSAdaptiveImageGlyph alloc];
  v5 = [self->_CTAdaptiveImageGlyph contentIdentifier];
  uint64_t v6 = [(NSAdaptiveImageGlyph *)v4 initWithContentIdentifier:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 allowsKeyedCoding]) {
    [self->_CTAdaptiveImageGlyph encodeWithCoder:v4];
  }
}

- (NSAdaptiveImageGlyph)initWithCoder:(id)a3
{
  id v4 = a3;
  if (![v4 allowsKeyedCoding]) {
    goto LABEL_6;
  }
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F24370]) initWithCoder:v4];
  if (!v5
    || (v10.receiver = self,
        v10.super_class = (Class)NSAdaptiveImageGlyph,
        uint64_t v6 = [(NSAdaptiveImageGlyph *)&v10 init],
        (self = v6) == 0))
  {

LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  CTAdaptiveImageGlyph = v6->_CTAdaptiveImageGlyph;
  v6->_CTAdaptiveImageGlyph = (CTAdaptiveImageGlyph *)v5;

  self = self;
  v8 = self;
LABEL_7:

  return v8;
}

- (NSArray)strikes
{
  return (NSArray *)[self->_CTAdaptiveImageGlyph strikes];
}

- (NSTextAttachment)nominalTextAttachment
{
  CTAdaptiveImageGlyph = self->_CTAdaptiveImageGlyph;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__NSAdaptiveImageGlyph_nominalTextAttachment__block_invoke;
  v5[3] = &unk_1E55C6C68;
  v5[4] = self;
  v3 = [CTAdaptiveImageGlyph _nominalTextAttachmentCreatingIfNeededUsingBlock:v5];

  return (NSTextAttachment *)v3;
}

NSTextAttachment *__45__NSAdaptiveImageGlyph_nominalTextAttachment__block_invoke(uint64_t a1)
{
  v2 = [NSTextAttachment alloc];
  v3 = [*(id *)(a1 + 32) imageContent];
  id v4 = +[NSAdaptiveImageGlyph contentType];
  v5 = [v4 identifier];
  uint64_t v6 = [(NSTextAttachment *)v2 initWithData:v3 ofType:v5];

  return v6;
}

- (CGImage)imageForProposedSize:(CGSize)a3 scaleFactor:(double)a4 imageOffset:(CGPoint *)a5 imageSize:(CGSize *)a6
{
  return (CGImage *)-[CTAdaptiveImageGlyph imageForProposedSize:scaleFactor:imageOffset:imageSize:](self->_CTAdaptiveImageGlyph, "imageForProposedSize:scaleFactor:imageOffset:imageSize:", a5, a6, a3.width, a3.height, a4);
}

- (CGImage)imageForPointSize:(double)a3 scaleFactor:(double)a4 imageOffset:(CGPoint *)a5 imageSize:(CGSize *)a6
{
  return -[NSAdaptiveImageGlyph imageForProposedSize:scaleFactor:imageOffset:imageSize:](self, "imageForProposedSize:scaleFactor:imageOffset:imageSize:", a5, a6, a3, a3, a4);
}

+ (BOOL)_readsAdaptiveImageGlyphFromDocumentFormats
{
  return [MEMORY[0x1E4F24370] _readsAdaptiveImageGlyphFromDocumentFormats];
}

- (id)_configuredFileWrapperForAttributes:(id)a3
{
  return (id)[self->_CTAdaptiveImageGlyph _configuredFileWrapperForAttributes:a3];
}

- (CGSize)_imageSizeForAttributes:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"NSFont"];
  if (!v4)
  {
    id v4 = NSDefaultFont();
  }
  [v4 ascender];
  double v6 = v5;
  [v4 descender];
  -[CTAdaptiveImageGlyph _imageSizeForProposedSize:scaleFactor:](self->_CTAdaptiveImageGlyph, "_imageSizeForProposedSize:scaleFactor:", v6 - v7, v6 - v7, 1.0);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (NSFileWrapper)_fallbackFileWrapper
{
  return (NSFileWrapper *)[self->_CTAdaptiveImageGlyph _fallbackFileWrapper];
}

- (CTAdaptiveImageGlyph)_CTAdaptiveImageGlyph
{
  return (CTAdaptiveImageGlyph *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

- (void)initWithCTAdaptiveImageGlyph:.cold.1()
{
  __assert_rtn("-[NSAdaptiveImageGlyph initWithCTAdaptiveImageGlyph:]", "NSAdaptiveImageGlyph.m", 112, "nil != adaptiveImageGlyph");
}

@end