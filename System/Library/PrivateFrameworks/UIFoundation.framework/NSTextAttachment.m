@interface NSTextAttachment
+ (BOOL)supportsSecureCoding;
+ (Class)textAttachmentClassForFileType:(id)a3;
+ (Class)textAttachmentViewProviderClassForFileType:(NSString *)fileType;
+ (id)imageCache;
+ (void)initialize;
+ (void)registerTextAttachmentClass:(Class)a3 forFileType:(id)a4;
+ (void)registerTextAttachmentViewProviderClass:(Class)textAttachmentViewProviderClass forFileType:(NSString *)fileType;
- (BOOL)_allocatesTextContainer;
- (BOOL)_hasTextAttachmentViewCell;
- (BOOL)_isEmojiImage;
- (BOOL)allowsEditingContents;
- (BOOL)allowsTextAttachmentView;
- (BOOL)ignoresOrientation;
- (BOOL)usesTextAttachmentView;
- (CGFloat)lineLayoutPadding;
- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7;
- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6;
- (CGRect)bounds;
- (Class)textAttachmentViewProviderClass;
- (NSData)contents;
- (NSFileWrapper)fileWrapper;
- (NSString)description;
- (NSString)fileType;
- (NSTextAttachment)init;
- (NSTextAttachment)initWithCoder:(id)a3;
- (NSTextAttachment)initWithData:(NSData *)contentData ofType:(NSString *)uti;
- (NSTextAttachment)initWithFileWrapper:(NSFileWrapper *)fileWrapper;
- (UIImage)image;
- (UIView)contentView;
- (id)_cacheKey;
- (id)_image;
- (id)_imageForUTType_iOS:(id)a3;
- (id)accessibilityLabel;
- (id)adaptiveImageGlyph;
- (id)attachmentCell;
- (id)imageForBounds:(CGRect)a3 attributes:(id)a4 location:(id)a5 textContainer:(id)a6;
- (id)viewProviderForParentView:(id)a3 characterIndex:(unint64_t)a4 layoutManager:(id)a5;
- (id)viewProviderForParentView:(id)a3 location:(id)a4 textContainer:(id)a5;
- (int64_t)_characterIndexForLocation:(id)a3 textContainer:(id)a4;
- (int64_t)embeddingType;
- (int64_t)standaloneAlignment;
- (void)_drawInAlignedRect:(CGRect)a3 attributes:(id)a4 location:(id)a5 textContainer:(id)a6 applicationFrameworkContext:(int64_t)a7;
- (void)_invalidateWrapperView;
- (void)_setAllocatesTextContainer:(BOOL)a3;
- (void)_setupAPIPreferences;
- (void)_showAttachmentCell_iOS:(id)a3 inRect:(CGRect)a4 characterIndex:(unint64_t)a5;
- (void)_showWithBounds:(CGRect)a3 attributes:(__CFDictionary *)a4 runRange:(id)a5 textLayoutFragment:(id)a6 inContext:(CGContext *)a7;
- (void)_showWithBounds:(CGRect)a3 attributes:(id)a4 location:(id)a5 textContainer:(id)a6 applicationFrameworkContext:(int64_t)a7 acceptsViewProvider:(BOOL)a8;
- (void)dealloc;
- (void)detachView:(id)a3 fromParentView:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)placeView:(id)a3 withFrame:(CGRect)a4 inParentView:(id)a5 characterIndex:(unint64_t)a6 layoutManager:(id)a7;
- (void)placeView:(id)a3 withFrame:(CGRect)a4 inParentView:(id)a5 location:(id)a6 textContainer:(id)a7 applicationFrameworkContext:(int64_t)a8;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAllowsEditingContents:(BOOL)a3;
- (void)setAllowsTextAttachmentView:(BOOL)allowsTextAttachmentView;
- (void)setAttachmentCell:(id)attachmentCell;
- (void)setBounds:(CGRect)bounds;
- (void)setContentView:(id)a3;
- (void)setContents:(NSData *)contents;
- (void)setEmbeddingType:(int64_t)a3;
- (void)setFileType:(NSString *)fileType;
- (void)setFileWrapper:(NSFileWrapper *)fileWrapper;
- (void)setIgnoresOrientation:(BOOL)a3;
- (void)setImage:(UIImage *)image;
- (void)setLineLayoutPadding:(CGFloat)lineLayoutPadding;
- (void)setStandaloneAlignment:(int64_t)a3;
@end

@implementation NSTextAttachment

- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  [(NSTextAttachment *)self bounds];
  double v60 = v15;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  [(NSTextAttachment *)self lineLayoutPadding];
  CGFloat v23 = v22;
  id v24 = [(NSTextAttachment *)self attachmentCell];
  v62.origin.double x = x;
  v62.origin.double y = y;
  v62.size.CGFloat width = width;
  v62.size.CGFloat height = height;
  if (CGRectGetWidth(v62) <= v23 + v23)
  {
    double v56 = height;
    CGFloat v26 = v60;
    double v25 = width;
  }
  else
  {
    v63.origin.double x = x;
    v63.origin.double y = y;
    v63.size.CGFloat width = width;
    v63.size.CGFloat height = height;
    CGRect v64 = CGRectInset(v63, v23, 0.0);
    double x = v64.origin.x;
    double y = v64.origin.y;
    double v25 = v64.size.width;
    double v56 = v64.size.height;
    CGFloat v26 = v60;
  }
  CGFloat v27 = *MEMORY[0x1E4F1DB28];
  CGRect v68 = *(CGRect *)*(void *)&MEMORY[0x1E4F1DB28];
  v65.origin.double x = v26;
  v65.origin.double y = v17;
  v65.size.CGFloat width = v19;
  v65.size.CGFloat height = v21;
  CGFloat v59 = v68.size.width;
  CGFloat v61 = v68.origin.y;
  CGFloat rect2 = v68.size.height;
  if (CGRectEqualToRect(v65, *MEMORY[0x1E4F1DB28])
    && [(NSTextAttachment *)self usesTextAttachmentView])
  {
    v28 = (void *)MEMORY[0x192FAE510]();
    v29 = objc_msgSend((id)objc_msgSend(a5, "textLayoutManager"), "_viewProviderForTextAttachment:parentView:location:textContainer:", self, objc_msgSend(a5, "textView"), a4, a5);
    if ([v29 tracksTextAttachmentViewBounds])
    {
      objc_msgSend(v29, "attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:", a3, a4, a5, x, y, v25, v56, a7.x, a7.y);
      CGFloat v26 = v30;
      double v17 = v31;
      double v19 = v32;
      double v21 = v33;
    }
  }
  if (v24)
  {
    int64_t v34 = [(NSTextAttachment *)self _characterIndexForLocation:a4 textContainer:a5];
    if (objc_opt_respondsToSelector())
    {
      objc_msgSend(v24, "cellFrameForTextContainer:proposedLineFragment:glyphPosition:characterIndex:", a5, v34, x, y, v25, v56, a7.x, a7.y);
LABEL_14:
      CGFloat v26 = v35;
      double v17 = v36;
      double v19 = v37;
      double v21 = v38;
      goto LABEL_17;
    }
    [v24 cellSize];
    double v19 = v39;
    double v21 = v40;
    CGFloat v26 = 0.0;
    double v17 = 0.0;
    if (objc_opt_respondsToSelector())
    {
      [v24 cellBaselineOffset];
      CGFloat v26 = v41;
      double v17 = v42;
    }
  }
  else if ((*(_WORD *)&self->_taFlags & 0x200) != 0)
  {
    -[NSTextAttachment attachmentBoundsForTextContainer:proposedLineFragment:glyphPosition:characterIndex:](self, "attachmentBoundsForTextContainer:proposedLineFragment:glyphPosition:characterIndex:", a5, [(NSTextAttachment *)self _characterIndexForLocation:a4 textContainer:a5], x, y, v25, v56, a7.x, a7.y);
    goto LABEL_14;
  }
