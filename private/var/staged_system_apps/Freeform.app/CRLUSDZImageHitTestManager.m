@interface CRLUSDZImageHitTestManager
+ (CGRect)p_visibleBoundsInContext:(CGContext *)a3 naturalRect:(CGRect)a4 canvasViewScale:(double)a5;
+ (CGRect)p_visibleBoundsInContext:(CGContext *)a3 withImageProvider:(id)a4 canvasViewScale:(double)a5;
- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4;
- (BOOL)isEmpty;
- (BOOL)visibleBoundsComputedFromAsset;
- (CGRect)naturalBounds;
- (CGRect)visibleBounds;
- (CGRect)visibleContentRect;
- (CRLUSDZImageHitTestManager)initWith:(id)a3 naturalBounds:(CGRect)a4 canvasViewScale:(double)a5;
- (_TtC8Freeform8CRLAsset)imageAsset;
- (double)canvasViewScale;
- (void)dealloc;
- (void)setNaturalBounds:(CGRect)a3;
@end

@implementation CRLUSDZImageHitTestManager

- (CRLUSDZImageHitTestManager)initWith:(id)a3 naturalBounds:(CGRect)a4 canvasViewScale:(double)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v12 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CRLUSDZImageHitTestManager;
  v13 = [(CRLUSDZImageHitTestManager *)&v34 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_imageAsset, a3);
    v14->_naturalBounds.origin.double y = y;
    v14->_naturalBounds.size.double width = width;
    v14->_naturalBounds.size.double height = height;
    v14->_canvasViewScale = a5;
    v14->_naturalBounds.origin.double x = x;
    v15 = +[CRLImageProviderPool sharedPool];
    v16 = [v15 temporaryProviderForAsset:v12 shouldValidate:1];

    if (v16 && ([v16 isError] & 1) == 0)
    {
      [v16 naturalSize];
      v14->_imageNaturalRect.origin.double x = sub_100064070();
      v14->_imageNaturalRect.origin.double y = v30;
      v14->_imageNaturalRect.size.double width = v31;
      v14->_imageNaturalRect.size.double height = v32;
      v14->_ctdouble x = sub_100455AA8(2, v31, v32);
      p_imageVisibleRect = &v14->_imageVisibleRect;
      [objc_opt_class() p_visibleBoundsInContext:v14->_ctx withImageProvider:v16 canvasViewScale:a5];
      char v26 = 1;
      uint64_t v27 = 64;
      uint64_t v28 = 56;
      uint64_t v29 = 48;
    }
    else
    {
      [(CRLUSDZImageHitTestManager *)v14 naturalBounds];
      v14->_imageVisibleRect.origin.double x = v17;
      v14->_imageVisibleRect.origin.double y = v18;
      v14->_imageVisibleRect.size.double width = v19;
      v14->_imageVisibleRect.size.double height = v20;
      p_imageVisibleRect = &v14->_imageNaturalRect;
      [(CRLUSDZImageHitTestManager *)v14 naturalBounds];
      char v26 = 0;
      uint64_t v27 = 32;
      uint64_t v28 = 24;
      uint64_t v29 = 16;
    }
    *(void *)&p_imageVisibleRect->origin.double x = v22;
    *(Class *)((char *)&v14->super.isa + v29) = v23;
    *(Class *)((char *)&v14->super.isa + v28) = v24;
    *(Class *)((char *)&v14->super.isa + v27) = v25;
    v14->_visibleBoundsComputedFromAsset = v26;
    -[CRLUSDZImageHitTestManager setNaturalBounds:](v14, "setNaturalBounds:", x, y, width, height);
  }
  return v14;
}

