@interface PIGreenFilter
- (CGRect)outputMaskSurroundExtent;
- (CIImage)inputExcludeMask;
- (CIImage)inputImage;
- (CIImage)inputMaskImage;
- (NSNumber)inputShowSurround;
- (NSObject)inputModel;
- (NSObject)inputRefinementModel;
- (id)outputImage;
- (void)setInputExcludeMask:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputMaskImage:(id)a3;
- (void)setInputModel:(id)a3;
- (void)setInputRefinementModel:(id)a3;
- (void)setInputShowSurround:(id)a3;
@end

@implementation PIGreenFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputRefinementModel, 0);
  objc_storeStrong((id *)&self->_inputModel, 0);
  objc_storeStrong((id *)&self->_inputExcludeMask, 0);
  objc_storeStrong((id *)&self->_inputShowSurround, 0);
  objc_storeStrong((id *)&self->_inputMaskImage, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setInputRefinementModel:(id)a3
{
}

- (NSObject)inputRefinementModel
{
  return self->_inputRefinementModel;
}

- (void)setInputModel:(id)a3
{
}

- (NSObject)inputModel
{
  return self->_inputModel;
}

- (void)setInputExcludeMask:(id)a3
{
}

- (CIImage)inputExcludeMask
{
  return self->_inputExcludeMask;
}

- (void)setInputShowSurround:(id)a3
{
}

- (NSNumber)inputShowSurround
{
  return self->_inputShowSurround;
}

- (void)setInputMaskImage:(id)a3
{
}

- (CIImage)inputMaskImage
{
  return self->_inputMaskImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (CGRect)outputMaskSurroundExtent
{
  v3 = [(PIGreenFilter *)self inputMaskImage];
  [v3 extent];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v29.origin.CGFloat x = v5;
  v29.origin.CGFloat y = v7;
  v29.size.CGFloat width = v9;
  v29.size.CGFloat height = v11;
  CGRect v30 = CGRectInset(v29, v9 * -0.1, v11 * -0.1);
  CGFloat x = v30.origin.x;
  CGFloat y = v30.origin.y;
  CGFloat width = v30.size.width;
  CGFloat height = v30.size.height;
  v16 = [(PIGreenFilter *)self inputImage];
  [v16 extent];
  v34.origin.CGFloat x = v17;
  v34.origin.CGFloat y = v18;
  v34.size.CGFloat width = v19;
  v34.size.CGFloat height = v20;
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  CGRect v32 = CGRectIntersection(v31, v34);
  CGFloat v21 = v32.origin.x;
  CGFloat v22 = v32.origin.y;
  CGFloat v23 = v32.size.width;
  CGFloat v24 = v32.size.height;

  double v25 = v21;
  double v26 = v22;
  double v27 = v23;
  double v28 = v24;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

- (id)outputImage
{
  v3 = [MEMORY[0x1E4F1E050] greenImage];
  double v4 = [(PIGreenFilter *)self inputImage];
  [v4 extent];
  CGFloat v5 = objc_msgSend(v3, "imageByCroppingToRect:");

  return v5;
}

@end