@interface CRLInstantAlphaBinaryBitmap
- (CRLInstantAlphaBinaryBitmap)initWithWidth:(int64_t)a3 height:(int64_t)a4;
- (CRLInstantAlphaBinaryBitmap)initWithWidth:(int64_t)a3 height:(int64_t)a4 rowBytes:(int64_t)a5;
- (char)data;
- (id)medianBitmap;
- (int64_t)height;
- (int64_t)rowBytes;
- (int64_t)width;
- (void)dealloc;
- (void)unionWithBitmap:(id)a3;
@end

@implementation CRLInstantAlphaBinaryBitmap

- (CRLInstantAlphaBinaryBitmap)initWithWidth:(int64_t)a3 height:(int64_t)a4 rowBytes:(int64_t)a5
{
  if (a3 < 1 || a4 < 1 || (uint64_t)((unint64_t)a3 >> 3) > a5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D72D8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107AB70();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D72F8);
    }
    v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v9);
    }
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInstantAlphaBinaryBitmap initWithWidth:height:rowBytes:]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInstantAlphaBinaryBitmap.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 23, 0, "Invalid parameter not satisfying: %{public}s", "width > 0 && height > 0 && rowBytes >= width / 8");
  }
  v16.receiver = self;
  v16.super_class = (Class)CRLInstantAlphaBinaryBitmap;
  v12 = [(CRLInstantAlphaBinaryBitmap *)&v16 init];
  v13 = v12;
  if (v12)
  {
    v12->mWidth = a3;
    v12->mHeight = a4;
    v12->mRowBytes = a5;
    v14 = (char *)malloc_type_calloc(a4, a5, 0xD12E5C31uLL);
    v13->mData = v14;
    if (!v14)
    {

      return 0;
    }
  }
  return v13;
}

- (CRLInstantAlphaBinaryBitmap)initWithWidth:(int64_t)a3 height:(int64_t)a4
{
  unint64_t v7 = sub_100010D48(vcvtpd_u64_f64((double)a3 * 0.125));

  return [(CRLInstantAlphaBinaryBitmap *)self initWithWidth:a3 height:a4 rowBytes:v7];
}

- (void)dealloc
{
  mData = self->mData;
  if (mData) {
    free(mData);
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLInstantAlphaBinaryBitmap;
  [(CRLInstantAlphaBinaryBitmap *)&v4 dealloc];
}

- (void)unionWithBitmap:(id)a3
{
  objc_super v4 = a3;
  v5 = v4;
  if (self->mWidth == v4[1] && (int64_t mHeight = self->mHeight, mHeight == v4[2]))
  {
    if (mHeight >= 1)
    {
      int64_t v7 = 0;
      uint64_t v8 = v4[4];
      int64_t mRowBytes = self->mRowBytes;
      mData = self->mData;
      do
      {
        if (mRowBytes >= 1)
        {
          for (int64_t i = 0; i < mRowBytes; ++i)
          {
            mData[i] |= *(unsigned char *)(v8 + i);
            int64_t mRowBytes = self->mRowBytes;
          }
          int64_t mHeight = self->mHeight;
        }
        ++v7;
        mData += mRowBytes;
        v8 += v4[3];
      }
      while (mHeight > v7);
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D7318);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107AC20();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D7338);
    }
    v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v12);
    }
    v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInstantAlphaBinaryBitmap unionWithBitmap:]");
    v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInstantAlphaBinaryBitmap.m"];
    +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:53 isFatal:0 description:"unionWithBitmap: sizes do not match"];
  }
}

