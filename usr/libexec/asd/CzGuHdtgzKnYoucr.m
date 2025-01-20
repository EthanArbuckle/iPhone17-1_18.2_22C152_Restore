@interface CzGuHdtgzKnYoucr
- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8;
- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4;
- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
@end

@implementation CzGuHdtgzKnYoucr

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v45 = a6;
  id v12 = a7;
  id v13 = a8;
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x2020000000;
  uint64_t v63 = 0;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  uint64_t v59 = 0;
  os_signpost_id_t v14 = os_signpost_id_generate((os_log_t)qword_1006AD1B0);
  v15 = (id)qword_1006AD1B0;
  v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "fkc", "enableTelemetry=YES", buf, 2u);
  }

  os_signpost_id_t v43 = v14;
  v44 = a4;
  v17 = objc_alloc_init(_TtC3asd20ASFinanceStoreHelper);
  v18 = dispatch_group_create();
  dispatch_time_t timeout = dispatch_time(0, 1000000 * a3->var3);
  uint64_t v19 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4.var26.var2[0].var3 xNtFS0jGMQPgkTi7:v61 + 3 i4KDOQicW9Xd5WBz:v12 TWWnmIjkBlMfHmma:v13];
  unint64_t v48 = v14 - 1;
  v50 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:(char *)&a3->var4.var26 + 176 xNtFS0jGMQPgkTi7:v61 + 3 i4KDOQicW9Xd5WBz:v12 TWWnmIjkBlMfHmma:v13];
  dispatch_group_enter(v18);
  unint64_t var0 = a3->var4.var0.var0;
  v20 = a3->var4.var0.var1.var0;
  v46 = v13;
  v22 = a3->var4.var1.var0.var2[0].var0;
  v23 = a3->var4.var0.var1.var2[0].var0;
  v49 = (void *)v19;
  var2 = a3->var4.var1.var0.var2[0].var2;
  unint64_t var7 = a3->var4.var23.var7;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_10000449C;
  v51[3] = &unk_10065E998;
  v54 = &v56;
  v26 = v17;
  v52 = v26;
  v55 = &v60;
  v53 = v18;
  v27 = v20;
  v28 = v12;
  v29 = var2;
  v30 = v53;
  [(ASFinanceStoreHelper *)v26 countTransactionsWithStartDateOffset:var0 endDateOffset:v27 transactionSources:v22 locationType:v23 locationFilterDistance:v29 lat:v49 lon:v50 maxCount:var7 completionHandler:v51];
  v31 = (id)qword_1006AD1B0;
  v32 = v31;
  if (v48 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    unsigned int v33 = v44->var0;
    unsigned int var1 = v44->var1;
    *(_DWORD *)buf = 67240448;
    unsigned int v68 = v33;
    __int16 v69 = 1026;
    unsigned int v70 = var1;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_END, v43, "fkc", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
  }

  if (dispatch_group_wait(v30, timeout))
  {
    v35 = [kjAS9HuCdR1m5txL alloc];
    uint64_t v36 = 174003;
LABEL_11:
    v37 = [(kjAS9HuCdR1m5txL *)v35 initWithGyF0atX3JpCKc9pK:0 qfSDGTGvqd3Hruzg:v36];
    goto LABEL_12;
  }
  if (v61[3])
  {
    v35 = [kjAS9HuCdR1m5txL alloc];
    uint64_t v36 = v61[3];
    goto LABEL_11;
  }
  v39 = [kjAS9HuCdR1m5txL alloc];
  CFStringRef v64 = @"c";
  v40 = +[NSNumber numberWithInteger:v57[3]];
  v65 = v40;
  v41 = +[NSDictionary dictionaryWithObjects:&v65 forKeys:&v64 count:1];
  v66 = v41;
  v42 = +[NSArray arrayWithObjects:&v66 count:1];
  v37 = [(kjAS9HuCdR1m5txL *)v39 initWithGyF0atX3JpCKc9pK:v42 qfSDGTGvqd3Hruzg:0];

LABEL_12:
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v60, 8);

  return v37;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  uint64_t v15 = 0;
  id v8 = a6;
  id v9 = a5;
  id v10 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:0];
  v11 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4.var26.var2[0].var3 xNtFS0jGMQPgkTi7:&v15 i4KDOQicW9Xd5WBz:v9 TWWnmIjkBlMfHmma:v8];
  id v12 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:(char *)&a3->var4.var26 + 176 xNtFS0jGMQPgkTi7:&v15 i4KDOQicW9Xd5WBz:v9 TWWnmIjkBlMfHmma:v8];

  [v10 encodeInt64:0x935167CDF835AA98 forKey:@"0x5563"];
  [v10 encodeObject:v11];
  [v10 encodeObject:v12];
  [v10 encodeInt64:a3->var4.var0.var0 forKey:@"0x1753"];
  [v10 encodeInt64:a3->var4.var11.var1 forKey:@"0x1fa8"];
  [v10 encodeInt64:a3->var4.var5.var3 forKey:@"0x1fa8"];
  [v10 encodeInt64:a3->var4.var5.var4 forKey:@"0x275a"];
  [v10 encodeInt64:a3->var4.var23.var7 forKey:@"0x0x5bde"];
  unint64_t v13 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:v10];

  return v13;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  return +[NSSet set];
}

@end