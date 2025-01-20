@interface UIImage(NTKWorldClockMap)
+ (id)ntk_gossamer_nightMaskForDate:()NTKWorldClockMap size:;
+ (id)ntk_pregossamer_nightMaskForDate:()NTKWorldClockMap size:;
+ (uint64_t)ntk_solarTerminatorStrokeColor;
@end

@implementation UIImage(NTKWorldClockMap)

+ (uint64_t)ntk_solarTerminatorStrokeColor
{
  return [MEMORY[0x1E4FB1618] systemGrayColor];
}

+ (id)ntk_gossamer_nightMaskForDate:()NTKWorldClockMap size:
{
  if (a1 == *MEMORY[0x1E4F1DB30] && a2 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v18 = 0;
  }
  else
  {
    double v8 = NTKWorldClock_DayOfYearForDate(a5);
    v12 = NTKWorldClock_NightMaskPathForDayOfYear(v9, v10, v11);
    v13 = [MEMORY[0x1E4FB14C0] bezierPath];
    if (sin((v8 + 284.0) * 0.98630137 * 0.0174532925) * 23.45 >= 0.0) {
      double v14 = 0.0;
    }
    else {
      double v14 = a2;
    }
    objc_msgSend(v13, "moveToPoint:");
    [v13 appendPath:v12];
    objc_msgSend(v13, "addLineToPoint:", a1, v14);
    objc_msgSend(v13, "addLineToPoint:", 0.0, v14);
    v21.width = a1;
    v21.height = a2;
    UIGraphicsBeginImageContextWithOptions(v21, 0, 0.0);
    v15 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.45];
    [v15 setFill];

    CurrentContext = UIGraphicsGetCurrentContext();
    v22.origin.x = 0.0;
    v22.origin.y = 0.0;
    v22.size.width = a1;
    v22.size.height = a2;
    CGContextFillRect(CurrentContext, v22);
    v17 = [MEMORY[0x1E4FB1618] whiteColor];
    [v17 setFill];

    [v13 fill];
    v18 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }

  return v18;
}

+ (id)ntk_pregossamer_nightMaskForDate:()NTKWorldClockMap size:
{
  if (a1 == *MEMORY[0x1E4F1DB30] && a2 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v17 = 0;
  }
  else
  {
    double v8 = NTKWorldClock_DayOfYearForDate(a5);
    v12 = NTKWorldClock_NightMaskPathForDayOfYear(v9, v10, v11);
    v13 = [MEMORY[0x1E4FB14C0] bezierPath];
    if (sin((v8 + 284.0) * 0.98630137 * 0.0174532925) * 23.45 <= 0.0) {
      double v14 = 0.0;
    }
    else {
      double v14 = a2;
    }
    objc_msgSend(v13, "moveToPoint:");
    [v13 appendPath:v12];
    objc_msgSend(v13, "addLineToPoint:", a1, v14);
    objc_msgSend(v13, "addLineToPoint:", 0.0, v14);
    v20.width = a1;
    v20.height = a2;
    UIGraphicsBeginImageContextWithOptions(v20, 0, 0.0);
    v15 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.65];
    [v15 setFill];

    [v13 fillWithBlendMode:17 alpha:1.0];
    v16 = objc_msgSend(MEMORY[0x1E4FB1818], "ntk_solarTerminatorStrokeColor");
    [v16 setStroke];
    [v12 stroke];
    v17 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }

  return v17;
}

@end