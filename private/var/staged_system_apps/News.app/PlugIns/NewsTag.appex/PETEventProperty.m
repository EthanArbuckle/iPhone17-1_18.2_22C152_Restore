@interface PETEventProperty
+ (id)ft_BOOLeanPropertyWithName:(id)a3;
+ (id)ft_appearanceTypeProperty;
+ (id)ft_headlineSourceProperty;
+ (id)ft_localTimeHourProperty;
+ (id)ft_sectionProperty;
+ (id)ft_timeZoneProperty;
+ (id)ft_userGroupProperty;
+ (id)ft_widgetDisplayModeProperty;
@end

@implementation PETEventProperty

+ (id)ft_appearanceTypeProperty
{
  v5[0] = &off_1001002A8;
  v5[1] = &off_1001002C0;
  v6[0] = @"stories";
  v6[1] = @"nostories";
  v5[2] = &off_1001002D8;
  v5[3] = &off_1001002F0;
  v6[2] = @"error";
  v6[3] = @"offline";
  v5[4] = &off_100100308;
  v6[4] = @"placeholder";
  v2 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:5];
  v3 = +[PETEventProperty propertyWithName:@"type" enumMapping:v2];

  return v3;
}

+ (id)ft_headlineSourceProperty
{
  return +[PETEventProperty freeValuedPropertyWithName:@"widgetMode"];
}

+ (id)ft_sectionProperty
{
  return +[PETEventProperty freeValuedPropertyWithName:@"section"];
}

+ (id)ft_widgetDisplayModeProperty
{
  v5[0] = &off_1001002C0;
  v5[1] = &off_1001002D8;
  v6[0] = @"compact";
  v6[1] = @"expanded";
  v2 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  v3 = +[PETEventProperty propertyWithName:@"displayMode" enumMapping:v2 autoSanitizeValues:0];

  return v3;
}

+ (id)ft_userGroupProperty
{
  return +[PETEventProperty freeValuedPropertyWithName:@"userGroup"];
}

+ (id)ft_localTimeHourProperty
{
  return +[PETEventProperty propertyWithName:@"localHour", 0, 24 range];
}

+ (id)ft_timeZoneProperty
{
  return +[PETEventProperty freeValuedPropertyWithName:@"tz"];
}

+ (id)ft_BOOLeanPropertyWithName:(id)a3
{
  id v3 = a3;
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000C8D5C();
  }
  v7[0] = @"yes";
  v7[1] = @"no";
  v4 = +[NSArray arrayWithObjects:v7 count:2];
  v5 = +[PETEventProperty propertyWithName:v3 possibleValues:v4];

  return v5;
}

@end