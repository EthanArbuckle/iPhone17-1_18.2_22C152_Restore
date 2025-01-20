@interface NiJVUDlOmidQPPQl
- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8;
- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4;
- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
@end

@implementation NiJVUDlOmidQPPQl

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v39 = a6;
  id v12 = a7;
  id v13 = a8;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  uint64_t v55 = 0;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = sub_10000FC94;
  v50 = sub_10000FCA4;
  id v51 = 0;
  v40 = objc_alloc_init(_TtC3asd20ASFinanceStoreHelper);
  v14 = dispatch_group_create();
  dispatch_time_t timeout = dispatch_time(0, 1000000 * a3->var3);
  os_signpost_id_t v15 = os_signpost_id_generate((os_log_t)qword_1006AD1B0);
  v16 = (id)qword_1006AD1B0;
  v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "fk", "enableTelemetry=YES", buf, 2u);
  }

  v18 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4.var26.var2[0].var3 xNtFS0jGMQPgkTi7:v53 + 3 i4KDOQicW9Xd5WBz:v12 TWWnmIjkBlMfHmma:v13];
  if (v53[3])
  {
    v19 = [[kjAS9HuCdR1m5txL alloc] initWithGyF0atX3JpCKc9pK:0 qfSDGTGvqd3Hruzg:174002];
  }
  else
  {
    v37 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:(char *)&a3->var4.var26 + 176 xNtFS0jGMQPgkTi7:v53 + 3 i4KDOQicW9Xd5WBz:v12 TWWnmIjkBlMfHmma:v13];
    if (v53[3])
    {
      v19 = [[kjAS9HuCdR1m5txL alloc] initWithGyF0atX3JpCKc9pK:0 qfSDGTGvqd3Hruzg:174002];
    }
    else
    {
      dispatch_group_enter(v14);
      var0 = a3->var4.var0.var1.var0;
      unint64_t v36 = a3->var4.var0.var0;
      v33 = a3->var4.var0.var1.var2[0].var0;
      v34 = a3->var4.var1.var0.var2[0].var0;
      var2 = a3->var4.var1.var0.var2[0].var2;
      long long v31 = *(_OWORD *)((char *)&a3->var4.var26 + 312);
      v29 = a3->var4.var1.var2.var2[1].var2;
      unint64_t var9 = a3->var4.var23.var9;
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_10000FCAC;
      v41[3] = &unk_10065EE08;
      v44 = &v46;
      v42 = v40;
      v45 = &v52;
      dispatch_group_t group = v14;
      dispatch_group_t v43 = group;
      -[ASFinanceStoreHelper queryTransactionsWithStartDateOffset:endDateOffset:transactionSources:locationType:locationFilterDistance:lat:lon:maxCount:sortOrder:sortByAttributes:attributes:completionHandler:](v42, "queryTransactionsWithStartDateOffset:endDateOffset:transactionSources:locationType:locationFilterDistance:lat:lon:maxCount:sortOrder:sortByAttributes:attributes:completionHandler:", v36, var0, v34, v33, var2, v18, v37, v31, var9, v29, v41);
      v20 = (id)qword_1006AD1B0;
      v21 = v20;
      if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        unsigned int v22 = a4->var0;
        unsigned int var1 = a4->var1;
        *(_DWORD *)buf = 67240448;
        unsigned int v57 = v22;
        __int16 v58 = 1026;
        unsigned int v59 = var1;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_END, v15, "fk", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
      }

      if (dispatch_group_wait(group, timeout))
      {
        v24 = [kjAS9HuCdR1m5txL alloc];
        uint64_t v25 = 0;
        uint64_t v26 = 174003;
      }
      else
      {
        v24 = [kjAS9HuCdR1m5txL alloc];
        uint64_t v25 = v47[5];
        uint64_t v26 = v53[3];
      }
      v19 = [(kjAS9HuCdR1m5txL *)v24 initWithGyF0atX3JpCKc9pK:v25 qfSDGTGvqd3Hruzg:v26];
    }
  }

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);

  return v19;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  uint64_t v15 = 0;
  id v8 = a6;
  id v9 = a5;
  id v10 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:0];
  v11 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4.var26.var2[0].var3 xNtFS0jGMQPgkTi7:&v15 i4KDOQicW9Xd5WBz:v9 TWWnmIjkBlMfHmma:v8];
  id v12 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:(char *)&a3->var4.var26 + 176 xNtFS0jGMQPgkTi7:&v15 i4KDOQicW9Xd5WBz:v9 TWWnmIjkBlMfHmma:v8];

  [v10 encodeInt64:0x9E55F39E67408347 forKey:@"0x5563"];
  [v10 encodeObject:v11];
  [v10 encodeObject:v12];
  [v10 encodeInt64:a3->var4.var0.var0 forKey:@"0x1753"];
  [v10 encodeInt64:a3->var4.var11.var1 forKey:@"0x1fa8"];
  [v10 encodeInt64:a3->var4.var5.var3 forKey:@"0x1fa8"];
  [v10 encodeInt64:a3->var4.var5.var4 forKey:@"0x275a"];
  [v10 encodeInt64:a3->var4.var23.var7 forKey:@"0x0x5bde"];
  [v10 encodeInt64:a3->var4.var23.var8 forKey:@"0x9097"];
  [v10 encodeInt64:a3->var4.var23.var9 forKey:@"0x38bb"];
  [v10 encodeInt64:a3->var4.var23.var10 forKey:@"0xf71a"];
  unint64_t v13 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:v10];

  return v13;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  return +[NSSet set];
}

@end