@interface MSDSessionDataPoint
- (id)print;
@end

@implementation MSDSessionDataPoint

- (id)print
{
  v2 = NSStringFromSelector(a2);
  uint64_t v3 = +[NSString stringWithFormat:@"Override %@ in a subclass", v2];

  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];
  objc_exception_throw(v4);
}

@end