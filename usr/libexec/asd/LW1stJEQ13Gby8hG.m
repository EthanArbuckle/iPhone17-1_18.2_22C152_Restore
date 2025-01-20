@interface LW1stJEQ13Gby8hG
- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8;
- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4;
- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
@end

@implementation LW1stJEQ13Gby8hG

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  uint64_t v10 = *(void *)&a5;
  id v13 = a6;
  id v14 = a8;
  uint64_t v35 = 0;
  v15 = qword_1006AD1B0;
  id v16 = a7;
  os_signpost_id_t v17 = os_signpost_id_generate(v15);
  v18 = (id)qword_1006AD1B0;
  v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "idf", "enableTelemetry=YES", buf, 2u);
  }

  v20 = +[Yp00msaYdVlZesvU eJSthhES04gLkDjz:&a3->var4 i4KDOQicW9Xd5WBz:v16 TWWnmIjkBlMfHmma:v14 eZh1LWn1FH2uQtPX:&v35];

  if (v35)
  {
    v21 = a4;
    v22 = 0;
    v23 = 0;
  }
  else if ([v20 BOOLValue])
  {
    v23 = [v13 PLMCCRRqEw4moT9R:a3->var4.var0.var3 UtPlzRffoEpw7Ue1:a4 SFkZRA5Ek9YzhDRs:v10 TWWnmIjkBlMfHmma:v14];
    v24 = [v23 GyF0atX3JpCKc9pK];
    uint64_t v35 = (uint64_t)[v23 qfSDGTGvqd3Hruzg];
    if (v35)
    {
      v22 = 0;
    }
    else if (v24)
    {
      v40[0] = @"s";
      v40[1] = @"v";
      v41[0] = &__kCFBooleanTrue;
      v41[1] = v24;
      +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
      v26 = v25 = a4;
      v42 = v26;
      v22 = +[NSArray arrayWithObjects:&v42 count:1];

      a4 = v25;
    }
    else
    {
      v27 = qword_1006AD1A0;
      if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_FAULT)) {
        sub_10055C464(v27);
      }
      v22 = 0;
      uint64_t v35 = 171001;
    }
    v21 = a4;
  }
  else
  {
    v21 = a4;
    v23 = 0;
    uint64_t v35 = 0;
    v22 = &off_1006885B0;
  }
  v28 = [kjAS9HuCdR1m5txL alloc];
  v29 = [(kjAS9HuCdR1m5txL *)v28 initWithGyF0atX3JpCKc9pK:v22 qfSDGTGvqd3Hruzg:v35];
  v30 = (id)qword_1006AD1B0;
  v31 = v30;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    unsigned int var0 = v21->var0;
    unsigned int var1 = v21->var1;
    *(_DWORD *)buf = 67240448;
    unsigned int v37 = var0;
    __int16 v38 = 1026;
    unsigned int v39 = var1;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v31, OS_SIGNPOST_INTERVAL_END, v17, "idf", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
  }

  return v29;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:0];
  uint64_t v17 = 0;
  id v13 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4.var15.var2.var1 xNtFS0jGMQPgkTi7:&v17 i4KDOQicW9Xd5WBz:v10 TWWnmIjkBlMfHmma:v9];

  id v14 = [v11 jCbmcix0xxhNVOSS:a3->var4.var0.var3 TWWnmIjkBlMfHmma:v9];
  [v12 encodeInt64:0x434A3129DEC70B42 forKey:@"0x5563"];
  [v12 encodeObject:v13];
  [v12 encodeInt64:a3->var4.var1.var0.var1 forKey:@"0xfd1e"];
  [v12 encodeInt64:v14 forKey:@"0x07aa"];
  unint64_t v15 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:v12];

  return v15;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init((Class)NSMutableSet);
  v7 = +[Yp00msaYdVlZesvU listDependenciesForIntExpression:&a3->var4];
  [v6 setSet:v7];

  v8 = [v5 listDependenciesForDataframe:a3->var4.var0.var3];

  [v6 unionSet:v8];
  id v9 = +[NSSet setWithSet:v6];

  return v9;
}

@end