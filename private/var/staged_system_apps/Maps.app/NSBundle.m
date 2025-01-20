@interface NSBundle
+ (id)mapsInternalExtrasBundle;
@end

@implementation NSBundle

+ (id)mapsInternalExtrasBundle
{
  if (qword_101610E60 != -1) {
    dispatch_once(&qword_101610E60, &stru_101320B28);
  }
  v2 = (void *)qword_101610E68;

  return v2;
}

@end