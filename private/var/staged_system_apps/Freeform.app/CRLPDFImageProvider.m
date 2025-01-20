@interface CRLPDFImageProvider
- (BOOL)i_hasFlushableContent;
- (BOOL)isValid;
- (CGPDFDocument)CGPDFDocument;
- (CGPDFDocument)p_load;
- (CGSize)naturalSize;
- (int64_t)pageAngle;
- (unint64_t)i_flushableMemoryEstimate;
- (void)dealloc;
- (void)drawImageInContext:(CGContext *)a3 rect:(CGRect)a4;
- (void)flush;
- (void)i_commonInit;
- (void)p_loadIfNecessary;
@end

@implementation CRLPDFImageProvider

- (void)i_commonInit
{
  v10.receiver = self;
  v10.super_class = (Class)CRLPDFImageProvider;
  [(CRLImageProvider *)&v10 i_commonInit];
  if (self->_accessQueue)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE178);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106AF68();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE198);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v3);
    }
    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPDFImageProvider i_commonInit]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPDFImageProvider.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:40 isFatal:0 description:"called i_common init twice on same object!"];
  }
  v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.freeform.CRLPDFImageProvider", 0);
  accessQueue = self->_accessQueue;
  self->_accessQueue = v6;

  v8 = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
  flushableContentLock = self->_flushableContentLock;
  self->_flushableContentLock = v8;
}

- (void)dealloc
{
  CGPDFDocumentRelease(self->_PDFDocument);
  v3.receiver = self;
  v3.super_class = (Class)CRLPDFImageProvider;
  [(CRLImageProvider *)&v3 dealloc];
}

- (CGPDFDocument)CGPDFDocument
{
  [(CRLPDFImageProvider *)self p_loadIfNecessary];
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  accessQueue = self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100050F50;
  v7[3] = &unk_1014CB090;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(accessQueue, v7);
  v4 = (const void *)v9[3];
  if (v4)
  {
    CFAutorelease(v4);
    v5 = (CGPDFDocument *)v9[3];
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (int64_t)pageAngle
{
  int64_t result = [(CRLPDFImageProvider *)self CGPDFDocument];
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
  [(CRLPDFImageProvider *)self p_loadIfNecessary];
  uint64_t v9 = 0;
  uint64_t v10 = (double *)&v9;
  uint64_t v11 = 0x3010000000;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  v12 = "";
  accessQueue = self->_accessQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100051078;
  v8[3] = &unk_1014CB090;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(accessQueue, v8);
  double v4 = v10[4];
  double v5 = v10[5];
  _Block_object_dispose(&v9, 8);
  double v6 = v4;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (BOOL)i_hasFlushableContent
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_flushableContentLock, 0xFFFFFFFFFFFFFFFFLL);
  BOOL hasFlushableContent = self->_hasFlushableContent;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_flushableContentLock);
  return hasFlushableContent;
}

- (unint64_t)i_flushableMemoryEstimate
{
  unint64_t result = [(CRLPDFImageProvider *)self CGPDFDocument];
  if (result)
  {
    double v4 = [(CRLImageProvider *)self imageData];
    id v5 = [v4 length];

    return (unint64_t)v5;
  }
  return result;
}

- (BOOL)isValid
{
  v2 = [(CRLPDFImageProvider *)self CGPDFDocument];
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
  if (![(CRLPDFImageProvider *)self isValid])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE1B8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106AFFC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE1D8);
    }
    uint64_t v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v10);
    }
    uint64_t v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPDFImageProvider drawImageInContext:rect:]");
    v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPDFImageProvider.m"];
    +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:103 isFatal:0 description:"shouldn't be drawing an invalid image provider"];
  }
  uint64_t v13 = [(CRLPDFImageProvider *)self CGPDFDocument];
  if (v13)
  {
    CGPDFPageRef Page = CGPDFDocumentGetPage(v13, 1uLL);
    if (Page)
    {
      v15 = Page;
      CGContextSaveGState(a3);
      v32.origin.CGFloat x = x;
      v32.origin.CGFloat y = y;
      v32.size.CGFloat width = width;
      v32.size.CGFloat height = height;
      double MinY = CGRectGetMinY(v32);
      v33.origin.CGFloat x = x;
      v33.origin.CGFloat y = y;
      v33.size.CGFloat width = width;
      v33.size.CGFloat height = height;
      CGFloat MaxY = CGRectGetMaxY(v33);
      CGContextTranslateCTM(a3, 0.0, MinY + MaxY);
      CGContextScaleCTM(a3, 1.0, -1.0);
      memset(&v31, 0, sizeof(v31));
      double v29 = 0.0;
      double v30 = 0.0;
      double v18 = sub_100456798(v15, (uint64_t)&v31, &v29);
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      if (!sub_100064EF4(v21, v23) && (sub_100067C58() & 1) == 0)
      {
        long long v27 = 0u;
        long long v28 = 0u;
        CGAffineTransform v25 = v31;
        __n128 v26 = 0u;
        sub_100456B98((__n128 *)&v25, &v26, v29, v30, x, y, width, height);
        *(__n128 *)&v25.a = v26;
        *(_OWORD *)&v25.c = v27;
        *(_OWORD *)&v25.tCGFloat x = v28;
        CGContextConcatCTM(a3, &v25);
        v34.origin.CGFloat x = v18;
        v34.origin.CGFloat y = v20;
        v34.size.CGFloat width = v22;
        v34.size.CGFloat height = v24;
        CGContextClipToRect(a3, v34);
        CGContextDrawPDFPage(a3, v15);
      }
      CGContextRestoreGState(a3);
    }
  }
}

