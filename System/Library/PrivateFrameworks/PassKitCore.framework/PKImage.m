@interface PKImage
+ (BOOL)supportsSecureCoding;
+ (id)URLForImageNamed:(id)a3 inBundle:(id)a4 scale:(double *)a5;
+ (id)URLForImageNamed:(id)a3 inBundle:(id)a4 scale:(double *)a5 preferredScreenScale:(double)a6 suffix:(id)a7;
+ (id)hashOfImageNamed:(id)a3 inBundle:(id)a4;
+ (id)imageNamed:(id)a3 inBundle:(id)a4;
+ (id)imageNamed:(id)a3 inBundle:(id)a4 screenScale:(double)a5 suffix:(id)a6;
+ (id)newImageNamed:(id)a3 inBundle:(id)a4;
+ (id)newImageNamed:(id)a3 inBundle:(id)a4 screenScale:(double)a5 suffix:(id)a6;
+ (id)passesImageNamed:(id)a3;
- (BOOL)_isTiledWhenStretchedToSize:(CGSize)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToImage:(id)a3;
- (BOOL)stretches;
- (BOOL)tiles;
- (CGImage)imageRef;
- (CGSize)downscaleSizeMatchingScale:(double)a3;
- (CGSize)size;
- (NSData)imageData;
- (PKEdgeInsets)capInsets;
- (PKImage)imageWithoutCapInsets;
- (PKImage)init;
- (PKImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5;
- (PKImage)initWithCoder:(id)a3;
- (PKImage)initWithData:(id)a3 scale:(double)a4;
- (double)scale;
- (id)blurredImageWithRadius:(unint64_t)a3 constraints:(id)a4;
- (id)croppedImageWithInsets:(PKEdgeInsets)a3;
- (id)imageHash;
- (id)resizableImageByStretchingWithCapInsets:(PKEdgeInsets)a3;
- (id)resizableImageByTilingCenterPixel;
- (id)resizableImageByTilingWithCapInsets:(PKEdgeInsets)a3;
- (id)resizedImageWithConstraints:(id)a3;
- (int64_t)orientation;
- (void)_queue_createImageRefIfNecessary;
- (void)dealloc;
- (void)drawInRect:(CGRect)a3 inContext:(CGContext *)a4;
- (void)drawInRect:(CGRect)a3 inContext:(CGContext *)a4 withBlendMode:(int)a5 alpha:(double)a6;
- (void)encodeWithCoder:(id)a3;
- (void)preheatBitmapData;
@end

@implementation PKImage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)URLForImageNamed:(id)a3 inBundle:(id)a4 scale:(double *)a5 preferredScreenScale:(double)a6 suffix:(id)a7
{
  v64[3] = *MEMORY[0x1E4F143B8];
  v11 = (__CFString *)a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = 0;
  v44 = v12;
  if (v11 && v12)
  {
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x3032000000;
    v52 = __Block_byref_object_copy__7;
    v53 = __Block_byref_object_dispose__7;
    id v54 = 0;
    v15 = [(__CFString *)v11 pathExtension];
    v40 = a5;
    if ([(__CFString *)v15 length])
    {
      [(__CFString *)v11 stringByDeletingPathExtension];
      v41 = v15;
      v15 = v11;
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v41 = @"png";
    }

    v43 = [(__CFString *)v11 stringByAppendingString:@"@1x"];
    if (v13)
    {
      v16 = [(__CFString *)v11 stringByAppendingString:v13];
      v42 = [v16 stringByAppendingString:@"@1x"];

      v17 = [(__CFString *)v11 stringByAppendingString:@"@2x"];
      v18 = [(__CFString *)v11 stringByAppendingString:v13];
      v19 = [v18 stringByAppendingString:@"@2x"];

      v20 = [(__CFString *)v11 stringByAppendingString:@"@3x"];
      v21 = [(__CFString *)v11 stringByAppendingString:v13];
      v22 = [v21 stringByAppendingString:@"@3x"];

      v62[0] = v42;
      v62[1] = v11;
      v62[2] = v43;
      v63[0] = &unk_1EE22B888;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:3];
      v64[0] = v23;
      v63[1] = &unk_1EE22B8A0;
      v61[0] = v19;
      v61[1] = v17;
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
      v64[1] = v24;
      v63[2] = &unk_1EE22B8B8;
      v60[0] = v22;
      v60[1] = v20;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
      v64[2] = v25;
      v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:3];
    }
    else
    {
      v42 = [(__CFString *)v11 stringByAppendingString:@"@2x"];
      v17 = [(__CFString *)v11 stringByAppendingString:@"@3x"];
      v57[0] = v11;
      v57[1] = v43;
      v58[0] = &unk_1EE22B888;
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
      v59[0] = v19;
      v58[1] = &unk_1EE22B8A0;
      v56 = v42;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
      v59[1] = v20;
      v58[2] = &unk_1EE22B8B8;
      v55 = v17;
      v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
      v59[2] = v22;
      v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:3];
    }

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __71__PKImage_URLForImageNamed_inBundle_scale_preferredScreenScale_suffix___block_invoke;
    aBlock[3] = &unk_1E56DCDD8;
    v48 = &v49;
    id v46 = v44;
    v27 = v41;
    v47 = v27;
    v28 = (void (**)(void *, void *))_Block_copy(aBlock);
    if (a6 <= 0.0) {
      a6 = PKScreenScale();
    }
    v29 = [NSNumber numberWithDouble:a6];
    v30 = [v26 objectForKey:v29];
    v28[2](v28, v30);

    if (v50[5])
    {
      double v31 = a6;
    }
    else
    {
      double v31 = a6;
      do
      {
        double v31 = v31 + 1.0;
        if (v31 > 3.0) {
          break;
        }
        v32 = [NSNumber numberWithDouble:v31];
        v33 = [v26 objectForKey:v32];
        int v34 = ((uint64_t (*)(void *, void *))v28[2])(v28, v33);
        int v35 = v31 >= 3.0 ? 1 : v34;
      }
      while (!v35);
      if (!v50[5])
      {
        double v31 = a6;
        do
        {
          double v31 = v31 + -1.0;
          if (v31 <= 0.0) {
            break;
          }
          v36 = [NSNumber numberWithDouble:v31];
          v37 = [v26 objectForKey:v36];
          int v38 = ((uint64_t (*)(void *, void *))v28[2])(v28, v37);
        }
        while (!v38);
      }
    }
    if (v40) {
      double *v40 = v31;
    }
    id v14 = (id)v50[5];

    _Block_object_dispose(&v49, 8);
  }

  return v14;
}

