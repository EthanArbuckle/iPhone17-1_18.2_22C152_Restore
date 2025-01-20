@interface Jc1OiXBj3TZTX6fS
- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8;
- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4;
- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
@end

@implementation Jc1OiXBj3TZTX6fS

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v12 = a6;
  id v13 = a7;
  id v14 = a8;
  id v35 = 0;
  uint64_t v15 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4.var7.var1 xNtFS0jGMQPgkTi7:&v35 i4KDOQicW9Xd5WBz:v13 TWWnmIjkBlMfHmma:v14];
  v16 = 0;
  v17 = (void *)v15;
  if (!v35 && v15)
  {
    unint64_t var0 = a3->var4.var8.var0;
    if ((unint64_t)[v13 count] <= var0)
    {
      v16 = 0;
      v21 = [[kjAS9HuCdR1m5txL alloc] initWithGyF0atX3JpCKc9pK:0 qfSDGTGvqd3Hruzg:161011];
      goto LABEL_16;
    }
    v19 = [v13 objectAtIndexedSubscript:a3->var4.var8.var0];
    v20 = +[NSPredicate predicateWithFormat:@"SELF.%@.integerValue != 0", v17];
    id v35 = [v19 qfSDGTGvqd3Hruzg];
    if (v35)
    {
      v16 = 0;
    }
    else
    {
      os_signpost_id_t v22 = os_signpost_id_generate((os_log_t)qword_1006AD1B0);
      v23 = (id)qword_1006AD1B0;
      v24 = v23;
      os_signpost_id_t spid = v22;
      unint64_t v25 = v22 - 1;
      if (v25 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_BEGIN, spid, "fi", "enableTelemetry=YES", buf, 2u);
      }

      v26 = [v19 GyF0atX3JpCKc9pK];
      v16 = [v26 filteredArrayUsingPredicate:v20];

      v27 = (id)qword_1006AD1B0;
      v28 = v27;
      if (v25 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v27))
      {
        unsigned int v29 = a4->var0;
        unsigned int var1 = a4->var1;
        *(_DWORD *)buf = 67240448;
        unsigned int v37 = v29;
        __int16 v38 = 1026;
        unsigned int v39 = var1;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, spid, "fi", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
      }

      v20 = 0;
    }
  }
  v31 = [kjAS9HuCdR1m5txL alloc];
  v21 = [(kjAS9HuCdR1m5txL *)v31 initWithGyF0atX3JpCKc9pK:v16 qfSDGTGvqd3Hruzg:v35];
LABEL_16:
  v32 = v21;

  return v32;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  id v10 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:0];
  uint64_t v15 = 0;
  v11 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4.var7.var1 xNtFS0jGMQPgkTi7:&v15 i4KDOQicW9Xd5WBz:v8 TWWnmIjkBlMfHmma:v9];
  [v10 encodeInt64:0x4AED952FCE4039C2 forKey:@"0x5563"];
  [v10 encodeObject:v11];
  id v12 = [v8 objectAtIndexedSubscript:a3->var4.var8.var0];
  [v10 encodeInt64:objc_msgSend(v12, "JmiV9VW8P3Gxz1H7") forKey:@"0x07aa"];
  unint64_t v13 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:v10];

  return v13;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  id v5 = objc_alloc_init((Class)NSMutableSet);
  v6 = +[Yp00msaYdVlZesvU listDependenciesForStringType:&a3->var4.var7.var1];
  [v5 setSet:v6];

  v7 = +[NSNumber numberWithUnsignedInt:a3->var4.var8.var0];
  [v5 addObject:v7];

  id v8 = +[NSSet setWithSet:v5];

  return v8;
}

@end