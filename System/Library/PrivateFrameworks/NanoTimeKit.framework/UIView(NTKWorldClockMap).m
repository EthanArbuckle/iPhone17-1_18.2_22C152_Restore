@interface UIView(NTKWorldClockMap)
+ (id)ntk_gossamer_terminatorViewForDate:()NTKWorldClockMap size:;
@end

@implementation UIView(NTKWorldClockMap)

+ (id)ntk_gossamer_terminatorViewForDate:()NTKWorldClockMap size:
{
  v28[4] = *MEMORY[0x1E4F143B8];
  if (a1 == *MEMORY[0x1E4F1DB30] && a2 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v11 = 0;
  }
  else
  {
    v8 = (objc_class *)MEMORY[0x1E4FB1EB0];
    id v9 = a5;
    id v10 = [v8 alloc];
    v11 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a1, a2);
    NTKWorldClock_DayOfYearForDate(v9);

    v15 = NTKWorldClock_NightMaskPathForDayOfYear(v12, v13, v14);
    v16 = [MEMORY[0x1E4F39BD0] layer];
    [v11 bounds];
    objc_msgSend(v16, "setFrame:");
    id v17 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.1];
    v28[0] = [v17 CGColor];
    id v18 = [MEMORY[0x1E4FB1618] whiteColor];
    v28[1] = [v18 CGColor];
    id v19 = [MEMORY[0x1E4FB1618] whiteColor];
    v28[2] = [v19 CGColor];
    id v20 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.1];
    v28[3] = [v20 CGColor];
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
    [v16 setColors:v21];

    objc_msgSend(v16, "setStartPoint:", 0.0, 0.5);
    objc_msgSend(v16, "setEndPoint:", 1.0, 0.5);
    [v16 setLocations:&unk_1F16EA090];
    v22 = [MEMORY[0x1E4F39C88] layer];
    id v23 = v15;
    objc_msgSend(v22, "setPath:", objc_msgSend(v23, "CGPath"));
    id v24 = [MEMORY[0x1E4FB1618] whiteColor];
    objc_msgSend(v22, "setStrokeColor:", objc_msgSend(v24, "CGColor"));

    [v22 setLineWidth:1.0];
    id v25 = [MEMORY[0x1E4FB1618] clearColor];
    objc_msgSend(v22, "setFillColor:", objc_msgSend(v25, "CGColor"));

    [v16 setMask:v22];
    v26 = [v11 layer];
    [v26 addSublayer:v16];
  }

  return v11;
}

@end