- (void)dealloc
{
  ctdouble x = self->_ctx;
  if (ctx) {
    CGContextRelease(ctx);
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLUSDZImageHitTestManager;
  [(CRLUSDZImageHitTestManager *)&v4 dealloc];
}

- (void)setNaturalBounds:(CGRect)a3
{
  double height = a3.size.height;
  self->_naturalBounds = a3;
  double v5 = 1.0;
  if (a3.size.width == 0.0)
  {
    double v6 = 1.0;
  }
  else
  {
    double v6 = 1.0;
    if (height != 0.0)
    {
      double v5 = a3.size.width / self->_imageNaturalRect.size.width;
      double v6 = height / self->_imageNaturalRect.size.height;
    }
  }
  self->_visibleBounds = self->_imageVisibleRect;
  double y = self->_visibleBounds.origin.y;
  CGFloat v8 = v5 * self->_visibleBounds.origin.x;
  double v9 = self->_visibleBounds.size.height;
  CGFloat v10 = v5 * self->_visibleBounds.size.width;
  self->_scale.double width = v5;
  self->_scale.double height = v6;
  CGFloat v11 = v6 * y;
  self->_visibleBounds.origin.double x = v8;
  self->_visibleBounds.origin.double y = v6 * y;
  CGFloat v12 = v6 * v9;
  self->_visibleBounds.size.double width = v10;
  self->_visibleBounds.size.double height = v12;
  sub_100066B80(v8, v11, v10, v12);
  self->_visibleContentRect.origin.double x = v13;
  self->_visibleContentRect.origin.double y = v14;
  self->_visibleContentRect.size.double width = v15;
  self->_visibleContentRect.size.double height = v16;
}

- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  ctdouble x = self->_ctx;
  BOOL v9 = CGRectContainsPoint(self->_visibleBounds, a3);
  BOOL v10 = v9;
  if (ctx)
  {
    LOBYTE(v9) = 0;
    BOOL v11 = !v10;
  }
  else
  {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    if (self->_scale.width != 0.0 && self->_scale.height != 0.0)
    {
      size_t Width = CGBitmapContextGetWidth(self->_ctx);
      size_t Height = CGBitmapContextGetHeight(self->_ctx);
      size_t BytesPerRow = CGBitmapContextGetBytesPerRow(self->_ctx);
      size_t v15 = BytesPerRow * Height;
      unint64_t v16 = (unint64_t)(x / self->_scale.width);
      unint64_t v17 = (unint64_t)(self->_imageNaturalRect.size.height - y / self->_scale.height);
      unint64_t v18 = v16 + BytesPerRow * v17;
      if (v18 < BytesPerRow * Height)
      {
        size_t v19 = BytesPerRow;
        Data = CGBitmapContextGetData(self->_ctx);
        if (Data[v18])
        {
          BOOL v21 = 1;
LABEL_21:
          LOBYTE(v9) = v21;
          return v9;
        }
        v22 = (double *)&unk_101178C20;
        if (!v4) {
          v22 = (double *)&unk_101178C18;
        }
        double v23 = *v22 / self->_canvasViewScale;
        unint64_t v24 = vcvtpd_u64_f64(v23 + v23);
        if (v16 + (v24 >> 1) >= Width - 1) {
          unint64_t v25 = Width - 1;
        }
        else {
          unint64_t v25 = v16 + (v24 >> 1);
        }
        unint64_t v26 = v17 - (v24 >> 1);
        if (v17 + (v24 >> 1) >= Height - 1) {
          unint64_t v27 = Height - 1;
        }
        else {
          unint64_t v27 = v17 + (v24 >> 1);
        }
        if (v26 <= v27)
        {
          BOOL v21 = 0;
          double v28 = v23 * v23;
          unint64_t v29 = v16 - (v24 >> 1);
          double v30 = (double)v17;
          double v31 = (double)v16;
          unint64_t v32 = v19 * v26;
          v33 = &Data[v19 * v26];
          do
          {
            int v34 = v21;
            if (v29 <= v25 && !v21)
            {
              unint64_t v35 = v29;
              do
              {
                if (sub_1000643CC(v31, v30, (double)v35, (double)v26) < v28 && v32 + v35 < v15) {
                  BOOL v21 = v33[v35] != 0;
                }
                ++v35;
                int v34 = v21;
              }
              while (v35 <= v25 && !v21);
            }
            if (++v26 > v27) {
              break;
            }
            v33 += v19;
            v32 += v19;
          }
          while (!v34);
          goto LABEL_21;
        }
      }
      BOOL v21 = 0;
      goto LABEL_21;
    }
    LOBYTE(v9) = 0;
  }
  return v9;
}

