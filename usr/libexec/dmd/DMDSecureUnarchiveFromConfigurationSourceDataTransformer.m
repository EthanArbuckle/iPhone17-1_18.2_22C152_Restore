@interface DMDSecureUnarchiveFromConfigurationSourceDataTransformer
+ (id)allowedTopLevelClasses;
+ (void)initialize;
@end

@implementation DMDSecureUnarchiveFromConfigurationSourceDataTransformer

+ (void)initialize
{
  if (qword_1000FBA90 != -1) {
    dispatch_once(&qword_1000FBA90, &stru_1000CAAD8);
  }
}

+ (id)allowedTopLevelClasses
{
  if (qword_1000FBAA0 != -1) {
    dispatch_once(&qword_1000FBAA0, &stru_1000CAAF8);
  }
  v2 = (void *)qword_1000FBA98;

  return v2;
}

@end