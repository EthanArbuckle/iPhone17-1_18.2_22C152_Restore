@interface MPAssetManager
+ (id)convertCGImageToBuffer:(CGImage *)a3;
+ (id)convertCGImageToBufferUsingDataProvider:(CGImage *)a3;
+ (id)convertCGImageToBufferUsingRGBDevice:(CGImage *)a3;
+ (id)sharedManager;
+ (void)releaseSharedManager;
+ (void)setInhibitSharedManagerInit:(BOOL)a3;
- (CGSize)resolutionForAssetAtPath:(id)a3;
- (double)altitudeForAssetAtPath:(id)a3;
- (double)durationForAssetAtPath:(id)a3;
- (double)latitudeForAssetAtPath:(id)a3;
- (double)longitudeForAssetAtPath:(id)a3;
- (double)posterTimeForAssetAtPath:(id)a3;
- (double)startTimeForAssetAtPath:(id)a3;
- (double)stopTimeForAssetAtPath:(id)a3;
- (id)absolutePathFromPath:(id)a3;
- (id)creationDateForAssetAtPath:(id)a3;
- (id)keywordsForAssetAtPath:(id)a3;
- (id)locationHierarchyForAssetAtPath:(id)a3;
- (id)regionsOfInterestForAsset:(CGImage *)a3;
- (id)regionsOfInterestForAssetAtPath:(id)a3;
- (unint64_t)mediaTypeForAssetAtPath:(id)a3;
@end

@implementation MPAssetManager

+ (void)setInhibitSharedManagerInit:(BOOL)a3
{
  byte_1F13E0 = a3;
}

+ (id)sharedManager
{
  id result = (id)qword_1F13E8;
  if (qword_1F13E8) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = byte_1F13E0 == 0;
  }
  if (v4)
  {
    objc_sync_enter(a1);
    if (!qword_1F13E8) {
      qword_1F13E8 = objc_alloc_init(MPEmbeddedAssetManager);
    }
    objc_sync_exit(a1);
    return (id)qword_1F13E8;
  }
  return result;
}

+ (void)releaseSharedManager
{
  if (qword_1F13E8)
  {
    objc_sync_enter(a1);
    v3 = (void *)qword_1F13E8;
    objc_sync_enter((id)qword_1F13E8);

    qword_1F13E8 = 0;
    objc_sync_exit(v3);
    objc_sync_exit(a1);
  }
}

- (double)durationForAssetAtPath:(id)a3
{
  return 0.0;
}

- (double)startTimeForAssetAtPath:(id)a3
{
  return 0.0;
}

- (double)stopTimeForAssetAtPath:(id)a3
{
  return 0.0;
}

- (CGSize)resolutionForAssetAtPath:(id)a3
{
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  if (a3)
  {
    v6 = [a3 isAbsolutePath]
       ? +[NSURL fileURLWithPath:a3]
       : +[NSURL URLWithString:a3];
    CFURLRef v7 = (const __CFURL *)v6;
    v8 = +[AVURLAsset assetWithURL:v6];
    if (!v8) {
      goto LABEL_25;
    }
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v9 = [(AVURLAsset *)v8 tracksWithMediaType:AVMediaTypeVideo];
    id v10 = [v9 countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v48;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v48 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          objc_msgSend(v14, "naturalSize", v44, v45, v46);
          double v16 = v15;
          double v18 = v17;
          if (v14)
          {
            [v14 preferredTransform];
            double v19 = *((double *)&v44 + 1);
            double v20 = *(double *)&v44;
            double v21 = *((double *)&v45 + 1);
            double v22 = *(double *)&v45;
          }
          else
          {
            long long v45 = 0u;
            long long v46 = 0u;
            double v21 = 0.0;
            double v19 = 0.0;
            double v22 = 0.0;
            double v20 = 0.0;
            long long v44 = 0u;
          }
          double v23 = v18 * v22 + v20 * v16;
          double v24 = v18 * v21 + v19 * v16;
          if (v23 > width) {
            double width = v23;
          }
          if (v24 > height) {
            double height = v24;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v47 objects:v51 count:16];
      }
      while (v11);
    }
    if (width == CGSizeZero.width && height == CGSizeZero.height)
    {
LABEL_25:
      v26 = CGImageSourceCreateWithURL(v7, 0);
      if (v26)
      {
        v27 = v26;
        CFDictionaryRef v28 = CGImageSourceCopyPropertiesAtIndex(v26, 0, 0);
        if (v28)
        {
          CFDictionaryRef v29 = v28;
          id v30 = [(__CFDictionary *)v28 objectForKey:kCGImagePropertyPixelWidth];
          if (v30)
          {
            [v30 floatValue];
            double height = v31;
            objc_msgSend(-[__CFDictionary objectForKey:](v29, "objectForKey:", kCGImagePropertyPixelHeight), "floatValue");
            double v33 = v32;
            unsigned __int8 v34 = objc_msgSend(-[__CFDictionary objectForKey:](v29, "objectForKey:", kCGImagePropertyOrientation), "integerValue");
            if (v34 <= 4uLL) {
              double width = height;
            }
            else {
              double width = v33;
            }
            if (v34 <= 4uLL) {
              double height = v33;
            }
          }
          else
          {
            id v37 = [(__CFDictionary *)v29 valueForKey:kCGImagePropertyExifDictionary];
            if (v37)
            {
              v38 = v37;
              id v39 = [v37 objectForKeyedSubscript:kCGImagePropertyExifPixelXDimension];
              id v40 = [v38 objectForKeyedSubscript:kCGImagePropertyExifPixelYDimension];
              if (v39)
              {
                v41 = v40;
                if (v40)
                {
                  [v39 floatValue];
                  double width = v42;
                  [v41 floatValue];
                  double height = v43;
                }
              }
            }
          }
          CFRelease(v29);
        }
        CFRelease(v27);
      }
    }
  }
  double v35 = width;
  double v36 = height;
  result.double height = v36;
  result.double width = v35;
  return result;
}

