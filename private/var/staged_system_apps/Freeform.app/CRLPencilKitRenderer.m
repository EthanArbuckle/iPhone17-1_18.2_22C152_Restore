@interface CRLPencilKitRenderer
+ (void)drawStrokes:(id)a3 inContext:(CGContext *)a4 overTransparentCanvas:(BOOL)a5;
@end

@implementation CRLPencilKitRenderer

+ (void)drawStrokes:(id)a3 inContext:(CGContext *)a4 overTransparentCanvas:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v9 = objc_alloc((Class)PKDrawing);
  id v10 = objc_alloc_init((Class)PKDrawing);
  id v11 = [v9 initWithStrokes:v7 fromDrawing:v10];

  [v11 bounds];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  ClipBoundingBodouble x = CGContextGetClipBoundingBox(a4);
  v51.origin.double x = v13;
  v51.origin.CGFloat y = v15;
  v51.size.CGFloat width = v17;
  v51.size.CGFloat height = v19;
  CGRect v52 = CGRectIntersection(v51, ClipBoundingBox);
  double x = v52.origin.x;
  CGFloat y = v52.origin.y;
  CGFloat width = v52.size.width;
  CGFloat height = v52.size.height;
  if (!CGRectIsEmpty(v52) && sub_100065B50(x, y, width, height))
  {
    double v24 = sub_100458664((uint64_t)a4);
    double v25 = v24;
    if (v24 <= 0.0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F6B70);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010AD9BC();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F6B90);
      }
      v26 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v26);
      }
      v27 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPencilKitRenderer drawStrokes:inContext:overTransparentCanvas:]");
      v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPencilKitRenderer.m"];
      +[CRLAssertionHandler handleFailureInFunction:v27 file:v28 lineNumber:330 isFatal:0 description:"CGContext has an invalid associated screen scale."];

      double v25 = 1.0;
    }
    if (sub_1004583EC((uint64_t)a4)) {
      double v24 = 3.0;
    }
    CGContextGetCTM(&v50, a4);
    double v29 = v24 * (sub_10007F808(&v50.a) / v25);
    if (v29 > 0.0)
    {
      v53.origin.double x = sub_100067B88(x, y, width, height, v29);
      CGRect v54 = CGRectInset(v53, -1.0 / v29, -1.0 / v29);
      CGFloat v30 = v54.origin.x;
      CGFloat v31 = v54.origin.y;
      CGFloat v32 = v54.size.width;
      CGFloat v33 = v54.size.height;
      double v34 = sub_1000646A4(v54.size.width, v54.size.height, v29);
      double v36 = v35;
      int v37 = sub_1004583EC((uint64_t)a4);
      int v38 = sub_100457C78((uint64_t)a4);
      int v39 = sub_100457DB4((uint64_t)a4);
      int v40 = sub_100457EF0((uint64_t)a4);
      int v41 = v5 & ~(v38 | v39);
      uint64_t v42 = (v40 | v37 | v41) ^ 1u;
      if (v40 | v37) {
        char v43 = v40;
      }
      else {
        char v43 = v41;
      }
      v44 = +[CRLPKImageRendererPool sharedPool];
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_1003E5B7C;
      v45[3] = &unk_1014F6CC8;
      *(CGFloat *)&v45[6] = v30;
      *(CGFloat *)&v45[7] = v31;
      *(CGFloat *)&v45[8] = v32;
      *(CGFloat *)&v45[9] = v33;
      char v46 = v43;
      v45[4] = v11;
      v45[5] = a4;
      *(double *)&v45[10] = v29;
      char v47 = v37;
      char v48 = v38;
      char v49 = v39;
      [v44 provideImageRendererOfMinimumSize:v42 sixChannelBlending:v45 inBlock:v34, v36];
    }
  }
}

@end