BOOL __71__PKImage_URLForImageNamed_inBundle_scale_preferredScreenScale_suffix___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v14 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "URLForResource:withExtension:", *(void *)(*((void *)&v13 + 1) + 8 * v7), *(void *)(a1 + 40), (void)v13);
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  BOOL v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
  return v11;
}

- (BOOL)tiles
{
  return self->_shouldTile;
}

- (PKImage)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKImage *)self init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x192FDC630]();
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageData"];
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v7;

    [v4 decodeFloatForKey:@"scale"];
    v5->_scale = v9;
    v5->_orientation = [v4 decodeIntegerForKey:@"orientation"];
    v5->_shouldTile = [v4 decodeBoolForKey:@"shouldTile"];
    int v10 = [v4 decodeBoolForKey:@"shouldStretch"];
    v5->_shouldStretch = v10;
    if (v5->_shouldTile || v10)
    {
      [v4 decodeFloatForKey:@"leftCap"];
      v5->_capInsets.left = v11;
      [v4 decodeFloatForKey:@"rightCap"];
      v5->_capInsets.right = v12;
      [v4 decodeFloatForKey:@"topCap"];
      v5->_capInsets.top = v13;
      [v4 decodeFloatForKey:@"bottomCap"];
      v5->_capInsets.bottom = v14;
    }
  }

  return v5;
}