LABEL_17:
  v66.origin.double x = v26;
  v66.origin.double y = v17;
  v66.size.CGFloat width = v19;
  v66.size.CGFloat height = v21;
  v69.origin.double x = v27;
  v69.size.CGFloat width = v59;
  v69.origin.double y = v61;
  v69.size.CGFloat height = rect2;
  if (CGRectEqualToRect(v66, v69))
  {
    id v43 = [(NSTextAttachment *)self _image];
    if (v43)
    {
      v44 = v43;
      [v43 size];
      if (v45 != *MEMORY[0x1E4F1DB30] || v46 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
      {
        double v21 = v46;
        double v19 = v45;
      }
      if (-[NSTextAttachment adjustsImageSizeForAccessibilityContentSizeCategory](self, "adjustsImageSizeForAccessibilityContentSizeCategory", *(void *)&v56)&& ([v44 _isSymbolImage] & 1) == 0)
      {
        softLink_UIAccessibilityContentSizeCategoryImageAdjustingScaleFactorForTraitCollection(0);
        double v48 = v47;
        if (v47 != 1.0 && [(UIImage *)[(NSTextAttachment *)self image] _CGPDFPage])
        {
          [(UIImage *)[(NSTextAttachment *)self image] _CGPDFPageSize];
          double v19 = v49;
          double v21 = v50;
        }
        double v19 = v48 * v19;
        double v21 = v48 * v21;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0
        && [v44 hasBaseline]
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
        [v44 baselineOffsetFromBottom];
        double v17 = v17 - v51;
      }
    }
  }
  double v52 = v26;
  double v53 = v17;
  double v54 = v19;
  double v55 = v21;
  result.size.CGFloat height = v55;
  result.size.CGFloat width = v54;
  result.origin.double y = v53;
  result.origin.double x = v52;
  return result;
}

- (id)attachmentCell
{
  id result = self->_wrapperView;
  if (result) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = __NSTextAttachmentAlwaysUsesAttachmentView == 0;
  }
  if (!v4)
  {
    id result = (id)objc_msgSend(objc_alloc(getUITextAttachmentViewClass()), "initWithTextAttachment:image:", self, -[NSTextAttachment _image](self, "_image"));
    self->_wrapperView = (NSTextAttachmentView *)result;
  }
  return result;
}

- (CGFloat)lineLayoutPadding
{
  return self->_layoutPadding;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)embeddingType
{
  return ((unint64_t)*(_WORD *)&self->_taFlags >> 1) & 0xF;
}

- (NSTextAttachment)init
{
  return [(NSTextAttachment *)self initWithData:0 ofType:0];
}

- (id)adaptiveImageGlyph
{
  objc_sync_enter(self);
  v3 = (NSAdaptiveImageGlyph *)[MEMORY[0x1E4F1CA98] null];
  adaptiveImageGlyph = self->_adaptiveImageGlyph;
  if (adaptiveImageGlyph) {
    goto LABEL_13;
  }
  if (self->_data
    && [(UTType *)self->_uti conformsToType:+[NSAdaptiveImageGlyph contentType]])
  {
    data = self->_data;
    if (!data) {
      goto LABEL_11;
    }
  }
  else
  {
    v6 = [(NSString *)[(NSFileWrapper *)self->_fileWrapperForContents preferredFilename] pathExtension];
    if (!v6
      || !objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F442D8], "typeWithFilenameExtension:", v6), "conformsToType:", +[NSAdaptiveImageGlyph contentType](NSAdaptiveImageGlyph, "contentType"))|| (data = -[NSFileWrapper regularFileContents](self->_fileWrapperForContents, "regularFileContents")) == 0)
    {
LABEL_11:
      adaptiveImageGlyph = self->_adaptiveImageGlyph;
      if (adaptiveImageGlyph) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  adaptiveImageGlyph = [[NSAdaptiveImageGlyph alloc] initWithImageContent:data];
  self->_adaptiveImageGlyph = adaptiveImageGlyph;
  if (adaptiveImageGlyph) {
    goto LABEL_13;
  }
LABEL_12:
  adaptiveImageGlyph = v3;
  self->_adaptiveImageGlyph = adaptiveImageGlyph;
LABEL_13:
  if (v3 == adaptiveImageGlyph) {
    v7 = 0;
  }
  else {
    v7 = adaptiveImageGlyph;
  }
  objc_sync_exit(self);
  return v7;
}

- (BOOL)_isEmojiImage
{
  return 0;
}

- (void)setBounds:(CGRect)bounds
{
  self->_bounds = bounds;
}

- (void)_showWithBounds:(CGRect)a3 attributes:(id)a4 location:(id)a5 textContainer:(id)a6 applicationFrameworkContext:(int64_t)a7 acceptsViewProvider:(BOOL)a8
{
  BOOL v8 = a8;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v18 = [(NSTextAttachment *)self attachmentCell];
  if (v18)
  {
    id v19 = v18;
    int64_t v20 = [(NSTextAttachment *)self _characterIndexForLocation:a5 textContainer:a6];
    if (a7 == 2)
    {
      -[NSTextAttachment _showAttachmentCell_macOS:inRect:characterIndex:](self, "_showAttachmentCell_macOS:inRect:characterIndex:", v19, v20, x, y, width, height);
    }
    else
    {
      -[NSTextAttachment _showAttachmentCell_iOS:inRect:characterIndex:](self, "_showAttachmentCell_iOS:inRect:characterIndex:", v19, v20, x, y, width, height);
    }
  }
  else if (!v8 {
         || ![(NSTextAttachment *)self usesTextAttachmentView]
  }
         || !objc_msgSend((id)objc_msgSend(a6, "textLayoutManager"), "viewProviderForTextAttachment:location:", self, a5))
  {
    -[NSTextAttachment _drawInAlignedRect:attributes:location:textContainer:applicationFrameworkContext:](self, "_drawInAlignedRect:attributes:location:textContainer:applicationFrameworkContext:", a4, a5, a6, a7, x, y, width, height);
  }
}

