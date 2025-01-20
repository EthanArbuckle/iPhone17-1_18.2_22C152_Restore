@interface MTPodcastPlaylistSettings
+ (id)_longStringForEpisodes:(int64_t)a3 defaultValue:(int64_t)a4;
+ (id)_shortStringForEpisodes:(int64_t)a3 defaultValue:(int64_t)a4;
+ (id)episodesOptionArray:(BOOL)a3 defaultValue:(int64_t)a4;
+ (id)episodesOptionValues;
+ (id)insertNewSettingsInManagedObjectContext:(id)a3;
+ (id)mediaOptionArray:(BOOL)a3;
+ (id)mediaOptionValues;
+ (id)predicateForPlaylistSettingsUuid:(id)a3;
+ (id)stringForEpisodes:(int64_t)a3 short:(BOOL)a4 defaultValue:(int64_t)a5;
+ (id)stringForMedia:(int)a3 short:(BOOL)a4;
- (BOOL)needsUpdate;
- (BOOL)tracksDefault;
- (double)latestEpisodeDate;
- (double)oldestEpisodeDate;
- (id)metricsAdditionalData;
- (id)metricsContentIdentifier;
- (id)metricsKeys;
- (id)predicateForSettings;
- (int64_t)integerForEpisodesToShow;
- (void)setNeedsUpdate:(BOOL)a3;
- (void)setTracksDefault:(BOOL)a3;
- (void)takeValuesFromDefaultSettings:(id)a3;
@end

@implementation MTPodcastPlaylistSettings

- (void)setNeedsUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(MTPodcastPlaylistSettings *)self playlist];
  unsigned int v6 = [v5 needsUpdate];

  unint64_t v7 = (unint64_t)[(MTPodcastPlaylistSettings *)self flags];
  if (((((v7 & 2) == 0) ^ v3) & 1) == 0)
  {
    uint64_t v8 = v3 | v6;
    uint64_t v9 = 2;
    if (!v3) {
      uint64_t v9 = 0;
    }
    [(MTPodcastPlaylistSettings *)self setFlags:v7 & 0xFFFFFFFFFFFFFFFDLL | v9];
    v10 = [(MTPodcastPlaylistSettings *)self playlist];
    [v10 setNeedsUpdate:v8];

    v11 = [(MTPodcastPlaylistSettings *)self playlistIfDefault];
    LODWORD(v10) = [v11 needsUpdate];

    id v12 = [(MTPodcastPlaylistSettings *)self playlistIfDefault];
    [v12 setNeedsUpdate:v3 | v10];
  }
}

- (BOOL)needsUpdate
{
  return ((unint64_t)[(MTPodcastPlaylistSettings *)self flags] >> 1) & 1;
}