- (PKImage)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKImage;
  result = [(PKImage *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void).cxx_destruct
{
}

+ (id)imageNamed:(id)a3 inBundle:(id)a4 screenScale:(double)a5 suffix:(id)a6
{
  uint64_t v6 = (void *)[a1 newImageNamed:a3 inBundle:a4 screenScale:a6 suffix:a5];
  return v6;
}

+ (id)newImageNamed:(id)a3 inBundle:(id)a4 screenScale:(double)a5 suffix:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v21 = 0x3FF0000000000000;
  float v13 = [a1 URLForImageNamed:v10 inBundle:v11 scale:&v21 preferredScreenScale:v12 suffix:a5];
  double v14 = *(double *)&v21;
  id v15 = v13;
  long long v16 = (void *)MEMORY[0x192FDC630]();
  if (v15
    && ([MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v15],
        (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v18 = (void *)v17;
    v19 = [[PKImage alloc] initWithData:v17 scale:v14];
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (PKImage)initWithData:(id)a3 scale:(double)a4
{
  id v7 = a3;
  uint64_t v8 = [(PKImage *)self init];
  float v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_imageData, a3);
    v9->_scale = a4;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  id v4 = (void *)MEMORY[0x192FDC630]();
  uint64_t v5 = [(PKImage *)self imageData];
  [v11 encodeObject:v5 forKey:@"imageData"];

  [(PKImage *)self scale];
  *(float *)&double v6 = v6;
  [v11 encodeFloat:@"scale" forKey:v6];
  objc_msgSend(v11, "encodeInteger:forKey:", -[PKImage orientation](self, "orientation"), @"orientation");
  [v11 encodeBool:self->_shouldTile forKey:@"shouldTile"];
  [v11 encodeBool:self->_shouldStretch forKey:@"shouldStretch"];
  if (*(_WORD *)&self->_shouldTile)
  {
    double left = self->_capInsets.left;
    *(float *)&double left = left;
    [v11 encodeFloat:@"leftCap" forKey:left];
    double right = self->_capInsets.right;
    *(float *)&double right = right;
    [v11 encodeFloat:@"rightCap" forKey:right];
    double top = self->_capInsets.top;
    *(float *)&double top = top;
    [v11 encodeFloat:@"topCap" forKey:top];
    double bottom = self->_capInsets.bottom;
    *(float *)&double bottom = bottom;
    [v11 encodeFloat:@"bottomCap" forKey:bottom];
  }
}

- (double)scale
{
  return self->_scale;
}

- (NSData)imageData
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  imageData = self->_imageData;
  if (imageData)
  {
    uint64_t v5 = imageData;
  }
  else if (self->_imageRef)
  {
    double v6 = (void *)MEMORY[0x192FDC630]();
    imageRef = self->_imageRef;
    uint64_t v8 = (__CFData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
    float v9 = v8;
    if (v8)
    {
      CGImageDestinationRef v10 = CGImageDestinationCreateWithData(v8, @"public.png", 1uLL, 0);
      if (v10)
      {
        id v11 = v10;
        id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        float v13 = (void *)[objc_alloc(NSNumber) initWithLong:8];
        id v14 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        id v15 = objc_msgSend(v14, "initWithObjectsAndKeys:", v13, *MEMORY[0x1E4F2FCB8], 0);
        [v12 setObject:v15 forKey:*MEMORY[0x1E4F2FCD8]];
        long long v16 = (void *)[objc_alloc(NSNumber) initWithLong:2];
        [v12 setObject:v16 forKey:*MEMORY[0x1E4F2FCB0]];
        CGImageDestinationAddImage(v11, imageRef, (CFDictionaryRef)v12);
        BOOL v17 = CGImageDestinationFinalize(v11);
        CFRelease(v11);

        if (v17) {
          uint64_t v18 = v9;
        }
        else {
          uint64_t v18 = 0;
        }
      }
      else
      {
        uint64_t v18 = 0;
      }
      uint64_t v5 = v18;
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (CGImage)imageRef
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(PKImage *)self _queue_createImageRefIfNecessary];
  imageRef = self->_imageRef;
  os_unfair_lock_unlock(p_lock);
  return imageRef;
}

- (int64_t)orientation
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(PKImage *)self _queue_createImageRefIfNecessary];
  int64_t orientation = self->_orientation;
  os_unfair_lock_unlock(p_lock);
  return orientation;
}

- (void)_queue_createImageRefIfNecessary
{
  if (!self->_imageRef)
  {
    p_int64_t orientation = &self->_orientation;
    int64_t orientation = self->_orientation;
    imageData = self->_imageData;
    if (orientation) {
      p_int64_t orientation = 0;
    }
    CGImageFromData = _CreateCGImageFromData(imageData, p_orientation);
    id v7 = self->_imageData;
    self->_imageData = 0;
    self->_imageRef = CGImageFromData;
  }
}

- (PKEdgeInsets)capInsets
{
  if (self->_shouldTile || self->_shouldStretch)
  {
    double top = self->_capInsets.top;
    double left = self->_capInsets.left;
    double bottom = self->_capInsets.bottom;
    double right = self->_capInsets.right;
  }
  else
  {
    double left = 0.0;
    double top = 0.0;
    double bottom = 0.0;
    double right = 0.0;
  }
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

+ (id)URLForImageNamed:(id)a3 inBundle:(id)a4 scale:(double *)a5
{
  return (id)[a1 URLForImageNamed:a3 inBundle:a4 scale:a5 preferredScreenScale:0 suffix:0.0];
}

- (BOOL)stretches
{
  return self->_shouldStretch;
}

- (void)dealloc
{
  CGImageRelease(self->_imageRef);
  v3.receiver = self;
  v3.super_class = (Class)PKImage;
  [(PKImage *)&v3 dealloc];
}

- (void)drawInRect:(CGRect)a3 inContext:(CGContext *)a4 withBlendMode:(int)a5 alpha:(double)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectIsEmpty(a3))
  {
    [(PKImage *)self size];
    if (v14 > 0.0)
    {
      double v16 = v15;
      if (v15 > 0.0)
      {
        double v17 = v14;
        CGContextSaveGState(a4);
        CGContextSetBlendMode(a4, (CGBlendMode)a5);
        CGContextSetAlpha(a4, a6);
        v42.origin.CGFloat x = x;
        v42.origin.CGFloat y = y;
        v42.size.double width = width;
        v42.size.double height = height;
        CGFloat MinX = CGRectGetMinX(v42);
        v43.origin.CGFloat x = x;
        v43.origin.CGFloat y = y;
        v43.size.double width = width;
        v43.size.double height = height;
        CGFloat MaxY = CGRectGetMaxY(v43);
        CGContextTranslateCTM(a4, MinX, MaxY);
        CGContextScaleCTM(a4, 1.0, -1.0);
        int64_t v20 = [(PKImage *)self orientation];
        if (height > 0.0 && width > 0.0 && (unint64_t)(v20 - 2) <= 6)
        {
          long long v21 = xmmword_1916739C0;
          CGFloat v22 = -1.0;
          double v23 = 0.0;
          CGFloat v24 = 0.0;
          CGFloat v25 = width;
          switch(v20)
          {
            case 2:
              break;
            case 3:
              long long v21 = xmmword_1916739D0;
              goto LABEL_12;
            case 4:
              long long v21 = xmmword_1916739D0;
              CGFloat v22 = 1.0;
              CGFloat v25 = 0.0;
              CGFloat v24 = height;
              break;
            case 5:
              double v23 = -height / width;
              *((void *)&v21 + 1) = 0;
              *(double *)&long long v21 = -width / height;
              CGFloat v22 = 0.0;
LABEL_12:
              CGFloat v24 = height;
              CGFloat v25 = width;
              break;
            case 6:
              double v23 = -height / width;
              *((void *)&v21 + 1) = 0;
              *(double *)&long long v21 = width / height;
              CGFloat v25 = 0.0;
              CGFloat v24 = height;
              goto LABEL_16;
            case 7:
              double v23 = height / width;
              *((void *)&v21 + 1) = 0;
              *(double *)&long long v21 = width / height;
              CGFloat v24 = 0.0;
              CGFloat v25 = 0.0;
              goto LABEL_16;
            case 8:
              double v23 = height / width;
              *((void *)&v21 + 1) = 0;
              *(double *)&long long v21 = -width / height;
              CGFloat v24 = 0.0;
              CGFloat v25 = width;
LABEL_16:
              CGFloat v22 = 0.0;
              break;
            default:
              CGFloat v22 = *MEMORY[0x1E4F1DAB8];
              double v23 = *(double *)(MEMORY[0x1E4F1DAB8] + 8);
              long long v21 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
              CGFloat v25 = *(double *)(MEMORY[0x1E4F1DAB8] + 32);
              CGFloat v24 = *(double *)(MEMORY[0x1E4F1DAB8] + 40);
              break;
          }
          transform.a = v22;
          transform.b = v23;
          *(_OWORD *)&transform.c = v21;
          transform.tCGFloat x = v25;
          transform.tCGFloat y = v24;
          CGContextConcatCTM(a4, &transform);
        }
        if (v17 == width && v16 == height
          || !(BOOL v29 = -[PKImage _isTiledWhenStretchedToSize:](self, "_isTiledWhenStretchedToSize:", width, height))
          && (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_capInsets.top), (int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_capInsets.bottom))))) & 1) == 0)
        {
          CGFloat v26 = *MEMORY[0x1E4F1DAD8];
          CGFloat v27 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
          v28 = [(PKImage *)self imageRef];
          v44.origin.CGFloat x = v26;
          v44.origin.CGFloat y = v27;
          v44.size.double width = width;
          v44.size.double height = height;
          CGContextDrawImage(a4, v44, v28);
        }
        else
        {
          v30 = self;
          double v31 = [(PKImage *)v30 imageRef];
          [(PKImage *)v30 scale];
          *(float *)&double v32 = v32;
          uint64_t v33 = vcvtps_s32_f32(*(float *)&v32);
          double top = v30->_capInsets.top;
          CGFloat left = v30->_capInsets.left;
          double bottom = v30->_capInsets.bottom;
          CGFloat right = v30->_capInsets.right;
          *(_OWORD *)&transform.a = *MEMORY[0x1E4F1DAD8];
          transform.c = width;
          transform.d = height;
          memset(&slice, 0, sizeof(slice));
          memset(&remainder, 0, sizeof(remainder));
          memset(&v39, 0, sizeof(v39));
          v45.origin.CGFloat x = transform.a;
          v45.origin.CGFloat y = transform.b;
          v45.size.double width = width;
          v45.size.double height = height;
          CGRectDivide(v45, &slice, (CGRect *)&transform, top, CGRectMaxYEdge);
          v46.origin.CGFloat x = transform.a;
          v46.origin.CGFloat y = transform.b;
          v46.size.double width = transform.c;
          v46.size.double height = transform.d;
          CGRectDivide(v46, &v39, &remainder, bottom, CGRectMinYEdge);
          if (!CGRectIsEmpty(slice)) {
            _Draw3PartSlice(a4, v31, v33, v29, 0.0, 0.0, v17, top, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height, top, left, bottom, right);
          }
          if (!CGRectIsEmpty(remainder)) {
            _Draw3PartSlice(a4, v31, v33, v29, 0.0, top, v17, v16 - (top + bottom), remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height, top, left, bottom, right);
          }
          if (!CGRectIsEmpty(v39)) {
            _Draw3PartSlice(a4, v31, v33, v29, 0.0, v16 - bottom, v17, bottom, v39.origin.x, v39.origin.y, v39.size.width, v39.size.height, top, left, bottom, right);
          }
        }
        CGContextRestoreGState(a4);
      }
    }
  }
}

