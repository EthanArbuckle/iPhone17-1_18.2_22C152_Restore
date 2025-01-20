@interface CRLMutableImageFill
- (id)copyWithZone:(_NSZone *)a3;
- (void)setFillSize:(CGSize)a3;
- (void)setImageData:(id)a3;
- (void)setScale:(double)a3;
- (void)setTechnique:(unint64_t)a3;
- (void)setTintColor:(id)a3;
@end

@implementation CRLMutableImageFill

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CRLImageFill allocWithZone:a3];
  mImageData = self->super.mImageData;
  unint64_t mTechnique = self->super.mTechnique;
  mTintColor = self->super.mTintColor;
  [(CRLImageFill *)self fillSize];
  mReferenceColor = self->super.mReferenceColor;

  return -[CRLImageFill initWithImageData:technique:tintColor:size:referenceColor:](v4, "initWithImageData:technique:tintColor:size:referenceColor:", mImageData, mTechnique, mTintColor, mReferenceColor);
}

- (void)setTintColor:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  mTintColor = self->super.mTintColor;
  if (v4 | (unint64_t)mTintColor)
  {
    v11 = (void *)v4;
    unsigned __int8 v6 = [(CRLColor *)mTintColor isEqual:v4];
    unint64_t v4 = (unint64_t)v11;
    if ((v6 & 1) == 0)
    {
      [(CRLImageFill *)self p_clearTintedImageCache];
      v7 = (CRLColor *)[v11 copy];
      v8 = self->super.mTintColor;
      self->super.mTintColor = v7;

      mReferenceColor = self->super.mReferenceColor;
      self->super.mReferenceColor = 0;

      mCachedReferenceColor = self->super.mCachedReferenceColor;
      self->super.mCachedReferenceColor = 0;

      [(CRLImageFill *)self i_updateStoredReferenceColorIfNeeded];
      unint64_t v4 = (unint64_t)v11;
    }
  }
}

- (void)setTechnique:(unint64_t)a3
{
  unint64_t v3 = a3;
  if (a3 >= 5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D2648);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101072F78();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D2668);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    unsigned __int8 v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMutableImageFill setTechnique:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 1128, 0, "Invalid image fill technique: %zu Defaulting to natural size.", v3);

    unint64_t v3 = 0;
  }
  self->super.unint64_t mTechnique = v3;
}

- (void)setImageData:(id)a3
{
  v5 = (_TtC8Freeform8CRLAsset *)a3;
  if (self->super.mImageData != v5)
  {
    v10 = v5;
    [(CRLImageFill *)self p_clearTintedImageCache];
    objc_storeStrong((id *)&self->super.mImageData, a3);
    self->super.mFillSize = CGSizeZero;
    [(CRLImageFill *)self fillSize];
    self->super.mFillSize.width = v6;
    self->super.mFillSize.height = v7;
    mReferenceColor = self->super.mReferenceColor;
    self->super.mReferenceColor = 0;

    mCachedReferenceColor = self->super.mCachedReferenceColor;
    self->super.mCachedReferenceColor = 0;

    self->super.mShouldSkipFurtherAttemptsToCalculateReferenceColor = 0;
    [(CRLImageFill *)self i_updateStoredReferenceColorIfNeeded];
    v5 = v10;
  }
}

- (void)setFillSize:(CGSize)a3
{
  self->super.mFillSize = a3;
}

- (void)setScale:(double)a3
{
  [(CRLImageFill *)self p_imageDataNaturalSize];
  [(CRLMutableImageFill *)self setFillSize:sub_1000646A4(v5, v6, a3)];
  [(CRLImageFill *)self scale];
  if (v7 != a3 && vabdd_f64(a3, v7) >= 0.00999999978)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D2688);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107300C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D26A8);
    }
    v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMutableImageFill setScale:]");
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLImageFill.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:1164 isFatal:0 description:"Scale math changed the scale"];
  }
}

@end