@interface SUImageDataProvider
- (BOOL)isEqual:(id)a3;
- (BOOL)parseData:(id)a3 returningError:(id *)a4;
- (CGSize)finalSize;
- (SUImageModifier)modifier;
- (UIColor)fillColor;
- (double)inputImageScale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newImageFromImage:(id)a3;
- (unint64_t)hash;
- (void)_getFinalSize:(CGSize *)a3 imageFrame:(CGRect *)a4 forImage:(id)a5 withModifier:(id)a6;
- (void)dealloc;
- (void)setFillColor:(id)a3;
- (void)setFinalSize:(CGSize)a3;
- (void)setInputImageScale:(double)a3;
- (void)setModifier:(id)a3;
@end

@implementation SUImageDataProvider

- (void)dealloc
{
  [(SUImageDataProvider *)self setFillColor:0];
  [(SUImageDataProvider *)self setModifier:0];
  v3.receiver = self;
  v3.super_class = (Class)SUImageDataProvider;
  [(SUImageDataProvider *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SUImageDataProvider;
  v4 = [(ISDataProvider *)&v8 copyWithZone:a3];
  v4[14] = [(SUImageDataProvider *)self fillColor];
  [(SUImageDataProvider *)self finalSize];
  v4[15] = v5;
  v4[16] = v6;
  v4[18] = [(SUImageDataProvider *)self modifier];
  return v4;
}

- (unint64_t)hash
{
  v2 = (objc_class *)objc_opt_class();
  objc_super v3 = NSStringFromClass(v2);

  return [(NSString *)v3 hash];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if (!-[UIColor isEqual:](-[SUImageDataProvider fillColor](self, "fillColor"), "isEqual:", [a3 fillColor]))return 0; {
  [(SUImageDataProvider *)self finalSize];
  }
  double v6 = v5;
  double v8 = v7;
  [a3 finalSize];
  if (v6 != v10 || v8 != v9) {
    return 0;
  }
  v11 = [(SUImageDataProvider *)self modifier];
  uint64_t v12 = [a3 modifier];

  return [(SUImageModifier *)v11 isEqual:v12];
}

- (id)newImageFromImage:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  double v5 = [(SUImageDataProvider *)self modifier];
  id v6 = v3;
  if (v5)
  {

    id v3 = [(SUImageModifier *)v5 newImageForImage:v3];
  }
  [(SUImageDataProvider *)self finalSize];
  double v8 = v7;
  double v10 = v9;
  double v32 = v7;
  double v33 = v9;
  v31.origin = (CGPoint)*MEMORY[0x263F001A8];
  [v3 size];
  v31.size.width = v11;
  v31.size.height = v12;
  if (v8 == *MEMORY[0x263F001B0] && v10 == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    [v3 size];
    double v32 = v14;
    double v33 = v15;
  }
  [(SUImageDataProvider *)self _getFinalSize:&v32 imageFrame:&v31 forImage:v3 withModifier:v5];
  CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (DeviceRGB)
  {
    v17 = DeviceRGB;
    v18 = [(SUImageDataProvider *)self fillColor];
    if (!v18 || v18 == (UIColor *)[MEMORY[0x263F1C550] clearColor]) {
      uint32_t v19 = 8194;
    }
    else {
      uint32_t v19 = 8198;
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "scale");
    double v22 = v21;
    *(float *)&double v21 = v21 * v33;
    float v23 = v22 * v32;
    v24 = CGBitmapContextCreate(0, vcvtps_u32_f32(v23), vcvtps_u32_f32(*(float *)&v21), 8uLL, (vcvtd_n_u64_f64(ceilf(v23), 3uLL) + 31) & 0xFFFFFFFFFFFFFFE0, v17, v19);
    if (v24)
    {
      v25 = v24;
      CGContextSetInterpolationQuality(v24, kCGInterpolationHigh);
      CGContextSetFillColorSpace(v25, v17);
      CGContextScaleCTM(v25, v22, v22);
      CGAffineTransformMakeScale(&v30, v22, v22);
      CGContextSetBaseCTM();
      if (v18)
      {
        CGContextSetFillColorWithColor(v25, [(UIColor *)v18 CGColor]);
        CGContextSetCompositeOperation();
        v34.size.width = v32;
        v34.size.height = v33;
        v34.origin.x = 0.0;
        v34.origin.y = 0.0;
        CGContextFillRect(v25, v34);
      }
      -[SUImageModifier drawBeforeImageForContext:imageFrame:finalSize:](v5, "drawBeforeImageForContext:imageFrame:finalSize:", v25, *(_OWORD *)&v31.origin, v31.size.width, v31.size.height, v32, v33);
      v26 = (CGImage *)[v3 CGImage];
      CGContextDrawImage(v25, v31, v26);
      -[SUImageModifier drawAfterImageForContext:imageFrame:finalSize:](v5, "drawAfterImageForContext:imageFrame:finalSize:", v25, *(_OWORD *)&v31.origin, v31.size.width, v31.size.height, v32, v33);
      CGImageRef Image = CGBitmapContextCreateImage(v25);
      if (Image)
      {
        v28 = Image;
        v20 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithCGImage:Image scale:0 orientation:v22];
        CGImageRelease(v28);
      }
      else
      {
        v20 = 0;
      }
      CFRelease(v25);
    }
    else
    {
      v20 = 0;
    }
    CGColorSpaceRelease(v17);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)parseData:(id)a3 returningError:(id *)a4
{
  double v5 = CGImageSourceCreateWithData((CFDataRef)a3, 0);
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  if (CGImageSourceGetCount(v5) && (CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v6, 0, 0)) != 0)
  {
    double v8 = ImageAtIndex;
    [(SUImageDataProvider *)self inputImageScale];
    if (v9 >= 0.00000011920929) {
      double v10 = v9;
    }
    else {
      double v10 = 1.0;
    }
    CGFloat v11 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithCGImage:v8 scale:0 orientation:v10];
    id v12 = [(SUImageDataProvider *)self newImageFromImage:v11];
    if (!v12) {
      id v12 = v11;
    }
    [(ISDataProvider *)self setOutput:v12];

    CGImageRelease(v8);
    BOOL v13 = 1;
  }
  else
  {
    BOOL v13 = 0;
  }
  CFRelease(v6);
  return v13;
}

