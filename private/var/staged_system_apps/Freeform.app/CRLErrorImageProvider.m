@interface CRLErrorImageProvider
+ (CRLErrorImageProvider)sharedInstance;
- (BOOL)isError;
- (BOOL)isValid;
- (CGPDFDocument)p_iconPDFDocument;
- (CGSize)naturalSize;
- (void)drawImageInContext:(CGContext *)a3 rect:(CGRect)a4;
@end

@implementation CRLErrorImageProvider

+ (CRLErrorImageProvider)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023E1CC;
  block[3] = &unk_1014CC6D8;
  block[4] = a1;
  if (qword_1016A93C8 != -1) {
    dispatch_once(&qword_1016A93C8, block);
  }
  v2 = (void *)qword_1016A93C0;

  return (CRLErrorImageProvider *)v2;
}

- (CGSize)naturalSize
{
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isValid
{
  return 1;
}

- (BOOL)isError
{
  return 1;
}

- (void)drawImageInContext:(CGContext *)a3 rect:(CGRect)a4
{
  CGRect v43 = a4;
  if (sub_1001ACDE8(&v43.origin.x) && sub_1001ACDE8(&v43.origin.y))
  {
    CGFloat width = v43.size.width;
    if (v43.size.width != 0.0)
    {
      CGFloat height = v43.size.height;
      if (v43.size.height != 0.0)
      {
        CGFloat x = v43.origin.x;
        CGFloat y = v43.origin.y;
        if (!CGRectIsInfinite(*(CGRect *)(&width - 2)) && !CGRectIsNull(v43))
        {
          CGContextSetShouldAntialias(a3, 1);
          v10 = sub_10000FE5C(0.939999998, 0.939999998, 0.939999998, 1.0);
          CGContextSetFillColorWithColor(a3, v10);
          CGColorRelease(v10);
          CGContextFillRect(a3, v43);
          v11 = [(CRLErrorImageProvider *)self p_iconPDFDocument];
          if (v11)
          {
            Page = CGPDFDocumentGetPage(v11, 1uLL);
            if (Page)
            {
              v13 = Page;
              memset(&v42, 0, sizeof(v42));
              double v40 = 0.0;
              double v41 = 0.0;
              double v14 = sub_100456798(Page, (uint64_t)&v42, &v40);
              CGFloat v16 = v15;
              CGFloat v18 = v17;
              CGFloat v20 = v19;
              CGFloat v21 = v43.size.width;
              CGFloat v22 = v43.size.height;
              double v23 = sub_1000646A4(v43.size.width, v43.size.height, 0.35);
              double v24 = v40;
              double v25 = v41;
              sub_100067200(v40, v41, v23, v26);
              double v27 = sub_100064070();
              double v31 = sub_100065A10(v27, v28, v29, v30, v43.origin.x, v43.origin.y, v21, v22);
              long long v38 = 0u;
              long long v39 = 0u;
              __n128 v37 = 0u;
              CGAffineTransform v36 = v42;
              sub_100456B98((__n128 *)&v36, &v37, v24, v25, v31, v32, v33, v34);
              *(__n128 *)&v36.a = v37;
              *(_OWORD *)&v36.c = v38;
              *(_OWORD *)&v36.tCGFloat x = v39;
              CGContextConcatCTM(a3, &v36);
              v44.origin.CGFloat x = v14;
              v44.origin.CGFloat y = v16;
              v44.size.CGFloat width = v18;
              v44.size.CGFloat height = v20;
              CGContextClipToRect(a3, v44);
              v45.origin.CGFloat x = v14;
              v45.origin.CGFloat y = v16;
              v45.size.CGFloat width = v18;
              v45.size.CGFloat height = v20;
              CGFloat MaxY = CGRectGetMaxY(v45);
              CGContextTranslateCTM(a3, 0.0, MaxY);
              CGContextScaleCTM(a3, 1.0, -1.0);
              CGContextDrawPDFPage(a3, v13);
            }
          }
        }
      }
    }
  }
}

- (CGPDFDocument)p_iconPDFDocument
{
  if (qword_1016A93D8 != -1) {
    dispatch_once(&qword_1016A93D8, &stru_1014E4690);
  }
  v2 = (void *)qword_1016A93D0;

  return (CGPDFDocument *)[v2 CGPDFDocument];
}

@end