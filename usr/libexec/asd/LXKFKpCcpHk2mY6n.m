@interface LXKFKpCcpHk2mY6n
- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8;
- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4;
- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
@end

@implementation LXKFKpCcpHk2mY6n

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  v38 = a4;
  id v39 = a6;
  id v41 = a7;
  id v42 = a8;
  unsigned int var1 = a3->var1;
  v40 = objc_opt_new();
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x3032000000;
  v54 = sub_100007654;
  v55 = sub_100007664;
  id v56 = 0;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  uint64_t v50 = 0;
  os_signpost_id_t v12 = os_signpost_id_generate((os_log_t)qword_1006AD1B0);
  v13 = (id)qword_1006AD1B0;
  v14 = v13;
  unint64_t v15 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "cs", "enableTelemetry=YES", buf, 2u);
  }

  v16 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4 xNtFS0jGMQPgkTi7:v48 + 3 i4KDOQicW9Xd5WBz:v41 TWWnmIjkBlMfHmma:v42];
  id v17 = [objc_alloc((Class)NSMutableArray) initWithCapacity:a3->var4.var2.var3];
  if (a3->var4.var2.var3)
  {
    unint64_t v18 = 0;
    do
    {
      v19 = +[eTBtehykeBvfpeTP rsNB9HkZVEH0l6fT:gsx0MJUoOpcxcozG:](eTBtehykeBvfpeTP, "rsNB9HkZVEH0l6fT:gsx0MJUoOpcxcozG:", *(void *)&a3->var4.var1.var1.var0[8 * v18], a3->var4.var2.var2[v18], v38, v39);
      [v17 addObject:v19];

      ++v18;
    }
    while (v18 < a3->var4.var2.var3);
  }
  if (var1 == 2) {
    uint64_t var4 = a3->var4.var2.var4;
  }
  else {
    uint64_t var4 = 100;
  }
  if (v48[3]) {
    BOOL v21 = 1;
  }
  else {
    BOOL v21 = v16 == 0;
  }
  if (v21)
  {
    v22 = (id)qword_1006AD1B0;
    v23 = v22;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      unsigned int var0 = v38->var0;
      unsigned int v25 = v38->var1;
      *(_DWORD *)buf = 67240704;
      unsigned int v58 = var0;
      __int16 v59 = 1026;
      unsigned int v60 = v25;
      __int16 v61 = 1026;
      int v62 = 1;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_END, v12, "cs", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d,e=%{public,signpost.telemetry:number2}d", buf, 0x14u);
    }

    v26 = +[eTBtehykeBvfpeTP hKjCyPlJs74k9vMV:v48[3]];
  }
  else
  {
    v27 = dispatch_group_create();
    dispatch_group_enter(v27);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_10000766C;
    v43[3] = &unk_10065EB18;
    v45 = &v47;
    v46 = &v51;
    v28 = v27;
    v44 = v28;
    [v40 pRfmPXmMPeo7rsRf:v16 N3UHg1ij3irF9uUu:v17 QsX3tfdMvsGwvY0F:var4 completionBlock:v43];
    dispatch_group_wait(v28, 0xFFFFFFFFFFFFFFFFLL);
    v29 = (id)qword_1006AD1B0;
    v30 = v29;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      unsigned int v31 = v38->var0;
      unsigned int v32 = v38->var1;
      BOOL v33 = v48[3] != 0;
      *(_DWORD *)buf = 67240704;
      unsigned int v58 = v31;
      __int16 v59 = 1026;
      unsigned int v60 = v32;
      __int16 v61 = 1026;
      int v62 = v33;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v30, OS_SIGNPOST_INTERVAL_END, v12, "cs", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d,e=%{public,signpost.telemetry:number2}d", buf, 0x14u);
    }

    if (v48[3])
    {
      v34 = [kjAS9HuCdR1m5txL alloc];
      uint64_t v35 = 0;
      uint64_t v36 = v48[3];
    }
    else
    {
      v34 = [kjAS9HuCdR1m5txL alloc];
      uint64_t v36 = 0;
      uint64_t v35 = v52[5];
    }
    v26 = -[kjAS9HuCdR1m5txL initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:](v34, "initWithGyF0atX3JpCKc9pK:qfSDGTGvqd3Hruzg:", v35, v36, v38);
  }
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);

  return v26;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  id v10 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:0];
  unsigned int var1 = a3->var1;
  uint64_t v19 = 0;
  os_signpost_id_t v12 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4 xNtFS0jGMQPgkTi7:&v19 i4KDOQicW9Xd5WBz:v8 TWWnmIjkBlMfHmma:v9];
  id v13 = [objc_alloc((Class)NSMutableArray) initWithCapacity:a3->var4.var2.var3];
  if (a3->var4.var2.var3)
  {
    unint64_t v14 = 0;
    do
    {
      unint64_t v15 = +[eTBtehykeBvfpeTP rsNB9HkZVEH0l6fT:*(void *)&a3->var4.var1.var1.var0[8 * v14] gsx0MJUoOpcxcozG:a3->var4.var2.var2[v14]];
      [v13 addObject:v15];

      ++v14;
    }
    while (v14 < a3->var4.var2.var3);
  }
  if (var1 == 2) {
    uint64_t var4 = a3->var4.var2.var4;
  }
  else {
    uint64_t var4 = 100;
  }
  [v10 encodeInt64:0x76B410A5C9FCBEC4 forKey:@"0x5563"];
  [v10 encodeObject:v12];
  [v10 encodeObject:v13];
  [v10 encodeInt32:var4 forKey:@"0x0x5bde"];
  unint64_t v17 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:v10];

  return v17;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  return +[Yp00msaYdVlZesvU listDependenciesForStringType:](Yp00msaYdVlZesvU, "listDependenciesForStringType:", &a3->var4, a4);
}

@end