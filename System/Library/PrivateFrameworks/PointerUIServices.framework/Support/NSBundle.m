@interface NSBundle
+ (id)PUID_mainBundle;
@end

@implementation NSBundle

+ (id)PUID_mainBundle
{
  if (qword_100056040 != -1) {
    dispatch_once(&qword_100056040, &stru_100045770);
  }
  v4 = (void *)qword_100056038;
  if (!qword_100056038)
  {
    v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"NSBundle+PUIDAdditions.m" lineNumber:21 description:@"Failed to find pointeruid's bundle."];

    v4 = (void *)qword_100056038;
  }
  return v4;
}

@end