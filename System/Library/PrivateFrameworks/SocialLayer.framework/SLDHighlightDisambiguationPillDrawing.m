@interface SLDHighlightDisambiguationPillDrawing
- (BOOL)forRemote;
- (BOOL)isRTL;
- (CGSize)drawingSize;
- (SLDHighlightDisambiguationPillDrawing)initWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5;
- (SLDHighlightDisambiguationPillSlotTag)tag;
- (UISSlotStyle)slotStyle;
- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4;
- (void)setForRemote:(BOOL)a3;
- (void)setIsRTL:(BOOL)a3;
- (void)setSlotStyle:(id)a3;
- (void)setTag:(id)a3;
@end

@implementation SLDHighlightDisambiguationPillDrawing

- (SLDHighlightDisambiguationPillDrawing)initWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SLDHighlightDisambiguationPillDrawing;
  v11 = [(SLDHighlightDisambiguationPillDrawing *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_slotStyle, a3);
    if ([v10 isMemberOfClass:objc_opt_class()])
    {
      v13 = (SLDHighlightDisambiguationPillSlotTag *)v10;
      p_super = &v12->_tag->super.super.super;
      v12->_tag = v13;
    }
    else
    {
      p_super = SLDaemonLogHandle();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        -[SLDHighlightDisambiguationPillDrawing initWithStyle:tag:forRemote:]((uint64_t)v12, (uint64_t)v10, p_super);
      }
    }

    v12->_forRemote = a5;
    v12->_isRTL = [v9 layoutDirection] == 1;
  }

  return v12;
}

- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4
{
  if ([(SLDHighlightDisambiguationPillDrawing *)self forRemote])
  {
    v6 = [SLDHighlightDisambiguationPillRenderer alloc];
    v7 = [(SLDHighlightDisambiguationPillDrawing *)self slotStyle];
    v8 = [(SLDHighlightDisambiguationPillDrawing *)self tag];
    id v10 = [(SLDHighlightDisambiguationPillRenderer *)v6 initWithStyle:v7 tag:v8];

    id v9 = v10;
    if (v10)
    {
      [(SLDHighlightDisambiguationPillRenderer *)v10 renderInContext:a3];
      id v9 = v10;
    }
  }
}

- (CGSize)drawingSize
{
  v3 = [SLHighlightDisambiguationPillMetrics alloc];
  v4 = [(SLDHighlightDisambiguationPillDrawing *)self slotStyle];
  v5 = [(SLDHighlightDisambiguationPillDrawing *)self tag];
  v6 = [(SLHighlightDisambiguationPillMetrics *)v3 initWithSlotStyle:v4 tag:v5];

  [(SLHighlightDisambiguationPillMetrics *)v6 pillSize];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (UISSlotStyle)slotStyle
{
  return self->_slotStyle;
}

- (void)setSlotStyle:(id)a3
{
}

- (SLDHighlightDisambiguationPillSlotTag)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
}

- (BOOL)forRemote
{
  return self->_forRemote;
}

- (void)setForRemote:(BOOL)a3
{
  self->_forRemote = a3;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_slotStyle, 0);
}

- (void)initWithStyle:(uint64_t)a1 tag:(uint64_t)a2 forRemote:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_19BE17000, log, OS_LOG_TYPE_ERROR, "[SLDHighlightDisambiguationPillDrawing %p] Tried to initialize with a tag of the wrong type: %@", (uint8_t *)&v3, 0x16u);
}

@end