- (void)flush
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005152C;
  block[3] = &unk_1014CBBB0;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)p_loadIfNecessary
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100051640;
  block[3] = &unk_1014CBBB0;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (CGPDFDocument)p_load
{
  objc_super v3 = [(CRLImageProvider *)self imageData];
  double v4 = (CGDataProvider *)[v3 newCGDataProvider];

  if (!v4) {
    return 0;
  }
  id v5 = CGPDFDocumentCreateWithProvider(v4);
  double v6 = v5;
  if (v5)
  {
    CGPDFPageRef Page = CGPDFDocumentGetPage(v5, 1uLL);
    if (Page)
    {
      uint64_t v8 = Page;
      CGRect BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFMediaBox);
      CGFloat x = BoxRect.origin.x;
      CGFloat y = BoxRect.origin.y;
      CGFloat width = BoxRect.size.width;
      CGFloat height = BoxRect.size.height;
      CGRect v52 = CGPDFPageGetBoxRect(v8, kCGPDFCropBox);
      CGFloat v13 = v52.origin.x;
      CGFloat v14 = v52.origin.y;
      CGFloat v15 = v52.size.width;
      CGFloat v16 = v52.size.height;
      CGRect v56 = CGPDFPageGetBoxRect(v8, kCGPDFArtBox);
      v53.origin.CGFloat x = x;
      v53.origin.CGFloat y = y;
      v53.size.CGFloat width = width;
      v53.size.CGFloat height = height;
      CGRect v57 = CGRectIntersection(v53, v56);
      v54.origin.CGFloat x = v13;
      v54.origin.CGFloat y = v14;
      v54.size.CGFloat width = v15;
      v54.size.CGFloat height = v16;
      CGRect v55 = CGRectIntersection(v54, v57);
      double v17 = v55.size.width;
      CGFloat v18 = v55.size.height;
      int RotationAngle = CGPDFPageGetRotationAngle(v8);
      if (RotationAngle == 270 || RotationAngle == 90)
      {
        double v20 = v18;
      }
      else
      {
        double v20 = v17;
        double v17 = v18;
      }
      double v21 = fmax(v20, 0.01);
      double v22 = fmax(v17, 0.01);
      if (v21 != v20 || v22 != v17)
      {
        unsigned int v24 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CE1F8);
        }
        CGAffineTransform v25 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
        {
          CGRect v32 = v25;
          v49.CGFloat width = v20;
          v49.CGFloat height = v17;
          CGRect v33 = NSStringFromCGSize(v49);
          v50.CGFloat width = v21;
          v50.CGFloat height = v22;
          CGRect v34 = NSStringFromCGSize(v50);
          *(_DWORD *)buf = 67110402;
          unsigned int v36 = v24;
          __int16 v37 = 2082;
          v38 = "-[CRLPDFImageProvider p_load]";
          __int16 v39 = 2082;
          v40 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPDFImageProvider.m";
          __int16 v41 = 1024;
          int v42 = 206;
          __int16 v43 = 2112;
          v44 = v33;
          __int16 v45 = 2112;
          v46 = v34;
          _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d PDF image had zero-width or height size; was %@, capped to %@",
            buf,
            0x36u);
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CE218);
        }
        __n128 v26 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010668E0(v26);
        }
        long long v27 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPDFImageProvider p_load]");
        long long v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPDFImageProvider.m"];
        v47.CGFloat width = v20;
        v47.CGFloat height = v17;
        double v29 = NSStringFromCGSize(v47);
        v48.CGFloat width = v21;
        v48.CGFloat height = v22;
        double v30 = NSStringFromCGSize(v48);
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v28, 206, 0, "PDF image had zero-width or height size; was %@, capped to %@",
          v29,
          v30);
      }
      self->_naturalSize.CGFloat width = v21;
      self->_naturalSize.CGFloat height = v22;
    }
    else
    {
      CGPDFDocumentRelease(v6);
      double v6 = 0;
    }
  }
  CGDataProviderRelease(v4);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flushableContentLock, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end