@interface NSEmojiImageTextAttachment
+ (BOOL)_isEmojiImageTextAttachmentData:(id)a3 UTI:(id)a4;
+ (BOOL)_readsEmojiImageTextAttachmentFromDocumentFormats;
+ (id)_UTIForEmojiImage;
+ (id)emojiImageTextAttachmentForContentIdentifier:(id)a3;
+ (void)flushInstanceCache;
+ (void)initialize;
+ (void)setEmojiImageTextAttachment:(id)a3 forContentIdentifier:(id)a4;
- (BOOL)_isEmojiImage;
- (BOOL)isEqual:(id)a3;
- (CGImage)imageForPointSize:(double)a3 scaleFactor:(double)a4 imageOffset:(CGPoint *)a5 imageSize:(CGSize *)a6;
- (CGImage)imageForProposedSize:(CGSize)a3 scaleFactor:(double)a4 imageOffset:(CGPoint *)a5 imageSize:(CGSize *)a6;
- (NSAdaptiveImageGlyph)adaptiveImageGlyph;
- (NSEmojiImageTextAttachment)initWithAdaptiveImageGlyph:(id)a3;
- (NSEmojiImageTextAttachment)initWithData:(id)a3;
- (NSEmojiImageTextAttachment)initWithFileWrapper:(id)a3;
- (NSString)contentIdentifier;
- (NSString)shortDescription;
- (id)_fallbackFileWrapper;
- (id)strikes;
- (unint64_t)hash;
@end

@implementation NSEmojiImageTextAttachment

+ (BOOL)_readsEmojiImageTextAttachmentFromDocumentFormats
{
  if (_readsEmojiImageTextAttachmentFromDocumentFormats_onceToken != -1) {
    dispatch_once(&_readsEmojiImageTextAttachmentFromDocumentFormats_onceToken, &__block_literal_global_37);
  }
  return _readsEmojiImageTextAttachmentFromDocumentFormats__readsEmojiImageTextAttachmentFromDocumentFormats;
}

void __79__NSEmojiImageTextAttachment__readsEmojiImageTextAttachmentFromDocumentFormats__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v2 = [v0 valueForKey:@"_NSReadsEmojiImageTextAttachmentFromDocumentFormats"];

  if (v2) {
    char v1 = [v2 BOOLValue];
  }
  else {
    char v1 = +[NSAdaptiveImageGlyph prefersEmojiImageTextAttachment];
  }
  _readsEmojiImageTextAttachmentFromDocumentFormats__readsEmojiImageTextAttachmentFromDocumentFormats = v1;
}

+ (id)_UTIForEmojiImage
{
  if (_UTIForEmojiImage_onceToken != -1) {
    dispatch_once(&_UTIForEmojiImage_onceToken, &__block_literal_global_15);
  }
  id v2 = (void *)_UTIForEmojiImage_utType;

  return v2;
}

uint64_t __47__NSEmojiImageTextAttachment__UTIForEmojiImage__block_invoke()
{
  _UTIForEmojiImage_utType = [MEMORY[0x1E4F442D8] exportedTypeWithIdentifier:@"com.apple.emojiimage" conformingToType:*MEMORY[0x1E4F443E0]];

  return MEMORY[0x1F41817F8]();
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && [a1 _readsEmojiImageTextAttachmentFromDocumentFormats])
  {
    id v4 = [a1 _UTIForEmojiImage];
    v3 = [v4 identifier];
    +[NSTextAttachment registerTextAttachmentClass:a1 forFileType:v3];
  }
}

