@interface PXCTFramesetter
- (CGContext)context;
- (NSAttributedString)attributedString;
- (NSShadow)shadow;
- (PXCTFramesetter)init;
- (PXCTFramesetter)initWithAttributedString:(id)a3 context:(CGContext *)a4;
- (__CTFramesetter)framesetter;
- (id)frameWithRect:(CGRect)a3 maximumLineCount:(unint64_t)a4 allowTruncation:(BOOL)a5;
- (void)dealloc;
- (void)prepare;
@end

@implementation PXCTFramesetter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
}

- (NSShadow)shadow
{
  return self->_shadow;
}

- (__CTFramesetter)framesetter
{
  return self->_framesetter;
}

- (CGContext)context
{
  return self->_context;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (void)prepare
{
  if (!self->_prepared)
  {
    self->_prepared = 1;
    CFAttributedStringRef v3 = [(PXCTFramesetter *)self attributedString];
    self->_framesetter = CTFramesetterCreateWithAttributedString(v3);
    if ([(__CFAttributedString *)v3 length])
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      v4 = [(__CFAttributedString *)v3 attribute:*MEMORY[0x1E4FB0758] atIndex:0 effectiveRange:&v9];
      if (v4)
      {
        if (v9 || (uint64_t v5 = v10, v5 != [(__CFAttributedString *)v3 length]))
        {
          v6 = PLUIGetLog();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v8 = 0;
            _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "Currently only supporting NSShadowAttributeName spanning the whole string", v8, 2u);
          }

          v4 = 0;
        }
      }
      shadow = self->_shadow;
      self->_shadow = v4;
    }
  }
}

- (id)frameWithRect:(CGRect)a3 maximumLineCount:(unint64_t)a4 allowTruncation:(BOOL)a5
{
  BOOL v5 = a5;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v30[1] = *MEMORY[0x1E4F143B8];
  [(PXCTFramesetter *)self prepare];
  v12 = [(PXCTFramesetter *)self framesetter];
  v36.origin.CGFloat x = x;
  v36.origin.CGFloat y = y;
  v36.size.CGFloat width = width;
  v36.size.CGFloat height = height;
  v13 = CGPathCreateWithRect(v36, 0);
  v32.location = 0;
  v32.length = 0;
  Frame = CTFramesetterCreateFrame(v12, v32, v13, 0);
  CFRelease(v13);
  if (Frame)
  {
    v15 = CTFrameGetLines(Frame);
    if ([v15 count])
    {

LABEL_11:
      v23 = [[PXCTFrame alloc] initWithFrame:Frame maximumLineCount:a4 allowTruncation:v5 framesetter:self];
      CFRelease(Frame);
      [(PXCTFrame *)v23 prepare];
      goto LABEL_13;
    }
    CFRelease(Frame);
    uint64_t v29 = *MEMORY[0x1E4F24750];
    v16 = [NSNumber numberWithUnsignedInteger:a4];
    v30[0] = v16;
    CFDictionaryRef v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];

    v35.CGFloat height = 1.79769313e308;
    v33.location = 0;
    v33.length = 0;
    v35.CGFloat width = width;
    CGFloat v18 = CTFramesetterSuggestFrameSizeWithConstraints(v12, v33, v17, v35, 0).height;
    v37.origin.CGFloat x = x;
    v37.origin.CGFloat y = y;
    v37.size.CGFloat width = width;
    v37.size.CGFloat height = v18;
    v19 = CGPathCreateWithRect(v37, 0);
    v20 = PLUIGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      int v25 = 134218240;
      CGFloat v26 = height;
      __int16 v27 = 2048;
      CGFloat v28 = v18;
      _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_DEBUG, "avoid text being clipped in PXCTFramesetter by recalculating maxHeight from %f to %f", (uint8_t *)&v25, 0x16u);
    }

    v34.location = 0;
    v34.length = 0;
    Frame = CTFramesetterCreateFrame(v12, v34, v19, 0);
    CFRelease(v19);
    v21 = CTFrameGetLines(Frame);
    if (![v21 count])
    {
      v22 = PLUIGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_1A9AE7000, v22, OS_LOG_TYPE_DEFAULT, "text clipped completely during layout", (uint8_t *)&v25, 2u);
      }
    }
    if (Frame) {
      goto LABEL_11;
    }
  }
  v23 = 0;
LABEL_13:
  return v23;
}

- (void)dealloc
{
  framesetter = self->_framesetter;
  if (framesetter) {
    CFRelease(framesetter);
  }
  v4.receiver = self;
  v4.super_class = (Class)PXCTFramesetter;
  [(PXCTFramesetter *)&v4 dealloc];
}

- (PXCTFramesetter)initWithAttributedString:(id)a3 context:(CGContext *)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXCTFramesetter;
  v7 = [(PXCTFramesetter *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    attributedString = v7->_attributedString;
    v7->_attributedString = (NSAttributedString *)v8;

    v7->_context = a4;
  }

  return v7;
}

- (PXCTFramesetter)init
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreText+PhotosUICore.m", 23, @"%s is not available as initializer", "-[PXCTFramesetter init]");

  abort();
}

@end