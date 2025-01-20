@interface PVFaceCropUtils
+ (BOOL)isValidFaceCrop:(id)a3;
+ (CGImageMetadata)createOutputMetadataFromDictionary:(id)a3;
+ (CGRect)cropBoundsInOriginalImageFromFaceCrop:(id)a3 error:(id *)a4;
+ (CGRect)faceBoundsFromFaceCrop:(id)a3 error:(id *)a4;
+ (CGSize)faceCropDimensionsFromFaceCrop:(id)a3 error:(id *)a4;
+ (id)groupingIdentifierFromFaceCrop:(id)a3 error:(id *)a4;
+ (id)newDictionaryPopulatedWithFaceCropDataFromImageData:(id)a3;
+ (id)newDictionaryRepresentationOfFaceCropDataFromFaceBox:(CGRect)a3 andCropRegion:(CGRect)a4 andGroupingIdentifier:(id)a5;
+ (id)newDictionaryWithCGImageSourceOptions;
+ (id)newFaceCropFromCGImageSource:(const CGImageSource *)a3 withFaceRect:(CGRect)a4 groupingIdentifier:(id)a5 error:(id *)a6;
+ (id)newFaceCropFromImageData:(id)a3 withFaceRect:(CGRect)a4 groupingIdentifier:(id)a5 error:(id *)a6;
+ (id)newFaceCropFromImageURL:(id)a3 withFaceRect:(CGRect)a4 groupingIdentifier:(id)a5 error:(id *)a6;
@end

@implementation PVFaceCropUtils

+ (CGSize)faceCropDimensionsFromFaceCrop:(id)a3 error:(id *)a4
{
  CFDataRef v5 = (const __CFData *)a3;
  v6 = (void *)MEMORY[0x1D26057A0]();
  if (([a1 isValidFaceCrop:v5] & 1) == 0)
  {
    v13 = @"the supplied data is not a facecrop";
    goto LABEL_7;
  }
  CFDictionaryRef v7 = +[PVFaceCropUtils newDictionaryWithCGImageSourceOptions];
  v8 = CGImageSourceCreateWithData(v5, v7);

  if (!v8)
  {
    v13 = @"could not create an image source";
LABEL_7:
    id v14 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v13 userInfo:0];
    objc_exception_throw(v14);
  }
  int v18 = -1;
  size_t v16 = 0;
  size_t v17 = 0;
  if ((getImagePropertiesFromCGImageSource(v8, &v18, &v17, &v16) & 1) == 0)
  {
    id v15 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Could not retrieve image properties" userInfo:0];
    objc_exception_throw(v15);
  }
  double v9 = (double)v17;
  double v10 = (double)v16;
  CFRelease(v8);

  double v11 = v9;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

+ (id)groupingIdentifierFromFaceCrop:(id)a3 error:(id *)a4
{
  id v4 = a3;
  CFDataRef v5 = (void *)MEMORY[0x1D26057A0]();
  id v6 = +[PVFaceCropUtils newDictionaryPopulatedWithFaceCropDataFromImageData:v4];
  CFDictionaryRef v7 = v6;
  if (!v6)
  {
    id v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"invalid face crop supplied" userInfo:0];
    objc_exception_throw(v10);
  }
  v8 = [v6 objectForKeyedSubscript:@"PVFC_GID"];

  return v8;
}

+ (CGRect)cropBoundsInOriginalImageFromFaceCrop:(id)a3 error:(id *)a4
{
  id v4 = a3;
  CGSize v5 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  rect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  rect.size = v5;
  id v6 = (void *)MEMORY[0x1D26057A0]();
  id v7 = +[PVFaceCropUtils newDictionaryPopulatedWithFaceCropDataFromImageData:v4];
  v8 = v7;
  if (!v7)
  {
    id v15 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"invalid face crop supplied" userInfo:0];
    objc_exception_throw(v15);
  }
  CFDictionaryRef v9 = [v7 objectForKeyedSubscript:@"PVFC_CB"];
  CFDictionaryRef v10 = v9;
  if (v9) {
    CGRectMakeWithDictionaryRepresentation(v9, &rect);
  }

  double x = rect.origin.x;
  double y = rect.origin.y;
  double width = rect.size.width;
  double height = rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

