@interface VKRecognizedItem
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldAssociateWithItem:(id)a3;
- (CGAffineTransform)_applyWarpTransform:(CGAffineTransform *)result toVisionPoint:;
- (NSUUID)uuid;
- (VKFrameInfo)frameInfo;
- (VKQuad)layerQuad;
- (VKQuad)visionQuad;
- (VKRecognizedItem)initWithFrameInfo:(id)a3 rectangleObservation:(id)a4;
- (VKRecognizedItem)initWithFrameInfo:(id)a3 rectangleObservation:(id)a4 layoutDirection:(unint64_t)a5;
- (VNObservation)observation;
- (unint64_t)hash;
- (void)applyHomographyWarpTransform:(uint64_t)a1;
- (void)associateWithItem:(id)a3;
- (void)setObservation:(id)a3;
@end

@implementation VKRecognizedItem

- (VKRecognizedItem)initWithFrameInfo:(id)a3 rectangleObservation:(id)a4
{
  return [(VKRecognizedItem *)self initWithFrameInfo:a3 rectangleObservation:a4 layoutDirection:0];
}

- (VKRecognizedItem)initWithFrameInfo:(id)a3 rectangleObservation:(id)a4 layoutDirection:(unint64_t)a5
{
  v32[8] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v31.receiver = self;
  v31.super_class = (Class)VKRecognizedItem;
  v11 = [(VKRecognizedItem *)&v31 init];
  if (v11)
  {
    uint64_t v12 = [v10 uuid];
    uuid = v11->_uuid;
    v11->_uuid = (NSUUID *)v12;

    objc_storeStrong((id *)&v11->_frameInfo, a3);
    [v10 topLeft];
    v32[0] = v14;
    v32[1] = v15;
    [v10 topRight];
    v32[2] = v16;
    v32[3] = v17;
    [v10 bottomRight];
    v32[4] = v18;
    v32[5] = v19;
    [v10 bottomLeft];
    v32[6] = v20;
    v32[7] = v21;
    v22 = [VKQuad alloc];
    uint64_t v23 = 2;
    uint64_t v24 = 4;
    if (a5 == 5) {
      uint64_t v23 = 4;
    }
    v25 = (double *)&v32[v23];
    uint64_t v26 = 6;
    if (a5 == 5) {
      uint64_t v24 = 6;
    }
    v27 = (double *)&v32[v24];
    if (a5 == 5) {
      uint64_t v26 = 0;
    }
    uint64_t v28 = -[VKQuad initWithTopLeft:topRight:bottomRight:bottomLeft:](v22, "initWithTopLeft:topRight:bottomRight:bottomLeft:", *(double *)&v32[2 * (a5 == 5)], *(double *)&v32[2 * (a5 == 5) + 1], *v25, v25[1], *v27, v27[1], *(double *)&v32[v26], *(double *)&v32[v26 + 1]);
    visionQuad = v11->_visionQuad;
    v11->_visionQuad = (VKQuad *)v28;

    [(VKRecognizedItem *)v11 setObservation:v10];
  }

  return v11;
}

- (VKFrameInfo)frameInfo
{
  return self->_frameInfo;
}

- (VKQuad)visionQuad
{
  return self->_visionQuad;
}

- (VKQuad)layerQuad
{
  layerQuad = self->_layerQuad;
  if (!layerQuad)
  {
    v4 = [(VKRecognizedItem *)self frameInfo];
    [(VKQuad *)self->_visionQuad topLeft];
    double v37 = v6;
    double v7 = v5;
    if (v4)
    {
      double v40 = v5;
      [v4 visionToLayerTransform];
      double v7 = v40;
      float64x2_t v8 = v54;
      float64x2_t v32 = v55;
      float64x2_t v34 = v53;
    }
    else
    {
      float64x2_t v8 = 0uLL;
      float64x2_t v32 = 0u;
      float64x2_t v34 = 0u;
    }
    float64x2_t v41 = vmulq_n_f64(v8, v7);
    [(VKQuad *)self->_visionQuad topRight];
    double v11 = v9;
    if (v4)
    {
      double v27 = v10;
      double v28 = v9;
      [v4 visionToLayerTransform];
      double v10 = v27;
      double v11 = v28;
      float64x2_t v12 = v50;
      float64x2_t v13 = v51;
      float64x2_t v30 = v52;
    }
    else
    {
      float64x2_t v12 = 0uLL;
      float64x2_t v30 = 0u;
      float64x2_t v13 = 0uLL;
    }
    float64x2_t v42 = vmlaq_n_f64(v41, v34, v37);
    float64x2_t v35 = vmlaq_n_f64(vmulq_n_f64(v13, v10), v12, v11);
    [(VKQuad *)self->_visionQuad bottomRight];
    if (v4)
    {
      double v38 = v14;
      double v29 = v15;
      [v4 visionToLayerTransform];
      double v15 = v29;
      double v14 = v38;
      float64x2_t v17 = v47;
      float64x2_t v16 = v48;
      float64x2_t v18 = v49;
    }
    else
    {
      float64x2_t v18 = 0uLL;
      float64x2_t v17 = 0uLL;
      float64x2_t v16 = 0uLL;
    }
    float64x2_t v39 = vaddq_f64(v32, v42);
    float64x2_t v43 = vaddq_f64(v30, v35);
    float64x2_t v36 = vaddq_f64(v18, vmlaq_n_f64(vmulq_n_f64(v16, v15), v17, v14));
    [(VKQuad *)self->_visionQuad bottomLeft];
    if (v4)
    {
      double v31 = v20;
      double v33 = v19;
      [v4 visionToLayerTransform];
      double v20 = v31;
      double v19 = v33;
      float64x2_t v22 = v44;
      float64x2_t v21 = v45;
      float64x2_t v23 = v46;
    }
    else
    {
      float64x2_t v23 = 0uLL;
      float64x2_t v22 = 0uLL;
      float64x2_t v21 = 0uLL;
    }
    uint64_t v24 = [[VKQuad alloc] initWithTopLeft:*(_OWORD *)&v39 topRight:*(_OWORD *)&v43 bottomLeft:vaddq_f64(v23, vmlaq_n_f64(vmulq_n_f64(v21, v20), v22, v19)) bottomRight:*(_OWORD *)&v36];
    v25 = self->_layerQuad;
    self->_layerQuad = v24;

    layerQuad = self->_layerQuad;
  }
  return layerQuad;
}

