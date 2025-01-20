@interface CRLDropShadow
- (BOOL)isEqual:(id)a3;
- (CGImage)newShadowImageForRep:(id)a3 withSize:(CGSize)a4 drawSelector:(SEL)a5 unflipped:(BOOL)a6;
- (CGRect)boundsForRep:(id)a3;
- (CGRect)boundsInNaturalSpaceForRep:(id)a3;
- (CRLDropShadow)initWithAngle:(double)a3 offset:(double)a4 radius:(double)a5 opacity:(double)a6 color:(id)a7 enabled:(BOOL)a8;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)newShadowClampedForSwatches;
- (unint64_t)hash;
- (unint64_t)shadowType;
@end

@implementation CRLDropShadow

- (CRLDropShadow)initWithAngle:(double)a3 offset:(double)a4 radius:(double)a5 opacity:(double)a6 color:(id)a7 enabled:(BOOL)a8
{
  v9.receiver = self;
  v9.super_class = (Class)CRLDropShadow;
  return (CRLDropShadow *)[(CRLShadow *)&v9 i_initWithOpacity:a7 color:a8 angle:a6 offset:a3 radius:a4 enabled:a5];
}

- (unint64_t)shadowType
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = sub_1002469D0(v5, v4);

  if (v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)CRLDropShadow;
    BOOL v7 = [(CRLShadow *)&v9 isEqual:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)CRLDropShadow;
  return [(CRLShadow *)&v3 hash];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [CRLMutableDropShadow alloc];
  [(CRLShadow *)self angle];
  double v6 = v5;
  [(CRLShadow *)self offset];
  double v8 = v7;
  [(CRLShadow *)self radius];
  double v10 = v9;
  [(CRLShadow *)self opacity];
  double v12 = v11;
  v13 = [(CRLShadow *)self color];
  v14 = [(CRLDropShadow *)v4 initWithAngle:v13 offset:[(CRLShadow *)self isEnabled] radius:v6 opacity:v8 color:v10 enabled:v12];

  return v14;
}

- (id)newShadowClampedForSwatches
{
  [(CRLShadow *)self radius];
  double v4 = v3;
  [(CRLShadow *)self offset];
  double v6 = v4 + v5;
  [(CRLShadow *)self radius];
  double v8 = v7;
  [(CRLShadow *)self offset];
  double v10 = v9;
  if (v6 > 10.0)
  {
    double v8 = v8 * (10.0 / v6);
    double v10 = v9 * (10.0 / v6);
  }
  double v11 = [CRLDropShadow alloc];
  [(CRLShadow *)self angle];
  double v13 = v12;
  [(CRLShadow *)self opacity];
  double v15 = v14;
  v16 = [(CRLShadow *)self color];
  v17 = [(CRLDropShadow *)v11 initWithAngle:v16 offset:[(CRLShadow *)self isEnabled] radius:v13 opacity:v10 color:v8 enabled:v15];

  return v17;
}

