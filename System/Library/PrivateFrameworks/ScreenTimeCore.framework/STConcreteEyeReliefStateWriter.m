@interface STConcreteEyeReliefStateWriter
- (STConcreteEyeReliefStateWriter)init;
- (id)writeEyeReliefState:(BOOL)a3;
@end

@implementation STConcreteEyeReliefStateWriter

- (STConcreteEyeReliefStateWriter)init
{
  v3.receiver = self;
  v3.super_class = (Class)STConcreteEyeReliefStateWriter;
  return [(STConcreteEyeReliefStateWriter *)&v3 init];
}

- (id)writeEyeReliefState:(BOOL)a3
{
  v4 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009BE04;
  block[3] = &unk_1002FEA20;
  BOOL v8 = a3;
  dispatch_async(v4, block);

  v5 = +[STResult success];
  return v5;
}

@end