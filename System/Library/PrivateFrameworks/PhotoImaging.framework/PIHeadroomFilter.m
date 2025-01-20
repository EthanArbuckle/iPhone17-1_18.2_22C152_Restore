@interface PIHeadroomFilter
- (BOOL)isInactive;
- (BOOL)useBlur;
- (BOOL)useHighKeyStyle;
- (CGRect)extendedRect;
- (CIImage)inputImage;
- (PFParallaxColor)primaryGradientColor;
- (double)renderScale;
- (id)outputImage;
- (void)setExtendedRect:(CGRect)a3;
- (void)setInputImage:(id)a3;
- (void)setIsInactive:(BOOL)a3;
- (void)setPrimaryGradientColor:(id)a3;
- (void)setRenderScale:(double)a3;
- (void)setUseBlur:(BOOL)a3;
- (void)setUseHighKeyStyle:(BOOL)a3;
@end

@implementation PIHeadroomFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryGradientColor, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setRenderScale:(double)a3
{
  self->_renderScale = a3;
}

- (double)renderScale
{
  return self->_renderScale;
}

- (void)setPrimaryGradientColor:(id)a3
{
}

- (PFParallaxColor)primaryGradientColor
{
  return self->_primaryGradientColor;
}

- (void)setUseHighKeyStyle:(BOOL)a3
{
  self->_useHighKeyStyle = a3;
}

- (BOOL)useHighKeyStyle
{
  return self->_useHighKeyStyle;
}

- (void)setIsInactive:(BOOL)a3
{
  self->_isInactive = a3;
}

- (BOOL)isInactive
{
  return self->_isInactive;
}

- (void)setUseBlur:(BOOL)a3
{
  self->_useBlur = a3;
}

- (BOOL)useBlur
{
  return self->_useBlur;
}

- (void)setExtendedRect:(CGRect)a3
{
  self->_extendedRect = a3;
}