- (void)_drawInAlignedRect:(CGRect)a3 attributes:(id)a4 location:(id)a5 textContainer:(id)a6 applicationFrameworkContext:(int64_t)a7
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (self)
  {
    [(NSTextAttachment *)self lineLayoutPadding];
    if (v16 != 0.0)
    {
      CGFloat v17 = v16;
      v35.origin.double x = x;
      v35.origin.double y = y;
      v35.size.double width = width;
      v35.size.double height = height;
      NSRect v36 = NSInsetRect(v35, v17, 0.0);
      double x = v36.origin.x;
      double y = v36.origin.y;
      double width = v36.size.width;
      double height = v36.size.height;
    }
  }
  id v18 = -[NSTextAttachment imageForBounds:attributes:location:textContainer:](self, "imageForBounds:attributes:location:textContainer:", a4, a5, a6, x, y, width, height);
  id v19 = (void *)[(objc_class *)+[NSTextGraphicsContextProvider textGraphicsContextProviderClass] graphicsContextForApplicationFrameworkContext:a7];
  int64_t v20 = [(NSTextAttachment *)self image];
  if (a7 == 2
    && v18 == v20
    && [(UIImage *)v18 conformsToProtocol:&unk_1EDD8B9A8]
    && [(UIImage *)v18 willProvideAdaptedImageForPresentation])
  {
    id v18 = (UIImage *)-[UIImage imageForBounds:attributes:location:textContainer:](v18, "imageForBounds:attributes:location:textContainer:", a4, a5, a6, x, y, width, height);
  }
  uint64_t v21 = [v19 CGContext];
  if (v21)
  {
    double v22 = (CGContext *)v21;
    CGFloat v23 = (void *)[a4 objectForKeyedSubscript:@"NSColor"];
    if (!v23)
    {
      if (+[NSTextGraphicsContextProvider textGraphicsContextProviderClassRespondsToColorQuery])
      {
        id v24 = (objc_class *)[(objc_class *)+[NSTextGraphicsContextProvider textGraphicsContextProviderClass] colorClassForApplicationFrameworkContext:a7];
      }
      else
      {
        id v24 = +[NSTextGraphicsContextProvider __defaultColorClass];
      }
      CGFloat v23 = (void *)[(objc_class *)v24 blackColor];
    }
    CGContextSaveGState(v22);
    [v23 set];
    double v25 = (CGContext *)[v19 CGContext];
    double v26 = y - height;
    if (v25)
    {
      CGFloat v27 = v25;
      double v28 = x;
      CGPoint v29 = CGContextConvertPointToDeviceSpace(v25, *(CGPoint *)(&v26 - 1));
      v34.double x = floor(v29.x + 0.5);
      v34.double y = floor(v29.y + 0.5);
      CGPoint v32 = CGContextConvertPointToUserSpace(v27, v34);
      double v31 = v32.y;
      double v30 = v32.x;
    }
    else
    {
      double v30 = floor(x + 0.5);
      double v31 = floor(v26 + 0.5);
    }
    -[UIImage drawInRect:](v18, "drawInRect:", v30, v31, width, height);
    CGContextRestoreGState(v22);
  }
}

- (id)_image
{
  v3 = [(NSTextAttachment *)self image];
  if (v3) {
    return v3;
  }
  id v4 = +[NSTextAttachment imageCache];
  v3 = (UIImage *)objc_msgSend(v4, "objectForKey:", -[NSTextAttachment _cacheKey](self, "_cacheKey"));
  if (v3) {
    return v3;
  }
  uint64_t v5 = _NSTextScalingTypeForCurrentEnvironment();
  if (![(UTType *)self->_uti conformsToType:*MEMORY[0x1E4F44400]]
    && ![(UTType *)self->_uti conformsToType:*MEMORY[0x1E4F44450]])
  {
    goto LABEL_17;
  }
  fileWrapperForContents = self->_fileWrapperForContents;
  if (fileWrapperForContents)
  {
    if ([(NSFileWrapper *)fileWrapperForContents isSymbolicLink])
    {
      v7 = (NSData *)objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithContentsOfURL:", -[NSFileWrapper symbolicLinkDestinationURL](self->_fileWrapperForContents, "symbolicLinkDestinationURL"));
    }
    else
    {
      if (![(NSFileWrapper *)self->_fileWrapperForContents isRegularFile]) {
        goto LABEL_17;
      }
      v7 = [(NSFileWrapper *)self->_fileWrapperForContents regularFileContents];
    }
    data = v7;
    if (v7) {
      goto LABEL_13;
    }
LABEL_17:
    if (self->_uti) {
      goto LABEL_28;
    }
    goto LABEL_18;
  }
  data = self->_data;
  if (!data) {
    goto LABEL_17;
  }
LABEL_13:
  v9 = (uint64_t (**)(void))&getNSImageClass;
  if (v5 != 2) {
    v9 = &getUIImageClass_0;
  }
  v3 = (UIImage *)[objc_alloc((Class)(*v9)()) initWithData:data];
  if (v3) {
    goto LABEL_29;
  }

  self->_fileWrapperForContents = 0;
  self->_data = 0;

  self->_uti = 0;
LABEL_18:
  v10 = self->_fileWrapperForContents;
  if (!v10) {
    goto LABEL_24;
  }
  if ([(NSFileWrapper *)v10 isDirectory])
  {
    v11 = (void *)MEMORY[0x1E4F44390];
  }
  else
  {
    if (![(NSFileWrapper *)self->_fileWrapperForContents isSymbolicLink]) {
      goto LABEL_24;
    }
    v11 = (void *)MEMORY[0x1E4F444D8];
  }
  if (!*v11)
  {
LABEL_24:
    if (_image_onceToken != -1) {
      dispatch_once(&_image_onceToken, &__block_literal_global_10_1);
    }
    v3 = 0;
    if ((_image_usesDefaultIcon & 1) != 0 || !*MEMORY[0x1E4F44378]) {
      return v3;
    }
  }
LABEL_28:
  v3 = -[NSTextAttachment _imageForUTType_iOS:](self, "_imageForUTType_iOS:");
  v12 = v3;
  if (v3)
  {
LABEL_29:
    objc_msgSend(v4, "setObject:forKey:", v3, -[NSTextAttachment _cacheKey](self, "_cacheKey"));
  }
  return v3;
}

- (UIImage)image
{
  if (!self->_wrapperView || _NSTextScalingTypeForCurrentEnvironment() != 2) {
    return self->_image;
  }
  wrapperView = self->_wrapperView;

  return (UIImage *)[(NSTextAttachmentView *)wrapperView image];
}

- (void)setImage:(UIImage *)image
{
  if (self->_image != image)
  {
    uint64_t v5 = image;

    self->_image = image;
    self->_data = 0;

    self->_uti = 0;
    objc_msgSend(+[NSTextAttachment imageCache](NSTextAttachment, "imageCache"), "removeObjectForKey:", -[NSTextAttachment _cacheKey](self, "_cacheKey"));

    self->_fileWrapperForContents = 0;
    [(NSTextAttachment *)self _invalidateWrapperView];
  }
  if (_NSTextScalingTypeForCurrentEnvironment() == 2)
  {
    wrapperView = self->_wrapperView;
    [(NSTextAttachmentView *)wrapperView setImage:image];
  }
}