+ (CGRect)p_visibleBoundsInContext:(CGContext *)a3 withImageProvider:(id)a4 canvasViewScale:(double)a5
{
  id v8 = a4;
  CGContextSaveGState(a3);
  CGContextSetInterpolationQuality(a3, kCGInterpolationNone);
  [v8 naturalSize];
  double v9 = sub_100064070();
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [v8 drawImageInContext:a3];

  CGContextRestoreGState(a3);

  [a1 p_visibleBoundsInContext:a3 naturalRect:v9 canvasViewScale:v11 v13 v15 a5];
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

+ (CGRect)p_visibleBoundsInContext:(CGContext *)a3 naturalRect:(CGRect)a4 canvasViewScale:(double)a5
{
  Data = (char *)CGBitmapContextGetData(a3);
  size_t Width = CGBitmapContextGetWidth(a3);
  size_t Height = CGBitmapContextGetHeight(a3);
  size_t BytesPerRow = CGBitmapContextGetBytesPerRow(a3);
  if (Height)
  {
    size_t v13 = Height;
    do
    {
      if (Width)
      {
        size_t v14 = 0;
        double v15 = &Data[(v13 - 1) * BytesPerRow];
        do
        {
          int v16 = v15[v14];
          BOOL v17 = v15[v14++] != 0;
        }
        while (v14 < Width && !v16);
      }
      else
      {
        BOOL v17 = 0;
      }
      v13 -= !v17;
    }
    while (v13 && !v17);
    if (v13)
    {
      size_t v18 = 0;
      do
      {
        if (Width)
        {
          size_t v19 = 0;
          CGFloat v20 = &Data[v18 * BytesPerRow];
          do
          {
            int v21 = v20[v19];
            BOOL v22 = v20[v19++] != 0;
          }
          while (v19 < Width && !v21);
        }
        else
        {
          BOOL v22 = 0;
        }
        v18 += !v22;
      }
      while (v18 < v13 && !v22);
      if (!Width) {
        goto LABEL_45;
      }
      goto LABEL_25;
    }
  }
  else
  {
    size_t v13 = 0;
  }
  size_t v18 = 0;
  if (!Width)
  {
LABEL_45:
    unint64_t v28 = 0;
    goto LABEL_46;
  }
LABEL_25:
  double v23 = &Data[BytesPerRow * v18];
  do
  {
    if (v13 <= v18)
    {
      BOOL v27 = 0;
    }
    else
    {
      unint64_t v24 = &v23[Width - 1];
      size_t v25 = v18 + 1;
      do
      {
        int v26 = *v24;
        BOOL v27 = *v24 != 0;
        if (v25 >= v13) {
          break;
        }
        ++v25;
        v24 += BytesPerRow;
      }
      while (!v26);
    }
    Width -= !v27;
  }
  while (Width && !v27);
  if (!Width) {
    goto LABEL_45;
  }
  unint64_t v28 = 0;
  do
  {
    if (v13 <= v18)
    {
      BOOL v32 = 0;
    }
    else
    {
      unint64_t v29 = &v23[v28];
      size_t v30 = v18 + 1;
      do
      {
        int v31 = *v29;
        BOOL v32 = *v29 != 0;
        if (v30 >= v13) {
          break;
        }
        ++v30;
        v29 += BytesPerRow;
      }
      while (!v31);
    }
    v28 += !v32;
  }
  while (v28 < Width && !v32);
LABEL_46:
  SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)BytesPerRow, *(Swift::String *)&v11);
  if (v13 != v18 && Width != v28)
  {
    v37.size.double width = (double)(Width - v28);
    v37.origin.double x = v33 + (double)v28;
    v37.origin.double y = v34 + (double)(Height - v13);
    v37.size.double height = (double)(v13 - v18);
    *(CGRect *)&CGFloat v33 = CGRectInset(v37, a5 * -25.0, a5 * -25.0);
  }
  result.size.double height = v36;
  result.size.double width = v35;
  result.origin.double y = v34;
  result.origin.double x = v33;
  return result;
}

- (_TtC8Freeform8CRLAsset)imageAsset
{
  return self->_imageAsset;
}

- (BOOL)visibleBoundsComputedFromAsset
{
  return self->_visibleBoundsComputedFromAsset;
}

- (CGRect)naturalBounds
{
  double x = self->_naturalBounds.origin.x;
  double y = self->_naturalBounds.origin.y;
  double width = self->_naturalBounds.size.width;
  double height = self->_naturalBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)isEmpty
{
  return self->_isEmpty;
}

- (double)canvasViewScale
{
  return self->_canvasViewScale;
}

- (CGRect)visibleContentRect
{
  double x = self->_visibleContentRect.origin.x;
  double y = self->_visibleContentRect.origin.y;
  double width = self->_visibleContentRect.size.width;
  double height = self->_visibleContentRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)visibleBounds
{
  double x = self->_visibleBounds.origin.x;
  double y = self->_visibleBounds.origin.y;
  double width = self->_visibleBounds.size.width;
  double height = self->_visibleBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
}

@end