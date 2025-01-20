@interface ZC5UHnWnOtc38V53
- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8;
- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4;
- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
@end

@implementation ZC5UHnWnOtc38V53

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  v8 = +[LARatchetManager sharedInstance];
  id v9 = [v8 isFeatureEnabled];

  v10 = +[LARatchetManager sharedInstance];
  v11 = [v10 ratchetState];
  id v12 = [v11 rawValue];

  v13 = [kjAS9HuCdR1m5txL alloc];
  v14 = +[NSNumber numberWithBool:v9, @"dto"];
  v20[1] = @"rs";
  v21[0] = v14;
  v15 = +[NSNumber numberWithInteger:v12];
  v21[1] = v15;
  v16 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  v22 = v16;
  v17 = +[NSArray arrayWithObjects:&v22 count:1];
  v18 = [(kjAS9HuCdR1m5txL *)v13 initWithGyF0atX3JpCKc9pK:v17 qfSDGTGvqd3Hruzg:0];

  return v18;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v6 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:0];
  [v6 encodeInt64:0x97EE7E1D1A32667CLL forKey:@"0x5563"];
  unint64_t v7 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:v6];

  return v7;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  return +[NSSet set];
}

@end