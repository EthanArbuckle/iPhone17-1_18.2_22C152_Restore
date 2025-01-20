@interface CRLInstantAlphaImage
- (CRLInstantAlphaImage)initWithWidth:(int64_t)a3 height:(int64_t)a4;
- (unsigned)averageColorAtXPosition:(int64_t)a3 yPosition:(int64_t)a4;
- (void)dealloc;
@end

@implementation CRLInstantAlphaImage

- (CRLInstantAlphaImage)initWithWidth:(int64_t)a3 height:(int64_t)a4
{
  if (a3 < 1 || a4 <= 0)
  {
    int v7 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EE4B8);
    }
    v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109F32C(v7, v8);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EE4D8);
    }
    v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v9, v7);
    }
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInstantAlphaImage initWithWidth:height:]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInstantAlphaImage.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 15, 0, "Invalid parameter not satisfying: %{public}s", "width > 0 && height > 0");
  }
  v16.receiver = self;
  v16.super_class = (Class)CRLInstantAlphaImage;
  v12 = [(CRLInstantAlphaImage *)&v16 init];
  v13 = v12;
  if (v12)
  {
    v12->mWidth = a3;
    v12->mHeight = a4;
    v14 = (unsigned int *)malloc_type_calloc(1uLL, 4 * a3 * a4, 0x100004052888210uLL);
    v13->mImageData = v14;
    if (!v14)
    {

      return 0;
    }
  }
  return v13;
}

- (void)dealloc
{
  mImageData = self->mImageData;
  if (mImageData) {
    free(mImageData);
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLInstantAlphaImage;
  [(CRLInstantAlphaImage *)&v4 dealloc];
}

- (unsigned)averageColorAtXPosition:(int64_t)a3 yPosition:(int64_t)a4
{
  int v5 = 0;
  int v6 = 0;
  int v7 = 0;
  for (uint64_t i = -1; i != 2; ++i)
  {
    double v9 = (double)(i + a4);
    uint64_t v10 = -1;
    uint64_t v32 = i;
    do
    {
      uint64_t v11 = (uint64_t)sub_100407E48((double)(a3 + v10), 0.0, (double)(self->mWidth - 1));
      int64_t v12 = (uint64_t)sub_100407E48(v9, 0.0, (double)(self->mHeight - 1));
      v13 = self;
      if (v11 < 0 || v12 < 0 || (int64_t v14 = self->mWidth, v14 <= v11) || self->mHeight <= v12)
      {
        v34 = v13;
        unsigned int v16 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014EE4F8);
        }
        v17 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
        {
          int64_t mWidth = self->mWidth;
          int64_t mHeight = self->mHeight;
          *(_DWORD *)buf = 67110914;
          unsigned int v36 = v16;
          __int16 v37 = 2082;
          v38 = "CRLInstantAlphaPixel getPixel(CRLInstantAlphaImage *__strong, NSInteger, NSInteger)";
          __int16 v39 = 2082;
          v40 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInstantAlphaImage.h";
          __int16 v41 = 1024;
          int v42 = 36;
          __int16 v43 = 2048;
          uint64_t v44 = v11;
          __int16 v45 = 2048;
          int64_t v46 = v12;
          __int16 v47 = 2048;
          int64_t v48 = mWidth;
          __int16 v49 = 2048;
          int64_t v50 = mHeight;
          _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d bad request for get pixel in IA: (%li, %li) for image of size (%li, %li)", buf, 0x4Au);
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014EE518);
          }
        }
        v18 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
        {
          v25 = v18;
          v26 = +[CRLAssertionHandler packedBacktraceString];
          *(_DWORD *)buf = 67109378;
          unsigned int v36 = v16;
          __int16 v37 = 2114;
          v38 = v26;
          _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
        }
        v19 = +[NSString stringWithUTF8String:"CRLInstantAlphaPixel getPixel(CRLInstantAlphaImage *__strong, NSInteger, NSInteger)"];
        v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInstantAlphaImage.h"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 36, 0, "bad request for get pixel in IA: (%li, %li) for image of size (%li, %li)", v11, v12, self->mWidth, self->mHeight);

        unsigned int v15 = 0;
        uint64_t i = v32;
        v13 = v34;
      }
      else
      {
        unsigned int v15 = self->mImageData[v11 + v14 * v12];
      }

      if (v10 | i) {
        int v21 = 3;
      }
      else {
        int v21 = 5;
      }
      if (v10) {
        BOOL v22 = i == 0;
      }
      else {
        BOOL v22 = 1;
      }
      if (!v22) {
        int v21 = 1;
      }
      v5 += HIBYTE(v15) * v21;
      v7 += BYTE2(v15) * v21;
      v6 += BYTE1(v15) * v21;
      ++v10;
    }
    while (v10 != 2);
  }
  unsigned int v27 = (v5 / 21) & ~((v5 / 21) >> 31);
  if (v27 >= 0xFF) {
    unsigned int v27 = 255;
  }
  unsigned int v28 = (v7 / 21) & ~((v7 / 21) >> 31);
  if (v28 >= 0xFF) {
    unsigned int v28 = 255;
  }
  unsigned int v29 = (v6 / 21) & ~((v6 / 21) >> 31);
  if (v29 >= 0xFF) {
    unsigned int v29 = 255;
  }
  return (v27 << 24) | (v28 << 8) | (v29 << 16) | 0xFF;
}

@end