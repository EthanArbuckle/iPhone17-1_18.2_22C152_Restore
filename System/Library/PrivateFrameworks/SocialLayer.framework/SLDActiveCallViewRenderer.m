@interface SLDActiveCallViewRenderer
- (BOOL)isRTL;
- (SLDActiveCallViewRenderer)initWithStyle:(id)a3 tag:(id)a4;
- (SLDActiveCallViewSlotTag)slotTag;
- (UISSlotStyle)slotStyle;
- (void)renderInContext:(CGContext *)a3;
- (void)setRTL:(BOOL)a3;
- (void)setSlotStyle:(id)a3;
- (void)setSlotTag:(id)a3;
@end

@implementation SLDActiveCallViewRenderer

- (SLDActiveCallViewRenderer)initWithStyle:(id)a3 tag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SLDActiveCallViewRenderer;
  v9 = [(SLDActiveCallViewRenderer *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_slotStyle, a3);
    objc_storeStrong((id *)&v10->_slotTag, a4);
    v10->_RTL = [v7 layoutDirection] == 1;
  }

  return v10;
}

- (void)renderInContext:(CGContext *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v5 = [(SLDActiveCallViewRenderer *)self slotTag];
  int v6 = [v5 isCallActive];

  id v7 = SLDaemonLogHandle();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LODWORD(v25.a) = 138412290;
      *(void *)((char *)&v25.a + 4) = self;
      _os_log_impl(&dword_19BE17000, v8, OS_LOG_TYPE_INFO, "[%@] SLDActiveCallViewRenderer had an active conversation at time of rendering.", (uint8_t *)&v25, 0xCu);
    }

    v9 = [(SLDActiveCallViewRenderer *)self slotTag];
    [v9 maxWidth];
    double v11 = v10;

    v28.origin.x = 0.0;
    v28.origin.y = 0.0;
    v28.size.width = v11;
    v28.size.height = 45.0;
    objc_super v12 = CGPathCreateWithRoundedRect(v28, 15.0, 15.0, 0);
    CGContextSetRGBFillColor(a3, 0.8, 0.8, 0.8, 1.0);
    CGContextAddPath(a3, v12);
    CGContextDrawPath(a3, kCGPathFill);
    CGPathRelease(v12);
    v13 = [(SLDActiveCallViewRenderer *)self slotTag];
    id v8 = [v13 activeCallGroupPhotoData];

    if (v8)
    {
      v14 = CGDataProviderCreateWithCFData((CFDataRef)v8);
      if (v14)
      {
        v15 = v14;
        v16 = CGImageSourceCreateWithDataProvider(v14, 0);
        CFRelease(v15);
        if (v16)
        {
          ImageAtIndex = CGImageSourceCreateImageAtIndex(v16, 0, 0);
          CFRelease(v16);
          if (ImageAtIndex)
          {
            CGContextSaveGState(a3);
            CGContextTranslateCTM(a3, 0.0, 45.0);
            CGContextScaleCTM(a3, 1.0, -1.0);
            CGContextBeginPath(a3);
            v29.origin.x = 8.0;
            v29.origin.y = 8.0;
            v29.size.width = 30.0;
            v29.size.height = 30.0;
            CGContextAddEllipseInRect(a3, v29);
            CGContextClip(a3);
            CGContextClosePath(a3);
            v30.origin.x = 8.0;
            v30.origin.y = 8.0;
            v30.size.width = 30.0;
            v30.size.height = 30.0;
            CGContextDrawImage(a3, v30, ImageAtIndex);
            CGContextRestoreGState(a3);
            CGImageRelease(ImageAtIndex);
          }
        }
      }
    }
    CGContextSaveGState(a3);
    long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v25.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v25.c = v18;
    *(_OWORD *)&v25.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    CGContextSetTextMatrix(a3, &v25);
    CGContextTranslateCTM(a3, 0.0, 45.0);
    CGContextScaleCTM(a3, 1.0, -1.0);
    Mutable = CGPathCreateMutable();
    v31.size.width = v11 + -46.0;
    v31.origin.x = 46.0;
    v31.origin.y = 0.0;
    v31.size.height = 30.0;
    CGPathAddRect(Mutable, 0, v31);
    v20 = [(SLDActiveCallViewRenderer *)self slotTag];
    v21 = [v20 activeCallDisplayName];

    CFAttributedStringRef v22 = (const __CFAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v21];
    v23 = CTFramesetterCreateWithAttributedString(v22);
    v27.length = [(__CFAttributedString *)v22 length];
    v27.location = 0;
    Frame = CTFramesetterCreateFrame(v23, v27, Mutable, 0);
    CTFrameDraw(Frame, a3);
    CFRelease(Frame);
    CFRelease(Mutable);
    CFRelease(v23);
    CGContextRestoreGState(a3);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[SLDActiveCallViewRenderer renderInContext:](v8);
  }
}

- (UISSlotStyle)slotStyle
{
  return self->_slotStyle;
}

- (void)setSlotStyle:(id)a3
{
}

- (SLDActiveCallViewSlotTag)slotTag
{
  return self->_slotTag;
}

- (void)setSlotTag:(id)a3
{
}

- (BOOL)isRTL
{
  return self->_RTL;
}

- (void)setRTL:(BOOL)a3
{
  self->_RTL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slotTag, 0);
  objc_storeStrong((id *)&self->_slotStyle, 0);
}

- (void)renderInContext:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19BE17000, log, OS_LOG_TYPE_DEBUG, "SLDActiveCallViewRenderer: Not drawing anything because there was no active conversation.", v1, 2u);
}

@end