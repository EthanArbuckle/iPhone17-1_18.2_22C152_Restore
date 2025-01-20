@interface PLThumbnailUtilities
+ (BOOL)_performSWDownscaleTo5551OnSourceImage:(CGImage *)a3 withSourceDimensions:(id)a4 withSpecification:(id)a5 destinationData:(id)a6 imageRect:(CGRect *)a7 bytesPerRow:(int *)a8;
+ (BOOL)_validateSpecification:(id)a3 destinationData:(id *)a4;
+ (BOOL)_validateSpecifications:(id)a3 destinationData:(id *)a4;
+ (BOOL)performHWCascadingDownscaleTo5551OnIOSurface:(__IOSurface *)a3 withSpecifications:(id)a4 destinationData:(id *)a5 usingContext:(id)a6;
+ (BOOL)performSWCascadingDownscaleTo5551OnImage:(CGImage *)a3 withSpecifications:(id)a4 destinationData:(id *)a5;
+ (BOOL)performSWDownscaleTo5551OnImage:(CGImage *)a3 withSpecification:(id)a4 destinationData:(id *)a5 imageRect:(CGRect *)a6 bytesPerRow:(int *)a7;
+ (id)_destinationDataArrayFromSpecifications:(id)a3;
+ (id)_destinationDataFromSpecification:(id)a3;
+ (int)_bytesPerRowForSpecification:(id)a3;
+ (int)_requiredDataLengthForSpecification:(id)a3;
@end

@implementation PLThumbnailUtilities

+ (BOOL)performSWCascadingDownscaleTo5551OnImage:(CGImage *)a3 withSpecifications:(id)a4 destinationData:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v29 = a1;
  if ([a1 _validateSpecifications:v8 destinationData:a5])
  {
    id v30 = *a5;
    CGImageGetWidth(a3);
    CGImageGetHeight(a3);
    uint64_t v25 = PLSizeMake();
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = v8;
    uint64_t v9 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v24 = v8;
      SquareCroppedImage = 0;
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      CGImageRef image = a3;
      uint64_t v28 = *(void *)v32;
      uint64_t v14 = *MEMORY[0x1E4F8C838];
LABEL_4:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v32 != v28) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v31 + 1) + 8 * v15);
        v17 = [v16 objectForKey:v14];
        int v18 = [v17 intValue];

        if (v18 == 2)
        {
          v19 = SquareCroppedImage;
          uint64_t v20 = v12;
          if (!SquareCroppedImage)
          {
            SquareCroppedImage = PLThumbnailCreateSquareCroppedImage(image);
            CGImageGetWidth(SquareCroppedImage);
            CGImageGetHeight(SquareCroppedImage);
            uint64_t v12 = PLSizeMake();
            v19 = SquareCroppedImage;
            uint64_t v20 = v12;
          }
        }
        else
        {
          v19 = image;
          uint64_t v20 = v25;
        }
        v21 = [v30 objectAtIndex:v13 + v15];
        int v22 = [v29 _performSWDownscaleTo5551OnSourceImage:v19 withSourceDimensions:v20 withSpecification:v16 destinationData:v21 imageRect:0 bytesPerRow:0];

        if (!v22) {
          break;
        }
        if (v10 == ++v15)
        {
          v13 += v15;
          uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
          if (v10) {
            goto LABEL_4;
          }
          LOBYTE(v22) = 1;
          break;
        }
      }
      id v8 = v24;
    }
    else
    {
      SquareCroppedImage = 0;
      LOBYTE(v22) = 1;
    }

    CGImageRelease(SquareCroppedImage);
  }
  else
  {
    LOBYTE(v22) = 0;
  }

  return v22;
}

