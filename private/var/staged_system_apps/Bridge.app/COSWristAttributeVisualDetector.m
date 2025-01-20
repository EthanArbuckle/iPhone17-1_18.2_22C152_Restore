@interface COSWristAttributeVisualDetector
- (CGImage)newImageFromSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (CGImage)resizedImageFromImage:(CGImage *)a3;
- (CGImage)warmupBuffer;
- (COSWristAttributeVisualDetector)init;
- (NSMutableArray)confidenceObservations;
- (__CVBuffer)newPixelBufferFromCGImage:(CGImage *)a3;
- (beam_bridge_2022_v2_1)bbModel;
- (id)computedConfidences;
- (id)confidenceSummary;
- (void)exportSample:(opaqueCMSampleBuffer *)a3 withClassification:(unint64_t)a4;
- (void)ingestSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)ingestWarmupBuffer;
- (void)setBbModel:(id)a3;
- (void)setConfidenceObservations:(id)a3;
@end

@implementation COSWristAttributeVisualDetector

- (COSWristAttributeVisualDetector)init
{
  v8.receiver = self;
  v8.super_class = (Class)COSWristAttributeVisualDetector;
  v2 = [(COSWristAttributeVisualDetector *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    confidenceObservations = v2->_confidenceObservations;
    v2->_confidenceObservations = v3;

    v5 = objc_alloc_init(beam_bridge_2022_v2_1);
    bbModel = v2->_bbModel;
    v2->_bbModel = v5;
  }
  return v2;
}

- (id)confidenceSummary
{
  v2 = [(COSWristAttributeVisualDetector *)self computedConfidences];
  [v2 leftWristRightCrown];
  double v4 = v3;
  [v2 leftWristLeftCrown];
  double v6 = v5;
  [v2 rightWristRightCrown];
  double v8 = v7;
  [v2 rightWristLeftCrown];
  double v10 = v9;
  [v2 none];
  double v12 = v11;
  [v2 invalid];
  double v14 = v13;
  [v2 palm];
  double v16 = v15;
  [v2 dock];
  if (v4 <= v6 || v4 <= v8 || v4 <= v10 || v4 <= v12 || v4 <= v14 || v4 <= v16 || v4 <= 0.65 || v4 <= v17)
  {
    if (v8 <= v6 || v8 <= v4 || v8 <= v10 || v8 <= v12 || v8 <= v14 || v8 <= v16 || v8 <= 0.65 || v8 <= v17)
    {
      if (v6 <= v4 || v6 <= v8 || v6 <= v10 || v6 <= v12 || v6 <= v14 || v6 <= v16 || v6 <= 0.65 || v6 <= v17)
      {
        if (v10 <= v6 || v10 <= v4 || v10 <= v8 || v10 <= v12 || v10 <= v14 || v10 <= v16 || v10 <= 0.65 || v10 <= v17)
        {
          if (v14 <= v12 || v14 <= v16 || v14 <= 0.65 || v14 <= v17)
          {
            if (v12 <= v14 || v12 <= v16 || v12 <= 0.55 || v12 <= v17)
            {
              if (v16 <= v14 || v16 <= v17 || v16 <= v12 || v16 <= 0.55)
              {
                if (v17 <= v14 || v17 <= v16 || v17 <= v12 || v17 <= 0.55)
                {
                  double v4 = 0.0;
                  uint64_t v18 = 4;
                }
                else
                {
                  uint64_t v18 = 3;
                  double v4 = v17;
                }
              }
              else
              {
                uint64_t v18 = 2;
                double v4 = v16;
              }
            }
            else
            {
              uint64_t v18 = 0;
              double v4 = v12;
            }
          }
          else
          {
            uint64_t v18 = 1;
            double v4 = v14;
          }
        }
        else
        {
          uint64_t v18 = 8;
          double v4 = v10;
        }
      }
      else
      {
        uint64_t v18 = 6;
        double v4 = v6;
      }
    }
    else
    {
      uint64_t v18 = 7;
      double v4 = v8;
    }
  }
  else
  {
    uint64_t v18 = 5;
  }
  v19 = [[COSWristAttributeConfidenceSummary alloc] initWithAttribute:v18 andConfidenceValue:v4];

  return v19;
}

- (id)computedConfidences
{
  double v3 = +[NSDate date];
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;

  double v6 = [[COSWristAttributeConfidences alloc] initWithObservationTime:v5];
  double v7 = (char *)[(NSMutableArray *)self->_confidenceObservations count];
  if ((unint64_t)v7 < 7)
  {
    if (v7) {
      double v10 = self->_confidenceObservations;
    }
    else {
      double v10 = 0;
    }
  }
  else
  {
    confidenceObservations = self->_confidenceObservations;
    double v9 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v7 - 6, 6);
    double v10 = [(NSMutableArray *)confidenceObservations objectsAtIndexes:v9];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v11 = v10;
  id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        -[COSWristAttributeConfidences addConfidences:](v6, "addConfidences:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
      }
      id v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }

  [(COSWristAttributeConfidences *)v6 divideConfidencesBy:[(NSMutableArray *)v11 count]];

  return v6;
}