+ (CGRect)faceBoundsFromFaceCrop:(id)a3 error:(id *)a4
{
  id v4 = a3;
  CGSize v5 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  rect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  rect.size = v5;
  id v6 = (void *)MEMORY[0x1D26057A0]();
  id v7 = +[PVFaceCropUtils newDictionaryPopulatedWithFaceCropDataFromImageData:v4];
  v8 = v7;
  if (!v7)
  {
    id v15 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"invalid face crop supplied" userInfo:0];
    objc_exception_throw(v15);
  }
  CFDictionaryRef v9 = [v7 objectForKeyedSubscript:@"PVFC_FB"];
  CFDictionaryRef v10 = v9;
  if (v9) {
    CGRectMakeWithDictionaryRepresentation(v9, &rect);
  }

  double x = rect.origin.x;
  double y = rect.origin.y;
  double width = rect.size.width;
  double height = rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

+ (BOOL)isValidFaceCrop:(id)a3
{
  id v4 = a3;
  CGSize v5 = (void *)MEMORY[0x1D26057A0]();
  id v6 = +[PVFaceCropUtils newDictionaryPopulatedWithFaceCropDataFromImageData:v4];
  id v7 = v6;
  if (v6)
  {
    v8 = [v6 objectForKeyedSubscript:@"PVFC_VER"];
    char v9 = [v8 isEqualToNumber:&unk_1F291A540];
    if ((v9 & 1) != 0
      || ([v7 objectForKeyedSubscript:@"PVFC_VER"],
          v3 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqualToNumber:&unk_1F291A558]))
    {
      CFDictionaryRef v10 = [v7 objectForKeyedSubscript:@"PVFC_FB"];
      if (v10)
      {
        double v11 = [v7 objectForKeyedSubscript:@"PVFC_CB"];
        BOOL v12 = v11 != 0;
      }
      else
      {
        BOOL v12 = 0;
      }

      if (v9) {
        goto LABEL_12;
      }
    }
    else
    {
      BOOL v12 = 0;
    }

LABEL_12:
    goto LABEL_13;
  }
  BOOL v12 = 0;
LABEL_13:

  return v12;
}

+ (id)newFaceCropFromImageData:(id)a3 withFaceRect:(CGRect)a4 groupingIdentifier:(id)a5 error:(id *)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  CFDataRef v12 = (const __CFData *)a3;
  id v13 = a5;
  id v14 = (void *)MEMORY[0x1D26057A0]();
  if (!v12)
  {
    v20 = @"image data is nil";
    goto LABEL_9;
  }
  CFDictionaryRef v15 = +[PVFaceCropUtils newDictionaryWithCGImageSourceOptions];
  CGImageSourceRef v16 = CGImageSourceCreateWithData(v12, v15);

  if (!v16)
  {
    v20 = @"Could not create image source from data";
LABEL_9:
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v20 userInfo:0];
    objc_exception_throw(v21);
  }
  id v22 = 0;
  id v17 = +[PVFaceCropUtils newFaceCropFromCGImageSource:withFaceRect:groupingIdentifier:error:](PVFaceCropUtils, "newFaceCropFromCGImageSource:withFaceRect:groupingIdentifier:error:", v16, v13, &v22, x, y, width, height);
  id v18 = v22;
  CFRelease(v16);
  if (a6 && v18) {
    *a6 = v18;
  }

  return v17;
}

+ (id)newFaceCropFromImageURL:(id)a3 withFaceRect:(CGRect)a4 groupingIdentifier:(id)a5 error:(id *)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  CFURLRef v12 = (const __CFURL *)a3;
  id v13 = a5;
  id v14 = (void *)MEMORY[0x1D26057A0]();
  if (!v12)
  {
    v20 = @"image url is nil";
    goto LABEL_9;
  }
  CFDictionaryRef v15 = +[PVFaceCropUtils newDictionaryWithCGImageSourceOptions];
  CGImageSourceRef v16 = CGImageSourceCreateWithURL(v12, v15);

  if (!v16)
  {
    v20 = @"Could not create image source from URL";
LABEL_9:
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v20 userInfo:0];
    objc_exception_throw(v21);
  }
  id v22 = 0;
  id v17 = +[PVFaceCropUtils newFaceCropFromCGImageSource:withFaceRect:groupingIdentifier:error:](PVFaceCropUtils, "newFaceCropFromCGImageSource:withFaceRect:groupingIdentifier:error:", v16, v13, &v22, x, y, width, height);
  id v18 = v22;
  CFRelease(v16);
  if (a6 && v18) {
    *a6 = v18;
  }

  return v17;
}