- (id)predicateForSettings
{
  BOOL v3 = [(MTPodcastPlaylistSettings *)self podcast];
  v4 = [v3 uuid];
  v5 = +[MTEpisode predicateForAllEpisodesOnPodcastUuid:v4];

  unsigned int v6 = +[MTEpisode predicateForExternalType:0];
  unint64_t v7 = [v5 AND:v6];

  if (([(MTPodcastPlaylistSettings *)self showPlayedEpisodes] & 1) == 0)
  {
    uint64_t v8 = +[MTEpisode predicateForVisuallyPlayed:0];
    uint64_t v9 = [v7 AND:v8];

    unint64_t v7 = (void *)v9;
  }
  if ((+[PFRestrictionsController isExplicitContentAllowed] & 1) == 0)
  {
    v10 = [(MTPodcastPlaylistSettings *)self podcast];
    unsigned int v11 = [v10 isExplicit];

    if (v11)
    {
      uint64_t v12 = +[NSPredicate falsePredicate];
    }
    else
    {
      uint64_t v13 = +[MTEpisode predicateForExplicit:0];
      uint64_t v12 = [v7 AND:v13];

      unint64_t v7 = (void *)v13;
    }

    unint64_t v7 = (void *)v12;
  }
  if ([(MTPodcastPlaylistSettings *)self mediaType])
  {
    id v14 = [(MTPodcastPlaylistSettings *)self mediaType];
    v15 = (id *)&kEpisodeAudio;
    if (v14 != (id)1) {
      v15 = (id *)&kEpisodeVideo;
    }
    id v16 = *v15;
    v17 = +[NSPredicate predicateWithFormat:@"%K = 1", v16];
    v34[0] = v17;
    v34[1] = v7;
    v18 = +[NSArray arrayWithObjects:v34 count:2];
    uint64_t v19 = +[NSCompoundPredicate andPredicateWithSubpredicates:v18];

    unint64_t v7 = (void *)v19;
  }
  v20 = +[MTEpisode predicateForStationEligibleEpisodes];
  v21 = [v7 AND:v20];

  unsigned int v22 = [(MTPodcastPlaylistSettings *)self downloaded];
  if (v22 == 1)
  {
    v23 = +[NSPredicate predicateWithFormat:@"%K != nil", kEpisodeAssetURL, v21];
    v32[1] = v23;
    v24 = v32;
  }
  else
  {
    if (v22 != 2) {
      goto LABEL_17;
    }
    v33[0] = v21;
    v23 = +[NSPredicate predicateWithFormat:@"%K = nil", kEpisodeAssetURL];
    v33[1] = v23;
    v24 = v33;
  }
  v25 = +[NSArray arrayWithObjects:v24 count:2];
  uint64_t v26 = +[NSCompoundPredicate andPredicateWithSubpredicates:v25];

  v21 = (void *)v26;
LABEL_17:
  v27 = [(MTPodcastPlaylistSettings *)self podcast];
  v28 = [v27 uuid];
  v29 = +[MTEpisode predicateForAllEpisodesOnPodcastUuid:v28];
  v30 = [v21 AND:v29];

  return v30;
}

- (double)oldestEpisodeDate
{
  BOOL v3 = [(MTPodcastPlaylistSettings *)self podcast];
  unsigned int v4 = [v3 playbackNewestToOldest];

  v5 = [(MTPodcastPlaylistSettings *)self episodes];
  unsigned int v6 = v5;
  if (v4) {
    [v5 lastObject];
  }
  else {
  unint64_t v7 = [v5 firstObject];
  }

  [v7 firstTimeAvailable];
  double v9 = v8;

  return v9;
}

- (double)latestEpisodeDate
{
  BOOL v3 = [(MTPodcastPlaylistSettings *)self podcast];
  unsigned int v4 = [v3 playbackNewestToOldest];

  v5 = [(MTPodcastPlaylistSettings *)self episodes];
  unsigned int v6 = v5;
  if (v4) {
    [v5 firstObject];
  }
  else {
  unint64_t v7 = [v5 lastObject];
  }

  [v7 firstTimeAvailable];
  double v9 = v8;

  return v9;
}

- (int64_t)integerForEpisodesToShow
{
  int64_t result = (int64_t)[(MTPodcastPlaylistSettings *)self episodesToShow];
  switch(result)
  {
    case 1:
    case 2:
    case 3:
      return result;
    case 4:
      int64_t result = 5;
      break;
    case 5:
      int64_t result = 10;
      break;
    case 6:
      unsigned int v4 = [(MTPodcastPlaylistSettings *)self playlist];
      v5 = [v4 defaultSettings];
      id v6 = [v5 integerForEpisodesToShow];

      int64_t result = (int64_t)v6;
      break;
    default:
      int64_t result = 0;
      break;
  }
  return result;
}

+ (id)predicateForPlaylistSettingsUuid:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"%K = %@", kPlaylistSettingUuid, a3];
}

