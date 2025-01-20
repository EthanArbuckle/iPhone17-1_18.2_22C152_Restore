@interface NeKgVVgVwvD6Xs2O
- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8;
- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4;
- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
@end

@implementation NeKgVVgVwvD6Xs2O

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v10 = a6;
  id v11 = a7;
  id v12 = a8;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_10001F658;
  v32 = sub_10001F668;
  id v33 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  v13 = dispatch_group_create();
  dispatch_group_enter(v13);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10001F670;
  v20[3] = &unk_10065F258;
  v22 = &v24;
  v14 = v13;
  v21 = v14;
  v23 = &v28;
  +[NEVPNManager loadAllFromPreferencesWithCompletionHandler:v20];
  dispatch_group_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  if (v25[3])
  {
    v15 = [kjAS9HuCdR1m5txL alloc];
    v16 = [(kjAS9HuCdR1m5txL *)v15 initWithGyF0atX3JpCKc9pK:&__NSArray0__struct qfSDGTGvqd3Hruzg:v25[3]];
  }
  else
  {
    v17 = [kjAS9HuCdR1m5txL alloc];
    v16 = [(kjAS9HuCdR1m5txL *)v17 initWithGyF0atX3JpCKc9pK:v29[5] qfSDGTGvqd3Hruzg:0];
  }
  v18 = v16;

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v18;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v6 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:0];
  [v6 encodeInt64:0xF61BD3125A00C9C2 forKey:@"0x5563"];
  unint64_t v7 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:v6];

  return v7;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  return +[NSSet set];
}

@end