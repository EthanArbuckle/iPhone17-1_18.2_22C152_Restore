@interface FroFlbyYlUw5zsSg
- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8;
- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4;
- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
@end

@implementation FroFlbyYlUw5zsSg

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  uint64_t v41 = 0;
  p_var4 = &a3->var4;
  id v12 = a8;
  id v13 = a7;
  v14 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:p_var4 xNtFS0jGMQPgkTi7:&v41 i4KDOQicW9Xd5WBz:v13 TWWnmIjkBlMfHmma:v12];
  v15 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4.var26 + 1 xNtFS0jGMQPgkTi7:&v41 i4KDOQicW9Xd5WBz:v13 TWWnmIjkBlMfHmma:v12];
  v16 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4.var26 + 2 xNtFS0jGMQPgkTi7:&v41 i4KDOQicW9Xd5WBz:v13 TWWnmIjkBlMfHmma:v12];

  if ([v16 length])
  {
    v17 = +[NSFileManager defaultManager];
    v18 = [v17 containerURLForSecurityApplicationGroupIdentifier:v16];

    if (!v18) {
      uint64_t v41 = 167002;
    }
  }
  else
  {
    v18 = 0;
  }
  v19 = 0;
  if (!v41 && v15 && v14)
  {
    os_signpost_id_t v20 = os_signpost_id_generate((os_log_t)qword_1006AD1B0);
    v21 = (id)qword_1006AD1B0;
    v22 = v21;
    unint64_t v40 = v20 - 1;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "sud", "enableTelemetry=YES", buf, 2u);
    }

    id v23 = objc_alloc((Class)NSUserDefaults);
    v39 = a4;
    if (v18) {
      id v24 = [v23 _initWithSuiteName:v14 container:v18];
    }
    else {
      id v24 = [v23 initWithSuiteName:v14];
    }
    v25 = v24;
    uint64_t v26 = [v24 objectForKey:v15];
    v27 = (void *)v26;
    if (v26)
    {
      v49[0] = @"v";
      v49[1] = @"ec";
      v50[0] = v26;
      v50[1] = &off_100688250;
      v28 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];
      v51 = v28;
      v19 = +[NSArray arrayWithObjects:&v51 count:1];
    }
    else
    {
      if (v25) {
        uint64_t v29 = 167000;
      }
      else {
        uint64_t v29 = 167001;
      }
      uint64_t v41 = v29;
      v46[0] = @"v";
      v46[1] = @"ec";
      v47[0] = &__NSDictionary0__struct;
      v28 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
      v47[1] = v28;
      +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];
      v31 = os_signpost_id_t v30 = v20;
      v48 = v31;
      v19 = +[NSArray arrayWithObjects:&v48 count:1];

      os_signpost_id_t v20 = v30;
    }

    v32 = (id)qword_1006AD1B0;
    v33 = v32;
    if (v40 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      unsigned int var0 = v39->var0;
      unsigned int var1 = v39->var1;
      *(_DWORD *)buf = 67240448;
      unsigned int v43 = var0;
      __int16 v44 = 1026;
      unsigned int v45 = var1;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_END, v20, "sud", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
    }
  }
  v36 = [kjAS9HuCdR1m5txL alloc];
  v37 = [(kjAS9HuCdR1m5txL *)v36 initWithGyF0atX3JpCKc9pK:v19 qfSDGTGvqd3Hruzg:v41];

  return v37;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  id v10 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:0];
  [v10 encodeInt64:0x6301FA738391F0F9 forKey:@"0x5563"];
  uint64_t v11 = 0;
  uint64_t v16 = 0;
  v17[0] = &a3->var4.var1.var1;
  v17[1] = &a3->var4.var1.var2;
  v17[2] = &a3->var4;
  while (1)
  {
    id v12 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:v17[v11] xNtFS0jGMQPgkTi7:&v16 i4KDOQicW9Xd5WBz:v8 TWWnmIjkBlMfHmma:v9];
    id v13 = v12;
    if (v16) {
      break;
    }
    if (v12) {
      [v10 encodeObject:v12];
    }

    if (++v11 == 3) {
      goto LABEL_8;
    }
  }

LABEL_8:
  unint64_t v14 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:v10];

  return v14;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  id v5 = objc_alloc_init((Class)NSMutableSet);
  p_var4 = &a3->var4;
  v7 = +[Yp00msaYdVlZesvU listDependenciesForStringType:&a3->var4.var26 + 1];
  [v5 setSet:v7];

  id v8 = +[Yp00msaYdVlZesvU listDependenciesForStringType:&a3->var4.var26 + 2];
  [v5 unionSet:v8];

  id v9 = +[Yp00msaYdVlZesvU listDependenciesForStringType:p_var4];
  [v5 unionSet:v9];

  id v10 = +[NSSet setWithSet:v5];

  return v10;
}

@end