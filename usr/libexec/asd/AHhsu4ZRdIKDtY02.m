@interface AHhsu4ZRdIKDtY02
- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8;
- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4;
- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
@end

@implementation AHhsu4ZRdIKDtY02

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v38 = a6;
  id v11 = a7;
  id v12 = a8;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = sub_10002DDE8;
  v46 = sub_10002DDF8;
  id v47 = 0;
  uint64_t v41 = 0;
  os_signpost_id_t v13 = os_signpost_id_generate((os_log_t)qword_1006AD1B0);
  v14 = (id)qword_1006AD1B0;
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "sl", "enableTelemetry=YES", buf, 2u);
  }

  p_var4 = &a3->var4;
  uint64_t v17 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4 xNtFS0jGMQPgkTi7:&v41 i4KDOQicW9Xd5WBz:v11 TWWnmIjkBlMfHmma:v12];
  v18 = (void *)v17;
  if (v41 || !v17)
  {
    v28 = +[eTBtehykeBvfpeTP hKjCyPlJs74k9vMV:](eTBtehykeBvfpeTP, "hKjCyPlJs74k9vMV:");
  }
  else
  {
    uint64_t v19 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4.var26 + 1 xNtFS0jGMQPgkTi7:&v41 i4KDOQicW9Xd5WBz:v11 TWWnmIjkBlMfHmma:v12];
    v20 = (void *)v19;
    if (v41 || !v19)
    {
      v28 = +[eTBtehykeBvfpeTP hKjCyPlJs74k9vMV:](eTBtehykeBvfpeTP, "hKjCyPlJs74k9vMV:");
    }
    else
    {
      if (a3->var1 < 2) {
        goto LABEL_13;
      }
      unsigned int v36 = [v18 isEqualToString:@":biomeview:"];
      v21 = +[NSURL URLWithString:v18];
      v22 = [v21 scheme];
      unsigned int v23 = [v22 isEqualToString:@"biome"];

      if (v36 | v23)
      {
        v24 = objc_opt_new();
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_10002DE00;
        v40[3] = &unk_10065ED70;
        v40[4] = &v42;
        id v25 = [v24 zjSRqCgYhfa1wFgr:v20 nN3snF4sAp0Cxy6t:v18 wRPFKB7h3xbveJFz:p_var4 tNXuX79TcZPxzyjn:v40];
        v26 = [kjAS9HuCdR1m5txL alloc];
        v27 = [(kjAS9HuCdR1m5txL *)v26 initWithGyF0atX3JpCKc9pK:v43[5] qfSDGTGvqd3Hruzg:v25];
      }
      else
      {
LABEL_13:
        v24 = objc_opt_new();
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_10002DE4C;
        v39[3] = &unk_10065ED70;
        v39[4] = &v42;
        id v29 = [v24 zjSRqCgYhfa1wFgr:v20 gqhuZKS8Xs6ugnFL:v18 wRPFKB7h3xbveJFz:p_var4 x1IqrF8Flbgd3Jhk:v39];
        v30 = [kjAS9HuCdR1m5txL alloc];
        v27 = [(kjAS9HuCdR1m5txL *)v30 initWithGyF0atX3JpCKc9pK:v43[5] qfSDGTGvqd3Hruzg:v29];
      }
      v28 = v27;
    }
  }
  v31 = (id)qword_1006AD1B0;
  v32 = v31;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    unsigned int var0 = a4->var0;
    unsigned int var1 = a4->var1;
    *(_DWORD *)buf = 67240704;
    unsigned int v49 = var0;
    __int16 v50 = 1026;
    unsigned int v51 = var1;
    __int16 v52 = 1026;
    BOOL v53 = v41 != 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_END, v13, "sl", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d,e=%{public,signpost.telemetry:number2}d", buf, 0x14u);
  }

  _Block_object_dispose(&v42, 8);

  return v28;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  id v10 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:0];
  uint64_t v26 = 0;
  id v11 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4 xNtFS0jGMQPgkTi7:&v26 i4KDOQicW9Xd5WBz:v8 TWWnmIjkBlMfHmma:v9];
  id v12 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4.var26 + 1 xNtFS0jGMQPgkTi7:&v26 i4KDOQicW9Xd5WBz:v8 TWWnmIjkBlMfHmma:v9];
  [v10 encodeInt64:0x42A9F8AC261B9FEFLL forKey:@"0x5563"];
  [v10 encodeObject:v12];
  [v10 encodeObject:v11];
  [v10 encodeInt32:a3->var4.var1.var2.var1 forKey:@"0xd730"];
  if (a3->var4.var1.var2.var1)
  {
    unsigned int v23 = v11;
    id v24 = v9;
    id v25 = v8;
    uint64_t v13 = 0;
    unint64_t v14 = 0;
    v15 = 0;
    do
    {
      v16 = v15;
      v15 = +[eTBtehykeBvfpeTP rsNB9HkZVEH0l6fT:*(void *)&a3->var4.var1.var2.var0[v13 + 16] gsx0MJUoOpcxcozG:*(unsigned int *)&a3->var4.var1.var2.var0[v13 + 8]];

      [v10 encodeObject:v15];
      uint64_t v17 = *(unsigned int *)&a3->var4.var1.var2.var0[v13 + 4];
      v18 = +[NSString stringWithFormat:@"%d 0x1f38", v14];
      [v10 encodeInt32:v17 forKey:v18];

      uint64_t v19 = *(unsigned int *)&a3->var4.var1.var2.var0[v13];
      v20 = +[NSString stringWithFormat:@"%d 0x91f8", v14];
      [v10 encodeInt32:v19 forKey:v20];

      ++v14;
      v13 += 24;
    }
    while (v14 < a3->var4.var1.var2.var1);

    id v9 = v24;
    id v8 = v25;
    id v11 = v23;
  }
  unint64_t v21 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:v10];

  return v21;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  id v5 = objc_alloc_init((Class)NSMutableSet);
  v6 = +[Yp00msaYdVlZesvU listDependenciesForStringType:&a3->var4];
  [v5 setSet:v6];

  v7 = +[Yp00msaYdVlZesvU listDependenciesForStringType:&a3->var4.var26 + 1];
  [v5 unionSet:v7];

  id v8 = +[NSSet setWithSet:v5];

  return v8;
}

@end