- (CGRect)boundsInNaturalSpaceForRep:(id)a3
{
  double v3 = [a3 layout];
  [v3 shadowedNaturalBoundsWithoutOffset];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)boundsForRep:(id)a3
{
  double v3 = [a3 layout];
  [v3 shadowedNaturalBoundsWithoutOffset];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGImage)newShadowImageForRep:(id)a3 withSize:(CGSize)a4 drawSelector:(SEL)a5 unflipped:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a4.height;
  double width = a4.width;
  id v11 = a3;
  double v12 = sub_1000674F0(width, height);
  double v14 = v13;
  double v15 = sub_100064070();
  double v19 = sub_10006757C(v15, v16, v17, v18);
  Image = 0;
  if (v21 != 0.0)
  {
    double v24 = v22;
    if (v22 != 0.0)
    {
      double v25 = v19;
      double v26 = v21;
      Image = 0;
      double v27 = ceil(fmax(v12, v21));
      if (v27 > 0.0 && ceil(fmax(v14, v22)) > 0.0)
      {
        double v28 = v20;
        v29 = [(CRLShadow *)self color];
        v30 = (CGColor *)[v29 CGColor];

        v31 = sub_100455AA8(11, v26, v24);
        if (v31)
        {
          v32 = v31;
          SEL v72 = a5;
          v33 = [v11 layout];
          v34 = v33;
          v35 = v30;
          if (v33) {
            [v33 transformInRoot];
          }
          else {
            memset(v79, 0, 48);
          }
          double v36 = sub_10007F788(v79);
          sub_100456DE0((uint64_t)v32, v36);

          v37 = [v11 canvas];
          id v38 = [v37 isPrinting];
          v39 = [v11 canvas];
          id v40 = [v39 isDrawingIntoPDF];
          v41 = [v11 canvas];
          [v41 contentsScale];
          sub_1004559A4((uint64_t)v32, (uint64_t)v38, (uint64_t)v40, 1, 0, v42);

          [(CRLShadow *)self radius];
          CGFloat v44 = v43;
          CGContextTranslateCTM(v32, -v25, -v28);
          CGContextTranslateCTM(v32, -(v27 + 10.0), -0.0);
          if (v6)
          {
            long long v77 = 0u;
            long long v78 = 0u;
            long long v76 = 0u;
            v45 = [v11 layout];
            v46 = [v45 geometry];
            v47 = v46;
            if (v46)
            {
              [v46 transform];
            }
            else
            {
              long long v77 = 0u;
              long long v78 = 0u;
              long long v76 = 0u;
            }

            if (sub_100064F08(*(double *)&v76, *(double *)&v77, *((double *)&v76 + 1), *((double *)&v77 + 1)) > 0.0)
            {
              transform.a = -1.0;
              transform.b = 0.0;
              transform.c = 0.0;
              transform.d = 1.0;
              transform.tx = v12;
              transform.ty = 0.0;
              CGContextConcatCTM(v32, &transform);
            }
            v74.b = 0.0;
            v74.c = 0.0;
            v74.a = 1.0;
            *(_OWORD *)&v74.d = xmmword_101177250;
            v74.ty = v14;
            CGContextConcatCTM(v32, &v74);
          }
          v80.double height = 0.0;
          v80.double width = v27 + 10.0;
          CGContextSetShadowWithColor(v32, v80, v44, v35);
          CGContextTranslateCTM(v32, v44, v44);
          if ([v11 canDrawShadowInOneStepWithChildren:1])
          {
            [v11 performSelector:v72 withObject:v32];
          }
          else
          {
            [v11 naturalBounds];
            double v49 = v48;
            double v51 = v50;
            sub_100064070();
            double v53 = v52;
            double v55 = v54;
            double v56 = sub_100067234(v49, v51, 2048.0, 2048.0);
            if (v56 > 0.0 && v57 > 0.0)
            {
              double v58 = v56 / v53;
              double v59 = v57 / v55;
              v60 = CGLayerCreateWithContext(v32, *(CGSize *)&v56, 0);
              Context = CGLayerGetContext(v60);
              v62 = [v11 layout];
              v63 = v62;
              if (v62) {
                [v62 transformInRoot];
              }
              else {
                memset(v73, 0, sizeof(v73));
              }
              double v64 = sub_10007F788(v73);
              sub_100456DE0((uint64_t)Context, v64);

              v65 = [v11 canvas];
              id v66 = [v65 isPrinting];
              v67 = [v11 canvas];
              id v68 = [v67 isDrawingIntoPDF];
              v69 = [v11 canvas];
              [v69 contentsScale];
              sub_1004559A4((uint64_t)Context, (uint64_t)v66, (uint64_t)v68, 0, 0, v70);

              CGContextScaleCTM(Context, v58, v59);
              [v11 performSelector:v72 withObject:Context];
              sub_1004552DC((uint64_t)Context);
              v81.origin.x = sub_100064070();
              CGContextDrawLayerInRect(v32, v81, v60);
              CGLayerRelease(v60);
            }
          }
          Image = CGBitmapContextCreateImage(v32);
          sub_1004552DC((uint64_t)v32);
          CGContextRelease(v32);
        }
        else
        {
          Image = 0;
        }
      }
    }
  }

  return Image;
}

@end