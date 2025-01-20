@interface NSDateComponents(NSCalendarUnit)
+ (__CFString)_ui_namesForComponents:()NSCalendarUnit;
+ (uint64_t)_ui_largerComponentsRelativeToComponent:()NSCalendarUnit;
+ (uint64_t)_ui_smallerComponentsRelativeToComponent:()NSCalendarUnit;
+ (uint64_t)smaller:()NSCalendarUnit componentsRelativeToComponent:;
- (id)_ui_conciseDescription;
- (uint64_t)_ui_valueForComponent:()NSCalendarUnit;
- (void)_ui_setComponents:()NSCalendarUnit;
- (void)_ui_setValue:()NSCalendarUnit forComponent:;
@end

@implementation NSDateComponents(NSCalendarUnit)

+ (uint64_t)smaller:()NSCalendarUnit componentsRelativeToComponent:
{
  char v4 = 0;
  uint64_t v5 = 0;
  uint64_t result = 0;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v20[0] = xmmword_186B9B170;
  v20[1] = unk_186B9B180;
  v20[2] = xmmword_186B9B190;
  uint64_t v21 = 2;
  v18[0] = xmmword_186B9B1A8;
  v18[1] = unk_186B9B1B8;
  uint64_t v19 = 2;
  uint64_t v7 = 0x2000;
  if (a4 != 256) {
    uint64_t v7 = a4;
  }
  uint64_t v8 = -1;
  if (!a3) {
    uint64_t v8 = 1;
  }
  uint64_t v9 = 6;
  if (!a3) {
    uint64_t v9 = 0;
  }
  uint64_t v10 = 7;
  if (a3) {
    uint64_t v10 = -1;
  }
  v17[0] = v20;
  v17[1] = v18;
  v18[2] = xmmword_186B9B1C8;
  do
  {
    int v11 = 0;
    v12 = (uint64_t *)(v17[v5] + 8 * v9);
    uint64_t v13 = v9;
    do
    {
      int v14 = v11 | (v7 == *v12);
      if (v11) {
        uint64_t v15 = *v12;
      }
      else {
        uint64_t v15 = 0;
      }
      result |= v15;
      v13 += v8;
      v12 += v8;
      int v11 = v14;
    }
    while (v13 != v10);
    char v16 = v4 | v14;
    char v4 = 1;
    uint64_t v5 = 1;
  }
  while ((v16 & 1) == 0);
  return result;
}

+ (uint64_t)_ui_smallerComponentsRelativeToComponent:()NSCalendarUnit
{
  return [a1 smaller:1 componentsRelativeToComponent:a3];
}

+ (uint64_t)_ui_largerComponentsRelativeToComponent:()NSCalendarUnit
{
  return [a1 smaller:0 componentsRelativeToComponent:a3];
}

+ (__CFString)_ui_namesForComponents:()NSCalendarUnit
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = @"NSDateComponentUndefined";
  }
  else
  {
    uint64_t v4 = a3;
    v11[4] = xmmword_1E52FF0F8;
    v11[5] = *(_OWORD *)&off_1E52FF108;
    v11[6] = xmmword_1E52FF118;
    v11[7] = *(_OWORD *)&off_1E52FF128;
    v11[0] = xmmword_1E52FF0B8;
    v11[1] = *(_OWORD *)&off_1E52FF0C8;
    v11[2] = xmmword_1E52FF0D8;
    v11[3] = *(_OWORD *)&off_1E52FF0E8;
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    for (uint64_t i = 0; i != 16; ++i)
    {
      uint64_t v7 = qword_186B9B1E0[i];
      if ((v7 & v4) != 0)
      {
        [v5 addObject:*(void *)((char *)v11 + i * 8)];
        v4 &= ~v7;
      }
    }
    if (v4)
    {
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"<Unknown: %lu>", v4);
      [v5 addObject:v8];
    }
    v3 = [v5 componentsJoinedByString:@" | "];

    for (uint64_t j = 120; j != -8; j -= 8)
  }
  return v3;
}

- (id)_ui_conciseDescription
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"<NSDateComponents: %p>", a1);
  v3 = [a1 calendar];
  if (v3)
  {
  }
  else
  {
    uint64_t v4 = [a1 timeZone];

    if (!v4) {
      goto LABEL_5;
    }
  }
  uint64_t v5 = [a1 calendar];
  v6 = [a1 timeZone];
  [v2 appendFormat:@"\nCalendar: %@ / Time Zone: %@", v5, v6];

