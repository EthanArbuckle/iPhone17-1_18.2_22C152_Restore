@interface MFPBitmapImage
- (CGSize)pixelSize;
- (CGSize)pointSize;
- (MFPBitmapImage)initWithBitmapData:(id)a3;
- (id)phoneImage;
- (void)drawInRect:(CGRect)a3 fromRect:(CGRect)a4 unit:(int)a5 effect:(id)a6;
@end

@implementation MFPBitmapImage

- (MFPBitmapImage)initWithBitmapData:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MFPBitmapImage;
  v6 = [(MFPBitmapImage *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mBitmapData, a3);
    v8 = [[OITSUImage alloc] initWithData:v5];
    mPhoneBitmapImage = v7->mPhoneBitmapImage;
    v7->mPhoneBitmapImage = v8;

    v7->mPixelSize.width = (double)CGImageGetWidth([(OITSUImage *)v7->mPhoneBitmapImage CGImage]);
    v7->mPixelSize.height = (double)CGImageGetHeight([(OITSUImage *)v7->mPhoneBitmapImage CGImage]);
    [(OITSUImage *)v7->mPhoneBitmapImage size];
    v7->mPointSize.width = v10;
    v7->mPointSize.height = v11;
  }

  return v7;
}

- (void)drawInRect:(CGRect)a3 fromRect:(CGRect)a4 unit:(int)a5 effect:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v10 = a3.size.height;
  double v11 = a3.size.width;
  double v12 = a3.origin.y;
  double v13 = a3.origin.x;
  +[MFPGraphics unitsPerInch:](MFPGraphics, "unitsPerInch:", *(void *)&a5, a6);
  if ((float)(v15 / 72.0) == 0.0)
  {
    float v20 = self->mPointSize.width / self->mPixelSize.width;
    double v16 = NSScaleRect2(x, y, width, height, v20);
  }
  else
  {
    double v16 = NSScaleRect(x, y, width, height, v15 / 72.0);
  }
  mPhoneBitmapImage = self->mPhoneBitmapImage;
  -[OITSUImage drawInRect:fromRect:isFlipped:](mPhoneBitmapImage, "drawInRect:fromRect:isFlipped:", 1, v13, v12, v11, v10, v16, v17, v18, v19);
}

- (id)phoneImage
{
  return self->mPhoneBitmapImage;
}

- (CGSize)pixelSize
{
  double width = self->mPixelSize.width;
  double height = self->mPixelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)pointSize
{
  double width = self->mPointSize.width;
  double height = self->mPointSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPhoneBitmapImage, 0);
  objc_storeStrong((id *)&self->mBitmapData, 0);
}

@end