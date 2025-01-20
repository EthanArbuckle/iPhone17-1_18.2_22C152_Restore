@interface NDFRjmNSzUL5yu9I
- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8;
- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4;
- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
@end

@implementation NDFRjmNSzUL5yu9I

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v49 = a6;
  id v54 = a7;
  id v55 = a8;
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x3032000000;
  v72 = sub_1000059F4;
  v73 = sub_100005A04;
  id v74 = 0;
  uint64_t v68 = 0;
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x2020000000;
  int v67 = 0;
  unsigned int var1 = a3->var1;
  os_signpost_id_t v11 = os_signpost_id_generate((os_log_t)qword_1006AD1B0);
  v12 = (id)qword_1006AD1B0;
  v13 = v12;
  os_signpost_id_t spid = v11;
  unint64_t v47 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "bi", "enableTelemetry=YES", buf, 2u);
  }

  aSelectorName = +[NSString stringWithFormat:@"%.*s", a3->var4.var1.var0.var1, a3->var4.var0.var0];
  v50 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4.var15.var2.var1 xNtFS0jGMQPgkTi7:&v68 i4KDOQicW9Xd5WBz:v54 TWWnmIjkBlMfHmma:v55];
  if (v68)
  {
    v14 = [kjAS9HuCdR1m5txL alloc];
    v15 = [(kjAS9HuCdR1m5txL *)v14 initWithGyF0atX3JpCKc9pK:v70[5] qfSDGTGvqd3Hruzg:v68];
    goto LABEL_39;
  }
  v53 = +[NSMutableArray arrayWithCapacity:a3->var4.var6.var4.var0];
  v52 = +[NSMutableArray arrayWithCapacity:a3->var4.var6.var4.var0];
  if (a3->var4.var6.var4.var0)
  {
    uint64_t v16 = 0;
    unint64_t v17 = 0;
    do
    {
      uint64_t v18 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:(char *)a3->var4.var0.var3 + v16 * 4 xNtFS0jGMQPgkTi7:&v68 i4KDOQicW9Xd5WBz:v54 TWWnmIjkBlMfHmma:v55];
      v19 = (void *)v18;
      if (v68) {
        BOOL v20 = 1;
      }
      else {
        BOOL v20 = v18 == 0;
      }
      if (v20)
      {
        v21 = +[NSNull null];
        [v53 addObject:v21];
      }
      else
      {
        [v53 addObject:v18];
      }
      v22 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4.var9.var6.var4[v16] xNtFS0jGMQPgkTi7:&v68 i4KDOQicW9Xd5WBz:v54 TWWnmIjkBlMfHmma:v55];
      v23 = +[NSExpression expressionWithFormat:v22];
      if (v68 || !v22)
      {
        v24 = +[NSNull null];
        [v52 addObject:v24];
      }
      else
      {
        [v52 addObject:v23];
      }

      ++v17;
      v16 += 34;
    }
    while (v17 < a3->var4.var6.var4.var0);
  }
  NSSelectorFromString(aSelectorName);
  if (objc_opt_respondsToSelector())
  {
    v25 = +[BMStreams valueForKey:aSelectorName];
    v26 = v25;
    if (var1 < 2) {
      [v25 publisherFromStartTime:0.0];
    }
    else {
    v30 = [v25 publisherWithStartTime:0 endTime:0 maxEvents:0 lastN:0 reversed:1];
    }
    goto LABEL_32;
  }
  v27 = BiomeLibrary();
  id v65 = 0;
  v26 = [v27 streamWithIdentifier:aSelectorName error:&v65];
  id v28 = v65;

  if (var1 > 1)
  {
    id v29 = [objc_alloc((Class)BMPublisherOptions) initWithStartDate:0 endDate:0 maxEvents:0 lastN:0 reversed:1];
    v30 = [v26 publisherWithOptions:v29];

    if (!v28) {
      goto LABEL_31;
    }
LABEL_28:
    v31 = qword_1006AD1A0;
    if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
      sub_10055C288((uint64_t)aSelectorName, (uint64_t)v28, v31);
    }
    uint64_t v68 = 168003;
    goto LABEL_31;
  }
  v30 = [v26 publisher];
  if (v28) {
    goto LABEL_28;
  }
LABEL_31:

