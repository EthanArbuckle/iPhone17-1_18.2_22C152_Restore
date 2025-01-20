@interface LazRaN3HgWYPPpKq
- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8;
- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4;
- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
@end

@implementation LazRaN3HgWYPPpKq

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v12 = a6;
  id v13 = a7;
  id v14 = a8;
  unsigned int var1 = a3->var1;
  uint64_t v16 = +[XxyDq1mpwtvCuJnm sharedInstance];
  v17 = (void *)v16;
  if (var1 == 5)
  {
    if (a3->var4.var1.var0.var1 - 4097 >= 0xFFFFF000 && a3->var4.var5.var2 < 6) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  if (var1 != 4)
  {
    v18 = [kjAS9HuCdR1m5txL alloc];
    uint64_t v19 = -27209;
    goto LABEL_11;
  }
  if (a3->var4.var1.var0.var1 - 4097 < 0xFFFFF000 || a3->var4.var5.var2 > 5 || a3->var4.var5.var3 >= 300001)
  {
LABEL_9:
    v18 = [kjAS9HuCdR1m5txL alloc];
    uint64_t v19 = 155;
LABEL_11:
    v20 = [(kjAS9HuCdR1m5txL *)v18 initWithGyF0atX3JpCKc9pK:0 qfSDGTGvqd3Hruzg:v19];
    goto LABEL_12;
  }
LABEL_15:
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = sub_100014C70;
  v37 = sub_100014C80;
  id v38 = 0;
  if (v16)
  {
    os_signpost_id_t v22 = os_signpost_id_generate((os_log_t)qword_1006AD1B0);
    v23 = (id)qword_1006AD1B0;
    v24 = v23;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "lo", "enableTelemetry=YES", buf, 2u);
    }

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100014C88;
    v32[3] = &unk_10065EBB8;
    v32[4] = &v33;
    [v17 UupMWO2j2nYek7xf:v32 exi2C8VfynTXu5cU:a3 TYPlhTGwKuAdWgfx:v12 TWWnmIjkBlMfHmma:v14];
    v25 = (id)qword_1006AD1B0;
    v26 = v25;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      unsigned int var0 = a4->var0;
      unsigned int v28 = a4->var1;
      *(_DWORD *)buf = 67240448;
      unsigned int v40 = var0;
      __int16 v41 = 1026;
      unsigned int v42 = v28;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_END, v22, "lo", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
    }

    v29 = [kjAS9HuCdR1m5txL alloc];
    v30 = [(kjAS9HuCdR1m5txL *)v29 initWithGyF0atX3JpCKc9pK:v34[5] qfSDGTGvqd3Hruzg:0];
  }
  else
  {
    v31 = [kjAS9HuCdR1m5txL alloc];
    v30 = [(kjAS9HuCdR1m5txL *)v31 initWithGyF0atX3JpCKc9pK:v34[5] qfSDGTGvqd3Hruzg:139001];
  }
  v20 = v30;
  _Block_object_dispose(&v33, 8);

LABEL_12:

  return v20;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v7 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:0];
  uint64_t var1 = a3->var1;
  [v7 encodeInt64:0x76DF2CA55E370785 forKey:@"0x5563"];
  [v7 encodeInt32:var1 forKey:@"0x6595"];
  if (var1 == 5)
  {
    v9 = +[eTBtehykeBvfpeTP rsNB9HkZVEH0l6fT:a3->var4.var0.var0 gsx0MJUoOpcxcozG:a3->var4.var1.var0.var1];
    [v7 encodeObject:v9];
    [v7 encodeInt32:a3->var4.var5.var2 forKey:@"0xb18e"];
    goto LABEL_5;
  }
  if (var1 == 4)
  {
    v9 = +[eTBtehykeBvfpeTP rsNB9HkZVEH0l6fT:a3->var4.var0.var0 gsx0MJUoOpcxcozG:a3->var4.var1.var0.var1];
    [v7 encodeObject:v9];
    [v7 encodeInt64:a3->var4.var5.var3 forKey:@"0x9efa"];
    [v7 encodeInt32:a3->var4.var5.var2 forKey:@"0xb18e"];
    [v7 encodeInt64:a3->var4.var5.var4 forKey:@"0xf16f"];
LABEL_5:
  }
  unint64_t v10 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:v7];

  return v10;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  if (a3->var1 == 5)
  {
    id v5 = objc_alloc_init((Class)NSMutableSet);
    v6 = +[Yp00msaYdVlZesvU listDependenciesForIntExpression:&a3->var4.var15.var2.var1];
    [v5 setSet:v6];

    id v7 = +[Yp00msaYdVlZesvU listDependenciesForIntExpression:(char *)&a3->var4.var26 + 168];
    [v5 unionSet:v7];

    v8 = +[NSSet setWithSet:v5];
  }
  else
  {
    v8 = +[NSSet set];
  }

  return v8;
}

@end