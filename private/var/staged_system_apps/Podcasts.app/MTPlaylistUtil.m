@interface MTPlaylistUtil
+ (id)stringForEmptyMessage:(id)a3;
+ (id)stringForUnplayedCount:(int64_t)a3;
+ (id)textForUnplayed:(id)a3;
+ (id)textForUnplayedShort:(id)a3;
@end

@implementation MTPlaylistUtil

+ (id)stringForUnplayedCount:(int64_t)a3
{
  if (a3 == 1)
  {
    v4 = +[NSBundle mainBundle];
    v5 = v4;
    CFStringRef v6 = @"1 Unplayed";
    goto LABEL_5;
  }
  if (!a3)
  {
    v4 = +[NSBundle mainBundle];
    v5 = v4;
    CFStringRef v6 = @"0 Unplayed";
LABEL_5:
    v7 = [v4 localizedStringForKey:v6 value:&stru_10056A8A0 table:0];
    goto LABEL_7;
  }
  v8 = +[NSBundle mainBundle];
  v5 = [v8 localizedStringForKey:@"%@ Unplayed" value:&stru_10056A8A0 table:0];

  v9 = +[NSNumber numberWithInteger:a3];
  v10 = IMAccessibilityLocalizedNumber();
  v7 = +[NSString stringWithValidatedFormat:v5, @"%@", 0, v10 validFormatSpecifiers error];

LABEL_7:

  return v7;
}

+ (id)stringForEmptyMessage:(id)a3
{
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"EMPTY_STATION_IOS" value:&stru_10056A8A0 table:0];

  return v4;
}

+ (id)textForUnplayed:(id)a3
{
  id v4 = a3;
  v5 = [v4 episodes];
  uint64_t v6 = (uint64_t)[v5 count];

  if (v6 < 1)
  {
    v9 = +[NSBundle mainBundle];
    v8 = [v9 localizedStringForKey:@"STATIONS_LABEL_EMPTY" value:&stru_10056A8A0 table:0];
  }
  else
  {
    [v4 totalDuration];
    if (v7 == 0.0)
    {
      v8 = [a1 textForUnplayedShort:v4];
      goto LABEL_10;
    }
    double v10 = v7;
    v11 = +[NSBundle mainBundle];
    v12 = v11;
    if (v6 == 1) {
      CFStringRef v13 = @"STATIONS_COUNT_EPISODES_SINGULAR_FORMAT";
    }
    else {
      CFStringRef v13 = @"STATIONS_COUNT_EPISODES_FORMAT";
    }
    v9 = [v11 localizedStringForKey:v13 value:&stru_10056A8A0 table:0];

    v14 = +[NSString prettyStringWithDuration:v10];
    v15 = +[NSNumber numberWithInteger:v6];
    v16 = IMAccessibilityLocalizedNumber();

    v8 = +[NSString stringWithValidatedFormat:v9, @"%@ %@", 0, v16, v14 validFormatSpecifiers error];
  }
LABEL_10:

  return v8;
}

+ (id)textForUnplayedShort:(id)a3
{
  v3 = [a3 episodes];
  uint64_t v4 = (uint64_t)[v3 count];

  if (v4 < 1)
  {
    v5 = +[NSBundle mainBundle];
    uint64_t v6 = v5;
    CFStringRef v7 = @"STATIONS_LABEL_EMPTY";
    goto LABEL_5;
  }
  v5 = +[NSBundle mainBundle];
  uint64_t v6 = v5;
  if (v4 == 1)
  {
    CFStringRef v7 = @"1 Episode";
LABEL_5:
    v8 = [v5 localizedStringForKey:v7 value:&stru_10056A8A0 table:0];
    goto LABEL_7;
  }
  uint64_t v9 = [v5 localizedStringForKey:@"%@ Episodes" value:&stru_10056A8A0 table:0];

  double v10 = +[NSNumber numberWithInteger:v4];
  v11 = IMAccessibilityLocalizedNumber();

  v8 = +[NSString stringWithValidatedFormat:v9, @"%@", 0, v11 validFormatSpecifiers error];

  uint64_t v6 = (void *)v9;
LABEL_7:

  return v8;
}

@end