- (id)medianBitmap
{
  v3 = [[CRLInstantAlphaBinaryBitmap alloc] initWithWidth:self->mWidth height:self->mHeight rowBytes:self->mRowBytes];
  int64_t mHeight = self->mHeight;
  if (mHeight >= 1)
  {
    int64_t v5 = 0;
    int64_t mWidth = self->mWidth;
    do
    {
      if (mWidth <= 0)
      {
        int64_t v36 = v5 + 1;
      }
      else
      {
        int64_t v7 = 0;
        int64_t v38 = (v5 - 1);
        int64_t v39 = v5 + 1;
        do
        {
          uint64_t v8 = self;
          v9 = v8;
          if (self->mWidth <= v7 || self->mHeight <= v5) {
            int v10 = 0;
          }
          else {
            int v10 = (self->mData[self->mRowBytes * v5 + (v7 >> 3)] << (v7 & 7)) & 0x80;
          }

          v11 = v9;
          v12 = v11;
          int v40 = v10;
          if (v7 && self->mWidth > (v7 - 1) && self->mHeight > v5) {
            int v13 = (self->mData[self->mRowBytes * v5 + ((v7 - 1) >> 3)] << ((v7 - 1) & 7)) & 0x80;
          }
          else {
            int v13 = 0;
          }

          int64_t v14 = v7 + 1;
          v15 = v12;
          objc_super v16 = v15;
          if (self->mWidth <= v7 + 1 || self->mHeight <= v5) {
            int v17 = 0;
          }
          else {
            int v17 = (self->mData[self->mRowBytes * v5 + (v14 >> 3)] << ((v7 + 1) & 7)) & 0x80;
          }

          v18 = v16;
          v19 = v18;
          int v20 = 0;
          if (v5 && self->mWidth > v7)
          {
            if (self->mHeight <= v38) {
              int v20 = 0;
            }
            else {
              int v20 = (self->mData[self->mRowBytes * v38 + (v7 >> 3)] << (v7 & 7)) & 0x80;
            }
          }

          v21 = v19;
          if (self->mWidth <= v7 || self->mHeight <= v39) {
            int v22 = 0;
          }
          else {
            int v22 = (self->mData[self->mRowBytes * v39 + (v7 >> 3)] << (v7 & 7)) & 0x80;
          }

          v23 = v3;
          if (v3->mWidth <= v7 || v3->mHeight <= v5)
          {
            unsigned int v27 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014D7358);
            }
            v28 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              int64_t v32 = v3->mWidth;
              int64_t v33 = v3->mHeight;
              *(_DWORD *)buf = 67110914;
              unsigned int v42 = v27;
              __int16 v43 = 2082;
              v44 = "void setBit(CRLInstantAlphaBinaryBitmap * _Nonnull __strong, NSInteger, NSInteger, NSInteger)";
              __int16 v45 = 2082;
              v46 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInstantAlphaBinaryBitmap.h";
              __int16 v47 = 1024;
              int v48 = 67;
              __int16 v49 = 2048;
              int64_t v50 = v7;
              __int16 v51 = 2048;
              int64_t v52 = v5;
              __int16 v53 = 2048;
              int64_t v54 = v32;
              __int16 v55 = 2048;
              int64_t v56 = v33;
              _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d bad request for set bit value in IA: (%li, %li) for image of size (%li, %li)", buf, 0x4Au);
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014D7378);
              }
            }
            v29 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              v34 = v29;
              v35 = +[CRLAssertionHandler packedBacktraceString];
              *(_DWORD *)buf = 67109378;
              unsigned int v42 = v27;
              __int16 v43 = 2114;
              v44 = v35;
              _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
            }
            v30 = +[NSString stringWithUTF8String:"void setBit(CRLInstantAlphaBinaryBitmap * _Nonnull __strong, NSInteger, NSInteger, NSInteger)"];
            v31 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInstantAlphaBinaryBitmap.h"];
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, 67, 0, "bad request for set bit value in IA: (%li, %li) for image of size (%li, %li)", v7, v5, v3->mWidth, v3->mHeight);
          }
          else
          {
            v24 = &v3->mData[v3->mRowBytes * v5];
            char v25 = v24[(unint64_t)v7 >> 3];
            if (v13 + v40 + v17 + v20 == -v22) {
              char v26 = v25 & (-129 >> (v7 & 7));
            }
            else {
              char v26 = v25 | (0x80u >> (v7 & 7));
            }
            v24[(unint64_t)v7 >> 3] = v26;
          }

          int64_t mWidth = self->mWidth;
          ++v7;
        }
        while (mWidth > v14);
        int64_t mHeight = self->mHeight;
        int64_t v36 = v5 + 1;
      }
      int64_t v5 = v36;
    }
    while (mHeight > v36);
  }

  return v3;
}

- (int64_t)width
{
  return self->mWidth;
}

- (int64_t)height
{
  return self->mHeight;
}

- (int64_t)rowBytes
{
  return self->mRowBytes;
}

- (char)data
{
  return self->mData;
}

@end