+ (id)_shortStringForEpisodes:(int64_t)a3 defaultValue:(int64_t)a4
{
  switch(a3)
  {
    case 0:
      unsigned int v4 = +[NSBundle mainBundle];
      v5 = v4;
      CFStringRef v6 = @"EPISODE_ALL";
      goto LABEL_4;
    case 1:
      unsigned int v4 = +[NSBundle mainBundle];
      v5 = v4;
      CFStringRef v6 = @"MOST_RECENT_SINGULAR";
LABEL_4:
      unint64_t v7 = [v4 localizedStringForKey:v6 value:&stru_10056A8A0 table:0];

      break;
    case 6:
      unint64_t v7 = [a1 stringForEpisodes:a4 short:1 defaultValue:0];
      break;
    default:
      double v8 = +[NSBundle mainBundle];
      double v9 = [v8 localizedStringForKey:@"Recent %@" value:&stru_10056A8A0 table:0];

      v10 = IMAccessibilityLocalizedNumber();
      unint64_t v7 = +[NSString stringWithValidatedFormat:v9, @"%@", 0, v10 validFormatSpecifiers error];

      break;
  }

  return v7;
}

+ (id)_longStringForEpisodes:(int64_t)a3 defaultValue:(int64_t)a4
{
  int64_t v4 = a3;
  switch(a3)
  {
    case 0:
      v5 = +[NSBundle mainBundle];
      CFStringRef v6 = v5;
      CFStringRef v7 = @"All Episodes";
      goto LABEL_5;
    case 1:
      v5 = +[NSBundle mainBundle];
      CFStringRef v6 = v5;
      CFStringRef v7 = @"Most recent episode";
LABEL_5:
      uint64_t v8 = [v5 localizedStringForKey:v7 value:&stru_10056A8A0 table:0];
      goto LABEL_9;
    case 2:
    case 3:
      goto LABEL_8;
    case 4:
      int64_t v4 = 5;
      goto LABEL_8;
    case 5:
      int64_t v4 = 10;
      goto LABEL_8;
    case 6:
      id v14 = +[NSBundle mainBundle];
      CFStringRef v6 = [v14 localizedStringForKey:@"Default (%@)" value:&stru_10056A8A0 table:0];

      v15 = [a1 stringForEpisodes:a4 short:1 defaultValue:0];
      v10 = +[NSString stringWithValidatedFormat:v6, @"%@", 0, v15 validFormatSpecifiers error];

      goto LABEL_10;
    default:
      int64_t v4 = 0;
LABEL_8:
      double v9 = +[NSBundle mainBundle];
      CFStringRef v6 = [v9 localizedStringForKey:@"MOST_RECENT_EPISODES" value:&stru_10056A8A0 table:0];

      uint64_t v8 = +[NSString localizedStringWithValidatedFormat:v6, @"%lu", 0, v4 validFormatSpecifiers error];
LABEL_9:
      v10 = (void *)v8;
LABEL_10:

      return v10;
  }
}

+ (id)stringForEpisodes:(int64_t)a3 short:(BOOL)a4 defaultValue:(int64_t)a5
{
  if (a4) {
    [a1 _shortStringForEpisodes:a3 defaultValue:a5];
  }
  else {
  v5 = [a1 _longStringForEpisodes:a3 defaultValue:a5];
  }

  return v5;
}

+ (id)stringForMedia:(int)a3 short:(BOOL)a4
{
  if (a3 == 2)
  {
    v5 = +[NSBundle mainBundle];
    CFStringRef v6 = v5;
    CFStringRef v7 = @"Video";
  }
  else if (a3 == 1)
  {
    v5 = +[NSBundle mainBundle];
    CFStringRef v6 = v5;
    CFStringRef v7 = @"Audio";
  }
  else
  {
    if (a3) {
      goto LABEL_8;
    }
    v5 = +[NSBundle mainBundle];
    CFStringRef v6 = v5;
    CFStringRef v7 = @"MEDIA_ALL";
  }
  int64_t v4 = [v5 localizedStringForKey:v7 value:&stru_10056A8A0 table:0];

LABEL_8:

  return v4;
}

