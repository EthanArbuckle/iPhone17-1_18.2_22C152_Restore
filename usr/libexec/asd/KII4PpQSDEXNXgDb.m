@interface KII4PpQSDEXNXgDb
- (KII4PpQSDEXNXgDb)initWithSmoothFunctions:(_yo6ptGgiZw8VbWk1 *)a3 X5iUjoUzZPsj1b68:(int64_t)a4;
- (_yo6ptGgiZw8VbWk1)jHoy3L8RogTTbjjB;
- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8;
- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4;
- (int64_t)X5iUjoUzZPsj1b68;
- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
- (void)setJHoy3L8RogTTbjjB:(_yo6ptGgiZw8VbWk1 *)a3;
- (void)setX5iUjoUzZPsj1b68:(int64_t)a3;
@end

@implementation KII4PpQSDEXNXgDb

- (KII4PpQSDEXNXgDb)initWithSmoothFunctions:(_yo6ptGgiZw8VbWk1 *)a3 X5iUjoUzZPsj1b68:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)KII4PpQSDEXNXgDb;
  result = [(KII4PpQSDEXNXgDb *)&v7 init];
  if (result)
  {
    result->_jHoy3L8RogTTbjjB = a3;
    result->_X5iUjoUzZPsj1b68 = a4;
  }
  return result;
}

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v13 = a6;
  id v14 = a7;
  id v15 = a8;
  uint64_t v38 = 0;
  int64_t var0 = a3->var4.var8.var0;
  uint64_t var1 = a3->var4.var9.var1;
  os_signpost_id_t v18 = os_signpost_id_generate((os_log_t)qword_1006AD1B0);
  v19 = (id)qword_1006AD1B0;
  v20 = v19;
  os_signpost_id_t spid = v18;
  unint64_t v21 = v18 - 1;
  if (v21 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_BEGIN, spid, "smf", "enableTelemetry=YES", buf, 2u);
  }

  if (self->_X5iUjoUzZPsj1b68 <= var0)
  {
    v31 = [[kjAS9HuCdR1m5txL alloc] initWithGyF0atX3JpCKc9pK:0 qfSDGTGvqd3Hruzg:164000];
  }
  else
  {
    v34 = a4;
    id v37 = v15;
    id v22 = [objc_alloc((Class)NSMutableArray) initWithCapacity:var1];
    if (var1)
    {
      uint64_t v23 = 0;
      while (1)
      {
        +[Yp00msaYdVlZesvU HeSoUpzppdCV64Ik:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:](Yp00msaYdVlZesvU, "HeSoUpzppdCV64Ik:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:", a3->var4.var5.var3 + 32 * v23, &v38, v14, v34);
        v24 = (kjAS9HuCdR1m5txL *)objc_claimAutoreleasedReturnValue();
        if (v38) {
          break;
        }
        [v22 setObject:v24 atIndexedSubscript:v23];

        if (++v23 == var1) {
          goto LABEL_9;
        }
      }
      v32 = [kjAS9HuCdR1m5txL alloc];
      v31 = [(kjAS9HuCdR1m5txL *)v32 initWithGyF0atX3JpCKc9pK:0 qfSDGTGvqd3Hruzg:v38];
    }
    else
    {
LABEL_9:
      id v25 = [objc_alloc((Class)NSMutableArray) initWithArray:v37];
      [v25 addObject:v22];
      v26 = [v13 PLMCCRRqEw4moT9R:&self->_jHoy3L8RogTTbjjB[var0].var1 UtPlzRffoEpw7Ue1:v34 SFkZRA5Ek9YzhDRs:a5 TWWnmIjkBlMfHmma:v25];
      v27 = (id)qword_1006AD1B0;
      v28 = v27;
      if (v21 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        unsigned int v29 = v34->var0;
        unsigned int v30 = v34->var1;
        *(_DWORD *)buf = 67240448;
        unsigned int v40 = v29;
        __int16 v41 = 1026;
        unsigned int v42 = v30;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, spid, "smf", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
      }

      v24 = v26;
      v31 = v24;
    }

    id v15 = v37;
  }

  return v31;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:0];
  int64_t var0 = a3->var4.var8.var0;
  uint64_t var1 = a3->var4.var9.var1;
  uint64_t v22 = 0;
  [v13 encodeInt64:0xBDE2F5530BB436CLL forKey:@"0x5563"];
  if (self->_X5iUjoUzZPsj1b68 <= var0) {
    uint64_t v16 = -1;
  }
  else {
    uint64_t v16 = (uint64_t)[v10 jCbmcix0xxhNVOSS:&self->_jHoy3L8RogTTbjjB[var0].var1 TWWnmIjkBlMfHmma:v12];
  }
  [v13 encodeInt64:v16 forKey:@"0x07aa"];
  id v17 = [objc_alloc((Class)NSMutableArray) initWithCapacity:var1];
  if (var1)
  {
    for (uint64_t i = 0; i != var1; ++i)
    {
      v19 = +[Yp00msaYdVlZesvU HeSoUpzppdCV64Ik:a3->var4.var5.var3 + 32 * i xNtFS0jGMQPgkTi7:&v22 i4KDOQicW9Xd5WBz:v11];
      [v17 setObject:v19 atIndexedSubscript:i];
    }
  }
  [v13 encodeObject:v17];
  unint64_t v20 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:v13];

  return v20;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableSet);
  uint64_t var1 = a3->var4.var9.var1;
  v9 = [v6 listDependenciesForDataframe:&self->_jHoy3L8RogTTbjjB[a3->var4.var8.var0].var1];
  [v7 setSet:v9];

  if (var1)
  {
    uint64_t v10 = 0;
    uint64_t v11 = 32 * var1;
    do
    {
      id v12 = +[Yp00msaYdVlZesvU dependenciesForStringExpression:a3->var4.var5.var3 + v10];
      [v7 addObject:v12];

      v10 += 32;
    }
    while (v11 != v10);
  }
  id v13 = +[NSSet setWithSet:v7];

  return v13;
}

- (_yo6ptGgiZw8VbWk1)jHoy3L8RogTTbjjB
{
  return self->_jHoy3L8RogTTbjjB;
}

- (void)setJHoy3L8RogTTbjjB:(_yo6ptGgiZw8VbWk1 *)a3
{
  self->_jHoy3L8RogTTbjjB = a3;
}

- (int64_t)X5iUjoUzZPsj1b68
{
  return self->_X5iUjoUzZPsj1b68;
}

- (void)setX5iUjoUzZPsj1b68:(int64_t)a3
{
  self->_X5iUjoUzZPsj1b68 = a3;
}

@end