- (void)dealloc
{
  if (self->_cacheKey) {
    objc_msgSend(+[NSTextAttachment imageCache](NSTextAttachment, "imageCache"), "removeObjectForKey:", -[NSTextAttachment _cacheKey](self, "_cacheKey"));
  }
  wrapperView = self->_wrapperView;
  if (wrapperView)
  {
    [(NSTextAttachmentView *)wrapperView removeFromSuperview];
  }
  if ((NSTextAttachment *)[(NSTextAttachmentCell *)self->_attachmentCell attachment] == self) {
    [(NSTextAttachmentCell *)self->_attachmentCell setAttachment:0];
  }

  v4.receiver = self;
  v4.super_class = (Class)NSTextAttachment;
  [(NSTextAttachment *)&v4 dealloc];
}

- (id)_cacheKey
{
  id result = self->_cacheKey;
  if (!result)
  {
    id result = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"%p", self);
    self->_cacheKedouble y = (NSString *)result;
  }
  return result;
}

+ (id)imageCache
{
  if (imageCache_onceToken != -1) {
    dispatch_once(&imageCache_onceToken, &__block_literal_global_35);
  }
  return (id)imageCache__imageCache;
}

- (void)_invalidateWrapperView
{
  self->_wrapperView = 0;
}

- (id)imageForBounds:(CGRect)a3 attributes:(id)a4 location:(id)a5 textContainer:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ((*(_WORD *)&self->_taFlags & 0x400) != 0)
  {
    int64_t v18 = [(NSTextAttachment *)self _characterIndexForLocation:a5 textContainer:a6];
    return -[NSTextAttachment imageForBounds:textContainer:characterIndex:](self, "imageForBounds:textContainer:characterIndex:", a6, v18, x, y, width, height);
  }
  else if ([(NSTextAttachment *)self usesTextAttachmentView] {
         && (v14 = (void *)MEMORY[0x192FAE510](),
  }
  {
    return v15;
  }
  else
  {
    return [(NSTextAttachment *)self _image];
  }
}

- (Class)textAttachmentViewProviderClass
{
  v3 = [(NSTextAttachment *)self fileType];
  if (![(NSTextAttachment *)self allowsTextAttachmentView] || !v3) {
    return 0;
  }
  objc_super v4 = objc_opt_class();

  return (Class)[v4 textAttachmentViewProviderClassForFileType:v3];
}

- (BOOL)allowsTextAttachmentView
{
  return *(_WORD *)&self->_taFlags & 1;
}

- (NSString)fileType
{
  return [(UTType *)self->_uti identifier];
}

- (BOOL)usesTextAttachmentView
{
  if ([(NSTextAttachment *)self textAttachmentViewProviderClass]
    || [(NSTextAttachment *)self _hasTextAttachmentViewCell])
  {
    return 1;
  }

  return [(NSTextAttachment *)self allowsTextAttachmentView];
}

- (BOOL)_hasTextAttachmentViewCell
{
  return 0;
}

- (id)_imageForUTType_iOS:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F22430], "documentProxyForName:type:MIMEType:", 0, objc_msgSend(a3, "identifier"), 0);
  id result = (id)[(objc_class *)getUIImageClass() _iconForResourceProxy:v3 format:3];
  if (!result)
  {
    id result = (id)[(objc_class *)getUIImageClass() _iconForResourceProxy:v3 format:6];
    if (!result)
    {
      id result = (id)[(objc_class *)getUIImageClass() _iconForResourceProxy:v3 format:4];
      if (!result)
      {
        Class UIImageClass = getUIImageClass();
        return (id)[(objc_class *)UIImageClass _iconForResourceProxy:v3 format:7];
      }
    }
  }
  return result;
}

- (NSTextAttachment)initWithData:(NSData *)contentData ofType:(NSString *)uti
{
  v9.receiver = self;
  v9.super_class = (Class)NSTextAttachment;
  v6 = [(NSTextAttachment *)&v9 init];
  if (v6)
  {
    v6->_data = (NSData *)[(NSData *)contentData copy];
    if (uti) {
      v7 = (UTType *)(id)[MEMORY[0x1E4F442D8] typeWithIdentifier:uti];
    }
    else {
      v7 = 0;
    }
    v6->_uti = v7;
    [(NSTextAttachment *)v6 setEmbeddingType:0];
    [(NSTextAttachment *)v6 setStandaloneAlignment:1];
    [(NSTextAttachment *)v6 setAllowsTextAttachmentView:1];
    [(NSTextAttachment *)v6 _setAllocatesTextContainer:1];
    [(NSTextAttachment *)v6 _setupAPIPreferences];
  }
  return v6;
}

- (void)setStandaloneAlignment:(int64_t)a3
{
  char v3 = a3;
  objc_sync_enter(self);
  *(_WORD *)&self->_taFlags = *(_WORD *)&self->_taFlags & 0xFF1F | (32 * (v3 & 7));

  objc_sync_exit(self);
}

- (void)setEmbeddingType:(int64_t)a3
{
  char v3 = a3;
  objc_sync_enter(self);
  *(_WORD *)&self->_taFlags = *(_WORD *)&self->_taFlags & 0xFFE1 | (2 * (v3 & 0xF));

  objc_sync_exit(self);
}

- (void)setAllowsTextAttachmentView:(BOOL)allowsTextAttachmentView
{
  __int16 v3 = allowsTextAttachmentView;
  objc_sync_enter(self);
  *(_WORD *)&self->_taFlags = *(_WORD *)&self->_taFlags & 0xFFFE | v3;

  objc_sync_exit(self);
}

- (void)_setupAPIPreferences
{
  uint64_t v3 = objc_opt_class();
  if (objc_opt_class() != v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__NSTextAttachment__setupAPIPreferences__block_invoke;
    block[3] = &unk_1E55C82C0;
    block[4] = v3;
    block[5] = sel_attachmentBoundsForTextContainer_proposedLineFragment_glyphPosition_characterIndex_;
    block[6] = sel_attachmentBoundsForAttributes_location_textContainer_proposedLineFragment_position_;
    block[7] = sel_imageForBounds_textContainer_characterIndex_;
    block[8] = sel_imageForBounds_attributes_location_textContainer_;
    if (_setupAPIPreferences_onceToken != -1) {
      dispatch_once(&_setupAPIPreferences_onceToken, block);
    }
    uint64_t v4 = [(NSTextAttachment *)self methodForSelector:sel_attachmentBoundsForAttributes_location_textContainer_proposedLineFragment_position_];
    if (v4 == _setupAPIPreferences_baseNewAttachmentBoundsAPI)
    {
      uint64_t v5 = [(NSTextAttachment *)self methodForSelector:sel_attachmentBoundsForTextContainer_proposedLineFragment_glyphPosition_characterIndex_];
      if (v5 != _setupAPIPreferences_baseOldAttachmentBoundsAPI) {
        *(_WORD *)&self->_taFlags |= 0x200u;
      }
    }
    uint64_t v6 = [(NSTextAttachment *)self methodForSelector:sel_imageForBounds_attributes_location_textContainer_];
    if (v6 == _setupAPIPreferences_baseNewImageForAttachmentAPI)
    {
      uint64_t v7 = [(NSTextAttachment *)self methodForSelector:sel_imageForBounds_textContainer_characterIndex_];
      if (v7 != _setupAPIPreferences_baseOldImageForAttachmentAPI) {
        *(_WORD *)&self->_taFlags |= 0x400u;
      }
    }
    uint64_t v8 = [(NSTextAttachment *)self methodForSelector:sel_viewProviderForParentView_location_textContainer_];
    if (v8 == _setupAPIPreferences_baseClassViewProviderMethod)
    {
      uint64_t v10 = [(NSTextAttachment *)self methodForSelector:sel_viewProviderForParentView_characterIndex_layoutManager_];
      __int16 v9 = (v10 != _setupAPIPreferences_baseClassOldViewProviderMethod) << 14;
    }
    else
    {
      __int16 v9 = 0x4000;
    }
    *(_WORD *)&self->_taFlags = *(_WORD *)&self->_taFlags & 0xBFFF | v9;
  }
}

