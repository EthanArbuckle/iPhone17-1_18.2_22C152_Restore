@interface HTDisplayParser
+ ($2825F4736939C4A6D3AD43837233062D)displayStateBeforeOrAtTime:(unint64_t)a3 timestamps:(id)a4 states:(id)a5;
+ (DisplayStateChangeEvent)displayStateBeforeHangStartTimestamp:(unint64_t)a3 displayTimestamps:(id)a4 displayStates:(id)a5;
+ (id)displayEventStatesFromDisplayInfo:(id)a3;
+ (id)displayEventTimestampsFromDisplayInfo:(id)a3;
+ (id)displayInfoForSpindump:(id)a3 startAbsoluteTime:(unint64_t)a4 endAbsoluteTime:(unint64_t)a5;
+ (id)displayOnIntervalsForDisplayTimestamps:(id)a3 displayStates:(id)a4 startTimestamp:(unint64_t)a5 endTimestamp:(unint64_t)a6 startState:(id *)a7 endState:(id *)a8;
@end

@implementation HTDisplayParser

+ (id)displayEventTimestampsFromDisplayInfo:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  if ([v3 count])
  {
    unint64_t v6 = 0;
    *(void *)&long long v5 = 134217984;
    long long v13 = v5;
    do
    {
      v7 = sub_10001B6E0();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v9 = [v3 objectAtIndexedSubscript:v6];
        id v10 = [v9 unsignedLongLongValue];
        *(_DWORD *)buf = v13;
        id v15 = v10;
        _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "display event timestamp: %llu", buf, 0xCu);
      }
      v8 = [v3 objectAtIndexedSubscript:v6];
      [v4 addObject:v8];

      v6 += 2;
    }
    while ((unint64_t)[v3 count] > v6);
  }
  id v11 = [v4 copy:v13];

  return v11;
}

+ (id)displayEventStatesFromDisplayInfo:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  if ([v3 count])
  {
    unint64_t v6 = 1;
    *(void *)&long long v5 = 134217984;
    long long v13 = v5;
    do
    {
      v7 = sub_10001B6E0();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v9 = [v3 objectAtIndexedSubscript:v6];
        id v10 = [v9 unsignedLongLongValue];
        *(_DWORD *)buf = v13;
        id v15 = v10;
        _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "display event state: %llu", buf, 0xCu);
      }
      v8 = [v3 objectAtIndexedSubscript:v6];
      [v4 addObject:v8];

      v6 += 2;
    }
    while ((unint64_t)[v3 count] >= v6);
  }
  id v11 = [v4 copy:v13];

  return v11;
}

+ ($2825F4736939C4A6D3AD43837233062D)displayStateBeforeOrAtTime:(unint64_t)a3 timestamps:(id)a4 states:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([v7 count])
  {
    unint64_t v9 = 0;
    LODWORD(v10) = -1;
    LODWORD(v11) = -1;
    do
    {
      v12 = [v7 objectAtIndexedSubscript:v9];
      id v13 = [v12 unsignedLongLongValue];

      v14 = [v8 objectAtIndexedSubscript:v9];
      unsigned int v15 = [v14 intValue];

      if ((unint64_t)v13 <= a3) {
        uint64_t v11 = v9;
      }
      else {
        uint64_t v11 = v11;
      }
      if ((unint64_t)v13 <= a3) {
        uint64_t v10 = v15;
      }
      else {
        uint64_t v10 = v10;
      }
      ++v9;
    }
    while ((unint64_t)[v7 count] > v9);
    unint64_t v16 = v10 << 32;
  }
  else
  {
    unint64_t v16 = 0xFFFFFFFF00000000;
    uint64_t v11 = 0xFFFFFFFFLL;
  }

  return ($2825F4736939C4A6D3AD43837233062D)(v16 | v11);
}

+ (DisplayStateChangeEvent)displayStateBeforeHangStartTimestamp:(unint64_t)a3 displayTimestamps:(id)a4 displayStates:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v14 = 0;
  unsigned int v15 = &v14;
  uint64_t v16 = 0x3010000000;
  v17 = &unk_10007326F;
  long long v18 = xmmword_10003DF20;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000FDBC;
  v13[3] = &unk_100075420;
  v13[4] = &v14;
  v13[5] = a3;
  [v7 enumerateObjectsWithOptions:2 usingBlock:v13];
  unint64_t v9 = v15[4];
  uint64_t v10 = v15[5];
  _Block_object_dispose(&v14, 8);

  unint64_t v11 = v9;
  uint64_t v12 = v10;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

