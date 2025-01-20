@interface ICPDFPreviewHelper
+ (BOOL)drawPreviewOfPDFDocument:(id)a3 inRect:(CGRect)a4;
@end

@implementation ICPDFPreviewHelper

+ (BOOL)drawPreviewOfPDFDocument:(id)a3 inRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v8 = [a3 pageAtIndex:0];
  if (!v8)
  {
    v11 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[ICPDFPreviewHelper drawPreviewOfPDFDocument:inRect:](v11);
    }
    goto LABEL_13;
  }
  CurrentContext = UIGraphicsGetCurrentContext();
  v10 = objc_msgSend(v8, "thumbnailOfSize:forBox:", 1, width, height);
  v11 = v10;
  if (!v10
    || ([v10 size], v12 <= 0.0)
    || ([v11 size], v13 <= 0.0)
    || width <= 0.0
    || height <= 0.0)
  {
    v22 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      +[ICPDFPreviewHelper drawPreviewOfPDFDocument:inRect:](v22);
    }

LABEL_13:
    BOOL v21 = 0;
    goto LABEL_14;
  }
  [v11 size];
  double v15 = v14;
  [v11 size];
  v24.size.double height = width / (v15 / v16);
  v24.origin.CGFloat x = 0.0;
  v24.origin.CGFloat y = 0.0;
  v24.size.double width = width;
  CGRect v25 = CGRectOffset(v24, x, y);
  double v17 = v25.origin.x;
  double v18 = v25.origin.y;
  double v19 = v25.size.width;
  double v20 = v25.size.height;
  CGContextSaveGState(CurrentContext);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.double width = width;
  v26.size.double height = height;
  CGContextClipToRect(CurrentContext, v26);
  -[NSObject drawInRect:](v11, "drawInRect:", v17, v18, v19, v20);
  CGContextRestoreGState(CurrentContext);
  BOOL v21 = 1;
LABEL_14:

  return v21;
}

+ (void)drawPreviewOfPDFDocument:(os_log_t)log inRect:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "PDF document didn't have a first page for attachment", v1, 2u);
}

+ (void)drawPreviewOfPDFDocument:(os_log_t)log inRect:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "Generated preview image for paper bundle attachment was invalid", v1, 2u);
}

@end