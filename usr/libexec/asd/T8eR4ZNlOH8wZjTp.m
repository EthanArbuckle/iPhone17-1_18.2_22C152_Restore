@interface T8eR4ZNlOH8wZjTp
- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8;
- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4;
- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
@end

@implementation T8eR4ZNlOH8wZjTp

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  v9 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", a3, (double)a4->var2 * 0.001);
  v10 = +[NSDate dateWithTimeIntervalSince1970:(double)a4->var3 * 0.001];
  v11 = [kjAS9HuCdR1m5txL alloc];
  v16[0] = @"s";
  v16[1] = @"pp";
  v17[0] = v9;
  v17[1] = v10;
  v12 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  v18 = v12;
  v13 = +[NSArray arrayWithObjects:&v18 count:1];
  v14 = [(kjAS9HuCdR1m5txL *)v11 initWithGyF0atX3JpCKc9pK:v13 qfSDGTGvqd3Hruzg:0];

  return v14;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v6 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:0];
  [v6 encodeInt64:0xE4D9562B46050BFFLL forKey:@"0x5563"];
  unint64_t v7 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:v6];

  return v7;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  return +[NSSet set];
}

@end