- (CGImage)newImageFromSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  CVPixelBufferLockBaseAddress(ImageBuffer, 0);
  size_t Width = CVPixelBufferGetWidth(ImageBuffer);
  size_t Height = CVPixelBufferGetHeight(ImageBuffer);
  BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(ImageBuffer, 0);
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(ImageBuffer, 0);
  double v8 = (char *)CVPixelBufferGetBaseAddressOfPlane(ImageBuffer, 1uLL);
  size_t v9 = CVPixelBufferGetBytesPerRowOfPlane(ImageBuffer, 1uLL);
  double v10 = (char *)malloc_type_malloc(4 * Width * Height, 0xF6458296uLL);
  id v12 = v10;
  if (Height)
  {
    uint64_t v13 = 0;
    uint64_t v14 = v10 + 2;
    do
    {
      if (Width)
      {
        uint64_t v15 = 0;
        double v16 = &v8[v9 * (v13 >> 1)];
        long long v17 = v14;
        do
        {
          LOBYTE(v11) = BaseAddressOfPlane[v15];
          double v18 = (double)v11;
          double v19 = (double)(v16[(v15 & 0xFFFFFFFE) + 1] - 128);
          double v20 = (double)(v16[v15 & 0x7FFFFFFE] - 128);
          v21.f64[0] = v18 + v20 * -0.343;
          *(float *)&double v20 = v18 + v20 * 1.765;
          int v22 = llroundf(*(float *)&v20);
          *(v17 - 2) = -1;
          int v23 = v22 & ~(v22 >> 31);
          v21.f64[1] = v18;
          float32x2_t v24 = vrnda_f32(vcvt_f32_f64(vmlaq_n_f64(v21, (float64x2_t)xmmword_1001AAF80, v19)));
          if (v23 >= 255) {
            LOBYTE(v23) = -1;
          }
          unint64_t v11 = (unint64_t)vmin_s32(vmax_s32(vcvt_s32_f32(v24), 0), (int32x2_t)0xFF000000FFLL);
          *(v17 - 1) = v23;
          v17[1] = BYTE4(v11);
          *long long v17 = v11;
          v17 += 4;
          ++v15;
        }
        while (Width != v15);
      }
      ++v13;
      BaseAddressOfPlane += BytesPerRowOfPlane;
      v14 += 4 * Width;
    }
    while (v13 != Height);
  }
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v26 = CGBitmapContextCreate(v12, Width, Height, 8uLL, 4 * Width, DeviceRGB, 0x2005u);
  Image = CGBitmapContextCreateImage(v26);
  CGContextRelease(v26);
  CGColorSpaceRelease(DeviceRGB);
  free(v12);
  CVPixelBufferUnlockBaseAddress(ImageBuffer, 0);
  return Image;
}

