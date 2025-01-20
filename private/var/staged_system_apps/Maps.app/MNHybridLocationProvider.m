@interface MNHybridLocationProvider
+ (id)navdInstance;
@end

@implementation MNHybridLocationProvider

+ (id)navdInstance
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1008CC98C;
  v7[3] = &unk_1012E63F0;
  v7[4] = a1;
  v2 = objc_retainBlock(v7);
  if (+[NSThread isMainThread])
  {
    if (qword_10160FE78 != -1) {
      dispatch_once(&qword_10160FE78, v2);
    }
  }
  else
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1008CCAF4;
    v5[3] = &unk_1012E6EA8;
    v6 = v2;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v5);
  }
  id v3 = (id)qword_10160FE70;

  return v3;
}

@end