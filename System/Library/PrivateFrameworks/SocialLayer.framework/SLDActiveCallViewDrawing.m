@interface SLDActiveCallViewDrawing
- (BOOL)forRemote;
- (BOOL)isRTL;
- (CGSize)drawingSize;
- (SLDActiveCallViewDrawing)initWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5;
- (SLDActiveCallViewSlotTag)tag;
- (UISSlotStyle)slotStyle;
- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4;
- (void)setForRemote:(BOOL)a3;
- (void)setIsRTL:(BOOL)a3;
- (void)setSlotStyle:(id)a3;
- (void)setTag:(id)a3;
@end

@implementation SLDActiveCallViewDrawing

- (SLDActiveCallViewDrawing)initWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SLDActiveCallViewDrawing;
  v11 = [(SLDActiveCallViewDrawing *)&v14 init];
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
  if ([(SLDActiveCallViewDrawing *)self forRemote])
  {
    v6 = [SLDActiveCallViewRenderer alloc];
    v7 = [(SLDActiveCallViewDrawing *)self slotStyle];
    v8 = [(SLDActiveCallViewDrawing *)self tag];
    id v10 = [(SLDActiveCallViewRenderer *)v6 initWithStyle:v7 tag:v8];

    id v9 = v10;
    if (v10)
    {
      [(SLDActiveCallViewRenderer *)v10 renderInContext:a3];
      id v9 = v10;
    }
  }
}

- (CGSize)drawingSize
{
  v2 = [(SLDActiveCallViewDrawing *)self tag];
  [v2 maxWidth];
  double v4 = v3;

  double v5 = 200.0;
  double v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (UISSlotStyle)slotStyle
{
  return self->_slotStyle;
}

- (void)setSlotStyle:(id)a3
{
}

- (SLDActiveCallViewSlotTag)tag
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