@interface IJ2i1jyVHK2GU5Sj
- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8;
- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4;
- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
@end

@implementation IJ2i1jyVHK2GU5Sj

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v10 = a7;
  id v11 = a8;
  uint64_t v31 = 0;
  os_signpost_id_t v12 = os_signpost_id_generate((os_log_t)qword_1006AD1B0);
  v13 = (id)qword_1006AD1B0;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "sdf", "enableTelemetry=YES", buf, 2u);
  }

  unint64_t var0 = a3->var4.var8.var0;
  if ((unint64_t)[v10 count] <= var0)
  {
    v16 = 0;
    v17 = 0;
    v18 = 0;
    uint64_t v31 = 161021;
  }
  else
  {
    v16 = [v10 objectAtIndexedSubscript:a3->var4.var8.var0];
    v17 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4.var7.var1 xNtFS0jGMQPgkTi7:&v31 i4KDOQicW9Xd5WBz:v10 TWWnmIjkBlMfHmma:v11];
    if (v31)
    {
      v18 = 0;
    }
    else
    {
      v19 = [v16 GyF0atX3JpCKc9pK];
      v20 = +[NSSortDescriptor sortDescriptorWithKey:v17 ascending:a3->var4.var9.var1 != 0];
      v36 = v20;
      +[NSArray arrayWithObjects:&v36 count:1];
      v22 = id v21 = v11;
      v18 = [v19 sortedArrayUsingDescriptors:v22];

      id v11 = v21;
    }
  }
  v23 = [kjAS9HuCdR1m5txL alloc];
  v24 = [(kjAS9HuCdR1m5txL *)v23 initWithGyF0atX3JpCKc9pK:v18 qfSDGTGvqd3Hruzg:v31];
  v25 = (id)qword_1006AD1B0;
  v26 = v25;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    unsigned int v27 = a4->var0;
    unsigned int var1 = a4->var1;
    *(_DWORD *)buf = 67240448;
    unsigned int v33 = v27;
    __int16 v34 = 1026;
    unsigned int v35 = var1;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_END, v12, "sdf", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
  }

  return v24;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:0];
  [v10 encodeInt64:0x16EF48EF37AF2E13 forKey:@"0x5563"];
  uint64_t v16 = 0;
  uint64_t var1 = a3->var4.var9.var1;
  os_signpost_id_t v12 = [v9 objectAtIndexedSubscript:a3->var4.var8.var0];
  v13 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4.var7.var1 xNtFS0jGMQPgkTi7:&v16 i4KDOQicW9Xd5WBz:v9 TWWnmIjkBlMfHmma:v8];

  [v10 encodeObject:v13];
  [v10 encodeInt64:objc_msgSend(v12, "JmiV9VW8P3Gxz1H7") forKey:@"0x07aa"];
  [v10 encodeInt64:var1 forKey:@"0x9097"];
  unint64_t v14 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:v10];

  return v14;
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