- (void)_setAllocatesTextContainer:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_taFlags = *(_WORD *)&self->_taFlags & 0xFEFF | v3;
}

_UICache *__30__NSTextAttachment_imageCache__block_invoke()
{
  id result = objc_alloc_init(_UICache);
  imageCache__imageCache = (uint64_t)result;
  return result;
}

- (id)viewProviderForParentView:(id)a3 location:(id)a4 textContainer:(id)a5
{
  BOOL v9 = [(NSTextAttachment *)self usesTextAttachmentView];
  if (!a5 || !v9) {
    return 0;
  }
  uint64_t v10 = [a5 textLayoutManager];
  if (v10)
  {
    uint64_t v11 = v10;
    v12 = [(NSTextAttachment *)self textAttachmentViewProviderClass];
    if (v12)
    {
      v13 = (void *)[[v12 alloc] initWithTextAttachment:self parentView:a3 textLayoutManager:v11 location:a4];
      return v13;
    }
    return 0;
  }
  uint64_t v15 = [a5 layoutManager];
  if (!v15) {
    return 0;
  }
  uint64_t v16 = v15;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v17 = [a4 characterIndex];

  return [(NSTextAttachment *)self viewProviderForParentView:a3 characterIndex:v17 layoutManager:v16];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    __NSTextAttachmentAlwaysUsesAttachmentView = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"__NSTextAttachmentAlwaysUsesAttachmentView");
  }
}

uint64_t __40__NSTextAttachment__setupAPIPreferences__block_invoke(uint64_t a1)
{
  _setupAPIPreferences_baseOldAttachmentBoundsAPI = [*(id *)(a1 + 32) instanceMethodForSelector:*(void *)(a1 + 40)];
  _setupAPIPreferences_baseNewAttachmentBoundsAPI = [*(id *)(a1 + 32) instanceMethodForSelector:*(void *)(a1 + 48)];
  _setupAPIPreferences_baseOldImageForAttachmentAPI = [*(id *)(a1 + 32) instanceMethodForSelector:*(void *)(a1 + 56)];
  _setupAPIPreferences_baseNewImageForAttachmentAPI = [*(id *)(a1 + 32) instanceMethodForSelector:*(void *)(a1 + 64)];
  _setupAPIPreferences_baseClassViewProviderMethod = [*(id *)(a1 + 32) instanceMethodForSelector:sel_viewProviderForParentView_location_textContainer_];
  uint64_t result = [*(id *)(a1 + 32) instanceMethodForSelector:sel_viewProviderForParentView_characterIndex_layoutManager_];
  _setupAPIPreferences_baseClassOldViewProviderMethod = result;
  return result;
}

+ (void)registerTextAttachmentClass:(Class)a3 forFileType:(id)a4
{
  if (a3 && a4)
  {
    objc_sync_enter(a1);
    id v7 = (id)__NSTextAttachmentClassMappings;
    if (!__NSTextAttachmentClassMappings)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      __NSTextAttachmentClassMappings = (uint64_t)v7;
    }
    [v7 setValue:a3 forKey:a4];
    objc_sync_exit(a1);
  }
}

+ (void)registerTextAttachmentViewProviderClass:(Class)textAttachmentViewProviderClass forFileType:(NSString *)fileType
{
  if (textAttachmentViewProviderClass && fileType)
  {
    objc_sync_enter(a1);
    id v7 = (id)__NSTextAttachmentViewProviderClassMappings;
    if (!__NSTextAttachmentViewProviderClassMappings)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      __NSTextAttachmentViewProviderClassMappings = (uint64_t)v7;
    }
    [v7 setValue:textAttachmentViewProviderClass forKey:fileType];
    objc_sync_exit(a1);
  }
}

+ (Class)textAttachmentViewProviderClassForFileType:(NSString *)fileType
{
  objc_sync_enter(a1);
  uint64_t v5 = (objc_class *)[(id)__NSTextAttachmentViewProviderClassMappings objectForKeyedSubscript:fileType];
  objc_sync_exit(a1);
  if (v5) {
    return v5;
  }
  uint64_t v6 = objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return (Class)[v6 textAttachmentViewProviderClassForFileType:fileType];
}

uint64_t __26__NSTextAttachment__image__block_invoke()
{
  uint64_t result = _CFExecutableLinkedOnOrAfter();
  if (!result) {
    _image_usesDefaultIcon = 1;
  }
  return result;
}

