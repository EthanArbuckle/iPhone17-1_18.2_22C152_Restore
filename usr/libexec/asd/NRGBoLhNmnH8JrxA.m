@interface NRGBoLhNmnH8JrxA
- (id)bagIDForDF:(_KUwyEjpVZR65eUyl *)a3;
- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8;
- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4;
- (id)processServerJSONDataframeForBagWithID:(id)a3;
- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
@end

@implementation NRGBoLhNmnH8JrxA

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  os_signpost_id_t v11 = os_signpost_id_generate((os_log_t)qword_1006AD1B0);
  v12 = (id)qword_1006AD1B0;
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(v22[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "jdf", "enableTelemetry=YES", (uint8_t *)v22, 2u);
  }

  v14 = [(NRGBoLhNmnH8JrxA *)self bagIDForDF:a3];
  if (v14)
  {
    v15 = [(NRGBoLhNmnH8JrxA *)self processServerJSONDataframeForBagWithID:v14];
  }
  else
  {
    v15 = [[kjAS9HuCdR1m5txL alloc] initWithGyF0atX3JpCKc9pK:&__NSArray0__struct qfSDGTGvqd3Hruzg:165022];
  }
  v16 = v15;
  v17 = (id)qword_1006AD1B0;
  v18 = v17;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    unsigned int var0 = a4->var0;
    unsigned int var1 = a4->var1;
    v22[0] = 67240448;
    v22[1] = var0;
    __int16 v23 = 1026;
    unsigned int v24 = var1;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, v11, "jdf", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", (uint8_t *)v22, 0xEu);
  }

  return v16;
}

- (id)bagIDForDF:(_KUwyEjpVZR65eUyl *)a3
{
  unsigned int var1 = a3->var1;
  if (var1 == 2)
  {
    id v4 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:&a3->var4];
  }
  else if (var1 == 1)
  {
    id v4 = +[RavioliConstants ravioliUUID];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)processServerJSONDataframeForBagWithID:(id)a3
{
  id v3 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_1000147B8;
  v21 = sub_1000147C8;
  id v22 = 0;
  id v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  v5 = +[RavioliManagerObjC shared];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000147D0;
  v14[3] = &unk_10065EFD8;
  v16 = &v17;
  v6 = v4;
  v15 = v6;
  [v5 fetchRavioliDataFromStoreFor:v3 completion:v14];

  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v7 = v18[5];
  if (v7)
  {
    id v13 = 0;
    v8 = +[NSJSONSerialization JSONObjectWithData:v7 options:0 error:&v13];
    id v9 = v13;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v10 = [[kjAS9HuCdR1m5txL alloc] initWithGyF0atX3JpCKc9pK:v8 qfSDGTGvqd3Hruzg:0];
    }
    else {
      v10 = [[kjAS9HuCdR1m5txL alloc] initWithGyF0atX3JpCKc9pK:&__NSArray0__struct qfSDGTGvqd3Hruzg:165020];
    }
    os_signpost_id_t v11 = v10;
  }
  else
  {
    os_signpost_id_t v11 = [[kjAS9HuCdR1m5txL alloc] initWithGyF0atX3JpCKc9pK:&__NSArray0__struct qfSDGTGvqd3Hruzg:165021];
    id v9 = +[RavioliManagerObjC shared];
    v8 = +[DefinedRavioliNotificationIds missingBag];
    [v9 requestRavioliFetchWithProbabiliticThrottleWithBagID:v3 notificationId:v8];
  }

  _Block_object_dispose(&v17, 8);

  return v11;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v7 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:0];
  [v7 encodeInt64:0x569FF933A7589E17 forKey:@"0x5563"];
  [v7 encodeInt:a3->var1 forKey:@"0x6595"];
  if (a3->var1 == 2) {
    [v7 encodeBytes:&a3->var4 length:16];
  }
  unint64_t v8 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:v7];

  return v8;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  return +[NSSet set];
}

@end