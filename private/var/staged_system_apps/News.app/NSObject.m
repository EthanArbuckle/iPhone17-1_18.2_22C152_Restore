@interface NSObject
+ (id)headlineNotificationFromDictionary:(id)a3;
+ (id)headlineNotificationFromHeadline:(id)a3;
@end

@implementation NSObject

+ (id)headlineNotificationFromHeadline:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = [[FRHeadlineNotificationWrapper alloc] initWithHeadline:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)headlineNotificationFromDictionary:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = [[FRHeadlineNotificationWrapper alloc] initWithDictionary:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end