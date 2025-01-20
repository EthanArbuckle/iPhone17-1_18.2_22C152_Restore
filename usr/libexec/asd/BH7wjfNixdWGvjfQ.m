@interface BH7wjfNixdWGvjfQ
- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8;
- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4;
- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
@end

@implementation BH7wjfNixdWGvjfQ

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v30 = a6;
  id v31 = a7;
  id v32 = a8;
  v11 = +[YIbYnDZMoU7hwSYC sharedInstance];
  uint64_t v40 = 0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = sub_10000836C;
  v38 = sub_10000837C;
  id v39 = 0;
  uint64_t var0 = a3->var4.var8.var0;
  uint64_t var4 = a3->var4.var0.var4;
  v14 = +[NSMutableArray arrayWithCapacity:var4];
  uint64_t v28 = var0;
  os_signpost_id_t v15 = os_signpost_id_generate((os_log_t)qword_1006AD1B0);
  v16 = (id)qword_1006AD1B0;
  v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "pk", "enableTelemetry=YES", buf, 2u);
  }

  if (v11)
  {
    v18 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4.var7.var1 xNtFS0jGMQPgkTi7:&v40 i4KDOQicW9Xd5WBz:v31 TWWnmIjkBlMfHmma:v32];
    if (!v40)
    {
      if (var4)
      {
        for (uint64_t i = 0; i != var4; ++i)
        {
          v20 = +[eTBtehykeBvfpeTP rsNB9HkZVEH0l6fT:*(void *)&a3->var4.var2.var2[2 * i] gsx0MJUoOpcxcozG:*((unsigned int *)a3->var4.var0.var3 + i)];
          [v14 addObject:v20];
        }
      }
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100008384;
      v33[3] = &unk_10065EBB8;
      v33[4] = &v34;
      uint64_t v40 = (uint64_t)[v11 ZkTXckPDVjRWZuVM:v18 QsX3tfdMvsGwvY0F:v28 oMKZEzaKOVd8YlLk:v14 withCompletion:v33];
    }
  }
  else
  {
    v18 = 0;
    uint64_t v40 = 165000;
  }
  v21 = [kjAS9HuCdR1m5txL alloc];
  v22 = [(kjAS9HuCdR1m5txL *)v21 initWithGyF0atX3JpCKc9pK:v35[5] qfSDGTGvqd3Hruzg:v40];
  v23 = (id)qword_1006AD1B0;
  v24 = v23;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    unsigned int v25 = a4->var0;
    unsigned int var1 = a4->var1;
    *(_DWORD *)buf = 67240448;
    unsigned int v42 = v25;
    __int16 v43 = 1026;
    unsigned int v44 = var1;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_END, v15, "pk", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
  }

  _Block_object_dispose(&v34, 8);

  return v22;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  id v10 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:0];
  uint64_t v17 = 0;
  id v11 = [objc_alloc((Class)NSMutableArray) initWithCapacity:a3->var4.var0.var4];
  if (a3->var4.var0.var4)
  {
    unint64_t v12 = 0;
    do
    {
      v13 = +[eTBtehykeBvfpeTP rsNB9HkZVEH0l6fT:*(void *)&a3->var4.var2.var2[2 * v12] gsx0MJUoOpcxcozG:*((unsigned int *)a3->var4.var0.var3 + v12)];
      [v11 addObject:v13];

      ++v12;
    }
    while (v12 < a3->var4.var0.var4);
  }
  [v10 encodeObject:v11];
  v14 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4.var7.var1 xNtFS0jGMQPgkTi7:&v17 i4KDOQicW9Xd5WBz:v8 TWWnmIjkBlMfHmma:v9];
  [v10 encodeObject:v14];
  [v10 encodeInt64:a3->var4.var8.var0 forKey:@"0x0x5bde"];
  [v10 encodeInt64:0x48A30D07AA9F179CLL forKey:@"0x5563"];
  unint64_t v15 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:v10];

  return v15;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  return +[Yp00msaYdVlZesvU listDependenciesForStringType:](Yp00msaYdVlZesvU, "listDependenciesForStringType:", &a3->var4.var7.var1, a4);
}

@end