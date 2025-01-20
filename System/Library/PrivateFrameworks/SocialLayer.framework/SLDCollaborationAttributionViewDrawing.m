@interface SLDCollaborationAttributionViewDrawing
- (BOOL)forRemote;
- (BOOL)isRTL;
- (CGSize)drawingSize;
- (SLDCollaborationAttributionViewDrawing)initWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5;
- (SLDCollaborationAttributionViewSlotTag)tag;
- (UISSlotStyle)slotStyle;
- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4;
- (void)setForRemote:(BOOL)a3;
- (void)setIsRTL:(BOOL)a3;
- (void)setSlotStyle:(id)a3;
- (void)setTag:(id)a3;
@end

@implementation SLDCollaborationAttributionViewDrawing

- (SLDCollaborationAttributionViewDrawing)initWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SLDCollaborationAttributionViewDrawing;
  v11 = [(SLDCollaborationAttributionViewDrawing *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_slotStyle, a3);
    objc_storeStrong((id *)&v12->_tag, a4);
    v12->_forRemote = a5;
    v12->_isRTL = [v9 layoutDirection] == 1;
  }

  return v12;
}

- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4
{
  if ([(SLDCollaborationAttributionViewDrawing *)self forRemote]
    || ([(SLDCollaborationAttributionViewDrawing *)self tag],
        v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isPlaceholder],
        v6,
        v7))
  {
    v8 = [SLDCollaborationAttributionViewRenderer alloc];
    id v9 = [(SLDCollaborationAttributionViewDrawing *)self slotStyle];
    id v10 = [(SLDCollaborationAttributionViewDrawing *)self tag];
    v12 = [(SLDCollaborationAttributionViewRenderer *)v8 initWithStyle:v9 tag:v10];

    v11 = v12;
    if (v12)
    {
      [(SLDCollaborationAttributionViewRenderer *)v12 renderInContext:a3];
      v11 = v12;
    }
  }
}

- (CGSize)drawingSize
{
  v3 = [SLCollaborationAttributionViewMetricsProvider alloc];
  v4 = [(SLDCollaborationAttributionViewDrawing *)self slotStyle];
  v5 = [(SLDCollaborationAttributionViewDrawing *)self tag];
  v6 = [(SLCollaborationAttributionViewMetricsProvider *)v3 initWithSlotStyle:v4 tag:v5];

  [(SLCollaborationAttributionViewMetricsProvider *)v6 drawingSize];
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

- (SLDCollaborationAttributionViewSlotTag)tag
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

@end