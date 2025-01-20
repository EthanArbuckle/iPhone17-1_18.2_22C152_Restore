@interface VKTrafficIncidentFeature
- (BOOL)isRestrictionIncident;
- (NSString)restrictionCombinedDetails;
- (NSString)restrictionEffectiveTimeRange;
- (NSString)restrictionTitle;
@end

@implementation VKTrafficIncidentFeature

- (BOOL)isRestrictionIncident
{
  return [(VKTrafficIncidentFeature *)self type] == (id)10
      || [(VKTrafficIncidentFeature *)self type] == (id)11;
}

- (NSString)restrictionTitle
{
  v2 = [(VKTrafficIncidentFeature *)self formattedTitle];
  v3 = +[NSString _navigation_stringForServerFormattedString:v2];

  return (NSString *)v3;
}

- (NSString)restrictionCombinedDetails
{
  if ([(VKTrafficIncidentFeature *)self isRestrictionIncident])
  {
    id v3 = objc_alloc_init((Class)NSMutableArray);
    v4 = [(VKTrafficIncidentFeature *)self restrictionDetails];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100B26CE8;
    v8[3] = &unk_1013184F8;
    id v9 = v3;
    id v5 = v3;
    [v4 enumerateObjectsUsingBlock:v8];

    v6 = [v5 componentsJoinedByString:@"\n"];
  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

- (NSString)restrictionEffectiveTimeRange
{
  v2 = [(VKTrafficIncidentFeature *)self effectiveTimeRange];
  id v3 = +[NSString _navigation_stringForServerFormattedString:v2];

  return (NSString *)v3;
}

@end