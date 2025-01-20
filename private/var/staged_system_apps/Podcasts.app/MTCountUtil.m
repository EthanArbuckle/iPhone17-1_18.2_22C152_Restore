@interface MTCountUtil
+ (id)stringForEpisodeCount:(int64_t)a3 titleCase:(BOOL)a4;
+ (id)stringForNewEpisodeCount:(int64_t)a3;
+ (id)stringForNewEpisodeCount:(int64_t)a3 titleCase:(BOOL)a4;
+ (id)stringForPodcastCount:(int64_t)a3;
+ (id)stringForStationCount:(int64_t)a3;
+ (id)stringForUnplayedEpisodeCount:(int64_t)a3;
+ (id)stringForUnplayedEpisodeCount:(int64_t)a3 titleCase:(BOOL)a4;
@end

@implementation MTCountUtil

+ (id)stringForEpisodeCount:(int64_t)a3 titleCase:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 == 1)
  {
    v6 = +[NSBundle mainBundle];
    if (v4) {
      CFStringRef v7 = @"1 Episode";
    }
    else {
      CFStringRef v7 = @"1 episode";
    }
  }
  else
  {
    if (a3)
    {
      v8 = +[NSBundle mainBundle];
      v9 = v8;
      if (v4) {
        CFStringRef v10 = @"%@ Episodes";
      }
      else {
        CFStringRef v10 = @"%@ episodes";
      }
      v6 = [v8 localizedStringForKey:v10 value:&stru_10056A8A0 table:0];

      v11 = +[NSNumber numberWithInteger:a3];
      v12 = IMAccessibilityLocalizedNumber();
      v13 = +[NSString stringWithValidatedFormat:v6, @"%@", 0, v12 validFormatSpecifiers error];

      goto LABEL_14;
    }
    v6 = +[NSBundle mainBundle];
    if (v4) {
      CFStringRef v7 = @"0 Episodes";
    }
    else {
      CFStringRef v7 = @"0 episodes";
    }
  }
  v13 = [v6 localizedStringForKey:v7 value:&stru_10056A8A0 table:0];
LABEL_14:

  return v13;
}

+ (id)stringForNewEpisodeCount:(int64_t)a3
{
  return [a1 stringForNewEpisodeCount:a3 titleCase:0];
}

+ (id)stringForNewEpisodeCount:(int64_t)a3 titleCase:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 == 1)
  {
    v6 = +[NSBundle mainBundle];
    if (v4) {
      CFStringRef v7 = @"1 New Episode";
    }
    else {
      CFStringRef v7 = @"1 new episode";
    }
  }
  else
  {
    if (a3)
    {
      v8 = +[NSBundle mainBundle];
      v9 = v8;
      if (v4) {
        CFStringRef v10 = @"%@ New Episodes";
      }
      else {
        CFStringRef v10 = @"%@ new episodes";
      }
      v6 = [v8 localizedStringForKey:v10 value:&stru_10056A8A0 table:0];

      v11 = +[NSNumber numberWithInteger:a3];
      v12 = IMAccessibilityLocalizedNumber();
      v13 = +[NSString stringWithValidatedFormat:v6, @"%@", 0, v12 validFormatSpecifiers error];

      goto LABEL_14;
    }
    v6 = +[NSBundle mainBundle];
    if (v4) {
      CFStringRef v7 = @"0 New Episodes";
    }
    else {
      CFStringRef v7 = @"0 new episodes";
    }
  }
  v13 = [v6 localizedStringForKey:v7 value:&stru_10056A8A0 table:0];
LABEL_14:

  return v13;
}

+ (id)stringForUnplayedEpisodeCount:(int64_t)a3
{
  return _[a1 stringForUnplayedEpisodeCount:a3 titleCase:0];
}

+ (id)stringForUnplayedEpisodeCount:(int64_t)a3 titleCase:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 == 1)
  {
    v6 = +[NSBundle mainBundle];
    if (v4) {
      CFStringRef v7 = @"1 Unplayed Episode";
    }
    else {
      CFStringRef v7 = @"1 unplayed episode";
    }
  }
  else
  {
    if (a3)
    {
      v8 = +[NSBundle mainBundle];
      v9 = v8;
      if (v4) {
        CFStringRef v10 = @"%@ Unplayed Episodes";
      }
      else {
        CFStringRef v10 = @"%@ unplayed episodes";
      }
      v6 = [v8 localizedStringForKey:v10 value:&stru_10056A8A0 table:0];

      v11 = +[NSNumber numberWithInteger:a3];
      v12 = IMAccessibilityLocalizedNumber();
      v13 = +[NSString stringWithValidatedFormat:v6, @"%@", 0, v12 validFormatSpecifiers error];

      goto LABEL_14;
    }
    v6 = +[NSBundle mainBundle];
    if (v4) {
      CFStringRef v7 = @"0 Unplayed Episodes";
    }
    else {
      CFStringRef v7 = @"0 unplayed episodes";
    }
  }
  v13 = [v6 localizedStringForKey:v7 value:&stru_10056A8A0 table:0];
LABEL_14:

  return v13;
}

+ (id)stringForPodcastCount:(int64_t)a3
{
  if (a3 == 1)
  {
    BOOL v4 = +[NSBundle mainBundle];
    v5 = v4;
    CFStringRef v6 = @"1 podcast";
    goto LABEL_5;
  }
  if (!a3)
  {
    BOOL v4 = +[NSBundle mainBundle];
    v5 = v4;
    CFStringRef v6 = @"0 podcasts";
LABEL_5:
    CFStringRef v7 = [v4 localizedStringForKey:v6 value:&stru_10056A8A0 table:0];
    goto LABEL_7;
  }
  v8 = +[NSBundle mainBundle];
  v5 = [v8 localizedStringForKey:@"%@ podcasts" value:&stru_10056A8A0 table:0];

  v9 = +[NSNumber numberWithInteger:a3];
  CFStringRef v10 = IMAccessibilityLocalizedNumber();
  CFStringRef v7 = +[NSString stringWithValidatedFormat:v5, @"%@", 0, v10 validFormatSpecifiers error];

LABEL_7:

  return v7;
}

+ (id)stringForStationCount:(int64_t)a3
{
  if (a3 == 1)
  {
    BOOL v4 = +[NSBundle mainBundle];
    v5 = v4;
    CFStringRef v6 = @"1 station";
    goto LABEL_5;
  }
  if (!a3)
  {
    BOOL v4 = +[NSBundle mainBundle];
    v5 = v4;
    CFStringRef v6 = @"0 stations";
LABEL_5:
    CFStringRef v7 = [v4 localizedStringForKey:v6 value:&stru_10056A8A0 table:0];
    goto LABEL_7;
  }
  v8 = +[NSBundle mainBundle];
  v5 = [v8 localizedStringForKey:@"%@ stations" value:&stru_10056A8A0 table:0];

  v9 = +[NSNumber numberWithInteger:a3];
  CFStringRef v10 = IMAccessibilityLocalizedNumber();
  CFStringRef v7 = +[NSString stringWithValidatedFormat:v5, @"%@", 0, v10 validFormatSpecifiers error];

LABEL_7:

  return v7;
}

@end