LABEL_5:
  if ([a1 era] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v2, "appendFormat:", @"\n Era: %ld", objc_msgSend(a1, "era"));
  }
  if ([a1 year] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v2, "appendFormat:", @"\n Year: %ld", objc_msgSend(a1, "year"));
  }
  if ([a1 month] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v2, "appendFormat:", @"\n Month: %ld", objc_msgSend(a1, "month"));
  }
  if ([a1 day] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v2, "appendFormat:", @"\n Day: %ld", objc_msgSend(a1, "day"));
  }
  if ([a1 hour] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v2, "appendFormat:", @"\n Hour: %ld", objc_msgSend(a1, "hour"));
  }
  if ([a1 minute] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v2, "appendFormat:", @"\n Minute: %ld", objc_msgSend(a1, "minute"));
  }
  if ([a1 second] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v2, "appendFormat:", @"\n Second: %ld", objc_msgSend(a1, "second"));
  }
  if ([a1 weekOfMonth] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v2, "appendFormat:", @"\n Week of Month: %ld", objc_msgSend(a1, "weekOfMonth"));
  }
  if ([a1 weekOfYear] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v2, "appendFormat:", @"\n Week of Year: %ld", objc_msgSend(a1, "weekOfYear"));
  }
  if ([a1 yearForWeekOfYear] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v2, "appendFormat:", @"\n Year for Week of Year: %ld", objc_msgSend(a1, "yearForWeekOfYear"));
  }
  if ([a1 weekday] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v2, "appendFormat:", @"\n Weekday: %ld", objc_msgSend(a1, "weekday"));
  }
  if ([a1 weekdayOrdinal] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v2, "appendFormat:", @"\n Weekday Ordinal: %ld", objc_msgSend(a1, "weekdayOrdinal"));
  }
  if ([a1 quarter] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v2, "appendFormat:", @"\n Quarter: %ld", objc_msgSend(a1, "quarter"));
  }
  return v2;
}

- (uint64_t)_ui_valueForComponent:()NSCalendarUnit
{
  if (a3 > 255)
  {
    if (a3 <= 2047)
    {
      switch(a3)
      {
        case 256:
          return [a1 week];
        case 512:
          return [a1 weekday];
        case 1024:
          return [a1 weekdayOrdinal];
      }
    }
    else if (a3 >= 0x2000)
    {
      if (a3 == 0x2000) {
        return [a1 weekOfYear];
      }
      if (a3 == 0x4000) {
        return [a1 yearForWeekOfYear];
      }
    }
    else
    {
      if (a3 == 2048) {
        return [a1 quarter];
      }
      if (a3 == 4096) {
        return [a1 weekOfMonth];
      }
    }
  }
  else if (a3 <= 15)
  {
    switch(a3)
    {
      case 2:
        return [a1 era];
      case 4:
        return [a1 year];
      case 8:
        return [a1 month];
    }
  }
  else if (a3 > 63)
  {
    if (a3 == 64) {
      return [a1 minute];
    }
    if (a3 == 128) {
      return [a1 second];
    }
  }
  else
  {
    if (a3 == 16) {
      return [a1 day];
    }
    if (a3 == 32) {
      return [a1 hour];
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_ui_setValue:()NSCalendarUnit forComponent:
{
  if (a4 > 255)
  {
    if (a4 <= 2047)
    {
      switch(a4)
      {
        case 256:
          return objc_msgSend(a1, "setWeek:");
        case 512:
          return objc_msgSend(a1, "setWeekday:");
        case 1024:
          return objc_msgSend(a1, "setWeekdayOrdinal:");
      }
    }
    else if (a4 >= 0x2000)
    {
      if (a4 == 0x2000)
      {
        return objc_msgSend(a1, "setWeekOfYear:");
      }
      else if (a4 == 0x4000)
      {
        return objc_msgSend(a1, "setYearForWeekOfYear:");
      }
    }
    else if (a4 == 2048)
    {
      return objc_msgSend(a1, "setQuarter:");
    }
    else if (a4 == 4096)
    {
      return objc_msgSend(a1, "setWeekOfMonth:");
    }
  }
  else if (a4 <= 15)
  {
    switch(a4)
    {
      case 2:
        return objc_msgSend(a1, "setEra:");
      case 4:
        return objc_msgSend(a1, "setYear:");
      case 8:
        return objc_msgSend(a1, "setMonth:");
    }
  }
  else if (a4 > 63)
  {
    if (a4 == 64)
    {
      return objc_msgSend(a1, "setMinute:");
    }
    else if (a4 == 128)
    {
      return objc_msgSend(a1, "setSecond:");
    }
  }
  else if (a4 == 16)
  {
    return objc_msgSend(a1, "setDay:");
  }
  else if (a4 == 32)
  {
    return objc_msgSend(a1, "setHour:");
  }
  return a1;
}

- (void)_ui_setComponents:()NSCalendarUnit
{
  id v4 = a3;
  uint64_t v5 = 0;
  id v11 = v4;
  do
  {
    uint64_t v6 = qword_186B9B260[v5];
    if (objc_msgSend(v4, "_ui_valueForComponent:", v6) != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(a1, "_ui_setValue:forComponent:", objc_msgSend(v11, "_ui_valueForComponent:", v6), v6);
    }
    ++v5;
    id v4 = v11;
  }
  while (v5 != 14);
  uint64_t v7 = [v11 calendar];

  if (v7)
  {
    uint64_t v8 = [v11 calendar];
    [a1 setCalendar:v8];
  }
  uint64_t v9 = [v11 timeZone];

  if (v9)
  {
    uint64_t v10 = [v11 timeZone];
    [a1 setTimeZone:v10];
  }
}

@end