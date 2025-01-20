@interface AaZDqQVspOsBOmNU
- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8;
- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4;
- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
@end

@implementation AaZDqQVspOsBOmNU

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v10 = a8;
  id v11 = a7;
  id v12 = objc_alloc_init((Class)NSPersonNameComponentsFormatter);
  uint64_t v46 = 0;
  os_signpost_id_t v13 = os_signpost_id_generate((os_log_t)qword_1006AD1B0);
  v14 = (id)qword_1006AD1B0;
  v15 = v14;
  unint64_t v16 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "np", "enableTelemetry=YES", buf, 2u);
  }
  os_signpost_id_t v43 = v13;

  v17 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4 xNtFS0jGMQPgkTi7:&v46 i4KDOQicW9Xd5WBz:v11 TWWnmIjkBlMfHmma:v10];

  v18 = [v12 personNameComponentsFromString:v17];
  v19 = v18;
  if (v18)
  {
    v51[0] = @"gn";
    v41 = [v18 givenName];
    v40 = +[NSString string:v41 orDefault:&stru_100686790];
    v52[0] = v40;
    v51[1] = @"mn";
    v39 = [v19 middleName];
    v38 = +[NSString string:v39 orDefault:&stru_100686790];
    v52[1] = v38;
    v51[2] = @"fn";
    v37 = [v19 familyName];
    +[NSString string:v37 orDefault:&stru_100686790];
    v36 = v42 = v17;
    v52[2] = v36;
    v51[3] = @"np";
    v20 = [v19 namePrefix];
    +[NSString string:v20 orDefault:&stru_100686790];
    v21 = id v45 = v12;
    v52[3] = v21;
    v51[4] = @"ns";
    v22 = [v19 nameSuffix];
    v23 = +[NSString string:v22 orDefault:&stru_100686790];
    v52[4] = v23;
    v51[5] = @"nn";
    unint64_t v24 = v16;
    v25 = [v19 nickname];
    v26 = +[NSString string:v25 orDefault:&stru_100686790];
    v52[5] = v26;
    v27 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:6];
    v53 = v27;
    v28 = +[NSArray arrayWithObjects:&v53 count:1];

    unint64_t v16 = v24;
    id v12 = v45;

    v17 = v42;
  }
  else
  {
    v28 = 0;
  }
  v29 = [kjAS9HuCdR1m5txL alloc];
  v30 = [(kjAS9HuCdR1m5txL *)v29 initWithGyF0atX3JpCKc9pK:v28 qfSDGTGvqd3Hruzg:v46];
  v31 = (id)qword_1006AD1B0;
  v32 = v31;
  if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    unsigned int var0 = a4->var0;
    unsigned int var1 = a4->var1;
    *(_DWORD *)buf = 67240448;
    unsigned int v48 = var0;
    __int16 v49 = 1026;
    unsigned int v50 = var1;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_END, v43, "np", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
  }

  return v30;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  return +[Yp00msaYdVlZesvU listDependenciesForStringType:](Yp00msaYdVlZesvU, "listDependenciesForStringType:", &a3->var4, a4);
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:0];
  uint64_t v14 = 0;
  id v11 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4 xNtFS0jGMQPgkTi7:&v14 i4KDOQicW9Xd5WBz:v9 TWWnmIjkBlMfHmma:v8];

  [v10 encodeInt64:0x2B0DF39217DBC87ELL forKey:@"0x5563"];
  [v10 encodeObject:v11];
  unint64_t v12 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:v10];

  return v12;
}

@end