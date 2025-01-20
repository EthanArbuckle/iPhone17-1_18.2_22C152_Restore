@interface PDDynamicDistortionCameraCalibration
- (BOOL)pointFromMetadataField:(id)a3 key:(id)a4 point:(CGPoint *)a5;
- (BOOL)rectFromMetadataField:(id)a3 key:(id)a4 rect:(CGRect *)a5;
- (BOOL)updateForFrameWithDimensions:(CGSize)a3 metadataDictionary:(id)a4;
- (PDDynamicDistortionCameraCalibration)initWithPixelSize:(__n128)a3 gdcModel:(__n128)a4 cameraToPlatformTransform:(__n128)a5;
@end

@implementation PDDynamicDistortionCameraCalibration

- (PDDynamicDistortionCameraCalibration)initWithPixelSize:(__n128)a3 gdcModel:(__n128)a4 cameraToPlatformTransform:(__n128)a5
{
  id v10 = a8;
  v25.receiver = a1;
  v25.super_class = (Class)PDDynamicDistortionCameraCalibration;
  v11 = [(ADMutableCameraCalibration *)&v25 init];
  v12 = v11;
  if (!v11) {
    goto LABEL_7;
  }
  v11->_rawSensorPixelSize = a2;
  v13 = [v10 objectForKeyedSubscript:*MEMORY[0x263F2CA90]];
  v14 = v13;
  if (!v13)
  {
    peridot_depth_log("GDC dictionary doesn't contain BasePolynomial key", *(_OWORD *)&a3, *(_OWORD *)&a4, *(_OWORD *)&a5, *(_OWORD *)&a6);
LABEL_14:

    v19 = 0;
    goto LABEL_15;
  }
  if ([v13 length] != 64)
  {
    peridot_depth_log("GDC dictionary BasePolynomial key is of wrong size", *(_OWORD *)&a3, *(_OWORD *)&a4, *(_OWORD *)&a5, *(_OWORD *)&a6);
    goto LABEL_14;
  }
  v15 = [v10 objectForKeyedSubscript:*MEMORY[0x263F2CA98]];
  v16 = v15;
  if (!v15)
  {
    peridot_depth_log("GDC dictionary doesn't contain DynamicPolynomial key", *(_OWORD *)&a3, *(_OWORD *)&a4, *(_OWORD *)&a5, *(_OWORD *)&a6);
LABEL_13:

    goto LABEL_14;
  }
  if ([v15 length] != 64)
  {
    peridot_depth_log("GDC dictionary DynamicPolynomial key is of wrong size", *(_OWORD *)&a3, *(_OWORD *)&a4, *(_OWORD *)&a5, *(_OWORD *)&a6);
    goto LABEL_13;
  }
  id v17 = v14;
  memcpy(&v12->_gdcBase, (const void *)[v17 bytes], objc_msgSend(v17, "length"));
  id v18 = v16;
  memcpy(&v12->_gdcDynamic, (const void *)[v18 bytes], objc_msgSend(v18, "length"));
  -[ADMutableCameraCalibration setCameraToPlatformTransform:](v12, "setCameraToPlatformTransform:", a3.n128_f64[0], a4.n128_f64[0], a5.n128_f64[0], a6.n128_f64[0]);

LABEL_7:
  v19 = v12;
LABEL_15:

  return v19;
}