- (CGImage)resizedImageFromImage:(CGImage *)a3
{
  double Width = (double)CGImageGetWidth(a3);
  CGFloat v5 = Width * 256.0 / (double)CGImageGetHeight(a3);
  size_t BitsPerComponent = CGImageGetBitsPerComponent(a3);
  size_t BytesPerRow = CGImageGetBytesPerRow(a3);
  ColorSpace = CGImageGetColorSpace(a3);
  uint32_t BitmapInfo = CGImageGetBitmapInfo(a3);
  double v10 = CGBitmapContextCreate(0, 0x100uLL, 0x100uLL, BitsPerComponent, BytesPerRow, ColorSpace, BitmapInfo);
  CGContextSetInterpolationQuality(v10, kCGInterpolationHigh);
  CGContextTranslateCTM(v10, 128.0, 128.0);
  CGContextRotateCTM(v10, -1.57079633);
  CGContextTranslateCTM(v10, -128.0, -128.0);
  float v11 = (v5 + -256.0) * 0.5;
  v17.origin.x = (float)-floorf(v11);
  v17.origin.y = 0.0;
  v17.size.width = v5;
  v17.size.height = 256.0;
  CGContextDrawImage(v10, v17, a3);
  CGImageRef Image = CGBitmapContextCreateImage(v10);
  uint64_t v13 = +[UIImage imageWithCGImage:Image];
  if (Image) {
    CFRelease(Image);
  }
  if (v10) {
    CFRelease(v10);
  }
  id v14 = v13;
  uint64_t v15 = (CGImage *)[v14 CGImage];

  return v15;
}

- (__CVBuffer)newPixelBufferFromCGImage:(CGImage *)a3
{
  double Width = (double)CGImageGetWidth(a3);
  CVPixelBufferRef pixelBufferOut = 0;
  size_t Height = (unint64_t)(double)CGImageGetHeight(a3);
  CVReturn v6 = CVPixelBufferCreate(kCFAllocatorDefault, (unint64_t)Width, Height, 0x42475241u, 0, &pixelBufferOut);
  result = 0;
  if (!v6)
  {
    CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
    BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
    float v11 = CGBitmapContextCreate(BaseAddress, (unint64_t)Width, Height, 8uLL, BytesPerRow, DeviceRGB, 0x2002u);
    CGFloat v12 = (double)CGImageGetWidth(a3);
    v14.size.height = (double)CGImageGetHeight(a3);
    v14.origin.x = 0.0;
    v14.origin.y = 0.0;
    v14.size.width = v12;
    CGContextDrawImage(v11, v14, a3);
    CGColorSpaceRelease(DeviceRGB);
    CGContextRelease(v11);
    CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
    return pixelBufferOut;
  }
  return result;
}

- (CGImage)warmupBuffer
{
  v7.width = 256.0;
  v7.height = 256.0;
  UIGraphicsBeginImageContext(v7);
  v2 = +[UIColor whiteColor];
  [v2 setFill];

  v8.origin.x = 0.0;
  v8.origin.y = 0.0;
  v8.size.width = 256.0;
  v8.size.height = 256.0;
  UIRectFill(v8);
  double v3 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  id v4 = v3;
  CGFloat v5 = (CGImage *)[v4 CGImage];

  return v5;
}

