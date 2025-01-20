@interface GQDDrawable
- (BOOL)hasPagesOrder;
- (CGPath)createBezierPath;
- (__CFString)urlString;
- (__CFURL)url;
- (const)uid;
- (const)wrapPoints;
- (id)geometry;
- (int)collectWrapPointsForState:(id)a3 graphicStyle:(id)a4;
- (int)pagesOrder;
- (void)addWrapPoint:(id)a3;
- (void)clearWrapPoints;
- (void)collectWrapPoints:(id)a3 forPath:(CGPath *)a4 context:(FindLinesContext *)a5;
- (void)createListOfWrapPointsAlongY:(float)a3 minX:(float)a4 maxX:(float)a5 zIndex:(int)a6;
- (void)dealloc;
- (void)setPagesOrder:(int)a3;
@end

@implementation GQDDrawable

- (void)dealloc
{
  mUrl = self->mUrl;
  if (mUrl) {
    CFRelease(mUrl);
  }
  mUid = self->mUid;
  if (mUid) {
    xmlFree(mUid);
  }
  mInnerWrapPoints = (void **)self->mInnerWrapPoints;
  if (mInnerWrapPoints)
  {
    sub_9FBC((uint64_t)self->mInnerWrapPoints, mInnerWrapPoints[1]);
    operator delete();
  }
  v6.receiver = self;
  v6.super_class = (Class)GQDDrawable;
  [(GQDDrawable *)&v6 dealloc];
}

- (id)geometry
{
  return self->mGeometry;
}

- (__CFURL)url
{
  return self->mUrl;
}

- (__CFString)urlString
{
  result = (__CFString *)self->mUrl;
  if (result) {
    return (__CFString *)CFURLGetString((CFURLRef)result);
  }
  return result;
}

- (const)uid
{
  return self->mUid;
}

- (int)collectWrapPointsForState:(id)a3 graphicStyle:(id)a4
{
  uint64_t v14 = 0;
  cf[0] = 0;
  memset(v12, 0, sizeof(v12));
  cf[1] = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  id v11 = 0;
  unsigned int v7 = [a4 hasValueForObjectProperty:72 value:&v11];
  unsigned int v8 = 0;
  if (!v7 || !v11) {
    goto LABEL_9;
  }
  unsigned int v8 = [v11 floatingWrapType];
  switch(v8)
  {
    case 2u:
      unsigned int v8 = 0;
      goto LABEL_9;
    case 1u:
LABEL_9:
      HIDWORD(v14) = v8;
      break;
    case 0u:
      unsigned int v9 = [v11 wrapDirection];
      if (v9 < 3)
      {
        unsigned int v8 = dword_5EFA4[v9];
        goto LABEL_9;
      }
      break;
  }
  -[GQDDrawable collectWrapPoints:forPath:context:](self, "collectWrapPoints:forPath:context:", [a3 currentWrapPointGenerator], -[GQDBezierPath path](self->mWrapPath, "path"), v12);
  CFRelease(cf[1]);
  return 1;
}

- (void)addWrapPoint:(id)a3
{
  mInnerWrapPoints = (uint64_t **)self->mInnerWrapPoints;
  id v5 = a3;
  id v4 = a3;
  sub_A038(mInnerWrapPoints, &v5, &v5);
}

- (const)wrapPoints
{
  result = self->mInnerWrapPoints;
  if (!result) {
    operator new();
  }
  return result;
}

- (void)createListOfWrapPointsAlongY:(float)a3 minX:(float)a4 maxX:(float)a5 zIndex:(int)a6
{
}

- (void)clearWrapPoints
{
  mInnerWrapPoints = (char *)self->mInnerWrapPoints;
  sub_9FBC((uint64_t)mInnerWrapPoints, *((void **)mInnerWrapPoints + 1));
  *(void *)mInnerWrapPoints = mInnerWrapPoints + 8;
  *((void *)mInnerWrapPoints + 2) = 0;
  *((void *)mInnerWrapPoints + 1) = 0;
}

- (CGPath)createBezierPath
{
  Mutable = CGPathCreateMutable();
  [(GQDAffineGeometry *)self->mGeometry position];
  CGFloat v5 = v4;
  [(GQDAffineGeometry *)self->mGeometry position];
  CGFloat v7 = v6;
  [(GQDAffineGeometry *)self->mGeometry size];
  CGFloat v9 = v8;
  [(GQDAffineGeometry *)self->mGeometry size];
  v12.size.height = v10;
  v12.origin.x = v5;
  v12.origin.y = v7;
  v12.size.width = v9;
  CGPathAddRect(Mutable, 0, v12);
  return Mutable;
}

- (BOOL)hasPagesOrder
{
  return self->mHasPagesOrder;
}

- (int)pagesOrder
{
  return self->mPagesOrder;
}

- (void)setPagesOrder:(int)a3
{
  self->mHasPagesOrder = 1;
  self->mPagesOrder = a3;
}

