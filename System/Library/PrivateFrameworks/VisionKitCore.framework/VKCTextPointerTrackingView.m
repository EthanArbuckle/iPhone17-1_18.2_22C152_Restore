@interface VKCTextPointerTrackingView
- (VKCTextPointerTrackingView)initWithQuad:(id)a3;
- (VKQuad)quad;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
@end

@implementation VKCTextPointerTrackingView

- (VKCTextPointerTrackingView)initWithQuad:(id)a3
{
  id v5 = a3;
  v6 = v5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  if (v5)
  {
    [v5 rotationTransformAndBoundingBox:&v20];
    double v8 = *((double *)&v20 + 1);
    double v7 = *(double *)&v20;
    double v10 = *((double *)&v21 + 1);
    double v9 = *(double *)&v21;
  }
  else
  {
    double v10 = 0.0;
    double v9 = 0.0;
    double v8 = 0.0;
    double v7 = 0.0;
  }
  v16.receiver = self;
  v16.super_class = (Class)VKCTextPointerTrackingView;
  v11 = -[VKCTextPointerTrackingView initWithFrame:](&v16, sel_initWithFrame_, v7, v8, v9, v10);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_quad, a3);
    v15[0] = v17;
    v15[1] = v18;
    v15[2] = v19;
    [(VKCTextPointerTrackingView *)v12 setTransform:v15];
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F42CA0]) initWithDelegate:v12];
    [(VKCTextPointerTrackingView *)v12 addInteraction:v13];
  }
  return v12;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = a4;
  v6 = [(VKCTextPointerTrackingView *)self superview];
  [v5 rect];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  objc_msgSend(v6, "convertRect:toView:", 0, v8, v10, v12, v14);
  double v16 = v15;

  long long v17 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, v16 * 0.9 * -0.5, 3.0, v16 * 0.9, 1.5);
  long long v18 = [MEMORY[0x1E4F42CB8] shapeWithPath:v17];
  long long v19 = [MEMORY[0x1E4F42CC0] styleWithShape:v18 constrainedAxes:0];

  return v19;
}

- (VKQuad)quad
{
  return self->_quad;
}

- (void).cxx_destruct
{
}

@end