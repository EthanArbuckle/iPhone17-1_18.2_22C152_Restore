@interface BSUITemplate
+ (id)factory;
+ (id)manager;
@end

@implementation BSUITemplate

+ (id)manager
{
  if (qword_3D40B0 != -1) {
    dispatch_once(&qword_3D40B0, &stru_38E758);
  }
  v2 = (void *)qword_3D40A8;

  return v2;
}

+ (id)factory
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_157F0;
  block[3] = &unk_38E198;
  block[4] = a1;
  if (qword_3D40C0 != -1) {
    dispatch_once(&qword_3D40C0, block);
  }
  v2 = (void *)qword_3D40B8;

  return v2;
}

@end