- (void)ingestWarmupBuffer
{
  double v3 = [(COSWristAttributeVisualDetector *)self newPixelBufferFromCGImage:[(COSWristAttributeVisualDetector *)self warmupBuffer]];
  bbModel = self->_bbModel;
  if (!bbModel)
  {
    CGFloat v5 = objc_alloc_init(beam_bridge_2022_v2_1);
    CVReturn v6 = self->_bbModel;
    self->_bbModel = v5;

    bbModel = self->_bbModel;
  }
  id v10 = 0;
  CGSize v7 = [(beam_bridge_2022_v2_1 *)bbModel predictionFromImage_Placeholder:v3 error:&v10];
  id v8 = v10;
  if (v8)
  {
    size_t v9 = pbb_setupflow_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100172088();
    }
  }
  else
  {
    size_t v9 = pbb_setup_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v12 = @"BB2022-2";
      __int16 v13 = 2112;
      CGRect v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ ML Warmup Complete: %@", buf, 0x16u);
    }
  }

  CVPixelBufferRelease(v3);
}

- (void)ingestSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  id v4 = [(COSWristAttributeVisualDetector *)self newImageFromSampleBuffer:a3];
  CGFloat v5 = [(COSWristAttributeVisualDetector *)self resizedImageFromImage:v4];
  if (v4) {
    CGImageRelease(v4);
  }
  CVReturn v6 = [(COSWristAttributeVisualDetector *)self newPixelBufferFromCGImage:v5];
  bbModel = self->_bbModel;
  if (!bbModel)
  {
    id v8 = objc_alloc_init(beam_bridge_2022_v2_1);
    size_t v9 = self->_bbModel;
    self->_bbModel = v8;

    bbModel = self->_bbModel;
  }
  id v16 = 0;
  id v10 = [(beam_bridge_2022_v2_1 *)bbModel predictionFromImage_Placeholder:v6 error:&v16];
  id v11 = v16;
  if (v10)
  {
    CFStringRef v12 = [v10 leaf_leaf_predictions_probabilities];
    __int16 v13 = +[COSWristModelTranslator translatorWithBeamBridgeMultiArray:v12];

    CGRect v14 = [v13 confidences];
    [(NSMutableArray *)self->_confidenceObservations addObject:v14];
  }
  if (v11)
  {
    uint64_t v15 = pbb_setupflow_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100172108();
    }
  }
  CVPixelBufferRelease(v6);
}

- (void)exportSample:(opaqueCMSampleBuffer *)a3 withClassification:(unint64_t)a4
{
  CVReturn v6 = [(COSWristAttributeVisualDetector *)self newImageFromSampleBuffer:a3];
  CGSize v7 = [(COSWristAttributeVisualDetector *)self resizedImageFromImage:v6];
  if (v6) {
    CGImageRelease(v6);
  }
  if (a4 - 6 > 2) {
    CFStringRef v8 = @"LeftRight";
  }
  else {
    CFStringRef v8 = off_1002449E0[a4 - 6];
  }
  size_t v9 = NSTemporaryDirectory();
  id v10 = +[NSDate date];
  [v10 timeIntervalSinceReferenceDate];
  id v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  CFStringRef v12 = +[NSString stringWithFormat:@"/%@/images/%@-%@.png", v9, v8, v11];

  __int16 v13 = +[UIImage imageWithCGImage:v7];
  CGRect v14 = UIImagePNGRepresentation(v13);
  id v18 = 0;
  LODWORD(v10) = [v14 writeToFile:v12 options:1 error:&v18];
  uint64_t v15 = (UIImage *)v18;

  id v16 = pbb_setupflow_log();
  CGRect v17 = v16;
  if (v10)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      double v20 = v13;
      __int16 v21 = 2112;
      int v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "######### Wrote: (%@) %@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    double v20 = v15;
    __int16 v21 = 2112;
    int v22 = v13;
    __int16 v23 = 2112;
    float32x2_t v24 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "######### Failed! %@ -> (%@) %@", buf, 0x20u);
  }
}

- (NSMutableArray)confidenceObservations
{
  return self->_confidenceObservations;
}

- (void)setConfidenceObservations:(id)a3
{
}

- (beam_bridge_2022_v2_1)bbModel
{
  return self->_bbModel;
}

- (void)setBbModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bbModel, 0);

  objc_storeStrong((id *)&self->_confidenceObservations, 0);
}

@end