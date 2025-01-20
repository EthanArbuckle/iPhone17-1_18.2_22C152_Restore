@interface VUIImageBackgroundColorDecorator
- (BOOL)isEqual:(id)a3;
- (BOOL)loaderCropToFit;
- (CGSize)expectedSize;
- (CGSize)loaderScaleToSize;
- (CGSize)size;
- (UIColor)backgroundColor;
- (VUIImageBackgroundColorDecorator)initWithBackgroundColor:(id)a3 andSize:(CGSize)a4;
- (id)decorate:(id)a3 scaledWithSize:(CGSize)a4 croppedToFit:(BOOL)a5;
- (id)decoratorIdentifier;
@end

@implementation VUIImageBackgroundColorDecorator

- (VUIImageBackgroundColorDecorator)initWithBackgroundColor:(id)a3 andSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VUIImageBackgroundColorDecorator;
  v9 = [(VUIImageBackgroundColorDecorator *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_backgroundColor, a3);
    v10->_size.CGFloat width = width;
    v10->_size.CGFloat height = height;
  }

  return v10;
}

- (CGSize)loaderScaleToSize
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)loaderCropToFit
{
  return 0;
}

- (CGSize)expectedSize
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)decoratorIdentifier
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v6 = 0;
  uint64_t v5 = 0;
  [(UIColor *)self->_backgroundColor getRed:&v8 green:&v7 blue:&v6 alpha:&v5];
  id v2 = [NSString alloc];
  v3 = objc_msgSend(v2, "initWithFormat:", @"_bc(%.1f,%.1f,%.1f,%.1f)", v8, v7, v6, v5);
  return v3;
}

- (id)decorate:(id)a3 scaledWithSize:(CGSize)a4 croppedToFit:(BOOL)a5
{
  id v6 = a3;
  uint64_t v7 = +[VUIGraphicsImageRenderer preferredFormat];
  uint64_t v8 = [v6 uiImage];
  [v8 size];
  double v10 = v9;
  double v12 = v11;

  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __73__VUIImageBackgroundColorDecorator_decorate_scaledWithSize_croppedToFit___block_invoke;
  v20 = &unk_1E6DDD870;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  double v25 = v10;
  double v26 = v12;
  v21 = self;
  id v22 = v6;
  id v13 = v6;
  +[VUIGraphicsImageRenderer imageWithSize:format:actions:](VUIGraphicsImageRenderer, "imageWithSize:format:actions:", v7, &v17, v10, v12);
  id v14 = objc_claimAutoreleasedReturnValue();
  v15 = +[VUIImage imageWithCGImageRef:preserveAlpha:](VUIImage, "imageWithCGImageRef:preserveAlpha:", objc_msgSend(v14, "CGImage", v17, v18, v19, v20, v21), 1);

  return v15;
}

void __73__VUIImageBackgroundColorDecorator_decorate_scaledWithSize_croppedToFit___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  CGContextSetFillColorWithColor((CGContextRef)[v3 CGContext], (CGColorRef)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "CGColor"));
  v4 = (CGContext *)[v3 CGContext];

  CGContextFillRect(v4, *(CGRect *)(a1 + 48));
  id v5 = [*(id *)(a1 + 40) uiImage];
  objc_msgSend(v5, "drawInRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 decoratorIdentifier];
    id v6 = [(VUIImageBackgroundColorDecorator *)self decoratorIdentifier];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
}

@end