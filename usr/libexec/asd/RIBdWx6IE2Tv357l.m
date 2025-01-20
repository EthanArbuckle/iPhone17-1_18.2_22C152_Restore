@interface RIBdWx6IE2Tv357l
- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8;
- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4;
- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
@end

@implementation RIBdWx6IE2Tv357l

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  uint64_t v30 = 0;
  uint64_t v9 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4 xNtFS0jGMQPgkTi7:&v30 i4KDOQicW9Xd5WBz:a7 TWWnmIjkBlMfHmma:a8];
  v10 = (void *)v9;
  v11 = 0;
  v12 = 0;
  if (v30) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = v9 == 0;
  }
  if (v13) {
    goto LABEL_18;
  }
  os_signpost_id_t v14 = os_signpost_id_generate((os_log_t)qword_1006AD1B0);
  v15 = (id)qword_1006AD1B0;
  v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "pl", "enableTelemetry=YES", buf, 2u);
  }

  v17 = +[NSURL fileURLWithPath:v10 isDirectory:0];
  v12 = v17;
  if (!v17 || ([v17 checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {
    uint64_t v30 = 157;
    v42[0] = &__NSDictionary0__struct;
    v41[0] = @"v";
    v41[1] = @"ec";
    v19 = +[NSNumber numberWithInteger:157];
    v42[1] = v19;
    v20 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
    v43 = v20;
    v21 = &v43;
    goto LABEL_13;
  }
  uint64_t v18 = +[NSDictionary dictionaryWithContentsOfURL:v12 error:0];
  v19 = (void *)v18;
  if (v18)
  {
    v35[0] = @"v";
    v35[1] = @"ec";
    v36[0] = v18;
    v36[1] = &off_100688058;
    v20 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
    v37 = v20;
    v21 = &v37;
LABEL_13:
    v11 = +[NSArray arrayWithObjects:v21 count:1];
    goto LABEL_14;
  }
  uint64_t v30 = 158;
  v38[0] = @"v";
  v38[1] = @"ec";
  v39[0] = &__NSDictionary0__struct;
  v20 = +[NSNumber numberWithInteger:158];
  v39[1] = v20;
  v29 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
  v40 = v29;
  v11 = +[NSArray arrayWithObjects:&v40 count:1];

LABEL_14:
  v22 = (id)qword_1006AD1B0;
  v23 = v22;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    unsigned int var0 = a4->var0;
    unsigned int var1 = a4->var1;
    *(_DWORD *)buf = 67240448;
    unsigned int v32 = var0;
    __int16 v33 = 1026;
    unsigned int v34 = var1;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_END, v14, "pl", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
  }

LABEL_18:
  v26 = [kjAS9HuCdR1m5txL alloc];
  v27 = [(kjAS9HuCdR1m5txL *)v26 initWithGyF0atX3JpCKc9pK:v11 qfSDGTGvqd3Hruzg:v30];

  return v27;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:0];
  uint64_t v14 = 0;
  v11 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4 xNtFS0jGMQPgkTi7:&v14 i4KDOQicW9Xd5WBz:v9 TWWnmIjkBlMfHmma:v8];

  [v10 encodeInt64:0xF6509D9806D22585 forKey:@"0x5563"];
  [v10 encodeObject:v11];
  unint64_t v12 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:v10];

  return v12;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  return +[Yp00msaYdVlZesvU listDependenciesForStringType:](Yp00msaYdVlZesvU, "listDependenciesForStringType:", &a3->var4, a4);
}

@end