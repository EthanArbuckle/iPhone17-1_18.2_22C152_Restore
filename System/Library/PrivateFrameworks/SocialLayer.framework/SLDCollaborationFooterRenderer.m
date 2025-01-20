@interface SLDCollaborationFooterRenderer
- (SLDCollaborationFooterMetrics)metrics;
- (SLDCollaborationFooterRenderer)initWithStyle:(id)a3 tag:(id)a4;
- (SLDCollaborationFooterSlotTag)slotTag;
- (UISSlotStyle)slotStyle;
- (void)_renderString:(id)a3 inRect:(CGRect)a4 context:(CGContext *)a5;
- (void)_renderSubtitleInContext:(CGContext *)a3 titleRect:(CGRect)a4;
- (void)_renderTitleInContext:(CGContext *)a3 resultingRect:(CGRect *)a4;
- (void)renderInContext:(CGContext *)a3;
- (void)setSlotStyle:(id)a3;
- (void)setSlotTag:(id)a3;
@end

@implementation SLDCollaborationFooterRenderer

- (SLDCollaborationFooterRenderer)initWithStyle:(id)a3 tag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SLDCollaborationFooterRenderer;
  v9 = [(SLDCollaborationFooterRenderer *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_slotStyle, a3);
    objc_storeStrong((id *)&v10->_slotTag, a4);
    v11 = [[SLDCollaborationFooterMetrics alloc] initWithSlotStyle:v7 tag:v8];
    metrics = v10->_metrics;
    v10->_metrics = v11;
  }
  return v10;
}

- (void)renderInContext:(CGContext *)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = [(SLDCollaborationFooterRenderer *)self slotTag];
  v6 = [v5 title];

  if (v6)
  {
    [(SLDCollaborationFooterRenderer *)self _renderTitleInContext:a3 resultingRect:&v10];
  }
  else
  {
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    long long v10 = *MEMORY[0x1E4F1DB28];
    long long v11 = v7;
  }
  id v8 = [(SLDCollaborationFooterRenderer *)self slotTag];
  v9 = [v8 subtitle];

  if (v9) {
    -[SLDCollaborationFooterRenderer _renderSubtitleInContext:titleRect:](self, "_renderSubtitleInContext:titleRect:", a3, v10, v11);
  }
}

- (void)_renderTitleInContext:(CGContext *)a3 resultingRect:(CGRect *)a4
{
  long long v7 = [(SLDCollaborationFooterRenderer *)self metrics];
  id v17 = [v7 titleAttributedString];

  id v8 = [(SLDCollaborationFooterRenderer *)self metrics];
  [v8 boundingRectForString:v17];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  -[SLDCollaborationFooterRenderer _renderString:inRect:context:](self, "_renderString:inRect:context:", v17, a3, v10, v12, v14, v16);
  a4->origin.x = v10;
  a4->origin.y = v12;
  a4->size.width = v14;
  a4->size.height = v16;
}

- (void)_renderSubtitleInContext:(CGContext *)a3 titleRect:(CGRect)a4
{
  double height = a4.size.height;
  double y = a4.origin.y;
  id v8 = [(SLDCollaborationFooterRenderer *)self metrics];
  id v17 = [v8 subtitleAttributedString];

  double v9 = -(y + height);
  double v10 = [(SLDCollaborationFooterRenderer *)self metrics];
  [v10 boundingRectForString:v17];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  -[SLDCollaborationFooterRenderer _renderString:inRect:context:](self, "_renderString:inRect:context:", v17, a3, v12, v9, v14, v16);
}

- (void)_renderString:(id)a3 inRect:(CGRect)a4 context:(CGContext *)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CFAttributedStringRef v10 = (const __CFAttributedString *)a3;
  double v11 = CTFramesetterCreateWithAttributedString(v10);
  Mutable = CGPathCreateMutable();
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  CGPathAddRect(Mutable, 0, v17);
  CFIndex v13 = [(__CFAttributedString *)v10 length];

  v16.location = 0;
  v16.length = v13;
  Frame = CTFramesetterCreateFrame(v11, v16, Mutable, 0);
  CGContextSaveGState(a5);
  v15.a = 1.0;
  v15.b = 0.0;
  v15.c = 0.0;
  v15.d = 1.0;
  v15.tCGFloat x = x;
  v15.tCGFloat y = 0.0;
  CGContextSetTextMatrix(a5, &v15);
  CGContextTranslateCTM(a5, 0.0, height);
  CGContextScaleCTM(a5, 1.0, -1.0);
  CTFrameDraw(Frame, a5);
  CGContextRestoreGState(a5);
  if (v11) {
    CFRelease(v11);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (Frame) {
    CFRelease(Frame);
  }
}

- (UISSlotStyle)slotStyle
{
  return self->_slotStyle;
}

- (void)setSlotStyle:(id)a3
{
}

- (SLDCollaborationFooterSlotTag)slotTag
{
  return self->_slotTag;
}

- (void)setSlotTag:(id)a3
{
}

- (SLDCollaborationFooterMetrics)metrics
{
  return self->_metrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_slotTag, 0);
  objc_storeStrong((id *)&self->_slotStyle, 0);
}

@end