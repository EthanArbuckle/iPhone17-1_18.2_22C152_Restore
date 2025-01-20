@interface RCFavoriteActionActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (BOOL)isAlreadyFavorite;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (void)performActivity;
@end

@implementation RCFavoriteActionActivity

- (id)activityType
{
  return @"RCActivityTypeFavorite";
}

- (id)activityTitle
{
  unsigned int v2 = [(RCFavoriteActionActivity *)self isAlreadyFavorite];
  v3 = +[NSBundle mainBundle];
  v4 = v3;
  if (v2) {
    CFStringRef v5 = @"REMOVE_FROM_FAVORITES";
  }
  else {
    CFStringRef v5 = @"ADD_TO_FAVORITES";
  }
  v6 = [v3 localizedStringForKey:v5 value:&stru_100228BC8 table:0];

  return v6;
}

- (id)_systemImageName
{
  v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  v4 = [v3 favoriteActivitySystemImageName:[self isAlreadyFavorite]];

  return v4;
}

+ (int64_t)activityCategory
{
  return 0;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return [a3 count] != 0;
}

- (void)performActivity
{
  v3 = +[UIApplication sharedApplication];
  id v8 = [v3 delegate];

  v4 = [v8 defaultSceneDelegate];
  CFStringRef v5 = [v4 mainViewController];

  uint64_t v6 = [(RCFavoriteActionActivity *)self isAlreadyFavorite] ^ 1;
  v7 = [(RCUIActivity *)self recordingUUIDs];
  [v5 setFavorite:v6 forRecordingsWithUUIDs:v7];

  [(RCFavoriteActionActivity *)self activityDidFinish:1];
}

- (BOOL)isAlreadyFavorite
{
  +[RCRecordingsModelInteractor sharedRecordingsModelInteractor];
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000612B0;
  v5[3] = &unk_100221E10;
  id v8 = &v9;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v3;
  v7 = self;
  [v3 performBlockAndWait:v5];
  LOBYTE(self) = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)self;
}

@end