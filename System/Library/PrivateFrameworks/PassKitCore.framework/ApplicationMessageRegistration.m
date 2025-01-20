@interface ApplicationMessageRegistration
+ (id)databaseTable;
@end

@implementation ApplicationMessageRegistration

+ (id)databaseTable
{
  return @"application_message_registration";
}

@end