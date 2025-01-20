@interface FPteRld7NoAzBRMo
- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8;
- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4;
- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
@end

@implementation FPteRld7NoAzBRMo

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v11 = a6;
  id v12 = a7;
  id v13 = a8;
  v14 = +[FnfDbwO2lFcwJMJU sharedInstance];
  id v15 = objc_alloc_init((Class)NSMutableArray);
  os_signpost_id_t v16 = os_signpost_id_generate((os_log_t)qword_1006AD1B0);
  v17 = (id)qword_1006AD1B0;
  v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "pn", "enableTelemetry=YES", buf, 2u);
  }

  uint64_t v19 = [v14 N6iJbZh5ycxf9a3z];
  v20 = (id)qword_1006AD1B0;
  v21 = v20;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    unsigned int var0 = a4->var0;
    unsigned int var1 = a4->var1;
    *(_DWORD *)buf = 67240448;
    unsigned int v33 = var0;
    __int16 v34 = 1026;
    unsigned int v35 = var1;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_END, v16, "pn", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
  }

  if (v19) {
    uint64_t v24 = 0;
  }
  else {
    uint64_t v24 = 141001;
  }
  if (v19) {
    v25 = (__CFString *)v19;
  }
  else {
    v25 = &stru_100686790;
  }
  v26 = +[NSNumber numberWithUnsignedInt:v24, @"ec"];
  v30[1] = @"ph";
  v31[0] = v26;
  v31[1] = v25;
  v27 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
  [v15 addObject:v27];

  v28 = [[kjAS9HuCdR1m5txL alloc] initWithGyF0atX3JpCKc9pK:v15 qfSDGTGvqd3Hruzg:0];

  return v28;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v6 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:0];
  [v6 encodeInt64:0x594EAC2DD9E5ADEFLL forKey:@"0x5563"];
  unint64_t v7 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:v6];

  return v7;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  v4 = +[NSSet set];

  return v4;
}

@end