+ (id)displayOnIntervalsForDisplayTimestamps:(id)a3 displayStates:(id)a4 startTimestamp:(unint64_t)a5 endTimestamp:(unint64_t)a6 startState:(id *)a7 endState:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  *a7 = +[HTDisplayParser displayStateBeforeOrAtTime:a5 timestamps:v13 states:v14];
  *a8 = +[HTDisplayParser displayStateBeforeOrAtTime:a6 timestamps:v13 states:v14];
  unsigned int v15 = sub_10001B6E0();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_100038F64();
  }

  uint64_t v16 = sub_10001B6E0();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_100038EEC();
  }

  if (a7->var0 == -1)
  {
    v17 = sub_10001B6E0();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_100038EA8(v17);
    }

    a7->uint64_t var0 = 0;
  }
  v35 = v13;
  id v18 = [v13 mutableCopy];
  id v19 = [v14 mutableCopy];
  v20 = +[NSNumber numberWithUnsignedLongLong:a5];
  [v18 setObject:v20 atIndexedSubscript:a7->var0];

  v21 = +[NSNumber numberWithUnsignedLongLong:a6];
  [v18 insertObject:v21 atIndex:a8->var0 + 1];

  v22 = &off_10007A670;
  int var1 = a8->var1;
  if (!var1) {
    v22 = &off_10007A658;
  }
  if (var1 == 1) {
    v24 = &off_10007A640;
  }
  else {
    v24 = v22;
  }
  [v19 insertObject:v24 atIndex:a8->var0 + 1];
  v25 = +[NSMutableArray array];
  uint64_t var0 = a7->var0;
  if ((int)var0 <= a8->var0)
  {
    do
    {
      v27 = [v19 objectAtIndexedSubscript:var0];
      if ([v27 intValue] == 1)
      {
        uint64_t v28 = var0 + 1;
        v29 = [v19 objectAtIndexedSubscript:var0 + 1];
        unsigned int v30 = [v29 intValue];

        if (!v30)
        {
          v31 = [v18 objectAtIndexedSubscript:var0];
          [v25 addObject:v31];

          v32 = [v18 objectAtIndexedSubscript:var0 + 1];
          [v25 addObject:v32];
        }
      }
      else
      {

        uint64_t v28 = var0 + 1;
      }
      BOOL v33 = var0 < a8->var0;
      uint64_t var0 = v28;
    }
    while (v33);
  }

  return v25;
}

+ (id)displayInfoForSpindump:(id)a3 startAbsoluteTime:(unint64_t)a4 endAbsoluteTime:(unint64_t)a5
{
  id v8 = [a3 objectForKeyedSubscript:@"DisplayData"];
  if ([v8 count])
  {
    uint64_t v42 = -1;
    *(void *)buf = -1;
    unint64_t v9 = [a1 displayEventTimestampsFromDisplayInfo:v8];
    uint64_t v10 = [a1 displayEventStatesFromDisplayInfo:v8];
    id v41 = +[HTDisplayParser displayStateBeforeHangStartTimestamp:a4 displayTimestamps:v9 displayStates:v10];
    unint64_t v11 = +[HTDisplayParser displayOnIntervalsForDisplayTimestamps:v9 displayStates:v10 startTimestamp:a4 endTimestamp:a5 startState:buf endState:&v42];
    id v12 = [v11 mutableCopy];
    double v13 = sub_100003BDC(a4);
    double v14 = sub_100003BDC(a5);
    if ([v11 count])
    {
      unint64_t v15 = (unint64_t)v14 - (unint64_t)v13;
      id v16 = [v11 count];
      double v17 = 0.0;
      if (v16 != (id)1)
      {
        unint64_t v37 = (unint64_t)v14 - (unint64_t)v13;
        v38 = v10;
        v39 = v9;
        v40 = v8;
        id v18 = 0;
        unint64_t v19 = 0;
        double v20 = (double)(unint64_t)v13;
        do
        {
          v21 = [v12 objectAtIndexedSubscript:v18, v17, v37, v38, v39, v40];
          unint64_t v22 = (unint64_t)(sub_100003BDC((unint64_t)[v21 unsignedLongLongValue]) - v20);

          v23 = [v12 objectAtIndexedSubscript:v18 + 1];
          unint64_t v24 = (unint64_t)(sub_100003BDC((unint64_t)[v23 unsignedLongLongValue]) - v20);

          v25 = +[NSNumber numberWithUnsignedLongLong:v22];
          [v12 setObject:v25 atIndexedSubscript:v18];

          v26 = +[NSNumber numberWithUnsignedLongLong:v24];
          [v12 setObject:v26 atIndexedSubscript:v18 + 1];

          unint64_t v19 = v19 - v22 + v24;
          v18 += 2;
        }
        while ((char *)[v11 count] - 1 > v18);
        *(float *)&double v17 = (float)v19;
        unint64_t v9 = v39;
        id v8 = v40;
        unint64_t v15 = v37;
        uint64_t v10 = v38;
      }
      float v27 = *(float *)&v17 / (float)v15;
    }
    else
    {
      float v27 = 0.0;
    }
    id v30 = objc_alloc_init((Class)NSMutableDictionary);
    v31 = +[NSNumber numberWithInt:*(unsigned int *)&buf[4]];
    [v30 setObject:v31 forKeyedSubscript:@"startState"];

    v32 = +[NSNumber numberWithInt:HIDWORD(v42)];
    [v30 setObject:v32 forKeyedSubscript:@"endState"];

    [v30 setObject:v12 forKeyedSubscript:@"displayOnIntervals"];
    if (v41)
    {
      BOOL v33 = +[NSNumber numberWithDouble:sub_100003C34(a4 - (void)v41)];
      [v30 setObject:v33 forKeyedSubscript:@"secondsSinceDisplayStateBeforeHangStart"];
    }
    else
    {
      [v30 setObject:&off_10007A6D0 forKeyedSubscript:@"secondsSinceDisplayStateBeforeHangStart"];
    }
    *(float *)&double v34 = v27;
    v35 = +[NSNumber numberWithFloat:v34];
    [v30 setObject:v35 forKeyedSubscript:@"displayOnPercent"];

    CFStringRef v44 = @"displayData";
    id v45 = v30;
    v29 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
  }
  else
  {
    uint64_t v28 = sub_10001B6E0();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "No display information has been logged. Are you sure you restarted after writing to defaults?", buf, 2u);
    }

    v29 = &__NSDictionary0__struct;
  }

  return v29;
}

@end