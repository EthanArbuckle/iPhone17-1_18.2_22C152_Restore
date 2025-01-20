@interface PGiTJtLgUnKcxckL
- (NSDictionary)dEyUJuqYjUufZYGN;
- (PGiTJtLgUnKcxckL)initWithdEyUJuqYjUufZYGN:(id)a3;
- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8;
- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4;
- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
@end

@implementation PGiTJtLgUnKcxckL

- (PGiTJtLgUnKcxckL)initWithdEyUJuqYjUufZYGN:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGiTJtLgUnKcxckL;
  v6 = [(PGiTJtLgUnKcxckL *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dEyUJuqYjUufZYGN, a3);
  }

  return v7;
}

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  objc_super v9 = [kjAS9HuCdR1m5txL alloc];
  dEyUJuqYjUufZYGN = self->_dEyUJuqYjUufZYGN;
  v10 = +[NSArray arrayWithObjects:&dEyUJuqYjUufZYGN count:1];
  v11 = [(kjAS9HuCdR1m5txL *)v9 initWithGyF0atX3JpCKc9pK:v10 qfSDGTGvqd3Hruzg:0];

  return v11;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v6 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:0];
  [v6 encodeInt64:0x2C9EC9DF6B7ECB1CLL forKey:@"0x5563"];
  unint64_t v7 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:v6];

  return v7;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  return +[NSSet set];
}

- (NSDictionary)dEyUJuqYjUufZYGN
{
  return self->_dEyUJuqYjUufZYGN;
}

- (void).cxx_destruct
{
}

@end