- (void)_getFinalSize:(CGSize *)a3 imageFrame:(CGRect *)a4 forImage:(id)a5 withModifier:(id)a6
{
  double width = a3->width;
  double height = a3->height;
  double x = a4->origin.x;
  double y = a4->origin.y;
  double v15 = a4->size.width;
  double v14 = a4->size.height;
  if ([a6 scalesImage])
  {
    id v16 = a6;
    double v17 = width;
    double v18 = height;
LABEL_16:
    objc_msgSend(v16, "finalSizeForSize:originalSize:", v17, v18, width, height);
    double v20 = v33;
    double v22 = v34;
    objc_msgSend(a6, "imageFrameForImage:currentFrame:finalSize:", a5, x, y, v15, v14, v33, v34);
    double x = v35;
    double y = v36;
    double v15 = v37;
    double v14 = v38;
    goto LABEL_17;
  }
  if (a6)
  {
    objc_msgSend(a6, "finalSizeForSize:originalSize:", width, height, width, height);
    double v20 = v19;
    double v22 = v21;
    objc_msgSend(a6, "imageFrameForImage:currentFrame:finalSize:", a5, x, y, v15, v14, v19, v21);
    double x = v23;
    double y = v24;
    double v15 = v25;
    double v14 = v26;
  }
  else
  {
    double v22 = height;
    double v20 = width;
  }
  if (v20 == *MEMORY[0x263F001B0] && v22 == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    [a5 size];
    double v20 = v31;
    double v22 = v32;
    if (!a6) {
      goto LABEL_17;
    }
LABEL_15:
    id v16 = a6;
    double v17 = v20;
    double v18 = v22;
    goto LABEL_16;
  }
  double v28 = v22 / v14;
  if (v22 / v14 >= v20 / v15) {
    double v28 = v20 / v15;
  }
  float v29 = v14 * v28;
  double v14 = ceilf(v29);
  float v30 = v15 * v28;
  double v15 = ceilf(v30);
  if (a6) {
    goto LABEL_15;
  }
LABEL_17:
  a3->double width = v20;
  a3->double height = v22;
  a4->origin.double x = x;
  a4->origin.double y = y;
  a4->size.double width = v15;
  a4->size.double height = v14;
}

- (UIColor)fillColor
{
  return (UIColor *)objc_getProperty(self, a2, 112, 1);
}

- (void)setFillColor:(id)a3
{
}

- (CGSize)finalSize
{
  objc_copyStruct(v4, &self->_finalSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setFinalSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_finalSize, &v3, 16, 1, 0);
}

- (double)inputImageScale
{
  return self->_inputImageScale;
}

- (void)setInputImageScale:(double)a3
{
  self->_inputImageScale = a3;
}

- (SUImageModifier)modifier
{
  return (SUImageModifier *)objc_getProperty(self, a2, 144, 1);
}

- (void)setModifier:(id)a3
{
}

@end