- (BOOL)updateForFrameWithDimensions:(CGSize)a3 metadataDictionary:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F2D420]];
  uint64_t v9 = [v8 integerValue];

  id v10 = [v7 objectForKeyedSubscript:*MEMORY[0x263F2D418]];
  double v11 = (double)v9;
  double v12 = (double)[v10 integerValue];

  -[ADMutableCameraCalibration setReferenceDimensions:](self, "setReferenceDimensions:", (double)v9, v12);
  *(float *)&double v13 = self->_rawSensorPixelSize;
  [(ADMutableCameraCalibration *)self setPixelSize:v13];
  uint64_t v14 = *MEMORY[0x263F2D4D8];
  v15 = [v7 objectForKeyedSubscript:*MEMORY[0x263F2D4D8]];

  if (v15)
  {
    float32x4_t v16 = *(float32x4_t *)(MEMORY[0x263F001A0] + 16);
    float32x4_t v35 = *(float32x4_t *)MEMORY[0x263F001A0];
    float32x4_t v36 = v16;
    if (![(PDDynamicDistortionCameraCalibration *)self rectFromMetadataField:v7 key:v14 rect:&v35])goto LABEL_9; {
    [(ADMutableCameraCalibration *)self setReferenceDimensions:*(_OWORD *)&v36];
    }
    if (!-[ADMutableCameraCalibration scale:](self, "scale:", v11, v12)) {
      goto LABEL_9;
    }
  }
  else
  {
    -[ADMutableCameraCalibration setReferenceDimensions:](self, "setReferenceDimensions:", v11, v12);
  }
  id v17 = [v7 objectForKeyedSubscript:*MEMORY[0x263F2D3D0]];
  [v17 floatValue];
  float v19 = v18;

  [(PDDynamicDistortionCameraCalibration *)self pixelSize];
  float v21 = v20;
  if (![(PDDynamicDistortionCameraCalibration *)self pointFromMetadataField:v7 key:*MEMORY[0x263F2D038] point:&v39])goto LABEL_9; {
  *(float *)&unsigned int v22 = v19 * 0.001 / v21;
  }
  LODWORD(v23) = 0;
  HIDWORD(v23) = v22;
  -[ADMutableCameraCalibration setIntrinsicMatrix:](self, "setIntrinsicMatrix:", COERCE_DOUBLE((unint64_t)v22), v23, COERCE_DOUBLE(vcvt_f32_f64(v39)));
  v24 = [v7 objectForKeyedSubscript:*MEMORY[0x263F2D048]];
  [v24 floatValue];
  float v33 = v25;

  float32x4_t v26 = vmlaq_n_f32(*(float32x4_t *)self->_gdcBase.inverseOrders, *(float32x4_t *)self->_gdcDynamic.inverseOrders, v33);
  float32x4_t v27 = vmlaq_n_f32(*(float32x4_t *)&self->_gdcBase.forwardOrders[4], *(float32x4_t *)&self->_gdcDynamic.forwardOrders[4], v33);
  float32x4_t v28 = vmlaq_n_f32(*(float32x4_t *)&self->_gdcBase.inverseOrders[4], *(float32x4_t *)&self->_gdcDynamic.inverseOrders[4], v33);
  float32x4_t v35 = vmlaq_n_f32(*(float32x4_t *)self->_gdcBase.forwardOrders, *(float32x4_t *)self->_gdcDynamic.forwardOrders, v33);
  float32x4_t v36 = v27;
  float32x4_t v37 = v26;
  float32x4_t v38 = v28;
  id v29 = objc_alloc(MEMORY[0x263F26CE0]);
  v30 = (void *)[v29 initWithDistortionCenter:&v35 andPolynomials:*(_OWORD *)&v39];
  [(ADMutableCameraCalibration *)self setDistortionModel:v30];

  if (![(PDDynamicDistortionCameraCalibration *)self rectFromMetadataField:v7 key:*MEMORY[0x263F2D630] rect:v34])
  {
LABEL_9:
    BOOL v31 = 0;
    goto LABEL_10;
  }
  -[ADMutableCameraCalibration crop:](self, "crop:", v34[0], v34[1], v34[2], v34[3]);
  BOOL v31 = -[ADMutableCameraCalibration scale:](self, "scale:", width, height);
LABEL_10:

  return v31;
}

- (BOOL)rectFromMetadataField:(id)a3 key:(id)a4 rect:(CGRect *)a5
{
  id v7 = a4;
  CFDictionaryRef v8 = [a3 objectForKeyedSubscript:v7];
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    NSLog(&cfstr_CannotFindDict.isa, v7);
LABEL_6:
    BOOL v9 = 0;
    goto LABEL_7;
  }
  if (!CGRectMakeWithDictionaryRepresentation(v8, a5))
  {
    NSLog(&cfstr_InvalidDiction.isa, v7);
    goto LABEL_6;
  }
  BOOL v9 = 1;
LABEL_7:

  return v9;
}

- (BOOL)pointFromMetadataField:(id)a3 key:(id)a4 point:(CGPoint *)a5
{
  id v7 = a4;
  CFDictionaryRef v8 = [a3 objectForKeyedSubscript:v7];
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    NSLog(&cfstr_CannotFindDict.isa, v7);
LABEL_6:
    BOOL v9 = 0;
    goto LABEL_7;
  }
  if (!CGPointMakeWithDictionaryRepresentation(v8, a5))
  {
    NSLog(&cfstr_InvalidDiction.isa, v7);
    goto LABEL_6;
  }
  BOOL v9 = 1;
LABEL_7:

  return v9;
}

@end