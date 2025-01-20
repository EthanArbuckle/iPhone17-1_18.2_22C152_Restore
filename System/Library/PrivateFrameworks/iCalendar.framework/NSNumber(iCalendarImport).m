@interface NSNumber(iCalendarImport)
+ (id)BOOLFromICSString:()iCalendarImport;
@end

@implementation NSNumber(iCalendarImport)

+ (id)BOOLFromICSString:()iCalendarImport
{
  id v3 = a3;
  uint64_t v4 = [v3 isEqualToString:@"TRUE"];
  if ((v4 & 1) != 0 || [v3 isEqualToString:@"FALSE"])
  {
    v5 = [NSNumber numberWithBool:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end