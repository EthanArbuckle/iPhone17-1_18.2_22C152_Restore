@interface NIEyYkb5fUSqW222
- (BOOL)hasActiveCalls:(id)a3;
- (NIEyYkb5fUSqW222)init;
- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8;
- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4;
- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
@end

@implementation NIEyYkb5fUSqW222

- (NIEyYkb5fUSqW222)init
{
  v10.receiver = self;
  v10.super_class = (Class)NIEyYkb5fUSqW222;
  v2 = [(NIEyYkb5fUSqW222 *)&v10 init];
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.asd.ssdfe.scs", 0);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v3;

  v5 = objc_alloc_init(_TtC3asd32ASScreenContinuityServicesHelper);
  scsHelper = v2->_scsHelper;
  v2->_scsHelper = v5;

  v7 = (TUCallCenter *)[objc_alloc((Class)TUCallCenter) initWithQueue:v2->_queue];
  tuCallCenter = v2->_tuCallCenter;
  v2->_tuCallCenter = v7;

  return v2;
}

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v12 = a6;
  id v13 = a7;
  id v14 = a8;
  v15 = objc_opt_new();
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x3032000000;
  v54 = sub_10002D3D0;
  v55 = sub_10002D3E0;
  id v56 = (id)objc_opt_new();
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = sub_10002D3D0;
  v49 = sub_10002D3E0;
  id v50 = (id)objc_opt_new();
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  v16 = dispatch_group_create();
  dispatch_time_t v17 = dispatch_time(0, 1000000 * a3->var3);
  dispatch_group_enter(v16);
  scsHelper = self->_scsHelper;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10002D3E8;
  v33[3] = &unk_10065F778;
  v35 = &v41;
  v36 = &v51;
  v19 = v16;
  v34 = v19;
  [(ASScreenContinuityServicesHelper *)scsHelper loadScreenMirroringStatusWithCompletionHandler:v33];
  dispatch_group_enter(v19);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002D524;
  block[3] = &unk_10065F7F0;
  block[4] = self;
  v30 = &v37;
  v21 = v19;
  v29 = v21;
  v31 = &v45;
  v32 = &v41;
  dispatch_async(queue, block);
  if (dispatch_group_wait(v21, v17))
  {
    v22 = [[kjAS9HuCdR1m5txL alloc] initWithGyF0atX3JpCKc9pK:&__NSArray0__struct qfSDGTGvqd3Hruzg:176003];
  }
  else
  {
    [v15 addEntriesFromDictionary:v52[5]];
    [v15 addEntriesFromDictionary:v46[5]];
    uint64_t v23 = 176007;
    if (!v38[3]) {
      uint64_t v23 = v42[3];
    }
    if (v42[3]) {
      uint64_t v24 = v23;
    }
    else {
      uint64_t v24 = v38[3];
    }
    v25 = [kjAS9HuCdR1m5txL alloc];
    v57 = v15;
    v26 = +[NSArray arrayWithObjects:&v57 count:1];
    v22 = [(kjAS9HuCdR1m5txL *)v25 initWithGyF0atX3JpCKc9pK:v26 qfSDGTGvqd3Hruzg:v24];
  }
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&v51, 8);

  return v22;
}

- (BOOL)hasActiveCalls:(id)a3
{
  return [a3 countOfCallsPassingTest:&stru_10065F830] != 0;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v6 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:0];
  unint64_t v7 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:v6];

  return v7;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  return +[NSSet set];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inCallService, 0);
  objc_storeStrong((id *)&self->_tuCallCenter, 0);
  objc_storeStrong((id *)&self->_scsHelper, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end