+ (BOOL)_isEmojiImageTextAttachmentData:(id)a3 UTI:(id)a4
{
  CFDataRef v6 = (const __CFData *)a3;
  id v7 = a4;
  if ([a1 _readsEmojiImageTextAttachmentFromDocumentFormats]
    && (+[NSAdaptiveImageGlyph contentType],
        v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v7 isEqual:v8],
        v8,
        v9))
  {
    uint64_t v14 = 0;
    id v15 = 0;
    v10 = NSEmojiImageSourceCreateWithData(v6, &v15, &v14);
    id v11 = v15;
    BOOL v12 = v10 != 0;
    if (v10) {
      CFRelease(v10);
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

+ (id)emojiImageTextAttachmentForContentIdentifier:(id)a3
{
  return (id)[(id)_emojiTextAttachmentCache objectForKey:a3];
}

+ (void)setEmojiImageTextAttachment:(id)a3 forContentIdentifier:(id)a4
{
  uint64_t v5 = setEmojiImageTextAttachment_forContentIdentifier__onceToken;
  id v6 = a4;
  id v7 = a3;
  if (v5 != -1) {
    dispatch_once(&setEmojiImageTextAttachment_forContentIdentifier__onceToken, &__block_literal_global_20);
  }
  v8 = (void *)_emojiTextAttachmentCache;
  id v9 = [v7 contents];
  objc_msgSend(v8, "setObject:forKey:cost:", v7, v6, objc_msgSend(v9, "length"));
}

uint64_t __79__NSEmojiImageTextAttachment_setEmojiImageTextAttachment_forContentIdentifier___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  char v1 = (void *)_emojiTextAttachmentCache;
  _emojiTextAttachmentCache = (uint64_t)v0;

  id v2 = (void *)_emojiTextAttachmentCache;

  return [v2 setTotalCostLimit:0x400000];
}

+ (void)flushInstanceCache
{
}

- (NSEmojiImageTextAttachment)initWithAdaptiveImageGlyph:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = objc_opt_class();
    id v7 = [v5 contentIdentifier];
    v8 = [v6 emojiImageTextAttachmentForContentIdentifier:v7];

    if (v8)
    {
      id v9 = v8;
    }
    else
    {
      id v11 = [v5 imageContent];
      BOOL v12 = +[NSAdaptiveImageGlyph contentType];
      v13 = [v12 identifier];
      v18.receiver = self;
      v18.super_class = (Class)NSEmojiImageTextAttachment;
      uint64_t v14 = [(NSTextAttachment *)&v18 initWithData:v11 ofType:v13];

      if (v14)
      {
        objc_storeStrong((id *)&v14->_glyph, a3);
        id v15 = objc_opt_class();
        v16 = [(NSAdaptiveImageGlyph *)v14->_glyph contentIdentifier];
        [v15 setEmojiImageTextAttachment:v14 forContentIdentifier:v16];
      }
      id v9 = v14;
      self = v9;
    }
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSEmojiImageTextAttachment)initWithData:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"NSEmojiImageTextAttachment.m", 258, @"%@: initializer called with invalid data %@", objc_opt_class(), 0 object file lineNumber description];
  }
  id v6 = [[NSAdaptiveImageGlyph alloc] initWithImageContent:v5];
  id v7 = [(NSEmojiImageTextAttachment *)self initWithAdaptiveImageGlyph:v6];

  return v7;
}

- (NSEmojiImageTextAttachment)initWithFileWrapper:(id)a3
{
  id v4 = a3;
  id v5 = [v4 preferredFilename];
  id v6 = [v5 pathExtension];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:v6];
    v8 = +[NSAdaptiveImageGlyph contentType];
    int v9 = [v7 isEqual:v8];

    if (!v9)
    {
      BOOL v12 = 0;
LABEL_11:

      goto LABEL_12;
    }
    v10 = [v4 regularFileContents];
    if (v10)
    {
      id v11 = [(NSEmojiImageTextAttachment *)self initWithData:v10];
      if (v11)
      {
        self = v11;
        BOOL v12 = self;
LABEL_10:

        goto LABEL_11;
      }
      self = 0;
    }
    BOOL v12 = 0;
    goto LABEL_10;
  }
  BOOL v12 = 0;
LABEL_12:

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NSEmojiImageTextAttachment *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(NSAdaptiveImageGlyph *)self->_glyph contentIdentifier];
      id v6 = [(NSEmojiImageTextAttachment *)v4 contentIdentifier];
      char v7 = [v5 isEqualToString:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  id v2 = [(NSAdaptiveImageGlyph *)self->_glyph contentIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)contentIdentifier
{
  return [(NSAdaptiveImageGlyph *)self->_glyph contentIdentifier];
}

- (NSString)shortDescription
{
  return [(NSAdaptiveImageGlyph *)self->_glyph contentDescription];
}

- (NSAdaptiveImageGlyph)adaptiveImageGlyph
{
  return self->_glyph;
}

- (id)strikes
{
  return [(NSAdaptiveImageGlyph *)self->_glyph strikes];
}

- (CGImage)imageForProposedSize:(CGSize)a3 scaleFactor:(double)a4 imageOffset:(CGPoint *)a5 imageSize:(CGSize *)a6
{
  return -[NSAdaptiveImageGlyph imageForProposedSize:scaleFactor:imageOffset:imageSize:](self->_glyph, "imageForProposedSize:scaleFactor:imageOffset:imageSize:", a5, a6, a3.width, a3.height, a4);
}

- (CGImage)imageForPointSize:(double)a3 scaleFactor:(double)a4 imageOffset:(CGPoint *)a5 imageSize:(CGSize *)a6
{
  return -[NSEmojiImageTextAttachment imageForProposedSize:scaleFactor:imageOffset:imageSize:](self, "imageForProposedSize:scaleFactor:imageOffset:imageSize:", a5, a6, a3, a3, a4);
}

- (BOOL)_isEmojiImage
{
  return 1;
}

- (id)_fallbackFileWrapper
{
  return [(NSAdaptiveImageGlyph *)self->_glyph _fallbackFileWrapper];
}

- (void).cxx_destruct
{
}

@end