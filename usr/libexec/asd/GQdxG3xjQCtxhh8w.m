@interface GQdxG3xjQCtxhh8w
- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8;
- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4;
- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
@end

@implementation GQdxG3xjQCtxhh8w

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v12 = a6;
  id v13 = a7;
  id v14 = a8;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = sub_10001DC18;
  v46 = sub_10001DC28;
  id v47 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  os_signpost_id_t v15 = os_signpost_id_generate((os_log_t)qword_1006AD1B0);
  v16 = (id)qword_1006AD1B0;
  v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "ch", "enableTelemetry=YES", buf, 2u);
  }

  v18 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4.var7.var1 xNtFS0jGMQPgkTi7:v39 + 3 i4KDOQicW9Xd5WBz:v13 TWWnmIjkBlMfHmma:v14];
  if (v39[3])
  {
    v19 = 0;
  }
  else
  {
    v19 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:(char *)&a3->var4.var26 + 144 xNtFS0jGMQPgkTi7:v39 + 3 i4KDOQicW9Xd5WBz:v13 TWWnmIjkBlMfHmma:v14];
    if (!v39[3])
    {
      v32 = a4;
      id v33 = v12;
      v20 = objc_opt_new();
      v21 = dispatch_group_create();
      dispatch_group_enter(v21);
      unsigned int var0 = a3->var4.var8.var0;
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_10001DC30;
      v34[3] = &unk_10065EA50;
      v36 = &v38;
      v37 = &v42;
      v22 = v21;
      v35 = v22;
      v30 = v20;
      [v20 hSmO2OC6etXclsKP:v18 edrv2qHmtbt1iEyf:v19 QsX3tfdMvsGwvY0F:var0 completion:v34];
      dispatch_group_wait(v22, 0xFFFFFFFFFFFFFFFFLL);

      a4 = v32;
      id v12 = v33;
    }
  }
  v23 = (id)qword_1006AD1B0;
  v24 = v23;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    unsigned int v25 = a4->var0;
    unsigned int var1 = a4->var1;
    *(_DWORD *)buf = 67240448;
    unsigned int v49 = v25;
    __int16 v50 = 1026;
    unsigned int v51 = var1;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, v15, "ch", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
  }

  v27 = [kjAS9HuCdR1m5txL alloc];
  v28 = [(kjAS9HuCdR1m5txL *)v27 initWithGyF0atX3JpCKc9pK:v43[5] qfSDGTGvqd3Hruzg:v39[3]];
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  return v28;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:0];
  [v10 encodeInt64:0x9F34F2F6C05E11C5 forKey:@"0x5563"];
  uint64_t v15 = 0;
  v11 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4.var7.var1 xNtFS0jGMQPgkTi7:&v15 i4KDOQicW9Xd5WBz:v9 TWWnmIjkBlMfHmma:v8];
  [v10 encodeObject:v11];
  id v12 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:(char *)&a3->var4.var26 + 144 xNtFS0jGMQPgkTi7:&v15 i4KDOQicW9Xd5WBz:v9 TWWnmIjkBlMfHmma:v8];

  [v10 encodeObject:v12];
  unint64_t v13 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:v10];

  return v13;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  id v5 = objc_alloc_init((Class)NSMutableSet);
  v6 = +[Yp00msaYdVlZesvU listDependenciesForStringType:&a3->var4.var7.var1];
  [v5 setSet:v6];

  v7 = +[Yp00msaYdVlZesvU listDependenciesForStringType:(char *)&a3->var4.var26 + 144];
  [v5 unionSet:v7];

  id v8 = +[NSSet setWithSet:v5];

  return v8;
}

@end