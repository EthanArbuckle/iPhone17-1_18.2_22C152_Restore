@interface PXTimelineCrop
+ (id)cropForAsset:(id)a3 withTargetSize:(CGSize)a4;
- (CGRect)cropRect;
- (PXTimelineCrop)initWithCrop:(CGRect)a3 score:(double)a4;
- (double)cropScore;
- (id)description;
@end

@implementation PXTimelineCrop

- (CGRect)cropRect
{
  double x = self->_cropRect.origin.x;
  double y = self->_cropRect.origin.y;
  double width = self->_cropRect.size.width;
  double height = self->_cropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)cropScore
{
  return self->_cropScore;
}

- (id)description
{
  v3 = NSString;
  [(PXTimelineCrop *)self cropRect];
  uint64_t v5 = v4;
  [(PXTimelineCrop *)self cropRect];
  uint64_t v7 = v6;
  [(PXTimelineCrop *)self cropRect];
  uint64_t v9 = v8;
  [(PXTimelineCrop *)self cropRect];
  v11 = [v3 stringWithFormat:@"{{%.2f, %.2f}, {%.2f, %.2f}}", v5, v7, v9, v10];
  v12 = NSString;
  [(PXTimelineCrop *)self cropScore];
  v14 = [v12 stringWithFormat:@"cropRect:%@ cropScore:%.4f", v11, v13];

  return v14;
}

- (PXTimelineCrop)initWithCrop:(CGRect)a3 score:(double)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)PXTimelineCrop;
  CGRect result = [(PXTimelineCrop *)&v10 init];
  if (result)
  {
    result->_cropScore = a4;
    result->_cropRect.origin.CGFloat x = x;
    result->_cropRect.origin.CGFloat y = y;
    result->_cropRect.size.CGFloat width = width;
    result->_cropRect.size.CGFloat height = height;
  }
  return result;
}

+ (id)cropForAsset:(id)a3 withTargetSize:(CGSize)a4
{
  double v15 = 0.0;
  objc_msgSend(a3, "suggestedCropForTargetSize:withFocusRegion:andOutputCropScore:", &v15, a4.width, a4.height, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [PXTimelineCrop alloc];
  uint64_t v13 = -[PXTimelineCrop initWithCrop:score:](v12, "initWithCrop:score:", v5, v7, v9, v11, v15);
  return v13;
}

@end