+ (BOOL)performSWDownscaleTo5551OnImage:(CGImage *)a3 withSpecification:(id)a4 destinationData:(id *)a5 imageRect:(CGRect *)a6 bytesPerRow:(int *)a7
{
  id v12 = a4;
  if ([a1 _validateSpecification:v12 destinationData:a5])
  {
    id v13 = *a5;
    CGImageGetWidth(a3);
    CGImageGetHeight(a3);
    char v14 = [a1 _performSWDownscaleTo5551OnSourceImage:a3 withSourceDimensions:PLSizeMake() withSpecification:v12 destinationData:v13 imageRect:a6 bytesPerRow:a7];
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

+ (BOOL)_performSWDownscaleTo5551OnSourceImage:(CGImage *)a3 withSourceDimensions:(id)a4 withSpecification:(id)a5 destinationData:(id)a6 imageRect:(CGRect *)a7 bytesPerRow:(int *)a8
{
  id v13 = a5;
  id v14 = a6;
  if (a3)
  {
    uint64_t v15 = [v13 objectForKey:*MEMORY[0x1E4F8C848]];
    [v15 intValue];
    v16 = [v13 objectForKey:*MEMORY[0x1E4F8C840]];
    [v16 intValue];
    uint64_t v17 = PLSizeMake();

    PLRectByCenteringAndScalingDimensionsToFitDimensions();
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    int v26 = [a1 _bytesPerRowForSpecification:v13];
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    uint64_t v28 = CGBitmapContextCreate((void *)[v14 mutableBytes], (int)v17, v17 >> 32, 5uLL, v26, DeviceRGB, 0x1006u);
    BOOL v29 = v28 != 0;
    if (v28)
    {
      id v30 = v28;
      v32.origin.x = v19;
      v32.origin.y = v21;
      v32.size.width = v23;
      v32.size.height = v25;
      CGContextDrawImage(v28, v32, a3);
      CGContextRelease(v30);
    }
    CGColorSpaceRelease(DeviceRGB);
    if (a7)
    {
      a7->origin.x = v19;
      a7->origin.y = v21;
      a7->size.width = v23;
      a7->size.height = v25;
    }
    if (a8) {
      *a8 = v26;
    }
  }
  else
  {
    BOOL v29 = 0;
  }

  return v29;
}

+ (BOOL)performHWCascadingDownscaleTo5551OnIOSurface:(__IOSurface *)a3 withSpecifications:(id)a4 destinationData:(id *)a5 usingContext:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  int v12 = [a1 _validateSpecifications:v10 destinationData:a5];
  char v13 = 0;
  if (!v12 || !a3 || !v11) {
    goto LABEL_16;
  }
  id v14 = *a5;
  uint64_t v15 = [v10 count];
  uint64_t v16 = v15 << 32;
  uint64_t v17 = malloc_type_malloc(8 * (int)v15, 0x100004000313F17uLL);
  double v18 = malloc_type_malloc(4 * (int)v15, 0x100004052888210uLL);
  if (v15 << 32)
  {
    uint64_t v30 = v15;
    long long v31 = a3;
    id v32 = v14;
    long long v33 = v11;
    uint64_t v19 = 0;
    uint64_t v35 = *MEMORY[0x1E4F8C848];
    uint64_t v34 = *MEMORY[0x1E4F8C840];
    uint64_t v20 = *MEMORY[0x1E4F8C838];
    if ((unint64_t)(v16 >> 32) <= 1) {
      uint64_t v21 = 1;
    }
    else {
      uint64_t v21 = v16 >> 32;
    }
    double v22 = v17;
    do
    {
      CGFloat v23 = [v10 objectAtIndex:v19];
      [v23 objectForKey:v35];
      v25 = id v24 = v10;
      [v25 intValue];
      int v26 = [v23 objectForKey:v34];
      [v26 intValue];
      uint64_t v27 = PLSizeMake();

      id v10 = v24;
      v22[v19] = v27;
      uint64_t v28 = [v23 objectForKey:v20];
      v18[v19] = [v28 intValue];

      ++v19;
    }
    while (v21 != v19);
    id v14 = v32;
    id v11 = v33;
    uint64_t v17 = v22;
    char v13 = [v33 downscaleImageSurface:v31 destinationCount:v30 sizes:v22 cropModes:v18 pixelFormat:892679473 bytesPerRowAlignment:16 destinationData:v32];
    goto LABEL_12;
  }
  char v13 = [v11 downscaleImageSurface:a3 destinationCount:v15 sizes:v17 cropModes:v18 pixelFormat:892679473 bytesPerRowAlignment:16 destinationData:v14];
  if (v17) {
LABEL_12:
  }
    free(v17);
  if (v18) {
    free(v18);
  }

LABEL_16:
  return v13;
}

+ (BOOL)_validateSpecifications:(id)a3 destinationData:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (!a4) {
    goto LABEL_21;
  }
  uint64_t v8 = [v6 count];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    long long v33 = a4;
    id v34 = a1;
    uint64_t v35 = v7;
    uint64_t v12 = *(void *)v37;
    uint64_t v13 = *MEMORY[0x1E4F8C848];
    uint64_t v14 = *MEMORY[0x1E4F8C840];
    uint64_t v15 = *MEMORY[0x1E4F8C838];
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v17 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v18 = [v17 objectForKey:v13];
        if (!v18) {
          goto LABEL_23;
        }
        uint64_t v19 = (void *)v18;
        uint64_t v20 = [v17 objectForKey:v14];
        if (!v20)
        {

LABEL_23:
          BOOL v31 = 0;
          v7 = v35;
          goto LABEL_24;
        }
        uint64_t v21 = (void *)v20;
        double v22 = [v17 objectForKey:v15];

        if (!v22) {
          goto LABEL_23;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v11) {
        continue;
      }
      break;
    }

    a1 = v34;
    v7 = v35;
    a4 = v33;
    goto LABEL_14;
  }

  if (!v8)
  {
LABEL_21:
    BOOL v31 = 0;
    goto LABEL_25;
  }