- (BOOL)shouldAssociateWithItem:(id)a3
{
  id v4 = a3;
  double v5 = [(VKRecognizedItem *)self visionQuad];
  double v6 = [v4 visionQuad];

  [v5 topLeft];
  double v8 = v7;
  double v10 = v9;
  [v6 topLeft];
  if (!VKMNearlyEqualPointsWithThreshold(v8, v10, v11, v12, 0.1)) {
    goto LABEL_5;
  }
  [v5 topRight];
  double v14 = v13;
  double v16 = v15;
  [v6 topRight];
  if (!VKMNearlyEqualPointsWithThreshold(v14, v16, v17, v18, 0.1)) {
    goto LABEL_5;
  }
  [v5 bottomRight];
  double v20 = v19;
  double v22 = v21;
  [v6 bottomRight];
  if (VKMNearlyEqualPointsWithThreshold(v20, v22, v23, v24, 0.1))
  {
    [v5 bottomLeft];
    double v26 = v25;
    double v28 = v27;
    [v6 bottomLeft];
    BOOL v31 = VKMNearlyEqualPointsWithThreshold(v26, v28, v29, v30, 0.1);
  }
  else
  {
LABEL_5:
    BOOL v31 = 0;
  }

  return v31;
}

- (void)associateWithItem:(id)a3
{
  id v4 = a3;
  double v5 = [v4 observation];
  observation = self->_observation;
  self->_observation = v5;

  uint64_t v7 = objc_opt_class();
  VKCheckedDynamicCast(v7, (uint64_t)v4);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  double v8 = [v11 visionQuad];
  visionQuad = self->_visionQuad;
  self->_visionQuad = v8;

  layerQuad = self->_layerQuad;
  self->_layerQuad = 0;
}

- (void)applyHomographyWarpTransform:(uint64_t)a1
{
  __invert_f3(a2);
  [*(id *)(a1 + 16) topLeft];
  -[VKRecognizedItem _applyWarpTransform:toVisionPoint:]((CGAffineTransform *)a1);
  double v4 = v3;
  double v6 = v5;
  [*(id *)(a1 + 16) topRight];
  -[VKRecognizedItem _applyWarpTransform:toVisionPoint:]((CGAffineTransform *)a1);
  double v8 = v7;
  double v10 = v9;
  [*(id *)(a1 + 16) bottomRight];
  -[VKRecognizedItem _applyWarpTransform:toVisionPoint:]((CGAffineTransform *)a1);
  double v12 = v11;
  double v14 = v13;
  [*(id *)(a1 + 16) bottomLeft];
  -[VKRecognizedItem _applyWarpTransform:toVisionPoint:]((CGAffineTransform *)a1);
  double v17 = -[VKQuad initWithTopLeft:topRight:bottomLeft:bottomRight:]([VKQuad alloc], "initWithTopLeft:topRight:bottomLeft:bottomRight:", v4, v6, v8, v10, v15, v16, v12, v14);
  double v18 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v17;

  double v19 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = 0;
}

- (CGAffineTransform)_applyWarpTransform:(CGAffineTransform *)result toVisionPoint:
{
  if (result)
  {
    memset(&v5, 0, sizeof(v5));
    v1 = [(CGAffineTransform *)result frameInfo];
    v2 = v1;
    if (v1) {
      [v1 visionToCroppedImageTransform];
    }
    else {
      memset(&v5, 0, sizeof(v5));
    }

    CGAffineTransform v3 = v5;
    memset(&v4, 0, sizeof(v4));
    return CGAffineTransformInvert(&v4, &v3);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  CGAffineTransform v4 = (VKRecognizedItem *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CGAffineTransform v5 = [(VKRecognizedItem *)self uuid];
      double v6 = [(VKRecognizedItem *)v4 uuid];
      char v7 = [v5 isEqual:v6];
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
  v2 = [(VKRecognizedItem *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (VNObservation)observation
{
  return self->_observation;
}

- (void)setObservation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observation, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_layerQuad, 0);
  objc_storeStrong((id *)&self->_visionQuad, 0);
  objc_storeStrong((id *)&self->_frameInfo, 0);
}

@end