- (id)creationDateForAssetAtPath:(id)a3
{
  return 0;
}

- (id)keywordsForAssetAtPath:(id)a3
{
  return 0;
}

- (double)latitudeForAssetAtPath:(id)a3
{
  return 0.0;
}

- (double)longitudeForAssetAtPath:(id)a3
{
  return 0.0;
}

- (double)altitudeForAssetAtPath:(id)a3
{
  return 0.0;
}

- (id)locationHierarchyForAssetAtPath:(id)a3
{
  return 0;
}

- (unint64_t)mediaTypeForAssetAtPath:(id)a3
{
  __int16 v5 = 0;
  char v4 = 0;
  +[MPFileValidationManager checkFileExtension:a3 isAudio:(char *)&v5 + 1 isImage:&v5 isVideo:&v4];
  if ((_BYTE)v5) {
    return 2;
  }
  if (v4) {
    return 3;
  }
  if (HIBYTE(v5)) {
    return 1;
  }
  return -1;
}

- (id)regionsOfInterestForAsset:(CGImage *)a3
{
  if (a3)
  {
    size_t Width = CGImageGetWidth(a3);
    size_t Height = CGImageGetHeight(a3);
    if (Width
      && Height
      && ((double v7 = (double)Width, v8 = (double)Height, v9 = (double)Width / (double)Height, v9 >= 0.5)
        ? (BOOL v10 = v9 <= 2.0)
        : (BOOL v10 = 0),
          v10))
    {
      id v11 = 0;
      if (v7 >= v8) {
        double v13 = (double)Width;
      }
      else {
        double v13 = (double)Height;
      }
      if (v13 >= 200.0 && Width >= 0x32 && Height >= 0x32)
      {
        v14 = [+[CIDetector detectorOfType:context:options:](CIDetector, "detectorOfType:context:options:", CIDetectorTypeFace, 0, +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", CIDetectorAccuracyLow, CIDetectorAccuracy)) featuresInImage:+[CIImage imageWithCGImage:a3]];
        id v11 = +[NSMutableArray array];
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v15 = [(NSArray *)v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v24;
          do
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v24 != v17) {
                objc_enumerationMutation(v14);
              }
              [*(id *)(*((void *)&v23 + 1) + 8 * i) bounds];
              double x = v28.origin.x;
              double y = v28.origin.y;
              double v21 = v28.size.width;
              double v22 = v28.size.height;
              v30.origin.double x = CGRectZero.origin.x;
              v30.origin.double y = CGRectZero.origin.y;
              v30.size.double width = CGRectZero.size.width;
              v30.size.double height = CGRectZero.size.height;
              if (!CGRectEqualToRect(v28, v30))
              {
                v29.origin.double x = x / v7;
                v29.origin.double y = y / v8;
                v29.size.double width = v21 / v7;
                v29.size.double height = v22 / v8;
                objc_msgSend(v11, "addObject:", +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", NSStringFromCGRect(v29), kMPMetaDataRegionOfInterestBounds, 0));
              }
            }
            id v16 = [(NSArray *)v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
          }
          while (v16);
        }
      }
    }
    else
    {
      id v11 = +[NSMutableArray array];
    }
  }
  else
  {
    id v11 = 0;
  }
  return v11;
}

- (id)regionsOfInterestForAssetAtPath:(id)a3
{
  CFDataRef v6 = (const __CFData *)[objc_alloc((Class)NSData) initWithContentsOfFile:a3 options:2 error:0];
  if (!v6) {
    goto LABEL_20;
  }
  CFDataRef v7 = v6;
  double v8 = CGImageSourceCreateWithData(v6, 0);

  if (!v8) {
    goto LABEL_20;
  }
  CFDictionaryRef v9 = CGImageSourceCopyPropertiesAtIndex(v8, 0, 0);
  if (v9)
  {
    CFDictionaryRef v10 = v9;
    objc_msgSend(-[__CFDictionary objectForKey:](v9, "objectForKey:", kCGImagePropertyPixelWidth), "floatValue");
    double width = v11;
    objc_msgSend(-[__CFDictionary objectForKey:](v10, "objectForKey:", kCGImagePropertyPixelHeight), "floatValue");
    double height = v13;
    CFRelease(v10);
  }
  else
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  if (width != 0.0 && height != 0.0)
  {
    double v15 = width / height;
    if (width / height < 0.5 || v15 > 2.0)
    {
      id v17 = +[NSMutableArray array];
      CFRelease(v8);
      goto LABEL_21;
    }
  }
  if (width <= 256.0) {
    uint64_t v18 = 0;
  }
  else {
    uint64_t v18 = (uint64_t)(width * 0.00390625);
  }
  id v19 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithObjectsAndKeys:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), @"kCGImageSourceShouldPreferRGB32", 0);
  if (v18 >= 1) {
    objc_msgSend(v19, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v18), @"kCGImageSourceSubsampleFactor");
  }
  [v19 setObject:kCFBooleanTrue forKey:kCGImageSourceCreateThumbnailWithTransform];
  [v19 setObject:kCFBooleanTrue forKey:kCGImageSourceCreateThumbnailFromImageAlways];
  LODWORD(v20) = 1132462080;
  objc_msgSend(v19, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v20), kCGImageSourceThumbnailMaxPixelSize);
  ImageAtIndedouble x = CGImageSourceCreateImageAtIndex(v8, 0, (CFDictionaryRef)v19);

  CFRelease(v8);
  if (ImageAtIndex)
  {
    double v22 = (void *)qword_1F13E8;
    objc_sync_enter((id)qword_1F13E8);
    id v17 = [(MPAssetManager *)self regionsOfInterestForAsset:ImageAtIndex];
    CGImageRelease(ImageAtIndex);
    objc_sync_exit(v22);
  }
  else
  {
LABEL_20:
    id v17 = 0;
  }
