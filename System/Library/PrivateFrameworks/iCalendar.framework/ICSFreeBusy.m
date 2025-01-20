@interface ICSFreeBusy
+ (id)name;
- (NSArray)freebusy;
- (NSString)x_calendarserver_extended_freebusy;
- (NSString)x_calendarserver_mask_uid;
- (void)setFreebusy:(id)a3;
- (void)setX_calendarserver_extended_freebusy:(id)a3;
- (void)setX_calendarserver_mask_uid:(id)a3;
@end

@implementation ICSFreeBusy

+ (id)name
{
  return @"VFREEBUSY";
}

- (NSArray)freebusy
{
  return (NSArray *)[(ICSComponent *)self propertiesForName:@"FREEBUSY"];
}

- (void)setFreebusy:(id)a3
{
}

- (NSString)x_calendarserver_mask_uid
{
  v2 = [(ICSComponent *)self propertiesForName:@"X-CALENDARSERVER-MASK-UID"];
  v3 = [v2 lastObject];
  v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setX_calendarserver_mask_uid:(id)a3
{
}

- (NSString)x_calendarserver_extended_freebusy
{
  v2 = [(ICSComponent *)self propertiesForName:@"X-CALENDARSERVER-EXTENDED-FREEBUSY"];
  v3 = [v2 lastObject];
  v4 = [v3 value];

  return (NSString *)v4;
}

- (void)setX_calendarserver_extended_freebusy:(id)a3
{
}

@end