+ (id)newFaceCropFromCGImageSource:(const CGImageSource *)a3 withFaceRect:(CGRect)a4 groupingIdentifier:(id)a5 error:(id *)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v50[1] = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  context = (void *)MEMORY[0x1D26057A0]();
  if (!a3)
  {
    id v38 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"unexpected nil image source" userInfo:0];
    objc_exception_throw(v38);
  }
  int v48 = -1;
  size_t v46 = 0;
  size_t v47 = 0;
  if ((getImagePropertiesFromCGImageSource(a3, &v48, &v47, &v46) & 1) == 0)
  {
    v37 = @"invalid image source";
LABEL_29:
    id v39 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v37 userInfo:0];
    objc_exception_throw(v39);
  }
  if (!(unint64_t)(width + 0.5) || !(unint64_t)(height + 0.5))
  {
    v37 = @"zero dimensioned face rect submitted";
    goto LABEL_29;
  }
  unint64_t v12 = v47;
  if (x < 0.0 || y < 0.0)
  {
    unint64_t v13 = v46;
LABEL_14:
    v54.size.double width = (double)v47;
    v54.size.double height = (double)v13;
    v54.origin.double x = 0.0;
    v54.origin.double y = 0.0;
    v51.origin.double x = x;
    v51.origin.double y = y;
    v51.size.double width = width;
    v51.size.double height = height;
    CGRect v52 = CGRectIntersection(v51, v54);
    double x = v52.origin.x;
    double width = v52.size.width;
    unint64_t v13 = v46;
    unint64_t v12 = v47;
    goto LABEL_15;
  }
  unint64_t v13 = v46;
  if (v47 < (unint64_t)(width + x + 0.5) || v46 < (unint64_t)(height + y + 0.5)) {
    goto LABEL_14;
  }
LABEL_15:
  v53.origin.double x = makeRectWithAllIntegers(x + width * 0.5 - (width + width) * 0.5);
  v55.size.double width = (double)v12;
  v55.size.double height = (double)v13;
  v55.origin.double x = 0.0;
  v55.origin.double y = 0.0;
  *(void *)&double v15 = (unint64_t)CGRectIntersection(v53, v55);
  double RectWithAllIntegers = makeRectWithAllIntegers(v15);
  double v20 = v19;
  double v21 = v16;
  double v22 = v17;
  if (v16 >= v17) {
    double v23 = v16;
  }
  else {
    double v23 = v17;
  }
  if (v23 <= 256.0) {
    double v24 = 1.0;
  }
  else {
    double v24 = 256.0 / v23;
  }
  double v44 = makeRectWithAllIntegers((x - RectWithAllIntegers) * v24);
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  OrientedCroppedAndScaledImageFromCGImageSource = createOrientedCroppedAndScaledImageFromCGImageSource(a3, RectWithAllIntegers, v20, v21, v22, v24);
  if (!OrientedCroppedAndScaledImageFromCGImageSource)
  {
    id v40 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"could not create cropped face crop image" userInfo:0];
    objc_exception_throw(v40);
  }
  id v32 = +[PVFaceCropUtils newDictionaryRepresentationOfFaceCropDataFromFaceBox:andCropRegion:andGroupingIdentifier:](PVFaceCropUtils, "newDictionaryRepresentationOfFaceCropDataFromFaceBox:andCropRegion:andGroupingIdentifier:", v11, v44, v26, v28, v30, RectWithAllIntegers, v20, v21, v22);
  v33 = +[PVFaceCropUtils createOutputMetadataFromDictionary:v32];
  if (!v33)
  {
    id v41 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"could not create face crop metadata" userInfo:0];
    objc_exception_throw(v41);
  }
  v34 = [MEMORY[0x1E4F1CA58] data];
  v35 = CGImageDestinationCreateWithData(v34, @"public.jpeg", 1uLL, 0);
  if (!v35)
  {
    id v42 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"could not create face crop data" userInfo:0];
    objc_exception_throw(v42);
  }
  uint64_t v49 = *MEMORY[0x1E4F2F430];
  v50[0] = &unk_1F291A4E8;
  CGImageDestinationAddImageAndMetadata(v35, OrientedCroppedAndScaledImageFromCGImageSource, v33, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:&v49 count:1]);
  if (!CGImageDestinationFinalize(v35))
  {
    id v43 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"could not write face crop data" userInfo:0];
    objc_exception_throw(v43);
  }

  CGImageRelease(OrientedCroppedAndScaledImageFromCGImageSource);
  CFRelease(v33);
  CFRelease(v35);

  return v34;
}