LABEL_21:
  return v17;
}

- (id)absolutePathFromPath:(id)a3
{
  return 0;
}

- (double)posterTimeForAssetAtPath:(id)a3
{
  unint64_t v3 = [(MPAssetManager *)self mediaTypeForAssetAtPath:a3];
  double result = 0.0;
  if (v3 == 3) {
    return 2.0;
  }
  return result;
}

+ (id)convertCGImageToBuffer:(CGImage *)a3
{
  id result = +[MPAssetManager convertCGImageToBufferUsingDataProvider:](MPAssetManager, "convertCGImageToBufferUsingDataProvider:");
  if (!result)
  {
    return +[MPAssetManager convertCGImageToBufferUsingRGBDevice:a3];
  }
  return result;
}

+ (id)convertCGImageToBufferUsingRGBDevice:(CGImage *)a3
{
}

+ (id)convertCGImageToBufferUsingDataProvider:(CGImage *)a3
{
  if ((CGImageGetAlphaInfo(a3) & 5) != 0 && CGImageGetBitsPerComponent(a3) == 8 && CGImageGetBitsPerPixel(a3) == 32)
  {
    CGImageGetWidth(a3);
    CGImageGetHeight(a3);
    CGColorSpaceCreateDeviceGray();
    operator new[]();
  }
  return 0;
}

@end