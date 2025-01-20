@interface DirectionAction
- (BOOL)isCompatibleWithNavigation;
- (BOOL)isCompatibleWithRestorationTask;
- (DirectionAction)initWithDirectionItem:(id)a3 timePoint:(id)a4 source:(unint64_t)a5 navigationAutoLaunchDelay:(id)a6;
- (DirectionItem)directionItem;
- (GEOURLTimePoint)timePoint;
- (NSDictionary)userInfo;
- (NSNumber)navigationAutoLaunchDelay;
- (int)analyticsLaunchActionType;
- (unint64_t)source;
- (void)setDirectionItem:(id)a3;
- (void)setNavigationAutoLaunchDelay:(id)a3;
- (void)setSource:(unint64_t)a3;
- (void)setTimePoint:(id)a3;
@end

@implementation DirectionAction

- (DirectionAction)initWithDirectionItem:(id)a3 timePoint:(id)a4 source:(unint64_t)a5 navigationAutoLaunchDelay:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)DirectionAction;
  v14 = [(DirectionAction *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_directionItem, a3);
    objc_storeStrong((id *)&v15->_timePoint, a4);
    v15->_source = a5;
    objc_storeStrong((id *)&v15->_navigationAutoLaunchDelay, a6);
  }

  return v15;
}

- (NSDictionary)userInfo
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = v3;
  timePoint = self->_timePoint;
  if (timePoint) {
    [v3 setObject:timePoint forKeyedSubscript:@"GEOURLTimePoint"];
  }
  if (self->_source == 1)
  {
    [v4 setObject:&off_1013AAA98 forKeyedSubscript:@"RAPAuxiliaryControlsOrigin"];
  }
  else
  {
    v6 = +[NSNumber numberWithInteger:0];
    [v4 setObject:v6 forKeyedSubscript:@"RAPAuxiliaryControlsOrigin"];
  }
  unint64_t source = self->_source;
  if (source <= 2) {
    [v4 setObject:(&off_10131B488)[source] forKeyedSubscript:@"DirectionsSourceKey"];
  }
  navigationAutoLaunchDelay = self->_navigationAutoLaunchDelay;
  if (navigationAutoLaunchDelay) {
    [v4 setObject:navigationAutoLaunchDelay forKeyedSubscript:@"DirectionsNavigationAutoLaunchDelayKey"];
  }
  id v9 = [v4 copy];

  return (NSDictionary *)v9;
}

- (BOOL)isCompatibleWithNavigation
{
  v2 = [(DirectionItem *)self->_directionItem endMapItem];
  id v3 = [v2 _detourInfo];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isCompatibleWithRestorationTask
{
  return 0;
}

- (int)analyticsLaunchActionType
{
  return 6;
}

- (DirectionItem)directionItem
{
  return self->_directionItem;
}

- (void)setDirectionItem:(id)a3
{
}

- (GEOURLTimePoint)timePoint
{
  return self->_timePoint;
}

- (void)setTimePoint:(id)a3
{
}

- (NSNumber)navigationAutoLaunchDelay
{
  return self->_navigationAutoLaunchDelay;
}

- (void)setNavigationAutoLaunchDelay:(id)a3
{
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_unint64_t source = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationAutoLaunchDelay, 0);
  objc_storeStrong((id *)&self->_timePoint, 0);

  objc_storeStrong((id *)&self->_directionItem, 0);
}

@end