@interface A8dT9hzXgBYw0xH1
- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8;
- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4;
- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
@end

@implementation A8dT9hzXgBYw0xH1

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v10 = a7;
  id v11 = a8;
  uint64_t v43 = 0;
  os_signpost_id_t v12 = os_signpost_id_generate((os_log_t)qword_1006AD1B0);
  v13 = (id)qword_1006AD1B0;
  v14 = v13;
  unint64_t v38 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "ddf", "enableTelemetry=YES", buf, 2u);
  }

  unint64_t var0 = a3->var4.var8.var0;
  if ((unint64_t)[v10 count] <= var0)
  {
    v17 = 0;
    v16 = 0;
    v18 = 0;
    id v19 = 0;
    v20 = 0;
    uint64_t v43 = 161031;
  }
  else
  {
    v16 = [v10 objectAtIndexedSubscript:a3->var4.var8.var0];
    v17 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4.var7.var1 xNtFS0jGMQPgkTi7:&v43 i4KDOQicW9Xd5WBz:v10 TWWnmIjkBlMfHmma:v11];
    if (v43)
    {
      v18 = 0;
      id v19 = 0;
      v20 = 0;
    }
    else
    {
      os_signpost_id_t v35 = v12;
      id v36 = v11;
      v18 = objc_opt_new();
      v20 = objc_opt_new();
      v34 = v16;
      [v16 GyF0atX3JpCKc9pK];
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      id v21 = [v19 countByEnumeratingWithState:&v39 objects:v48 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v40;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v40 != v23) {
              objc_enumerationMutation(v19);
            }
            v25 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            v26 = [v25 valueForKey:v17];
            if (v26 && ([v18 containsObject:v26] & 1) == 0)
            {
              [v20 addObject:v25];
              [v18 addObject:v26];
            }
          }
          id v22 = [v19 countByEnumeratingWithState:&v39 objects:v48 count:16];
        }
        while (v22);
      }

      os_signpost_id_t v12 = v35;
      id v11 = v36;
      v16 = v34;
    }
  }
  v27 = [kjAS9HuCdR1m5txL alloc];
  v28 = [(kjAS9HuCdR1m5txL *)v27 initWithGyF0atX3JpCKc9pK:v20 qfSDGTGvqd3Hruzg:v43];
  v29 = (id)qword_1006AD1B0;
  v30 = v29;
  if (v38 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    unsigned int v31 = a4->var0;
    unsigned int var1 = a4->var1;
    *(_DWORD *)buf = 67240448;
    unsigned int v45 = v31;
    __int16 v46 = 1026;
    unsigned int v47 = var1;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v30, OS_SIGNPOST_INTERVAL_END, v12, "ddf", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
  }

  return v28;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:0];
  uint64_t v15 = 0;
  [v10 encodeInt64:0x9571AA7E8FC7EA84 forKey:@"0x5563"];
  id v11 = [v9 objectAtIndexedSubscript:a3->var4.var8.var0];
  os_signpost_id_t v12 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4.var7.var1 xNtFS0jGMQPgkTi7:&v15 i4KDOQicW9Xd5WBz:v9 TWWnmIjkBlMfHmma:v8];

  [v10 encodeObject:v12];
  [v10 encodeInt64:objc_msgSend(v11, "JmiV9VW8P3Gxz1H7") forKey:@"0x07aa"];
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