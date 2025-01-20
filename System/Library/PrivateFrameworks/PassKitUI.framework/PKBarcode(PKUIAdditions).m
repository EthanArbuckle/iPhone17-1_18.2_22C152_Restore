@interface PKBarcode(PKUIAdditions)
- (double)sizeForPassStyle:()PKUIAdditions;
- (double)variance;
- (id)_imageFromBarcodeMessage;
- (id)imageWithSize:()PKUIAdditions;
@end

@implementation PKBarcode(PKUIAdditions)

- (double)variance
{
  unint64_t v1 = [a1 format] - 1;
  if (v1 > 2) {
    return *MEMORY[0x1E4F1DB30];
  }
  else {
    return dbl_1A0443EE0[v1];
  }
}

- (double)sizeForPassStyle:()PKUIAdditions
{
  if (a3 < 8) {
    goto LABEL_2;
  }
  if (a3 != 8)
  {
    if (a3 != 9) {
      return *MEMORY[0x1E4F1DB30];
    }
LABEL_2:
    unint64_t v3 = [a1 format] - 1;
    if (v3 < 4) {
      return dbl_1A0443EF8[v3];
    }
    return *MEMORY[0x1E4F1DB30];
  }
  uint64_t v5 = [a1 format];
  double result = 245.0;
  switch(v5)
  {
    case 1:
      double result = dbl_1A0443EB0[PKUseTallPasses() == 0];
      break;
    case 2:
    case 4:
      return result;
    case 3:
      double result = 160.0;
      break;
    default:
      return *MEMORY[0x1E4F1DB30];
  }
  return result;
}

- (id)imageWithSize:()PKUIAdditions
{
  v6 = [a1 image];
  v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v7 scale];
  double v9 = v8;

  double v10 = a2 * v9;
  double v11 = a3 * v9;
  [v6 size];
  double v13 = a2 * v9 / v12;
  [v6 size];
  double v15 = a3 * v9 / v14;
  [v6 size];
  double v49 = v16;
  float v17 = v13;
  double v48 = floorf(v17);
  [v6 size];
  double v47 = v18;
  *(float *)&a3 = v15;
  double v19 = floorf(*(float *)&a3);
  [v6 size];
  double v21 = v20;
  double v22 = ceilf(v17);
  [v6 size];
  double v24 = v23;
  double v25 = ceilf(*(float *)&a3);
  [a1 variance];
  double v28 = vabdd_f64(v47 * v19, v11);
  double v29 = v24 * v25 - v11;
  double v30 = vabdd_f64(v49 * v48, v10);
  if (v26 <= 0.0)
  {
    double v26 = v27;
  }
  else
  {
    double v29 = v21 * v22 - v10;
    double v28 = v30;
  }
  double v31 = fabs(v29);
  double v32 = v9 * v26;
  if (v28 <= v32) {
    double v33 = v19;
  }
  else {
    double v33 = v25;
  }
  if (v28 <= v32) {
    double v34 = v48;
  }
  else {
    double v34 = v22;
  }
  if (v31 <= v32) {
    double v35 = v25;
  }
  else {
    double v35 = v33;
  }
  if (v31 <= v32) {
    double v36 = v22;
  }
  else {
    double v36 = v34;
  }
  [v6 size];
  CGFloat v38 = v37 * (v36 / v9);
  [v6 size];
  CGFloat v40 = v39 * (v35 / v9);
  id v41 = v6;
  v42 = (CGImage *)[v41 CGImage];
  v52.width = v38;
  v52.height = v40;
  UIGraphicsBeginImageContextWithOptions(v52, 0, v9);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationNone);
  transform.b = 0.0;
  transform.c = 0.0;
  transform.a = 1.0;
  *(_OWORD *)&transform.d = xmmword_1A0443EA0;
  transform.ty = v40;
  CGContextConcatCTM(CurrentContext, &transform);
  v53.origin.x = 0.0;
  v53.origin.y = 0.0;
  v53.size.width = v38;
  v53.size.height = v40;
  CGContextDrawImage(CurrentContext, v53, v42);
  Image = CGBitmapContextCreateImage(CurrentContext);
  UIGraphicsEndImageContext();
  v45 = objc_msgSend(MEMORY[0x1E4FB1818], "imageWithCGImage:scale:orientation:", Image, objc_msgSend(v41, "imageOrientation"), v9);
  CGImageRelease(Image);

  return v45;
}

- (id)_imageFromBarcodeMessage
{
  v2 = (void *)MEMORY[0x1A6224460]();
  uint64_t v3 = [a1 format];
  v4 = (void *)MEMORY[0x1E4F1E040];
  uint64_t v5 = PKBarcodeFilterNameForFormat();
  v6 = [v4 filterWithName:v5];

  v7 = [a1 messageData];
  [v6 setValue:v7 forKey:@"inputMessage"];

  if (v3 == 4)
  {
    if ([a1 shouldRemoveQuietZone]) {
      [v6 setValue:&unk_1EF2B88C0 forKey:@"inputQuietSpace"];
    }
  }
  else
  {
    uint64_t v8 = [a1 options];
    double v9 = (void *)v8;
    double v10 = (void *)MEMORY[0x1E4F1CC08];
    if (v8) {
      double v10 = (void *)v8;
    }
    id v11 = v10;

    [v6 setValue:v11 forKey:@"inputOptions"];
    [a1 shouldRemoveQuietZone];
  }
  if (objc_opt_respondsToSelector())
  {
    double v12 = objc_msgSend(MEMORY[0x1E4FB1818], "imageWithCGImage:", objc_msgSend(v6, "outputCGImage"));
  }
  else
  {
    double v13 = [v6 valueForKey:@"outputImage"];
    if (qword_1EB545C18 != -1) {
      dispatch_once(&qword_1EB545C18, &__block_literal_global_86);
    }
    id v14 = (id)_MergedGlobals_678;
    [v13 extent];
    double v15 = (CGImage *)objc_msgSend(v14, "createCGImage:fromRect:", v13);

    double v12 = [MEMORY[0x1E4FB1818] imageWithCGImage:v15];
    CGImageRelease(v15);
  }

  return v12;
}

@end