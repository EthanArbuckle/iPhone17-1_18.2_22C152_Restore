@interface BADoNotDisturbHelper
+ (void)fetchCurrentState:(id)a3;
@end

@implementation BADoNotDisturbHelper

+ (void)fetchCurrentState:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_4690;
    block[3] = &unk_2F6BE0;
    id v6 = v3;
    dispatch_async(v4, block);
  }
}

@end