- (CGRect)extendedRect
{
  double x = self->_extendedRect.origin.x;
  double y = self->_extendedRect.origin.y;
  double width = self->_extendedRect.size.width;
  double height = self->_extendedRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (id)outputImage
{
  v119[2] = *MEMORY[0x1E4F143B8];
  v3 = +[PIHeadroomSettings sharedInstance];
  [v3 blurRadius];
  double v5 = v4;
  [v3 blurMaskTopLocation];
  double v7 = v6;
  [v3 falloffHeight];
  double v9 = v8;
  [v3 gradientHeight];
  double v11 = v10;
  [v3 gradientWhite];
  double v90 = v12;
  [v3 highKeyGradientWhite];
  double v89 = v13;
  [v3 bottomGradientAlpha];
  CGFloat alpha = v14;
  [v3 bottomGradientTopLocation];
  double v103 = v15;
  [v3 bottomGradientBottomLocation];
  double v105 = v16;
  [v3 topGradientAlpha];
  CGFloat v107 = v17;
  [v3 topGradientTopLocation];
  double v109 = v18;
  [v3 topGradientBottomLocation];
  double v20 = v19;
  int v21 = [v3 useSoftLightBlendingModeForTopGradient];
  [(CIImage *)self->_inputImage extent];
  double v23 = v22;
  double v24 = self->_extendedRect.size.height - v22;
  [(CIImage *)self->_inputImage extent];
  double v26 = v25;
  v28 = -[CIImage imageByCroppingToRect:](self->_inputImage, "imageByCroppingToRect:", 0.0, v27 - v24);
  v29 = [v28 imageByApplyingOrientation:4];
  [v29 extent];
  CGAffineTransformMakeTranslation(&v113, 0.0, v23 - v30);
  v31 = [v29 imageByApplyingTransform:&v113];

  v32 = [v31 imageByCompositingOverImage:self->_inputImage];
  v33 = v32;
  if (self->_useBlur)
  {
    double v91 = v20;
    int v97 = v21;
    v99 = v31;
    v100 = v28;
    v34 = [MEMORY[0x1E4F7A400] extendedSRGBColorSpace];
    uint64_t v35 = [v34 CGColorSpace];

    v36 = [v33 imageByColorMatchingWorkingSpaceToColorSpace:v35];

    v37 = [MEMORY[0x1E4F1E040] linearGradientFilter];
    double v38 = v9 * v23;
    double v39 = v23 - v9 * v23;
    objc_msgSend(v37, "setPoint0:", 0.0, v39);
    objc_msgSend(v37, "setPoint1:", 0.0, v23 + v24 * (1.0 - v7));
    v40 = [MEMORY[0x1E4F1E008] clearColor];
    [v37 setColor0:v40];

    v41 = [MEMORY[0x1E4F1E008] greenColor];
    [v37 setColor1:v41];

    v96 = v37;
    v42 = [v37 outputImage];
    uint64_t v112 = v35;
    v43 = [v42 imageByColorMatchingWorkingSpaceToColorSpace:v35];

    double v44 = v24 + v38;
    v95 = v43;
    uint64_t v45 = objc_msgSend(v43, "imageByCroppingToRect:", 0.0, v39, self->_extendedRect.size.width, v24 + v38);
    v46 = objc_msgSend(v36, "imageByCroppingToRect:", 0.0, v39, self->_extendedRect.size.width, v24 + v38);
    v47 = [v46 imageByClampingToExtent];
    v94 = (void *)v45;
    v119[0] = v45;
    uint64_t v48 = *MEMORY[0x1E4F1E4E0];
    v118[0] = @"inputMask";
    v118[1] = v48;
    v49 = NSNumber;
    [(PIHeadroomFilter *)self renderScale];
    v51 = [v49 numberWithDouble:(v5 + v5) * v50];
    v119[1] = v51;
    v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v119 forKeys:v118 count:2];
    v53 = [v47 imageByApplyingFilter:@"CIMaskedVariableBlur" withInputParameters:v52];
    v93 = v46;
    [v46 extent];
    v54 = objc_msgSend(v53, "imageByCroppingToRect:");

    v92 = v54;
    id v98 = v36;
    v111 = [v54 imageByCompositingOverImage:v36];
    v55 = [(PIHeadroomFilter *)self primaryGradientColor];
    CopyWithAlpha = CGColorCreateCopyWithAlpha((CGColorRef)[v55 CGColor], alpha);

    if (!CopyWithAlpha)
    {
      BOOL v57 = [(PIHeadroomFilter *)self useHighKeyStyle];
      CGFloat v58 = v90;
      if (v57) {
        CGFloat v58 = v89;
      }
      CopyWithAlpha = CGColorCreateGenericGrayGamma2_2(v58, 1.0);
    }
    v59 = CGColorCreateCopyWithAlpha(CopyWithAlpha, 0.0);
    uint64_t v60 = [MEMORY[0x1E4F1E008] colorWithCGColor:CopyWithAlpha];
    uint64_t v61 = [MEMORY[0x1E4F1E008] colorWithCGColor:v59];
    v62 = [MEMORY[0x1E4F1E040] linearGradientFilter];
    double v63 = v23 + v24;
    objc_msgSend(v62, "setPoint0:", 0.0, v63 + -(v103 * v44) * v11);
    objc_msgSend(v62, "setPoint1:", 0.0, v39 + v44 * (1.0 - v11 * v105));
    v106 = (void *)v60;
    [v62 setColor0:v60];
    v104 = (void *)v61;
    [v62 setColor1:v61];
    v64 = CGColorCreateCopyWithAlpha(CopyWithAlpha, v107);
    v65 = CGColorCreateCopyWithAlpha(v64, 0.0);
    uint64_t v66 = [MEMORY[0x1E4F1E008] colorWithCGColor:v64];
    uint64_t v67 = [MEMORY[0x1E4F1E008] colorWithCGColor:v65];
    v68 = [MEMORY[0x1E4F1E040] linearGradientFilter];
    objc_msgSend(v68, "setPoint0:", 0.0, v63 + -(v109 * v44) * v11);
    objc_msgSend(v68, "setPoint1:", 0.0, v39 + v44 * (1.0 - v11 * v91));
    v110 = (void *)v66;
    [v68 setColor0:v66];
    v108 = (void *)v67;
    [v68 setColor1:v67];
    CGColorRelease(CopyWithAlpha);
    CGColorRelease(v59);
    CGColorRelease(v64);
    CGColorRelease(v65);
    v69 = [v62 outputImage];
    v70 = objc_msgSend(v69, "imageByCroppingToRect:", 0.0, v39, v26, v44);

    v71 = [v68 outputImage];
    v72 = objc_msgSend(v71, "imageByCroppingToRect:", 0.0, v39, v26, v44);

    v73 = [v70 imageByColorMatchingWorkingSpaceToColorSpace:v112];

    v74 = [v72 imageByColorMatchingWorkingSpaceToColorSpace:v112];

    if ([(PIHeadroomFilter *)self isInactive])
    {
      v116[0] = @"inputRVector";
      alphaa = [MEMORY[0x1E4F1E080] vectorWithX:0.406691223 Y:0.114257611 Z:0.0115343947 W:0.0];
      v117[0] = alphaa;
      v116[1] = @"inputGVector";
      v75 = [MEMORY[0x1E4F1E080] vectorWithX:0.0339641571 Y:0.487021983 Z:0.0115343947 W:0.0];
      v117[1] = v75;
      v116[2] = @"inputBVector";
      v76 = [MEMORY[0x1E4F1E080] vectorWithX:0.0339641571 Y:0.114257611 Z:0.384298772 W:0.0];
      v117[2] = v76;
      v116[3] = @"inputAVector";
      v77 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:0.0 W:1.0];
      v117[3] = v77;
      v116[4] = @"inputBiasVector";
      v78 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:0.0 W:0.0];
      v117[4] = v78;
      v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v117 forKeys:v116 count:5];

      uint64_t v80 = [v73 imageByApplyingFilter:@"CIColorMatrix" withInputParameters:v79];

      uint64_t v81 = [v74 imageByApplyingFilter:@"CIColorMatrix" withInputParameters:v79];

      v73 = (void *)v80;
      v74 = (void *)v81;
    }
    v31 = v99;
    v28 = v100;
    uint64_t v82 = [v73 imageByCompositingOverImage:v111];
    v83 = (void *)v82;
    if (v97)
    {
      uint64_t v114 = *MEMORY[0x1E4F1E418];
      uint64_t v115 = v82;
      v84 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v115 forKeys:&v114 count:1];
      v85 = [v74 imageByApplyingFilter:@"CISoftLightBlendMode" withInputParameters:v84];
    }
    else
    {
      v85 = [v74 imageByCompositingOverImage:v82];
    }
    v87 = [v85 imageByColorMatchingColorSpaceToWorkingSpace:v112];

    id v86 = v98;
  }
  else
  {
    id v86 = v32;
    v87 = v86;
  }

  return v87;
}

@end