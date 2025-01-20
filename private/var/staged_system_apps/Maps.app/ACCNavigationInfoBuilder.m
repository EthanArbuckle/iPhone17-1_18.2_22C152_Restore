@interface ACCNavigationInfoBuilder
+ (id)accNavigationLaneGuidanceInfoFrom:(id)a3;
+ (id)accNavigationLaneGuidanceLaneInfoFrom:(id)a3;
+ (id)accNavigationManeuverUpdateInfoFrom:(id)a3;
+ (id)accNavigationRouteGuidanceUpdateInfoFrom:(id)a3;
@end

@implementation ACCNavigationInfoBuilder

+ (id)accNavigationLaneGuidanceInfoFrom:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [v4 accNavFormat];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1009FC2F8;
  v12[3] = &unk_101313E40;
  id v13 = v4;
  id v15 = a1;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v12];

  v9 = v14;
  id v10 = v7;

  return v10;
}

+ (id)accNavigationLaneGuidanceLaneInfoFrom:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  v5 = [v3 accNavFormat];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1009FC54C;
  v8[3] = &unk_1012F3C58;
  id v6 = v4;
  id v9 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

+ (id)accNavigationManeuverUpdateInfoFrom:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  v5 = [v3 accNavFormat];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1009FC688;
  v8[3] = &unk_1012F3C58;
  id v6 = v4;
  id v9 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

+ (id)accNavigationRouteGuidanceUpdateInfoFrom:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  v5 = [v3 accNavFormat];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1009FC7C4;
  v8[3] = &unk_1012F3C58;
  id v6 = v4;
  id v9 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

@end