+ (id)newDictionaryWithCGImageSourceOptions
{
  v5[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F2FF88];
  v4[0] = *MEMORY[0x1E4F2FF08];
  v4[1] = v2;
  v5[0] = MEMORY[0x1E4F1CC28];
  v5[1] = MEMORY[0x1E4F1CC28];
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)newDictionaryRepresentationOfFaceCropDataFromFaceBox:(CGRect)a3 andCropRegion:(CGRect)a4 andGroupingIdentifier:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v9 = a3.size.height;
  CGFloat v10 = a3.size.width;
  CGFloat v11 = a3.origin.y;
  CGFloat v12 = a3.origin.x;
  id v13 = a5;
  id v14 = objc_opt_new();
  [v14 setObject:&unk_1F291A540 forKey:@"PVFC_VER"];
  v18.origin.CGFloat x = v12;
  v18.origin.CGFloat y = v11;
  v18.size.CGFloat width = v10;
  v18.size.CGFloat height = v9;
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v18);
  [v14 setObject:DictionaryRepresentation forKey:@"PVFC_FB"];

  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CFDictionaryRef v16 = CGRectCreateDictionaryRepresentation(v19);
  [v14 setObject:v16 forKey:@"PVFC_CB"];

  [v14 setObject:&unk_1F291A540 forKey:@"PVFC_VER"];
  if (v13) {
    [v14 setObject:v13 forKey:@"PVFC_GID"];
  }

  return v14;
}

+ (id)newDictionaryPopulatedWithFaceCropDataFromImageData:(id)a3
{
  CFDataRef v3 = (const __CFData *)a3;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D26057A0]();
    CGSize v5 = CGImageSourceCreateWithData(v3, 0);
    id v6 = v5;
    if (!v5)
    {
      id v16 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Could not create image source" userInfo:0];
      objc_exception_throw(v16);
    }
    id v7 = CGImageSourceCopyMetadataAtIndex(v5, 0, 0);
    v8 = v7;
    if (!v7)
    {
      id v17 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"No meta data exists on image" userInfo:0];
      objc_exception_throw(v17);
    }
    CGFloat v9 = (__CFString *)CGImageMetadataCopyStringValueWithPath(v7, 0, @"PVFC:PVFC");
    CGFloat v10 = v9;
    if (v9)
    {
      CGFloat v11 = (void *)MEMORY[0x1E4F28D90];
      CGFloat v12 = [(__CFString *)v9 dataUsingEncoding:4];
      uint64_t v13 = [v11 JSONObjectWithData:v12 options:1 error:0];
    }
    else
    {
      uint64_t v13 = 0;
    }

    CFRelease(v8);
    id v14 = (void *)v13;
    if (v6) {
      CFRelease(v6);
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

+ (CGImageMetadata)createOutputMetadataFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1D26057A0]();
  Mutable = CGImageMetadataCreateMutable();
  if (!CGImageMetadataSetValueWithPath(Mutable, 0, @"tiff:Orientation", @"1"))
  {
    CGFloat v9 = @"Could not set output orientation";
    goto LABEL_9;
  }
  if (!CGImageMetadataRegisterNamespaceForPrefix(Mutable, @"com.apple/PhotoVision/FaceCrop/", @"PVFC", 0))
  {
    CGFloat v9 = @"Could not register face crop namespace";
LABEL_9:
    id v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v9 userInfo:0];
    objc_exception_throw(v10);
  }
  id v6 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:1 error:0];
  if (!v6)
  {
    id v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Could not generate serialized metadata representation" userInfo:0];
    objc_exception_throw(v11);
  }
  id v7 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
  if (!v7)
  {
    CGFloat v12 = @"Could not convert metadata representation into serialized format";
    goto LABEL_13;
  }
  if (!CGImageMetadataSetValueWithPath(Mutable, 0, @"PVFC:PVFC", v7))
  {
    CGFloat v12 = @"Could not set face crop metadata";
LABEL_13:
    id v13 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v12 userInfo:0];
    objc_exception_throw(v13);
  }

  return Mutable;
}

@end