+ (id)imageNamed:(id)a3 inBundle:(id)a4
{
  id v4 = (void *)[a1 newImageNamed:a3 inBundle:a4];
  return v4;
}

+ (id)newImageNamed:(id)a3 inBundle:(id)a4
{
  return (id)[a1 newImageNamed:a3 inBundle:a4 screenScale:0 suffix:0.0];
}

+ (id)hashOfImageNamed:(id)a3 inBundle:(id)a4
{
  id v4 = (void *)[a1 newImageNamed:a3 inBundle:a4];
  uint64_t v5 = [v4 imageHash];

  return v5;
}

- (id)imageHash
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  memset(&c, 0, sizeof(c));
  uint64_t v3 = CC_SHA256_Init(&c);
  id v4 = (void *)MEMORY[0x192FDC630](v3);
  id v5 = [(PKImage *)self imageData];
  double v6 = (const void *)[v5 bytes];
  if ((unint64_t)[v5 length] > 0xFFFFFFFE) {
    CC_LONG v7 = -1;
  }
  else {
    CC_LONG v7 = [v5 length];
  }
  CC_SHA256_Update(&c, v6, v7);

  char data = 30;
  CC_SHA256_Update(&c, &data, 1u);
  CC_SHA256_Update(&c, &self->_scale, 8u);
  CC_SHA256_Final(md, &c);
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:md length:32];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKImage *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKImage *)self isEqualToImage:v5];

  return v6;
}

