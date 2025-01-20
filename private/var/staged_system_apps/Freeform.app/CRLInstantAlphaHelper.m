@interface CRLInstantAlphaHelper
+ (id)newInstantAlphaImageWithCGImage:(CGImage *)a3 ofSize:(CGSize)a4;
+ (id)newMaskBitmapWithPoint:(CGPoint)a3 image:(id)a4 tolerance:(unint64_t)a5 oldMaskBitmap:(id)a6;
+ (id)newMaskSeedFillWithPoint:(CGPoint)a3 inImage:(id)a4 tolerance:(unint64_t)a5 oldFill:(id)a6;
+ (id)removeBackgroundFromCGImage:(CGImage *)a3;
+ (void)p_loadVKCGImageRemoveBackground;
@end

@implementation CRLInstantAlphaHelper

+ (id)newInstantAlphaImageWithCGImage:(CGImage *)a3 ofSize:(CGSize)a4
{
  double v5 = sub_1000674B8(a4.width);
  double v7 = v6;
  v8 = [[CRLInstantAlphaImage alloc] initWithWidth:(uint64_t)v5 height:(uint64_t)v6];
  if (v8)
  {
    v9 = (CGColorSpace *)sub_10000FC28();
    ColorSpace = CGImageGetColorSpace(a3);
    if (CGColorSpaceIsWideGamutRGB(ColorSpace)) {
      v9 = (CGColorSpace *)sub_10000FDD8();
    }
    v11 = CGBitmapContextCreate(v8->mImageData, (unint64_t)v5, (unint64_t)v7, 8uLL, 4 * (unint64_t)v5, v9, 0x2001u);
    v14.origin.x = sub_100064070();
    CGContextDrawImage(v11, v14, a3);
    CGContextRelease(v11);
    v12 = v8;
  }

  return v8;
}

+ (id)newMaskBitmapWithPoint:(CGPoint)a3 image:(id)a4 tolerance:(unint64_t)a5 oldMaskBitmap:(id)a6
{
  double y = a3.y;
  double x = a3.x;
  v10 = a4;
  id v11 = a6;
  v12 = [[CRLInstantAlphaBinaryBitmap alloc] initWithWidth:v10[1] height:v10[2]];
  int v13 = sub_1000C846C(v10, (uint64_t)x, (uint64_t)y);
  CGRect v14 = dispatch_get_global_queue(0, 0);
  size_t v15 = v10[2];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C8704;
  block[3] = &unk_1014D3688;
  id v23 = v10;
  id v24 = v11;
  v16 = v12;
  int v27 = v13;
  v25 = v16;
  unint64_t v26 = a5;
  id v17 = v11;
  v18 = v10;
  dispatch_apply(v15, v14, block);
  v19 = v25;
  v20 = v16;

  return v20;
}

+ (id)newMaskSeedFillWithPoint:(CGPoint)a3 inImage:(id)a4 tolerance:(unint64_t)a5 oldFill:(id)a6
{
  double y = a3.y;
  double x = a3.x;
  v17[0] = 0;
  double v10 = (double)(*((void *)a4 + 1) - 1);
  id v11 = a6;
  v12 = a4;
  double v13 = sub_100407E48(x, 0.0, v10);
  double v14 = sub_100407E48(y, 0.0, (double)(v12[2] - 1));
  v17[0] = sub_1000C846C(v12, (uint64_t)v13, (uint64_t)v14);
  v17[1] = a5;
  id v15 = +[CRLInstantAlphaSeedFill newSeedFillWithImage:seedPoint:context:oldFill:](CRLInstantAlphaSeedFill, "newSeedFillWithImage:seedPoint:context:oldFill:", v12, v17, v11, v13, v14);

  return v15;
}

+ (id)removeBackgroundFromCGImage:(CGImage *)a3
{
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  unint64_t v26 = sub_1000C91EC;
  int v27 = sub_1000C91FC;
  v28 = objc_alloc_init(CRLRemoveImageBackgroundData);
  double v6 = (void (*)(CGImage *, uint64_t, void *))[a1 p_loadVKCGImageRemoveBackground];
  if (!v6) {
    goto LABEL_9;
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000C9204;
  v19[3] = &unk_1014D36F0;
  v21 = &v23;
  v22 = a3;
  double v7 = dispatch_group_create();
  v20 = v7;
  v8 = objc_retainBlock(v19);
  dispatch_group_enter(v7);
  v6(a3, 1, v8);
  dispatch_time_t v9 = dispatch_time(0, 5000000000);
  intptr_t v10 = dispatch_group_wait(v7, v9);
  if (v10)
  {
    if (qword_101719A68 != -1) {
      dispatch_once(&qword_101719A68, &stru_1014D3710);
    }
    id v11 = off_10166B498;
    if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Remove background from image timed out.", v18, 2u);
    }
    v12 = +[NSBundle mainBundle];
    double v13 = [v12 localizedStringForKey:@"Can’t Remove Background" value:0 table:0];

    double v14 = +[NSBundle mainBundle];
    id v15 = [v14 localizedStringForKey:@"The background can’t be removed from this image." value:0 table:0];

    v16 = +[NSError crl_errorWithDomain:@"com.apple.freeform" code:2 alertTitle:v13 alertMessage:v15];
    [(id)v24[5] setError:v16];
    id v3 = (id)v24[5];
  }
  if (!v10) {
LABEL_9:
  }
    id v3 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v3;
}

+ (void)p_loadVKCGImageRemoveBackground
{
  if (qword_1016A9038 != -1) {
    dispatch_once(&qword_1016A9038, &stru_1014D3730);
  }
  return (void *)qword_1016A9040;
}

@end