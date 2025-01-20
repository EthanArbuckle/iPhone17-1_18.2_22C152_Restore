@interface DMDSecureUnarchiveFromPayloadMetadataDataTransformer
+ (id)allowedTopLevelClasses;
+ (void)initialize;
@end

@implementation DMDSecureUnarchiveFromPayloadMetadataDataTransformer

+ (void)initialize
{
  if (qword_1000FBC68 != -1) {
    dispatch_once(&qword_1000FBC68, &stru_1000CBAC0);
  }
}

+ (id)allowedTopLevelClasses
{
  if (qword_1000FBC78 != -1) {
    dispatch_once(&qword_1000FBC78, &stru_1000CBAE0);
  }
  v2 = (void *)qword_1000FBC70;

  return v2;
}

@end