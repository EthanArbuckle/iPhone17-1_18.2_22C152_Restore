@interface SLDHighlightPillDrawing
- (BOOL)forRemote;
- (BOOL)isRTL;
- (CGSize)drawingSize;
- (SLDHighlightPillDrawing)initWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5;
- (SLDHighlightPillSlotTag)tag;
- (UISSlotStyle)slotStyle;
- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4;
- (void)drawingSize;
- (void)setForRemote:(BOOL)a3;
- (void)setIsRTL:(BOOL)a3;
- (void)setSlotStyle:(id)a3;
- (void)setTag:(id)a3;
@end

@implementation SLDHighlightPillDrawing

- (SLDHighlightPillDrawing)initWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SLDHighlightPillDrawing;
  v11 = [(SLDHighlightPillDrawing *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_slotStyle, a3);
    if ([v10 isMemberOfClass:objc_opt_class()]) {
      objc_storeStrong((id *)&v12->_tag, a4);
    }
    v12->_forRemote = a5;
    v12->_isRTL = [v9 layoutDirection] == 1;
  }

  return v12;
}

- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4
{
  if ([(SLDHighlightPillDrawing *)self forRemote])
  {
    v6 = [SLDHighlightPillRenderer alloc];
    v7 = [(SLDHighlightPillDrawing *)self slotStyle];
    v8 = [(SLDHighlightPillDrawing *)self tag];
    id v10 = [(SLDHighlightPillRenderer *)v6 initWithStyle:v7 tag:v8];

    id v9 = v10;
    if (v10)
    {
      [(SLDHighlightPillRenderer *)v10 renderInContext:a3];
      id v9 = v10;
    }
  }
}

- (CGSize)drawingSize
{
  v3 = [SLHighlightPillMetrics alloc];
  v4 = [(SLDHighlightPillDrawing *)self slotStyle];
  v5 = [(SLDHighlightPillDrawing *)self tag];
  v6 = [(SLHighlightPillMetrics *)v3 initWithSlotStyle:v4 tag:v5];

  [(SLHighlightPillMetrics *)v6 pillSize];
  double v8 = v7;
  double v10 = v9;
  v11 = [(SLDHighlightPillDrawing *)self tag];
  [v11 maxWidth];
  double v13 = v12;

  if (v8 > v13)
  {
    objc_super v14 = SLDaemonLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      [(SLDHighlightPillDrawing *)self drawingSize];
    }

    v15 = [(SLDHighlightPillDrawing *)self tag];
    [v15 maxWidth];
    double v8 = v16;
  }
  double v17 = v8;
  double v18 = v10;
  result.height = v18;
  result.width = v17;
  return result;
}

- (UISSlotStyle)slotStyle
{
  return self->_slotStyle;
}

- (void)setSlotStyle:(id)a3
{
}

- (SLDHighlightPillSlotTag)tag
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

- (void)drawingSize
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v6 = [a1 tag];
  [v6 maxWidth];
  int v8 = 134218496;
  double v9 = a1;
  __int16 v10 = 2048;
  uint64_t v11 = v7;
  __int16 v12 = 2048;
  double v13 = a3;
  _os_log_error_impl(&dword_19BE17000, a2, OS_LOG_TYPE_ERROR, "[SLDHighlightPillSlotDrawer: %p] client specified a max width smaller than the min size to fit the non-flexible contents. This will result in incorrect layout. maxWidth: %f, non-flexible item width: %f", (uint8_t *)&v8, 0x20u);
}

@end