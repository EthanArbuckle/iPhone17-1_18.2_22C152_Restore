@interface RouteStepWaypointItemUtil
+ (id)attributedSubtitleForLeg:(id)a3 waypoint:(id)a4 isOrigin:(BOOL)a5 attributes:(id)a6;
@end

@implementation RouteStepWaypointItemUtil

+ (id)attributedSubtitleForLeg:(id)a3 waypoint:(id)a4 isOrigin:(BOOL)a5 attributes:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (a5) {
    [v9 originListSecondaryInstructions];
  }
  else {
  v12 = [v9 destinationListSecondaryInstructions];
  }
  if ([v12 count])
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1007997B8;
    v21[3] = &unk_1012F1DD8;
    id v22 = v9;
    id v23 = v10;
    id v24 = v11;
    v13 = [v12 _geo_compactMap:v21];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100799850;
    v18[3] = &unk_1012F85E8;
    id v19 = [objc_alloc((Class)NSMutableAttributedString) initWithString:&stru_101324E70];
    id v20 = v13;
    id v14 = v13;
    id v15 = v19;
    [v14 enumerateObjectsUsingBlock:v18];
    id v16 = [v15 copy];
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

@end