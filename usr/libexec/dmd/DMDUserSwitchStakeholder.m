@interface DMDUserSwitchStakeholder
+ (id)sharedStakeholder;
- (BOOL)inEDUMode;
@end

@implementation DMDUserSwitchStakeholder

+ (id)sharedStakeholder
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100069AD0;
  block[3] = &unk_1000C9F80;
  block[4] = a1;
  if (qword_1000FBC98 != -1) {
    dispatch_once(&qword_1000FBC98, block);
  }
  v2 = (void *)qword_1000FBC90;

  return v2;
}

- (BOOL)inEDUMode
{
  if (qword_1000FBCA8 != -1) {
    dispatch_once(&qword_1000FBCA8, &stru_1000CBCB0);
  }
  return byte_1000FBCA0;
}

@end