- (void)_showAttachmentCell_iOS:(id)a3 inRect:(CGRect)a4 characterIndex:(unint64_t)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double x = a4.origin.x;
  double v9 = a4.origin.y - a4.size.height;
  if (a5 == 0x7FFFFFFFFFFFFFFFLL || (objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(a3, "drawWithFrame:inView:", 0, x, v9, width, height);
  }
  else
  {
    objc_msgSend(a3, "drawWithFrame:inView:characterIndex:", 0, a5, x, v9, width, height);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_allocatesTextContainer
{
  return HIBYTE(*(_WORD *)&self->_taFlags) & 1;
}

- (NSTextAttachment)initWithFileWrapper:(NSFileWrapper *)fileWrapper
{
  uint64_t v4 = [(NSTextAttachment *)self initWithData:0 ofType:0];
  if (v4)
  {
    uint64_t v5 = fileWrapper;
    v4->_fileWrapperForContents = v5;
    uint64_t v6 = [(NSString *)[(NSFileWrapper *)v5 preferredFilename] pathExtension];
    if (v6) {
      uint64_t v6 = (NSString *)(id)[MEMORY[0x1E4F442D8] typeWithFilenameExtension:v6];
    }
    v4->_uti = (UTType *)v6;
  }
  return v4;
}

- (NSData)contents
{
  v2 = self->_data;

  return v2;
}

- (void)setContents:(NSData *)contents
{
  data = self->_data;
  if (data != contents)
  {

    self->_data = (NSData *)[(NSData *)contents copy];
    self->_image = 0;
    objc_msgSend(+[NSTextAttachment imageCache](NSTextAttachment, "imageCache"), "removeObjectForKey:", -[NSTextAttachment _cacheKey](self, "_cacheKey"));

    self->_fileWrapperForContents = 0;
  }
}

- (void)setFileType:(NSString *)fileType
{
  if (![(NSString *)fileType isEqualToString:[(UTType *)self->_uti identifier]])
  {

    if (fileType) {
      uint64_t v5 = (UTType *)(id)[MEMORY[0x1E4F442D8] typeWithIdentifier:fileType];
    }
    else {
      uint64_t v5 = 0;
    }
    self->_uti = v5;

    self->_image = 0;
    objc_msgSend(+[NSTextAttachment imageCache](NSTextAttachment, "imageCache"), "removeObjectForKey:", -[NSTextAttachment _cacheKey](self, "_cacheKey"));

    self->_fileWrapperForContents = 0;
  }
}

- (NSFileWrapper)fileWrapper
{
  fileWrapperForContents = self->_fileWrapperForContents;
  if (!fileWrapperForContents)
  {
    if (self->_data)
    {
      uti = self->_uti;
      if (uti)
      {
        uint64_t v5 = [(UTType *)uti preferredFilenameExtension];
        if (v5) {
          uint64_t v6 = (__CFString *)[@"Attachment" stringByAppendingPathExtension:v5];
        }
        else {
          uint64_t v6 = @"Attachment";
        }
        uint64_t v8 = (NSFileWrapper *)(id)[objc_alloc(MEMORY[0x1E4F28CF0]) initRegularFileWithContents:self->_data];
        fileWrapperForContents = v8;
        double v9 = v6;
        goto LABEL_11;
      }
    }
    image = self->_image;
    if (image)
    {
      uint64_t v8 = (NSFileWrapper *)(id)[objc_alloc(MEMORY[0x1E4F28CF0]) initRegularFileWithContents:((uint64_t (*)(uint64_t))softLinkUIImagePNGRepresentation[0])((uint64_t)image)];
      fileWrapperForContents = v8;
      double v9 = @"Attachment.png";
LABEL_11:
      [(NSFileWrapper *)v8 setPreferredFilename:v9];
      return fileWrapperForContents;
    }
    return 0;
  }
  return fileWrapperForContents;
}

- (void)setFileWrapper:(NSFileWrapper *)fileWrapper
{
  if (self->_fileWrapperForContents != fileWrapper && (-[NSFileWrapper isEqual:](fileWrapper, "isEqual:") & 1) == 0)
  {
    uint64_t v5 = fileWrapper;

    self->_fileWrapperForContents = fileWrapper;
    self->_image = 0;

    self->_data = 0;
    uint64_t v6 = [(NSString *)[(NSFileWrapper *)self->_fileWrapperForContents preferredFilename] pathExtension];
    if (v6) {
      uint64_t v6 = (NSString *)(id)[MEMORY[0x1E4F442D8] typeWithFilenameExtension:v6];
    }
    self->_uti = (UTType *)v6;
    objc_msgSend(+[NSTextAttachment imageCache](NSTextAttachment, "imageCache"), "removeObjectForKey:", -[NSTextAttachment _cacheKey](self, "_cacheKey"));
    [(NSTextAttachment *)self _invalidateWrapperView];
  }
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    if (self->_data && self->_uti)
    {
      objc_msgSend(a3, "encodeObject:forKey:");
      image = [(UTType *)self->_uti identifier];
      uint64_t v6 = @"NS.fileType";
    }
    else
    {
      image = (NSString *)self->_image;
      if (!image)
      {
LABEL_12:
        if ([(NSTextAttachment *)self embeddingType]) {
          objc_msgSend(a3, "encodeInt32:forKey:", -[NSTextAttachment embeddingType](self, "embeddingType"), @"NS.embeddingType");
        }
        if ([(NSTextAttachment *)self standaloneAlignment] != 1) {
          objc_msgSend(a3, "encodeInt32:forKey:", -[NSTextAttachment standaloneAlignment](self, "standaloneAlignment"), @"NS.standaloneAlignment");
        }
        if (![(NSTextAttachment *)self allowsTextAttachmentView]) {
          objc_msgSend(a3, "encodeBool:forKey:", -[NSTextAttachment allowsTextAttachmentView](self, "allowsTextAttachmentView"), @"NS.allowsTextAttachmentView");
        }
        [(NSTextAttachment *)self lineLayoutPadding];
        if (v8 != 0.0)
        {
          [(NSTextAttachment *)self lineLayoutPadding];
          objc_msgSend(a3, "encodeDouble:forKey:", @"NS.lineLayoutPadding");
        }
        if ([(NSTextAttachment *)self accessibilityLabel]) {
          objc_msgSend(a3, "encodeObject:forKey:", -[NSTextAttachment accessibilityLabel](self, "accessibilityLabel"), @"NS.accessibilityLabel");
        }
        if (-[NSTextAttachment adjustsImageSizeForAccessibilityContentSizeCategory](self, "adjustsImageSizeForAccessibilityContentSizeCategory"))objc_msgSend(a3, "encodeBool:forKey:", -[NSTextAttachment adjustsImageSizeForAccessibilityContentSizeCategory](self, "adjustsImageSizeForAccessibilityContentSizeCategory"), @"NS.adjustsImageSizeForAccessibilityContentSizeCategory"); {
        objc_msgSend(a3, "encodeObject:forKey:", -[NSTextAttachment fileWrapper](self, "fileWrapper"), @"NSFileWrapper");
        }
        if (self->_attachmentCell && (*(_WORD *)&self->_taFlags & 0x800) != 0)
        {
          objc_msgSend(a3, "encodeObject:forKey:");
        }
        return;
      }
      uint64_t v6 = @"NS.image";
    }
    [a3 encodeObject:image forKey:v6];
    goto LABEL_12;
  }
  attachmentCell = self->_attachmentCell;
  if (attachmentCell) {
    LODWORD(attachmentCell) = (*(_WORD *)&self->_taFlags >> 11) & 1;
  }
  char v9 = (char)attachmentCell;
  objc_msgSend(a3, "encodeValuesOfObjCTypes:", "c@", &v9, &self->_fileWrapperForContents);
  if (v9) {
    [a3 encodeObject:self->_attachmentCell];
  }
}

- (NSTextAttachment)initWithCoder:(id)a3
{
  if (![a3 allowsKeyedCoding])
  {

    return 0;
  }
  uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.contents"];
  uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.fileType"];
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v11 = [(NSTextAttachment *)self initWithData:v5 ofType:v6];
LABEL_13:
    uint64_t v10 = v11;
    goto LABEL_14;
  }
  if (initWithCoder__onceToken_1 != -1) {
    dispatch_once(&initWithCoder__onceToken_1, &__block_literal_global_68_0);
  }
  uint64_t v8 = [a3 decodeObjectOfClasses:initWithCoder__imageClasses forKey:@"NS.image"];
  if (!v8)
  {
    uint64_t v11 = -[NSTextAttachment initWithFileWrapper:](self, "initWithFileWrapper:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSFileWrapper"]);
    goto LABEL_13;
  }
  uint64_t v9 = v8;
  uint64_t v10 = [(NSTextAttachment *)self initWithData:0 ofType:0];
  [(NSTextAttachment *)v10 setImage:v9];
