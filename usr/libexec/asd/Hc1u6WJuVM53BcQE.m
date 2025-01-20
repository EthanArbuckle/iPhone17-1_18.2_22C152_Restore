@interface Hc1u6WJuVM53BcQE
- (Hc1u6WJuVM53BcQE)initWithdEyUJuqYjUufZYGN:(id)a3;
- (NSDictionary)Po0NnEfbQHpSgzj7;
- (id)cLH5z0XbtucU9RrW:(_KUwyEjpVZR65eUyl *)a3;
- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8;
- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4;
- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
@end

@implementation Hc1u6WJuVM53BcQE

- (Hc1u6WJuVM53BcQE)initWithdEyUJuqYjUufZYGN:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)Hc1u6WJuVM53BcQE;
  v6 = [(Hc1u6WJuVM53BcQE *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_Po0NnEfbQHpSgzj7, a3);
  }

  return v7;
}

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v12 = a6;
  id v13 = a7;
  id v14 = a8;
  unsigned int var1 = a3->var1;
  if (var1 == 2)
  {
    v20 = [(Hc1u6WJuVM53BcQE *)self cLH5z0XbtucU9RrW:a3];
  }
  else
  {
    if (var1 == 1)
    {
      v16 = [kjAS9HuCdR1m5txL alloc];
      v28[0] = self->_Po0NnEfbQHpSgzj7;
      CFStringRef v26 = @"v";
      v17 = +[NSNumber numberWithUnsignedInt:a3->var1];
      v27 = v17;
      v18 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      v28[1] = v18;
      v19 = v28;
    }
    else
    {
      v16 = [kjAS9HuCdR1m5txL alloc];
      v25[0] = self->_Po0NnEfbQHpSgzj7;
      CFStringRef v23 = @"v";
      v17 = +[NSNumber numberWithUnsignedInt:a3->var1];
      v24 = v17;
      v18 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      v25[1] = v18;
      v19 = v25;
    }
    v21 = +[NSArray arrayWithObjects:v19 count:2];
    v20 = [(kjAS9HuCdR1m5txL *)v16 initWithGyF0atX3JpCKc9pK:v21 qfSDGTGvqd3Hruzg:0];
  }

  return v20;
}

- (id)cLH5z0XbtucU9RrW:(_KUwyEjpVZR65eUyl *)a3
{
  uint64_t var0 = a3->var4.var0.var0;
  char v3 = var0;
  __int16 v12 = 0;
  sub_100025CB0(&var0, &v12);
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  if (v3)
  {
    id v5 = +[NSNumber numberWithUnsignedChar:v12];
    [v4 setValue:v5 forKey:@"k_m"];
  }
  if ((v3 & 2) != 0)
  {
    v6 = +[NSNumber numberWithUnsignedChar:HIBYTE(v12)];
    [v4 setValue:v6 forKey:@"a_e"];
  }
  v7 = [kjAS9HuCdR1m5txL alloc];
  v8 = +[NSDictionary dictionaryWithDictionary:v4];
  id v14 = v8;
  objc_super v9 = +[NSArray arrayWithObjects:&v14 count:1];
  v10 = [(kjAS9HuCdR1m5txL *)v7 initWithGyF0atX3JpCKc9pK:v9 qfSDGTGvqd3Hruzg:0];

  return v10;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v6 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:0];
  [v6 encodeInt64:0x3D0D0285C2C47B97 forKey:@"0x5563"];
  unint64_t v7 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:v6];

  return v7;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  return +[NSSet set];
}

- (NSDictionary)Po0NnEfbQHpSgzj7
{
  return self->_Po0NnEfbQHpSgzj7;
}

- (void).cxx_destruct
{
}

@end