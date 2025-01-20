@interface Sby7psiLlGm5MLDx
- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8;
- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4;
- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
@end

@implementation Sby7psiLlGm5MLDx

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v38 = a6;
  id v12 = a7;
  id v13 = a8;
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  v14 = objc_opt_new();
  os_signpost_id_t v15 = os_signpost_id_generate((os_log_t)qword_1006AD1B0);
  v16 = (id)qword_1006AD1B0;
  v17 = v16;
  unint64_t v18 = v15 - 1;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "csc", "enableTelemetry=YES", buf, 2u);
  }

  uint64_t v19 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4 xNtFS0jGMQPgkTi7:v45 + 3 i4KDOQicW9Xd5WBz:v12 TWWnmIjkBlMfHmma:v13];
  v20 = (void *)v19;
  if (v45[3] || !v19)
  {
    v30 = +[eTBtehykeBvfpeTP hKjCyPlJs74k9vMV:v38];
    v31 = (id)qword_1006AD1B0;
    v32 = v31;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      unsigned int var0 = a4->var0;
      unsigned int var1 = a4->var1;
      *(_DWORD *)buf = 67240704;
      unsigned int v51 = var0;
      __int16 v52 = 1026;
      unsigned int v53 = var1;
      __int16 v54 = 1026;
      int v55 = 1;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_END, v15, "csc", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d,e=%{public,signpost.telemetry:number2}d", buf, 0x14u);
    }

    goto LABEL_17;
  }
  v21 = dispatch_group_create();
  dispatch_group_enter(v21);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10000D724;
  v40[3] = &unk_10065EDB8;
  v43 = &v44;
  id v41 = v14;
  v22 = v21;
  v42 = v22;
  [v41 f7RoJXIsBwkuxLd1:v20 completionBlock:v40 fNW54jBXJAcsCk:&v48];
  dispatch_group_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
  v23 = (id)qword_1006AD1B0;
  v24 = v23;
  if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    unsigned int v25 = a4->var0;
    unsigned int v26 = a4->var1;
    *(_DWORD *)buf = 67240704;
    unsigned int v51 = v25;
    __int16 v52 = 1026;
    unsigned int v53 = v26;
    __int16 v54 = 1026;
    int v55 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, v15, "csc", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d,e=%{public,signpost.telemetry:number2}d", buf, 0x14u);
  }

  uint64_t v27 = v45[3];
  if (v27)
  {
    v28 = [kjAS9HuCdR1m5txL alloc];
    v29 = [(kjAS9HuCdR1m5txL *)v28 initWithGyF0atX3JpCKc9pK:0 qfSDGTGvqd3Hruzg:v45[3]];
    v30 = 0;
  }
  else
  {
    v35 = +[NSNumber numberWithUnsignedInteger:v48];
    v36 = +[NSDictionary dictionaryWithObject:v35 forKey:@"cnt"];
    v49 = v36;
    v29 = +[NSArray arrayWithObjects:&v49 count:1];

    v30 = [[kjAS9HuCdR1m5txL alloc] initWithGyF0atX3JpCKc9pK:v29 qfSDGTGvqd3Hruzg:0];
  }

  if (!v27)
  {
LABEL_17:
    v30 = v30;
    v29 = v30;
  }

  _Block_object_dispose(&v44, 8);

  return v29;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:0];
  uint64_t v14 = 0;
  v11 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4 xNtFS0jGMQPgkTi7:&v14 i4KDOQicW9Xd5WBz:v9 TWWnmIjkBlMfHmma:v8];

  [v10 encodeInt64:0x27A4692BF11E14BALL forKey:@"0x5563"];
  [v10 encodeObject:v11];
  unint64_t v12 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:v10];

  return v12;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  return +[Yp00msaYdVlZesvU listDependenciesForStringType:](Yp00msaYdVlZesvU, "listDependenciesForStringType:", &a3->var4, a4);
}

@end