@interface NTKRichComplicationBezelUtilities
+ (id)hitTestPathWithViewBounds:(CGRect)a3 shape:(int64_t)a4 shapeFrame:(CGRect)a5 forDevice:(id)a6;
@end

@implementation NTKRichComplicationBezelUtilities

+ (id)hitTestPathWithViewBounds:(CGRect)a3 shape:(int64_t)a4 shapeFrame:(CGRect)a5 forDevice:(id)a6
{
  double height = a5.size.height;
  double width = a3.size.width;
  double v6 = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v10 = a3.size.height;
  double v31 = a3.origin.x;
  double v32 = a3.origin.y;
  id v11 = a6;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_66);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_66);
  if (WeakRetained)
  {
    v13 = WeakRetained;
    id v14 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_66);
    if (v14 == v11)
    {
      uint64_t v15 = [v11 version];
      uint64_t v16 = _LayoutConstants___previousCLKDeviceVersion_66;

      if (v15 == v16) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v17 = objc_storeWeak(&_LayoutConstants___cachedDevice_66, v11);
  _LayoutConstants___previousCLKDeviceVersion_66 = [v11 version];

  ___LayoutConstants_block_invoke_62(v18, v11);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_66);
  double v19 = *(double *)&_LayoutConstants_constants_0_8;
  double v20 = *(double *)&_LayoutConstants_constants_1_9;
  double v21 = *(double *)&_LayoutConstants_constants_2_8;
  double v22 = *(double *)&_LayoutConstants_constants_3_7;

  if ((unint64_t)a4 < 2)
  {
    v23 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", x, y, v6, height);
  }
  else if (a4 == 2)
  {
    double v27 = v10 * 0.5;
    double v28 = v19 * 0.5;
    double v29 = v19 * 0.5 - v20;
    v23 = [MEMORY[0x1E4FB14C0] bezierPath];
    objc_msgSend(v23, "moveToPoint:", width * 0.5, v27);
    objc_msgSend(v23, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, width * 0.5, v27, v29, v21, 3.14159265);
    objc_msgSend(v23, "addLineToPoint:", 0.0, v27);
    objc_msgSend(v23, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, width * 0.5, v27, v28, 3.14159265, 0.0);
    objc_msgSend(v23, "addLineToPoint:", width - v20, v27);
    objc_msgSend(v23, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, width * 0.5, v27, v29, 0.0, v22);
    [v23 closePath];
  }
  else if (a4 == 3)
  {
    v23 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", v31, v32, width, v10);
    double v24 = v10 * 0.5;
    v25 = [MEMORY[0x1E4FB14C0] bezierPath];
    objc_msgSend(v25, "moveToPoint:", width * 0.5, v24);
    objc_msgSend(v25, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, width * 0.5, v24, v19 * 0.5 - v20, v22, v21);
    objc_msgSend(v25, "addLineToPoint:", width * 0.5, v24);
    [v25 closePath];
    v26 = [v25 bezierPathByReversingPath];
    [v23 appendPath:v26];
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

@end