- (void)collectWrapPoints:(id)a3 forPath:(CGPath *)a4 context:(FindLinesContext *)a5
{
  mGeometry = self->mGeometry;
  CGPathApply(a4, a5, (CGPathApplierFunction)sub_9D34);
  [(GQDAffineGeometry *)mGeometry position];
  double v11 = v10;
  double v13 = v12;
  CGRect BoundingBox = CGPathGetBoundingBox(a4);
  float v14 = (float)(10 * ((int)(v13 + -20.0) / 10));
  float v15 = (float)(10 * ((int)(v13 + BoundingBox.size.height + 30.0) / 10));
  if (v14 < v15)
  {
    float v16 = v11 + BoundingBox.size.width * 0.5;
    do
    {
      __p = 0;
      v60 = 0;
      v61 = 0;
      uint64_t Count = CFArrayGetCount(a5->var3);
      if (Count)
      {
        CFIndex v18 = 0;
        double v19 = v14;
        do
        {
          ValueAtIndex = (double *)CFArrayGetValueAtIndex(a5->var3, v18);
          double v21 = ValueAtIndex[2];
          if (v21 <= v19)
          {
            double v22 = ValueAtIndex[4];
            if (v22 >= v19)
            {
              double v23 = ValueAtIndex[1];
              float v24 = ValueAtIndex[3] - v23;
              float v25 = v22 - v21;
              float v26 = v23 + (v19 - v21) * v24 / v25;
              v27 = v60;
              if (v60 >= (float *)v61)
              {
                v29 = __p;
                uint64_t v30 = v60 - __p;
                unint64_t v31 = v30 + 1;
                if ((unint64_t)(v30 + 1) >> 62) {
                  sub_A594();
                }
                uint64_t v32 = v61 - (char *)__p;
                if ((v61 - (char *)__p) >> 1 > v31) {
                  unint64_t v31 = v32 >> 1;
                }
                if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v33 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v33 = v31;
                }
                if (v33)
                {
                  v34 = (char *)sub_A8A0((uint64_t)&v61, v33);
                  v29 = __p;
                  v27 = v60;
                }
                else
                {
                  v34 = 0;
                }
                v35 = (float *)&v34[4 * v30];
                float *v35 = v26;
                v28 = v35 + 1;
                while (v27 != v29)
                {
                  int v36 = *((_DWORD *)v27-- - 1);
                  *((_DWORD *)v35-- - 1) = v36;
                }
                __p = v35;
                v61 = &v34[4 * v33];
                if (v29) {
                  operator delete(v29);
                }
              }
              else
              {
                float *v60 = v26;
                v28 = v60 + 1;
              }
              v60 = v28;
            }
          }
          ++v18;
        }
        while (v18 != Count);
      }
      v37 = __p;
      unint64_t v38 = (char *)v60 - (char *)__p;
      if (v60 != __p)
      {
        unsigned int var5 = a5->var5;
        if (var5 - 2 < 2)
        {
          if (v38 <= 4)
          {
            float v53 = *__p;
            float v54 = 0.0;
          }
          else
          {
            std::__sort<std::__less<float,float> &,float *>();
            if (var5 == 2)
            {
              float v52 = *(v60 - 1);
              float v53 = *__p;
            }
            else
            {
              float v52 = *__p;
              float v53 = *(v60 - 1);
            }
            float v54 = v52 - v53;
          }
          v55 = [GQDWrapPoint alloc];
          *(float *)&double v56 = v53;
          *(float *)&double v57 = v14;
          v58 = [(GQDWrapPoint *)v55 initWithX:2 * (var5 != 2) y:self flowType:v56 drawable:v57];
          v58[6] = v54;
          [a3 addWrapPoint:v58];
        }
        else if (var5 <= 1)
        {
          if (v38 < 5)
          {
            float v41 = *__p;
            v47 = [GQDWrapPoint alloc];
            if (var5) {
              uint64_t v50 = 2 * (v41 >= v16);
            }
            else {
              uint64_t v50 = 1;
            }
          }
          else
          {
            std::__sort<std::__less<float,float> &,float *>();
            float v40 = *__p;
            float v41 = *(v60 - 1);
            int v42 = a5->var5;
            v43 = [GQDWrapPoint alloc];
            *(float *)&double v44 = v40;
            *(float *)&double v45 = v14;
            v46 = [(GQDWrapPoint *)v43 initWithX:v42 != 0 y:self flowType:v44 drawable:v45];
            [a3 addWrapPoint:v46];

            LODWORD(v46) = a5->var5;
            v47 = [GQDWrapPoint alloc];
            if (v46) {
              uint64_t v50 = 1;
            }
            else {
              uint64_t v50 = 2;
            }
          }
          *(float *)&double v48 = v41;
          *(float *)&double v49 = v14;
          v51 = -[GQDWrapPoint initWithX:y:flowType:drawable:](v47, "initWithX:y:flowType:drawable:", v50, self, v48, v49, __p);
          [a3 addWrapPoint:v51];
        }
        v37 = __p;
      }
      if (v37) {
        operator delete(v37);
      }
      float v14 = v14 + 10.0;
    }
    while (v14 < v15);
  }
}

@end