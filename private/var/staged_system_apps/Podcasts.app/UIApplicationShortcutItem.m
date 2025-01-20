@interface UIApplicationShortcutItem
+ (id)mt_shortcutItemForStation:(id)a3;
@end

@implementation UIApplicationShortcutItem

+ (id)mt_shortcutItemForStation:(id)a3
{
  id v3 = a3;
  v4 = [v3 nextEpisode];
  v5 = [v3 uuid];
  if ([v5 length])
  {
    v6 = [v4 uuid];
    id v7 = [v6 length];

    if (v7)
    {
      v19[0] = @"stationUuid";
      v8 = [v3 uuid];
      v19[1] = @"episodeUuid";
      v20[0] = v8;
      v9 = [v4 uuid];
      v20[1] = v9;
      v10 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];

      v11 = +[NSBundle mainBundle];
      v12 = [v11 localizedStringForKey:@"PLAY_STATION_TITLE" value:&stru_10056A8A0 table:0];
      v13 = [v3 title];
      v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v13);

      v15 = +[UIApplicationShortcutIcon iconWithSystemImageName:@"dot.radiowaves.left.and.right"];
      id v16 = objc_alloc((Class)UIApplicationShortcutItem);
      v17 = [v4 bestTitle];
      id v7 = [v16 initWithType:@"kMTShortcutItemTypeStation" localizedTitle:v14 localizedSubtitle:v17 icon:v15 userInfo:v10];
    }
  }
  else
  {

    id v7 = 0;
  }

  return v7;
}

@end