+ (id)episodesOptionArray:(BOOL)a3 defaultValue:(int64_t)a4
{
  BOOL v5 = a3;
  CFStringRef v7 = [a1 stringForEpisodes:6 short:a3 defaultValue:a4];
  uint64_t v8 = [a1 stringForEpisodes:1 short:v5 defaultValue:a4];
  v16[1] = v8;
  double v9 = [a1 stringForEpisodes:2 short:v5 defaultValue:a4];
  v16[2] = v9;
  v10 = [a1 stringForEpisodes:3 short:v5 defaultValue:a4];
  v16[3] = v10;
  unsigned int v11 = [a1 stringForEpisodes:4 short:v5 defaultValue:a4];
  v16[4] = v11;
  uint64_t v12 = [a1 stringForEpisodes:5 short:v5 defaultValue:a4];
  v16[5] = v12;
  uint64_t v13 = [a1 stringForEpisodes:0 short:v5 defaultValue:a4];
  v16[6] = v13;
  id v14 = +[NSArray arrayWithObjects:v16 count:7];

  return v14;
}

+ (id)episodesOptionValues
{
  return +[NSOrderedSet orderedSetWithArray:&off_10057AE58];
}

+ (id)mediaOptionArray:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [a1 stringForMedia:0 short:a3];
  CFStringRef v6 = [a1 stringForMedia:1 short:v3, v5];
  v10[1] = v6;
  CFStringRef v7 = [a1 stringForMedia:2 short:v3];
  v10[2] = v7;
  uint64_t v8 = +[NSArray arrayWithObjects:v10 count:3];

  return v8;
}

+ (id)mediaOptionValues
{
  return +[NSOrderedSet orderedSetWithArray:&off_10057AE70];
}

+ (id)insertNewSettingsInManagedObjectContext:(id)a3
{
  BOOL v3 = +[NSEntityDescription insertNewObjectForEntityForName:kMTPodcastPlaylistSettingsEntityName inManagedObjectContext:a3];
  int64_t v4 = +[NSString UUID];
  [v3 setUuid:v4];

  [v3 setEpisodesToShow:1];
  [v3 setMediaType:0];
  [v3 setShowPlayedEpisodes:0];
  [v3 setTracksDefault:1];
  [v3 setNeedsUpdate:1];
  [v3 setDownloaded:0];

  return v3;
}

- (void)setTracksDefault:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = (unint64_t)[(MTPodcastPlaylistSettings *)self flags];
  if (((((v5 & 1) == 0) ^ v3) & 1) == 0)
  {
    [(MTPodcastPlaylistSettings *)self setFlags:v5 & 0xFFFFFFFFFFFFFFFELL | v3];
  }
}

- (BOOL)tracksDefault
{
  return [(MTPodcastPlaylistSettings *)self flags] & 1;
}

- (void)takeValuesFromDefaultSettings:(id)a3
{
  id v4 = a3;
  -[MTPodcastPlaylistSettings setMediaType:](self, "setMediaType:", [v4 mediaType]);
  id v5 = [v4 showPlayedEpisodes];

  [(MTPodcastPlaylistSettings *)self setShowPlayedEpisodes:v5];

  [(MTPodcastPlaylistSettings *)self setNeedsUpdate:1];
}

- (id)metricsContentIdentifier
{
  v2 = [(MTPodcastPlaylistSettings *)self playlist];
  BOOL v3 = [v2 metricsContentIdentifier];

  return v3;
}

- (id)metricsAdditionalData
{
  BOOL v3 = [(MTPodcastPlaylistSettings *)self metricsKeys];
  id v4 = [(MTPodcastPlaylistSettings *)self dictionaryWithValuesForKeys:v3];
  CFStringRef v7 = @"settings";
  uint64_t v8 = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  return v5;
}

- (id)metricsKeys
{
  v4[0] = kPlaylistSettingEpisodesToShow;
  v4[1] = kPlaylistSettingMediaType;
  v4[2] = kPlaylistSettingShowPlayedEpisodes;
  v2 = +[NSArray arrayWithObjects:v4 count:3];

  return v2;
}

@end