@interface NSString(NavigationDebug)
+ (__CFString)_navigation_pointerDescription:()NavigationDebug;
+ (__CFString)_navigation_stringWithAltitude:()NavigationDebug accuracy:;
+ (__CFString)_navigation_stringWithAltitudeUnits;
+ (__CFString)_navigation_stringWithDirection:()NavigationDebug abbreviated:;
+ (__CFString)_navigation_stringWithSpeed:()NavigationDebug;
+ (__CFString)_navigation_stringWithSpeedUnits;
+ (uint64_t)_navigation_stringWithTime:()NavigationDebug;
@end

@implementation NSString(NavigationDebug)

+ (__CFString)_navigation_stringWithSpeed:()NavigationDebug
{
  if (a1 >= 0.0)
  {
    objc_msgSend(NSString, "localizedStringWithFormat:", @"%ld", llround(a1 * 2.23693629));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = @"?";
  }
  return v2;
}

+ (__CFString)_navigation_stringWithSpeedUnits
{
  return @"m/h";
}

+ (__CFString)_navigation_stringWithDirection:()NavigationDebug abbreviated:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (!qword_1EB59C080)
  {
    int v39 = a4;
    id v5 = objc_alloc(MEMORY[0x1E4F1C978]);
    v6 = _MNLocalizedStringFromThisBundle(@"North");
    v7 = _MNLocalizedStringFromThisBundle(@"North East");
    v8 = _MNLocalizedStringFromThisBundle(@"East");
    v9 = _MNLocalizedStringFromThisBundle(@"South East");
    v10 = _MNLocalizedStringFromThisBundle(@"South");
    v11 = _MNLocalizedStringFromThisBundle(@"South West");
    v12 = _MNLocalizedStringFromThisBundle(@"West");
    v13 = _MNLocalizedStringFromThisBundle(@"North West");
    uint64_t v14 = objc_msgSend(v5, "initWithObjects:", v6, v7, v8, v9, v10, v11, v12, v13, 0);
    v15 = (void *)qword_1EB59C080;
    qword_1EB59C080 = v14;

    id v16 = objc_alloc(MEMORY[0x1E4F1C978]);
    v17 = _MNLocalizedStringFromThisBundle(@"N");
    v18 = _MNLocalizedStringFromThisBundle(@"NE");
    v19 = _MNLocalizedStringFromThisBundle(@"E");
    v20 = _MNLocalizedStringFromThisBundle(@"SE");
    v21 = _MNLocalizedStringFromThisBundle(@"S");
    v22 = _MNLocalizedStringFromThisBundle(@"SW");
    v23 = _MNLocalizedStringFromThisBundle(@"W");
    v24 = _MNLocalizedStringFromThisBundle(@"NW");
    uint64_t v25 = objc_msgSend(v16, "initWithObjects:", v17, v18, v19, v20, v21, v22, v23, v24, 0);
    v26 = (void *)qword_1EB59C088;
    qword_1EB59C088 = v25;

    a4 = v39;
  }
  double v27 = a1 + 360.0;
  if (a1 >= 0.0) {
    double v27 = a1;
  }
  if (v27 >= 0.0)
  {
    uint64_t v30 = 10;
    if (a4) {
      uint64_t v30 = 11;
    }
    v31 = (void *)_MergedGlobals_21[v30];
    unint64_t v32 = llround(floor((v27 + 22.5) / 45.0));
    unint64_t v33 = v32 & 7;
    uint64_t v35 = -(uint64_t)v32;
    BOOL v34 = v35 < 0;
    uint64_t v36 = v35 & 7;
    if (v34) {
      unint64_t v37 = v33;
    }
    else {
      unint64_t v37 = -v36;
    }
    v29 = [v31 objectAtIndex:v37];
  }
  else
  {
    v28 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v41 = "+[NSString(NavigationDebug) _navigation_stringWithDirection:abbreviated:]";
      __int16 v42 = 2080;
      v43 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/NSString+MNExtras.m";
      __int16 v44 = 1024;
      int v45 = 2300;
      _os_log_impl(&dword_1B542B000, v28, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", buf, 0x1Cu);
    }

    v29 = @"?";
  }
  return v29;
}

+ (__CFString)_navigation_stringWithAltitude:()NavigationDebug accuracy:
{
  if (a2 == 0.0)
  {
    objc_msgSend(NSString, "localizedStringWithFormat:", @"%ld", llround(a1 * 3.2808399), v4);
LABEL_5:
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (a2 > 0.0)
  {
    objc_msgSend(NSString, "localizedStringWithFormat:", @"%ld ±%ld", llround(a1 * 3.2808399), llround(a2 * 3.2808399));
    goto LABEL_5;
  }
  v2 = @"?";
LABEL_7:
  return v2;
}

+ (__CFString)_navigation_stringWithAltitudeUnits
{
  return @"ft";
}

+ (uint64_t)_navigation_stringWithTime:()NavigationDebug
{
  return [MEMORY[0x1E4F28C10] localizedStringFromDate:a3 dateStyle:0 timeStyle:1];
}

+ (__CFString)_navigation_pointerDescription:()NavigationDebug
{
  if (a3)
  {
    v3 = NSString;
    id v4 = a3;
    id v5 = [v3 stringWithFormat:@"<%@ %p>", objc_opt_class(), v4];
  }
  else
  {
    id v5 = @"nil";
  }
  return v5;
}

@end