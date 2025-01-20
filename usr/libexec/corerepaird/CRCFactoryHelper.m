@interface CRCFactoryHelper
+ (id)sharedInstance;
- (CRCFactoryHelper)init;
@end

@implementation CRCFactoryHelper

- (CRCFactoryHelper)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRCFactoryHelper;
  v2 = [(CoreRepairHelper *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CoreRepairHelper *)v2 setFactoryServiceOn:1];
  }
  return v3;
}

+ (id)sharedInstance
{
  if (qword_10006E8C0 != -1) {
    dispatch_once(&qword_10006E8C0, &stru_100058C18);
  }
  v2 = (void *)qword_10006E8B8;

  return v2;
}

@end