LABEL_14:
  if ([a3 containsValueForKey:@"NS.embeddingType"]) {
    -[NSTextAttachment setEmbeddingType:](v10, "setEmbeddingType:", (int)[a3 decodeInt32ForKey:@"NS.embeddingType"]);
  }
  if ([a3 containsValueForKey:@"NS.standaloneAlignment"]) {
    -[NSTextAttachment setStandaloneAlignment:](v10, "setStandaloneAlignment:", (int)[a3 decodeInt32ForKey:@"NS.standaloneAlignment"]);
  }
  if ([a3 containsValueForKey:@"NS.allowsTextAttachmentView"]) {
    -[NSTextAttachment setAllowsTextAttachmentView:](v10, "setAllowsTextAttachmentView:", [a3 decodeBoolForKey:@"NS.allowsTextAttachmentView"]);
  }
  if ([a3 containsValueForKey:@"NS.lineLayoutPadding"])
  {
    [a3 decodeDoubleForKey:@"NS.lineLayoutPadding"];
    [(NSTextAttachment *)v10 setLineLayoutPadding:"setLineLayoutPadding:"];
  }
  if ([a3 containsValueForKey:@"NS.accessibilityLabel"]) {
    -[NSTextAttachment setAccessibilityLabel:](v10, "setAccessibilityLabel:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.accessibilityLabel"]);
  }
  if ([a3 containsValueForKey:@"NS.adjustsImageSizeForAccessibilityContentSizeCategory"])-[NSTextAttachment setAdjustsImageSizeForAccessibilityContentSizeCategory:](v10, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", objc_msgSend(a3, "decodeBoolForKey:", @"NS.adjustsImageSizeForAccessibilityContentSizeCategory")); {
  return v10;
  }
}

uint64_t __34__NSTextAttachment_initWithCoder___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t result = objc_msgSend(v0, "initWithObjects:", getUIImageClass_0(), 0);
  initWithCoder__imageClasses = result;
  return result;
}

- (void)setContentView:(id)a3
{
  if ((id)[(NSTextAttachmentView *)self->_wrapperView contentView] != a3)
  {
    uint64_t v5 = _NSTextScalingTypeForCurrentEnvironment();
    uint64_t v6 = (uint64_t (**)(void))&getNSTextAttachmentViewClass;
    if (v5 != 2) {
      uint64_t v6 = (uint64_t (**)(void))&getUITextAttachmentViewClass;
    }
    BOOL v7 = (NSTextAttachmentView *)[objc_alloc((Class)(*v6)()) initWithContentView:a3];
    [(NSTextAttachmentView *)self->_wrapperView removeFromSuperview];

    self->_wrapperView = v7;
    [(NSTextAttachmentView *)v7 setAttachment:self];
  }
}

- (UIView)contentView
{
  return (UIView *)[(NSTextAttachmentView *)self->_wrapperView contentView];
}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  [(NSTextAttachment *)self bounds];
  CGRect v40 = *(CGRect *)*(void *)&MEMORY[0x1E4F1DB28];
  CGFloat x = v37.origin.x;
  double y = v37.origin.y;
  double width = v37.size.width;
  double height = v37.size.height;
  CGFloat v13 = *MEMORY[0x1E4F1DB28];
  CGFloat v14 = v40.origin.y;
  CGFloat v15 = v40.size.width;
  CGFloat v16 = v40.size.height;
  if (CGRectEqualToRect(v37, *MEMORY[0x1E4F1DB28]))
  {
    if ([(NSTextAttachment *)self usesTextAttachmentView])
    {
      if (dyld_program_sdk_at_least())
      {
        uint64_t v17 = [a3 layoutManager];
        if (v17)
        {
          id v18 = -[NSTextAttachment viewProviderForParentView:characterIndex:layoutManager:](self, "viewProviderForParentView:characterIndex:layoutManager:", [a3 textView], a6, v17);
          if ([v18 tracksTextAttachmentViewBounds])
          {
            objc_msgSend(v18, "attachmentBoundsForTextContainer:proposedLineFragment:glyphPosition:characterIndex:", a3, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.x, a5.y);
            CGFloat x = v19;
            double y = v20;
            double width = v21;
            double height = v22;
          }
        }
      }
    }
  }
  v38.origin.CGFloat x = x;
  v38.origin.double y = y;
  v38.size.double width = width;
  v38.size.double height = height;
  v41.origin.CGFloat x = v13;
  v41.origin.double y = v14;
  v41.size.double width = v15;
  v41.size.double height = v16;
  if (CGRectEqualToRect(v38, v41))
  {
    id v23 = [(NSTextAttachment *)self _image];
    if (v23)
    {
      id v24 = v23;
      [v23 size];
      if (v25 != *MEMORY[0x1E4F1DB30] || v26 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
      {
        double height = v26;
        double width = v25;
      }
      if (-[NSTextAttachment adjustsImageSizeForAccessibilityContentSizeCategory](self, "adjustsImageSizeForAccessibilityContentSizeCategory")&& ([v24 _isSymbolImage] & 1) == 0)
      {
        double v27 = softLink_UIAccessibilityContentSizeCategoryImageAdjustingScaleFactorForTraitCollection(0);
        if (v27 != 1.0 && [(UIImage *)[(NSTextAttachment *)self image] _CGPDFPage])
        {
          [(UIImage *)[(NSTextAttachment *)self image] _CGPDFPageSize];
          double width = v28;
          double height = v29;
        }
        double width = v27 * width;
        double height = v27 * height;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0
        && [v24 hasBaseline]
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
        [v24 baselineOffsetFromBottom];
        double y = y - v30;
      }
    }
  }
  double v31 = x;
  double v32 = y;
  double v33 = width;
  double v34 = height;
  result.size.double height = v34;
  result.size.double width = v33;
  result.origin.double y = v32;
  result.origin.CGFloat x = v31;
  return result;
}

- (int64_t)standaloneAlignment
{
  return *(_WORD *)&self->_taFlags >> 5;
}

- (void)setLineLayoutPadding:(CGFloat)lineLayoutPadding
{
  self->_layoutPadding = lineLayoutPadding;
}

- (id)viewProviderForParentView:(id)a3 characterIndex:(unint64_t)a4 layoutManager:(id)a5
{
  if (![(NSTextAttachment *)self usesTextAttachmentView]) {
    return 0;
  }
  uint64_t v9 = (void *)[a5 viewProviderForTextAttachment:self characterIndex:a4];
  if (!v9)
  {
    uint64_t v10 = [(NSTextAttachment *)self textAttachmentViewProviderClass];
    if (v10)
    {
      uint64_t v9 = (void *)[[v10 alloc] initWithTextAttachment:self parentView:a3 characterIndex:a4 layoutManager:a5];
      [a5 setViewProvider:v9 forTextAttachment:self characterIndex:a4];

      return v9;
    }
    return 0;
  }
  return v9;
}

