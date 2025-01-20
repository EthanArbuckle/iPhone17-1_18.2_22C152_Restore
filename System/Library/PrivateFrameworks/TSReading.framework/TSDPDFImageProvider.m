@interface TSDPDFImageProvider
- (BOOL)hasFlushableContent;
- (BOOL)isValid;
- (CGPDFDocument)CGPDFDocument;
- (CGPDFDocument)p_load;
- (CGSize)naturalSize;
- (int64_t)pageAngle;
- (void)dealloc;
- (void)drawImageInContext:(CGContext *)a3 rect:(CGRect)a4;
- (void)flush;
- (void)p_loadIfNecessary;
@end

@implementation TSDPDFImageProvider

- (void)dealloc
{
  CGPDFDocumentRelease(self->mPDFDocument);
  v3.receiver = self;
  v3.super_class = (Class)TSDPDFImageProvider;
  [(TSDImageProvider *)&v3 dealloc];
}

- (CGPDFDocument)CGPDFDocument
{
  return self->mPDFDocument;
}

- (int64_t)pageAngle
{
  int64_t result = [(TSDPDFImageProvider *)self CGPDFDocument];
  if (result)
  {
    int64_t result = (int64_t)CGPDFDocumentGetPage((CGPDFDocumentRef)result, 1uLL);
    if (result) {
      return CGPDFPageGetRotationAngle((CGPDFPageRef)result);
    }
  }
  return result;
}

- (CGSize)naturalSize
{
  [(TSDPDFImageProvider *)self p_loadIfNecessary];
  double width = self->mNaturalSize.width;
  double height = self->mNaturalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isValid
{
  v2 = [(TSDPDFImageProvider *)self CGPDFDocument];
  if (v2) {
    LOBYTE(v2) = CGPDFDocumentGetPage(v2, 1uLL) != 0;
  }
  return (char)v2;
}

- (void)drawImageInContext:(CGContext *)a3 rect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  if (![(TSDPDFImageProvider *)self isValid])
  {
    v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSDPDFImageProvider drawImageInContext:rect:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDPDFImageProvider.m"), 71, @"shouldn't be drawing an invalid image provider");
  }
  v12 = [(TSDPDFImageProvider *)self CGPDFDocument];
  if (v12)
  {
    CGPDFPageRef Page = CGPDFDocumentGetPage(v12, 1uLL);
    if (Page)
    {
      v14 = Page;
      CGContextSaveGState(a3);
      v31.origin.CGFloat x = x;
      v31.origin.CGFloat y = y;
      v31.size.CGFloat width = width;
      v31.size.CGFloat height = height;
      double MinY = CGRectGetMinY(v31);
      v32.origin.CGFloat x = x;
      v32.origin.CGFloat y = y;
      v32.size.CGFloat width = width;
      v32.size.CGFloat height = height;
      CGFloat MaxY = CGRectGetMaxY(v32);
      CGContextTranslateCTM(a3, 0.0, MinY + MaxY);
      CGContextScaleCTM(a3, 1.0, -1.0);
      memset(&v30, 0, sizeof(v30));
      double v28 = 0.0;
      double v29 = 0.0;
      double v17 = TSDComputeBoxTransformAndSizeForPDFPage(v14, (uint64_t)&v30, &v28);
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      long long v26 = 0u;
      long long v27 = 0u;
      CGAffineTransform v24 = v30;
      __n128 v25 = 0u;
      TSDComputeDrawTransformForPDFPage((__n128 *)&v24, &v25, v28, v29, x, y, width, height);
      *(__n128 *)&v24.a = v25;
      *(_OWORD *)&v24.c = v26;
      *(_OWORD *)&v24.tCGFloat x = v27;
      CGContextConcatCTM(a3, &v24);
      v33.origin.CGFloat x = v17;
      v33.origin.CGFloat y = v19;
      v33.size.CGFloat width = v21;
      v33.size.CGFloat height = v23;
      CGContextClipToRect(a3, v33);
      CGContextDrawPDFPage(a3, v14);
      CGContextRestoreGState(a3);
    }
  }
}

- (BOOL)hasFlushableContent
{
  return self->mPDFDocument != 0;
}

- (void)flush
{
  self->mPDFDocument = 0;
  if (self->super.mLoadState == 1) {
    self->super.mLoadState = 0;
  }
}

- (void)p_loadIfNecessary
{
  if (!self->mPDFDocument && self->super.mLoadState != 2)
  {
    objc_sync_enter(self);
    if (!self->mPDFDocument && self->super.mLoadState != 2)
    {
      objc_super v3 = [(TSDPDFImageProvider *)self p_load];
      __dmb(0xBu);
      self->mPDFDocument = v3;
      if (v3) {
        int v4 = 1;
      }
      else {
        int v4 = 2;
      }
      self->super.mLoadState = v4;
    }
    objc_sync_exit(self);
  }
}

- (CGPDFDocument)p_load
{
  objc_super v3 = (CGDataProvider *)objc_msgSend(-[TSDImageProvider imageData](self, "imageData"), "newCGDataProvider");
  if (!v3) {
    return 0;
  }
  int v4 = v3;
  v5 = CGPDFDocumentCreateWithProvider(v3);
  v6 = v5;
  if (v5)
  {
    CGPDFPageRef Page = CGPDFDocumentGetPage(v5, 1uLL);
    if (Page)
    {
      v8 = Page;
      CGRect BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFMediaBox);
      CGFloat x = BoxRect.origin.x;
      CGFloat y = BoxRect.origin.y;
      CGFloat width = BoxRect.size.width;
      CGFloat height = BoxRect.size.height;
      CGRect v23 = CGPDFPageGetBoxRect(v8, kCGPDFCropBox);
      CGFloat v13 = v23.origin.x;
      CGFloat v14 = v23.origin.y;
      CGFloat v15 = v23.size.width;
      CGFloat v16 = v23.size.height;
      CGRect v27 = CGPDFPageGetBoxRect(v8, kCGPDFArtBox);
      v24.origin.CGFloat x = x;
      v24.origin.CGFloat y = y;
      v24.size.CGFloat width = width;
      v24.size.CGFloat height = height;
      CGRect v28 = CGRectIntersection(v24, v27);
      v25.origin.CGFloat x = v13;
      v25.origin.CGFloat y = v14;
      v25.size.CGFloat width = v15;
      v25.size.CGFloat height = v16;
      CGRect v26 = CGRectIntersection(v25, v28);
      CGFloat v17 = v26.size.width;
      CGFloat v18 = v26.size.height;
      int RotationAngle = CGPDFPageGetRotationAngle(v8);
      if (RotationAngle == 270 || RotationAngle == 90)
      {
        CGFloat v20 = v18;
      }
      else
      {
        CGFloat v20 = v17;
        CGFloat v17 = v18;
      }
      self->mNaturalSize.CGFloat width = v20;
      self->mNaturalSize.CGFloat height = v17;
    }
    else
    {
      CGPDFDocumentRelease(v6);
      v6 = 0;
    }
  }
  CGDataProviderRelease(v4);
  return v6;
}

@end