LABEL_32:
  id v32 = objc_alloc_init((Class)NSMutableArray);
  v33 = (void *)v70[5];
  v70[5] = (uint64_t)v32;

  v34 = +[NSPredicate predicateWithFormat:v50];
  v35 = v34;
  if (v34)
  {
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_100005A0C;
    v63[3] = &unk_10065E9C0;
    id v64 = v34;
    v36 = objc_retainBlock(v63);
    v37 = [v30 filterWithIsIncluded:v36];
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_100005A20;
    v56[3] = &unk_10065EA28;
    p_var4 = &a3->var4;
    id v57 = v53;
    BOOL v62 = var1 > 1;
    id v58 = v52;
    v59 = &v69;
    v60 = v66;
    id v38 = [v37 sinkWithCompletion:&stru_10065EA00 shouldContinue:v56];
  }
  else
  {
    uint64_t v68 = 168004;
  }

  v39 = (id)qword_1006AD1B0;
  v40 = v39;
  if (v47 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
  {
    unsigned int var0 = a4->var0;
    unsigned int v42 = a4->var1;
    *(_DWORD *)buf = 67240448;
    unsigned int v76 = var0;
    __int16 v77 = 1026;
    unsigned int v78 = v42;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v40, OS_SIGNPOST_INTERVAL_END, spid, "bi", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
  }

  v43 = [kjAS9HuCdR1m5txL alloc];
  v15 = [(kjAS9HuCdR1m5txL *)v43 initWithGyF0atX3JpCKc9pK:v70[5] qfSDGTGvqd3Hruzg:v68];

LABEL_39:
  _Block_object_dispose(v66, 8);
  _Block_object_dispose(&v69, 8);

  return v15;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  id v10 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:0];
  [v10 encodeInt64:0x195A0A8200DBA60CLL forKey:@"0x5563"];
  uint64_t v33 = 0;
  id v29 = +[NSString stringWithFormat:@"%.*s", a3->var4.var1.var0.var1, a3->var4.var0.var0];
  [v10 encodeObject:];
  p_cache = HK6sPflgQIpvwaiG.cache;
  +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4.var15.var2.var1 xNtFS0jGMQPgkTi7:&v33 i4KDOQicW9Xd5WBz:v8 TWWnmIjkBlMfHmma:v9];
  id v28 = v30 = v10;
  [v10 encodeObject:];
  v12 = +[NSMutableArray arrayWithCapacity:a3->var4.var6.var4.var0];
  id v32 = +[NSMutableArray arrayWithCapacity:a3->var4.var6.var4.var0];
  if (a3->var4.var6.var4.var0)
  {
    uint64_t v13 = 0;
    unint64_t v14 = 0;
    v31 = a3;
    do
    {
      uint64_t v15 = [p_cache + 463 yv5QRLoFvJ66jYJS:(char *)a3->var4.var0.var3 + v13 * 4 xNtFS0jGMQPgkTi7:&v33 i4KDOQicW9Xd5WBz:v8 TWWnmIjkBlMfHmma:v9];
      uint64_t v16 = (void *)v15;
      if (v33) {
        BOOL v17 = 1;
      }
      else {
        BOOL v17 = v15 == 0;
      }
      if (v17)
      {
        uint64_t v18 = +[NSNull null];
        [v12 addObject:v18];
      }
      else
      {
        [v12 addObject:v15];
      }
      v19 = [p_cache + 463 yv5QRLoFvJ66jYJS:&a3->var4.var9.var6.var4[v13] xNtFS0jGMQPgkTi7:&v33 i4KDOQicW9Xd5WBz:v8 TWWnmIjkBlMfHmma:v9];
      BOOL v20 = +[NSExpression expressionWithFormat:v19];
      if (v33 || !v19)
      {
        +[NSNull null];
        id v21 = v9;
        id v22 = v8;
        v23 = v12;
        v25 = v24 = p_cache;
        [v32 addObject:v25];

        p_cache = v24;
        v12 = v23;
        id v8 = v22;
        id v9 = v21;
        a3 = v31;
      }
      else
      {
        [v32 addObject:v20];
      }

      ++v14;
      v13 += 34;
    }
    while (v14 < a3->var4.var6.var4.var0);
  }
  [v30 encodeObject:v12];
  [v30 encodeObject:v32];
  [v30 encodeInt64:a3->var4.var5.var2 forKey:@"0x0x5bde"];
  id v26 = [p_cache + 463 cv2QAcQ2CDdiHuN6:v30];

  return (unint64_t)v26;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  id v5 = objc_alloc_init((Class)NSMutableSet);
  v6 = +[Yp00msaYdVlZesvU listDependenciesForStringType:&a3->var4.var15.var2.var1];
  [v5 setSet:v6];

  if (a3->var4.var6.var4.var0)
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    do
    {
      id v9 = +[Yp00msaYdVlZesvU listDependenciesForStringType:(char *)a3->var4.var0.var3 + v7 * 4];
      [v5 unionSet:v9];

      id v10 = +[Yp00msaYdVlZesvU listDependenciesForStringType:&a3->var4.var9.var6.var4[v7]];
      [v5 unionSet:v10];

      ++v8;
      v7 += 34;
    }
    while (v8 < a3->var4.var6.var4.var0);
  }
  os_signpost_id_t v11 = +[NSSet setWithSet:v5];

  return v11;
}

@end