LABEL_14:
  id v23 = *a4;
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = [v9 count];
    if (v25 == [v24 count])
    {
      if ([v9 count])
      {
        unint64_t v26 = 0;
        do
        {
          uint64_t v27 = [v24 objectAtIndex:v26];
          uint64_t v28 = [v9 objectAtIndex:v26];
          unint64_t v29 = [v27 length];
          int v30 = [a1 _requiredDataLengthForSpecification:v28];

          BOOL v31 = v29 >= v30;
          if (v29 < v30) {
            break;
          }
          ++v26;
          BOOL v31 = 1;
        }
        while (v26 < [v9 count]);
      }
      else
      {
        BOOL v31 = 1;
      }
    }
    else
    {
      BOOL v31 = 0;
    }
    id v9 = v24;
  }
  else
  {
    [a1 _destinationDataArrayFromSpecifications:v9];
    id v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v31 = 1;
  }
LABEL_24:

LABEL_25:
  return v31;
}

+ (BOOL)_validateSpecification:(id)a3 destinationData:(id *)a4
{
  id v6 = a3;
  v7 = v6;
  if (a4)
  {
    uint64_t v8 = [v6 objectForKey:*MEMORY[0x1E4F8C848]];
    if (v8)
    {
      id v9 = (void *)v8;
      uint64_t v10 = [v7 objectForKey:*MEMORY[0x1E4F8C840]];
      if (v10)
      {
        uint64_t v11 = (void *)v10;
        uint64_t v12 = [v7 objectForKey:*MEMORY[0x1E4F8C838]];

        if (v12)
        {
          id v13 = *a4;
          id v14 = *a4;
          if (v13)
          {
            uint64_t v15 = v14;
            a4 = (id *)[v14 length];

            LOBYTE(a4) = (unint64_t)a4 >= (int)[a1 _requiredDataLengthForSpecification:v7];
          }
          else
          {
            *a4 = [a1 _destinationDataFromSpecification:v7];
            LOBYTE(a4) = 1;
          }
          goto LABEL_9;
        }
      }
      else
      {
      }
    }
    LOBYTE(a4) = 0;
  }
LABEL_9:

  return (char)a4;
}

+ (id)_destinationDataArrayFromSpecifications:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(a1, "_destinationDataFromSpecification:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)_destinationDataFromSpecification:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA58];
  id v5 = a3;
  id v6 = [v4 alloc];
  LODWORD(a1) = [a1 _requiredDataLengthForSpecification:v5];

  uint64_t v7 = (void *)[v6 initWithLength:(int)a1];
  return v7;
}

+ (int)_requiredDataLengthForSpecification:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F8C840];
  id v5 = a3;
  id v6 = [v5 objectForKey:v4];
  int v7 = [v6 intValue];

  LODWORD(a1) = [a1 _bytesPerRowForSpecification:v5];
  return a1 * v7;
}

+ (int)_bytesPerRowForSpecification:(id)a3
{
  uint64_t v3 = *MEMORY[0x1E4F8C848];
  id v4 = a3;
  id v5 = [v4 objectForKey:v3];
  uint64_t v6 = [v5 intValue];

  int v7 = [v4 objectForKey:*MEMORY[0x1E4F8CB78]];

  LOWORD(v4) = [v7 intValue];
  uint64_t v8 = [MEMORY[0x1E4F8B938] formatWithID:(unsigned __int16)v4];
  LODWORD(v4) = [v8 tableFormatBytesPerRowForWidth:v6];

  return (int)v4;
}

@end