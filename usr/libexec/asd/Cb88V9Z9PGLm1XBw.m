@interface Cb88V9Z9PGLm1XBw
- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8;
- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4;
- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
@end

@implementation Cb88V9Z9PGLm1XBw

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v12 = a6;
  id v13 = a7;
  id v14 = a8;
  v15 = +[YIbYnDZMoU7hwSYC sharedInstance];
  id v34 = 0;
  uint64_t v35 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_10001E80C;
  v33 = sub_10001E81C;
  os_signpost_id_t v16 = os_signpost_id_generate((os_log_t)qword_1006AD1B0);
  v17 = (id)qword_1006AD1B0;
  v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "pkc", "enableTelemetry=YES", buf, 2u);
  }

  if (v15)
  {
    v19 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4.var7.var1 xNtFS0jGMQPgkTi7:&v35 i4KDOQicW9Xd5WBz:v13 TWWnmIjkBlMfHmma:v14];
    if (!v35)
    {
      uint64_t var0 = a3->var4.var8.var0;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10001E824;
      v28[3] = &unk_10065EBB8;
      v28[4] = &v29;
      uint64_t v35 = (uint64_t)[v15 y8DihfZYjxGbiiEE:v19 QsX3tfdMvsGwvY0F:var0 withCompletion:v28];
    }
  }
  else
  {
    v19 = 0;
    uint64_t v35 = 165000;
  }
  v21 = [kjAS9HuCdR1m5txL alloc];
  v22 = [(kjAS9HuCdR1m5txL *)v21 initWithGyF0atX3JpCKc9pK:v30[5] qfSDGTGvqd3Hruzg:v35];
  v23 = (id)qword_1006AD1B0;
  v24 = v23;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    unsigned int v25 = a4->var0;
    unsigned int var1 = a4->var1;
    *(_DWORD *)buf = 67240448;
    unsigned int v37 = v25;
    __int16 v38 = 1026;
    unsigned int v39 = var1;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, v16, "pkc", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
  }

  _Block_object_dispose(&v29, 8);

  return v22;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:0];
  uint64_t v14 = 0;
  v11 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4.var7.var1 xNtFS0jGMQPgkTi7:&v14 i4KDOQicW9Xd5WBz:v9 TWWnmIjkBlMfHmma:v8];

  [v10 encodeObject:v11];
  [v10 encodeInt64:a3->var4.var8.var0 forKey:@"0x0x5bde"];
  [v10 encodeInt64:0xD52E3C5CA2F5DFECLL forKey:@"0x5563"];
  unint64_t v12 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:v10];

  return v12;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  return +[Yp00msaYdVlZesvU listDependenciesForStringType:](Yp00msaYdVlZesvU, "listDependenciesForStringType:", &a3->var4.var7.var1, a4);
}

@end