- (BOOL)isEqualToImage:(id)a3
{
  id v4 = a3;
  id v5 = [(PKImage *)self imageHash];
  BOOL v6 = [v4 imageHash];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

+ (id)passesImageNamed:(id)a3
{
  id v4 = a3;
  id v5 = PKPassKitCoreBundle();
  BOOL v6 = [a1 imageNamed:v4 inBundle:v5];

  return v6;
}

- (PKImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5
{
  uint64_t v8 = [(PKImage *)self init];
  if (v8)
  {
    if (a3) {
      CGImageRef v9 = CGImageRetain(a3);
    }
    else {
      CGImageRef v9 = 0;
    }
    v8->_imageRef = v9;
    v8->_scale = a4;
    v8->_int64_t orientation = a5;
  }
  return v8;
}

- (CGSize)size
{
  v2 = self;
  uint64_t v3 = [(PKImage *)v2 imageRef];
  [(PKImage *)v2 scale];
  double v5 = v4;
  double v6 = (double)CGImageGetWidth(v3) / v4;
  double v7 = (double)CGImageGetHeight(v3) / v5;
  uint64_t v8 = [(PKImage *)v2 orientation];
  if ((unint64_t)(v8 - 1) >= 4) {
    double v9 = v7;
  }
  else {
    double v9 = v6;
  }
  if ((unint64_t)(v8 - 1) >= 4) {
    double v10 = v6;
  }
  else {
    double v10 = v7;
  }
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (CGSize)downscaleSizeMatchingScale:(double)a3
{
  if (a3 == 0.0) {
    a3 = PKScreenScale();
  }
  double scale = self->_scale;
  BOOL v5 = a3 == 0.0 || scale == 0.0;
  double v6 = scale / a3;
  if (v5) {
    double v7 = 1.0;
  }
  else {
    double v7 = v6;
  }
  [(PKImage *)self size];
  double v8 = fmin(v7, 1.0);
  double v10 = v9 * v8;
  double v12 = v11 * v8;
  result.double height = v10;
  result.double width = v12;
  return result;
}

- (void)preheatBitmapData
{
  uint64_t v3 = (void *)MEMORY[0x192FDC630](self, a2);
  double v4 = [(PKImage *)self imageRef];
  if (objc_opt_respondsToSelector()) {
    [(CGImage *)v4 CA_prepareRenderValue];
  }
}

- (id)blurredImageWithRadius:(unint64_t)a3 constraints:(id)a4
{
  id v6 = a4;
  memset(&v33, 0, sizeof(v33));
  float64x2_t v32 = 0uLL;
  double v7 = 0;
  if ([v6 getPixelCropRect:&v33 pixelOutputSize:&v32 forImage:self])
  {
    [v6 outputScale];
    double v9 = v8;
    __asm { FMOV            V1.2D, #0.5 }
    CGSize rect = (CGSize)vrndaq_f64(vmulq_f64(v32, _Q1));
    BitmapContext = _CreateBitmapContext(1, 0, 0, rect.width, rect.height, 1.0);
    src.char data = CGBitmapContextGetData(BitmapContext);
    src.double width = CGBitmapContextGetWidth(BitmapContext);
    src.double height = CGBitmapContextGetHeight(BitmapContext);
    src.rowBytes = CGBitmapContextGetBytesPerRow(BitmapContext);
    double v16 = _CreateBitmapContext(1, 0, 0, rect.width, rect.height, 1.0);
    dest.char data = CGBitmapContextGetData(v16);
    dest.double width = CGBitmapContextGetWidth(v16);
    dest.double height = CGBitmapContextGetHeight(v16);
    dest.rowBytes = CGBitmapContextGetBytesPerRow(v16);
    double v17 = self;
    uint64_t v18 = [(PKImage *)v17 imageRef];
    v19 = CGImageCreateWithImageInRect(v18, v33);
    CGFloat v20 = *MEMORY[0x1E4F1DAD8];
    CGFloat v21 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    v35.origin.CGFloat x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
    v35.origin.CGFloat y = v21;
    v35.size = rect;
    CGContextDrawImage(BitmapContext, v35, v19);
    CGImageRelease(v19);
    uint32_t v22 = vcvtpd_u64_f64(v9 * (double)a3) | 1;
    vImageTentConvolve_ARGB8888(&src, &dest, 0, 0, 0, v22, v22, 0, 8u);
    Image = CGBitmapContextCreateImage(v16);
    CGContextRelease(BitmapContext);
    CGContextRelease(v16);
    if (Image)
    {
      CGFloat v24 = _CreateBitmapContext(1, 0, 0, v32.f64[0], v32.f64[1], 1.0);
      CGContextSetInterpolationQuality(v24, kCGInterpolationHigh);
      v36.size = (CGSize)v32;
      v36.origin.CGFloat x = v20;
      v36.origin.CGFloat y = v21;
      CGContextDrawImage(v24, v36, Image);
      CGImageRelease(Image);
      CGFloat v25 = CGBitmapContextCreateImage(v24);
      CGContextRelease(v24);
      LODWORD(v24) = [v6 outputMirrored];
      uint64_t v26 = [(PKImage *)v17 orientation];
      uint64_t v27 = v26;
      if (v24)
      {
        if ((unint64_t)(v26 - 1) > 7) {
          uint64_t v27 = 0;
        }
        else {
          uint64_t v27 = qword_191673A10[v26 - 1];
        }
      }
      double v7 = [[PKImage alloc] initWithCGImage:v25 scale:v27 orientation:v9];
      CGImageRelease(v25);
    }
    else
    {
      double v7 = 0;
    }
  }

  return v7;
}

- (id)croppedImageWithInsets:(PKEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  double v7 = self;
  double v8 = CGImageRetain([(PKImage *)v7 imageRef]);
  double scale = v7->_scale;
  CGFloat v10 = left * scale;
  CGFloat v11 = top * scale;
  CGFloat v12 = (double)CGImageGetWidth(v8) - (left + right) * scale;
  v17.size.double height = (double)CGImageGetWidth(v8) - (top + bottom) * v7->_scale;
  v17.origin.CGFloat x = v10;
  v17.origin.CGFloat y = v11;
  v17.size.double width = v12;
  uint64_t v13 = CGImageCreateWithImageInRect(v8, v17);
  double v14 = [[PKImage alloc] initWithCGImage:v13 scale:v7->_orientation orientation:v7->_scale];
  CGImageRelease(v13);
  CGImageRelease(v8);
  return v14;
}

- (PKImage)imageWithoutCapInsets
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double v4 = objc_alloc_init(PKImage);
  uint64_t v5 = [(NSData *)self->_imageData copy];
  imageData = v4->_imageData;
  v4->_imageData = (NSData *)v5;

  imageRef = self->_imageRef;
  if (imageRef) {
    imageRef = CGImageRetain(imageRef);
  }
  v4->_imageRef = imageRef;
  v4->_double scale = self->_scale;
  v4->_int64_t orientation = self->_orientation;
  *(_WORD *)&v4->_shouldTile = 0;
  *(_OWORD *)&v4->_capInsets.double top = 0u;
  *(_OWORD *)&v4->_capInsets.double bottom = 0u;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)resizedImageWithConstraints:(id)a3
{
  return (id)[a3 resizedImage:self];
}

- (id)resizableImageByTilingWithCapInsets:(PKEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double v9 = objc_alloc_init(PKImage);
  uint64_t v10 = [(NSData *)self->_imageData copy];
  imageData = v9->_imageData;
  v9->_imageData = (NSData *)v10;

  imageRef = self->_imageRef;
  if (imageRef) {
    imageRef = CGImageRetain(imageRef);
  }
  v9->_imageRef = imageRef;
  v9->_double scale = self->_scale;
  v9->_int64_t orientation = self->_orientation;
  v9->_shouldTile = 1;
  v9->_capInsets.double top = top;
  v9->_capInsets.double left = left;
  v9->_capInsets.double bottom = bottom;
  v9->_capInsets.double right = right;
  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (id)resizableImageByStretchingWithCapInsets:(PKEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double v9 = objc_alloc_init(PKImage);
  uint64_t v10 = [(NSData *)self->_imageData copy];
  imageData = v9->_imageData;
  v9->_imageData = (NSData *)v10;

  imageRef = self->_imageRef;
  if (imageRef) {
    imageRef = CGImageRetain(imageRef);
  }
  v9->_imageRef = imageRef;
  v9->_double scale = self->_scale;
  v9->_int64_t orientation = self->_orientation;
  v9->_shouldStretch = 1;
  v9->_capInsets.double top = top;
  v9->_capInsets.double left = left;
  v9->_capInsets.double bottom = bottom;
  v9->_capInsets.double right = right;
  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (id)resizableImageByTilingCenterPixel
{
  [(PKImage *)self size];
  return -[PKImage resizableImageByTilingWithCapInsets:](self, "resizableImageByTilingWithCapInsets:");
}

- (void)drawInRect:(CGRect)a3 inContext:(CGContext *)a4
{
}

- (BOOL)_isTiledWhenStretchedToSize:(CGSize)a3
{
  if (!self->_shouldTile) {
    return 0;
  }
  double height = a3.height;
  double width = a3.width;
  [(PKImage *)self size];
  if (v6 - self->_capInsets.left - self->_capInsets.right > 1.0 && width != v6) {
    return 1;
  }
  if (height == v7) {
    return 0;
  }
  return v7 - self->_capInsets.top - self->_capInsets.bottom > 1.0;
}

@end