- (void)placeView:(id)a3 withFrame:(CGRect)a4 inParentView:(id)a5 characterIndex:(unint64_t)a6 layoutManager:(id)a7
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if ((id)[a3 superview] != a5) {
    [(NSTextAttachment *)self detachView:a3 fromParentView:a5];
  }
  if (width < 0.0) {
    double width = 0.0;
  }
  if (height < 0.0) {
    double height = 0.0;
  }
  [a3 frame];
  v20.origin.double x = v14;
  v20.origin.double y = v15;
  v20.size.double width = v16;
  v20.size.double height = v17;
  v19.origin.double x = x;
  v19.origin.double y = y;
  v19.size.double width = width;
  v19.size.double height = height;
  if (!NSEqualRects(v19, v20)) {
    objc_msgSend(a3, "setFrame:", x, y, width, height);
  }
  if ((id)[a3 superview] != a5)
  {
    [a5 addSubview:a3];
  }
}

- (void)detachView:(id)a3 fromParentView:(id)a4
{
  if ((id)[a3 superview] == a4)
  {
    [a3 removeFromSuperview];
  }
}

+ (Class)textAttachmentClassForFileType:(id)a3
{
  objc_sync_enter(a1);
  uint64_t v5 = (objc_class *)[(id)__NSTextAttachmentClassMappings objectForKeyedSubscript:a3];
  objc_sync_exit(a1);
  return v5;
}

- (void)setIgnoresOrientation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_taFlags = *(_WORD *)&self->_taFlags & 0xEFFF | v3;
}

- (BOOL)ignoresOrientation
{
  return (*(_WORD *)&self->_taFlags >> 12) & 1;
}

- (void)setAttachmentCell:(id)attachmentCell
{
  uint64_t v4 = self->_attachmentCell;
  if (v4 != attachmentCell)
  {
    uint64_t v6 = v4;
    BOOL v7 = (NSTextAttachmentCell *)attachmentCell;
    self->_attachmentCell = v7;
    *(_WORD *)&self->_taFlags = *(_WORD *)&self->_taFlags & 0xF7FF | ((v7 != 0) << 11);
    if (v7)
    {
      if (objc_opt_respondsToSelector())
      {
        uint64_t v8 = self->_attachmentCell;
        [(NSTextAttachmentCell *)v8 setAttachment:self];
      }
    }
  }
}

- (void)setAllowsEditingContents:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_taFlags = *(_WORD *)&self->_taFlags & 0xDFFF | v3;
}

- (BOOL)allowsEditingContents
{
  return (*(_WORD *)&self->_taFlags >> 13) & 1;
}

- (NSString)description
{
  if (self->_fileWrapperForContents)
  {
    v4.receiver = self;
    v4.super_class = (Class)NSTextAttachment;
    return (NSString *)[NSString stringWithFormat:@"%@ \"%@\", -[NSTextAttachment description](&v4, sel_description), -[NSFileWrapper preferredFilename](self->_fileWrapperForContents, "preferredFilename"")];
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)NSTextAttachment;
    return [(NSTextAttachment *)&v3 description];
  }
}

- (int64_t)_characterIndexForLocation:(id)a3 textContainer:(id)a4
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a4, "textLayoutManager"), "textContentManager");
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = objc_msgSend((id)objc_msgSend(v5, "documentRange"), "location");
    return [v6 offsetFromLocation:v7 toLocation:a3];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      return [a3 characterIndex];
    }
    else
    {
      return 0;
    }
  }
}

- (void)_showWithBounds:(CGRect)a3 attributes:(__CFDictionary *)a4 runRange:(id)a5 textLayoutFragment:(id)a6 inContext:(CGContext *)a7
{
  id v8 = a6;
  int64_t var0 = a5.var0;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (a6
    && (CGFloat v16 = objc_msgSend(a6, "textLayoutManager", a4, a5.var0, a5.var1),
        CGFloat v17 = (NSCountableTextLocation *)(id)objc_msgSend((id)objc_msgSend(v8, "textParagraph"), "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", var0, 0, 0), v8 = (id)objc_msgSend(v16, "applicationFrameworkContext"), v17))
  {
    uint64_t v18 = [v16 textContainerForLocation:v17];
  }
  else
  {
    CGFloat v17 = [[NSCountableTextLocation alloc] initWithIndex:var0];
    uint64_t v18 = 0;
  }
  NSRect v19 = [[_NSCGTextGraphicsContext alloc] initWithCGContext:a7];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __85__NSTextAttachment__showWithBounds_attributes_runRange_textLayoutFragment_inContext___block_invoke;
  v20[3] = &unk_1E55C82E8;
  v20[7] = v18;
  v20[8] = a7;
  *(CGFloat *)&v20[9] = x;
  *(CGFloat *)&v20[10] = y;
  *(CGFloat *)&v20[11] = width;
  *(CGFloat *)&v20[12] = height;
  v20[4] = self;
  v20[5] = a4;
  v20[6] = v17;
  v20[13] = v8;
  +[NSTextGraphicsContextProvider setCurrentTextGraphicsContext:v19 duringBlock:v20];
}

uint64_t __85__NSTextAttachment__showWithBounds_attributes_runRange_textLayoutFragment_inContext___block_invoke(double *a1)
{
  if (*((void *)a1 + 8))
  {
    unsigned int Type = CGContextGetType();
    if (Type <= 9) {
      uint64_t v3 = (0x1E9u >> Type) & 1;
    }
    else {
      uint64_t v3 = 1;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  objc_super v4 = (void *)*((void *)a1 + 4);
  uint64_t v5 = *((void *)a1 + 5);
  uint64_t v6 = *((void *)a1 + 6);
  uint64_t v7 = *((void *)a1 + 7);
  uint64_t v8 = *((void *)a1 + 13);
  double v9 = a1[9];
  double v10 = a1[10];
  double v11 = a1[11];
  double v12 = a1[12];

  return objc_msgSend(v4, "_showWithBounds:attributes:location:textContainer:applicationFrameworkContext:acceptsViewProvider:", v5, v6, v7, v8, v3, v9, v10, v11, v12);
}

- (void)placeView:(id)a3 withFrame:(CGRect)a4 inParentView:(id)a5 location:(id)a6 textContainer:(id)a7 applicationFrameworkContext:(int64_t)a8
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if ((id)[a3 superview] != a5) {
    [(NSTextAttachment *)self detachView:a3 fromParentView:a5];
  }
  if (width < 0.0) {
    double width = 0.0;
  }
  if (height < 0.0) {
    double height = 0.0;
  }
  [a3 frame];
  v21.origin.double x = v15;
  v21.origin.double y = v16;
  v21.size.double width = v17;
  v21.size.double height = v18;
  v20.origin.double x = x;
  v20.origin.double y = y;
  v20.size.double width = width;
  v20.size.double height = height;
  if (!NSEqualRects(v20, v21)) {
    objc_msgSend(a3, "setFrame:", x, y, width, height);
  }
  if ((id)[a3 superview] != a5)
  {
    [a5 addSubview:a3];
  }
}

- (void)setAccessibilityLabel:(id)a3
{
}

- (id)accessibilityLabel
{
  return objc_getAssociatedObject(self, &AccessibilityLabel);
}

@end