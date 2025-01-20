@interface SSRRPILoggingUtils
+ (id)convertToSchemaTypeWithLocale:(id)a3;
+ (int)convertToSchemaEnumWithEnrollmentTriggerPhrase:(unint64_t)a3;
@end

@implementation SSRRPILoggingUtils

+ (int)convertToSchemaEnumWithEnrollmentTriggerPhrase:(unint64_t)a3
{
  if (a3 == 1) {
    return 1;
  }
  else {
    return 2 * (a3 == 2);
  }
}

+ (id)convertToSchemaTypeWithLocale:(id)a3
{
  return +[SSRUtils convertSchemaTypeWithLocale:a3];
}

@end