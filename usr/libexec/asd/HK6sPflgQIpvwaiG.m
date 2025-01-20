@interface HK6sPflgQIpvwaiG
- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8;
- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4;
- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
@end

@implementation HK6sPflgQIpvwaiG

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v28 = a6;
  id v12 = a7;
  id v13 = a8;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = sub_1000062E4;
  v41 = sub_1000062F4;
  id v42 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  os_signpost_id_t v14 = os_signpost_id_generate((os_log_t)qword_1006AD1B0);
  v15 = (id)qword_1006AD1B0;
  v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "av", "enableTelemetry=YES", buf, 2u);
  }

  v17 = objc_opt_new();
  v18 = dispatch_group_create();
  dispatch_group_enter(v18);
  unint64_t var0 = a3->var4.var0.var0;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000062FC;
  v29[3] = &unk_10065EA50;
  v31 = &v33;
  v32 = &v37;
  v20 = v18;
  v30 = v20;
  [v17 bQfuQcBGI0pnDtDP:var0 completion:v29];
  dispatch_group_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
  v21 = (id)qword_1006AD1B0;
  v22 = v21;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    unsigned int v23 = a4->var0;
    unsigned int var1 = a4->var1;
    *(_DWORD *)buf = 67240448;
    unsigned int v44 = v23;
    __int16 v45 = 1026;
    unsigned int v46 = var1;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_END, v14, "av", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
  }

  v25 = [kjAS9HuCdR1m5txL alloc];
  v26 = [(kjAS9HuCdR1m5txL *)v25 initWithGyF0atX3JpCKc9pK:v38[5] qfSDGTGvqd3Hruzg:v34[3]];

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return v26;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v7 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:0];
  [v7 encodeInt64:0x3414116015671928 forKey:@"0x5563"];
  [v7 encodeInt64:a3->var4.var0.var0 forKey:@"0x574f"];
  unint64_t v8 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:v7];

  return v8;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  return +[NSSet set];
}

@end