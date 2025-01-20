@interface GQDBezierPath
+ (__CFString)createCFStringFromPath:(CGPath *)a3;
+ (const)stateForReading;
- (BOOL)hasHorizontalFlip;
- (BOOL)hasVerticalFlip;
- (BOOL)horizontalFlip;
- (BOOL)isRectangular;
- (BOOL)verticalFlip;
- (CGPath)createBezierPath;
- (CGPath)path;
- (GQDBezierPath)initWithPathString:(const char *)a3;
- (char)pathStr;
- (int)readAttributesFromReader:(_xmlTextReader *)a3 processor:(id)a4;
- (void)dealloc;
@end

@implementation GQDBezierPath

+ (const)stateForReading
{
  return (const StateSpec *)&unk_9D8B0;
}

- (GQDBezierPath)initWithPathString:(const char *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GQDBezierPath;
  v4 = [(GQDBezierPath *)&v7 init];
  if (v4)
  {
    v5 = xmlStrdup((const xmlChar *)a3);
    v4->mPathStr = (char *)v5;
    v4->mPath = sub_43588((const char *)v5);
  }
  return v4;
}

- (void)dealloc
{
  mPath = self->mPath;
  if (mPath) {
    CFRelease(mPath);
  }
  mPathStr = self->mPathStr;
  if (mPathStr)
  {
    xmlFree(mPathStr);
    self->mPathStr = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)GQDBezierPath;
  [(GQDPath *)&v5 dealloc];
}

- (BOOL)isRectangular
{
  CGPoint v28 = CGPointZero;
  uint64_t v31 = 0;
  __int16 v32 = 0;
  CGPathApply([(GQDBezierPath *)self path], &v28, (CGPathApplierFunction)sub_3488);
  BOOL result = 0;
  if (HIBYTE(v32)) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = v31 == 4;
  }
  if (v3 && v32 != 0)
  {
    objc_super v5 = v30;
    for (uint64_t i = 2; i != 6; ++i)
    {
      double v7 = *(v5 - 1);
      double v8 = *v5;
      v9 = &v30[2 * ((i - 1) & 3) - 1];
      double v10 = *v9;
      double v11 = v9[1];
      v12 = &v30[2 * (i & 3) - 1];
      double v13 = *v12;
      double v14 = v12[1];
      float v15 = sub_50500(v7, *v5, v10, v11);
      LODWORD(v10) = sub_50500(v10, v11, v13, v14);
      v5 += 2;
      if (vabds_f32(sub_50500(v7, v8, v13, v14), sqrtf((float)(*(float *)&v10 * *(float *)&v10) + (float)(v15 * v15))) > 0.001) {
        return 0;
      }
    }
    double v16 = sub_505F4(v29, v30[0], v30[1]);
    double v20 = sub_50638(v16, v17, v18, v19, v30[3]);
    double v24 = sub_50638(v20, v21, v22, v23, v30[5]);
    double v26 = v25;
    uint64_t v27 = 0;
    do
    {
      BOOL result = sub_5068C(*(double *)((char *)&v28 + v27 * 8 + 16), v30[v27], v24, v26);
      if (result) {
        break;
      }
      BOOL v3 = v27 == 6;
      v27 += 2;
    }
    while (!v3);
  }
  return result;
}

- (CGPath)path
{
  BOOL result = self->mPath;
  if (!result)
  {
    BOOL result = (CGPath *)self->mPathStr;
    if (result)
    {
      BOOL result = sub_43588((const char *)result);
      self->mPath = result;
    }
  }
  return result;
}

- (char)pathStr
{
  return self->mPathStr;
}

- (CGPath)createBezierPath
{
  v2 = [(GQDBezierPath *)self path];
  return CGPathCreateCopy(v2);
}

- (BOOL)hasVerticalFlip
{
  return self->mHasVFlip;
}

- (BOOL)hasHorizontalFlip
{
  return self->mHasHFlip;
}

- (BOOL)verticalFlip
{
  return self->mVFlip;
}

- (BOOL)horizontalFlip
{
  return self->mHFlip;
}

+ (__CFString)createCFStringFromPath:(CGPath *)a3
{
  CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
  CGPathApply(a3, Mutable, (CGPathApplierFunction)sub_368C);
  return Mutable;
}

- (int)readAttributesFromReader:(_xmlTextReader *)a3 processor:(id)a4
{
  mPathStr = self->mPathStr;
  if (mPathStr)
  {
    xmlFree(mPathStr);
    self->mPathStr = 0;
  }
  AttributeNs = (char *)xmlTextReaderGetAttributeNs(a3, (const xmlChar *)"path", *(const xmlChar **)(qword_A35E0 + 16));
  self->mPathStr = AttributeNs;
  if (self->mPath)
  {
    CFRelease(self->mPath);
    self->mPath = 0;
    AttributeNs = self->mPathStr;
  }
  if (AttributeNs) {
    return 1;
  }
  else {
    return 3;
  }
}

@end