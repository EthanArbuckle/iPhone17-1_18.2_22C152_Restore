@interface UIImage(NTKRoundedCornerOverlayView)
+ (uint64_t)newImageForScreenCorner:()NTKRoundedCornerOverlayView screenScale:cornerRadius:;
@end

@implementation UIImage(NTKRoundedCornerOverlayView)

+ (uint64_t)newImageForScreenCorner:()NTKRoundedCornerOverlayView screenScale:cornerRadius:
{
  double v8 = ceil(a2 * 1.528665 * a1) / a1;
  v17.width = v8 + 0.5;
  v17.height = v8 + 0.5;
  UIGraphicsBeginImageContextWithOptions(v17, 0, a1);
  v9 = [MEMORY[0x1E4FB1618] blackColor];
  [v9 setFill];

  v10 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", 0.0, 0.0, v8 + 0.5, v8 + 0.5);
  [v10 fill];

  CurrentContext = UIGraphicsGetCurrentContext();
  switch(a5)
  {
    case 1:
      double v12 = -0.5;
      goto LABEL_4;
    case 2:
      double v12 = -0.5 - v8;
LABEL_4:
      double v13 = -0.5;
      goto LABEL_7;
    case 4:
      double v12 = -0.5;
      double v13 = -0.5 - v8;
      goto LABEL_7;
    case 8:
      double v12 = -0.5 - v8;
      double v13 = -0.5 - v8;
LABEL_7:
      CGContextTranslateCTM(CurrentContext, v12, v13);
      break;
    default:
      break;
  }
  v14 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", 1.0, 1.0, v8 + v8, v8 + v8, a2 + -1.0);
  [v14 setLineWidth:1.0];
  [v14 fillWithBlendMode:16 alpha:1.0];
  uint64_t v15 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v15;
}

@end