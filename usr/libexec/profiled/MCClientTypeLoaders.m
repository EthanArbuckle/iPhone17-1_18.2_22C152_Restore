@interface MCClientTypeLoaders
+ (id)clientTypeLoaders;
@end

@implementation MCClientTypeLoaders

+ (id)clientTypeLoaders
{
  if (qword_1001059E8 != -1) {
    dispatch_once(&qword_1001059E8, &stru_1000EC028);
  }
  id v2 = [(id)qword_1001059E0 copy];

  return v2;
}

@end