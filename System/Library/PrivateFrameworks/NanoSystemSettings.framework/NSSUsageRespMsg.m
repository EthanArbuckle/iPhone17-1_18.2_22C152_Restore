@interface NSSUsageRespMsg
+ (Class)appBundleUsageType;
+ (Class)appUsagesType;
+ (Class)bundleUsageType;
+ (Class)categoriesType;
- (BOOL)hasAudioCoursesUsage;
- (BOOL)hasAudioPodcastsUsage;
- (BOOL)hasAudiobooksUsage;
- (BOOL)hasCameralRollUsage;
- (BOOL)hasCapacityInBytes;
- (BOOL)hasHomeVideosUsage;
- (BOOL)hasMovieRentalsUsage;
- (BOOL)hasMoviesUsage;
- (BOOL)hasMusicBundleIdentifier;
- (BOOL)hasMusicVideosUsage;
- (BOOL)hasPhotoLibraryUsage;
- (BOOL)hasPhotoStreamUsage;
- (BOOL)hasPhotosBundleIdentifier;
- (BOOL)hasPodcastsBundleIdentifier;
- (BOOL)hasSongsUsage;
- (BOOL)hasTvShowsUsage;
- (BOOL)hasVideoCoursesUsage;
- (BOOL)hasVideoPodcastsUsage;
- (BOOL)isEqual:(id)a3;
- (BOOL)partiallyCharged;
- (BOOL)readFrom:(id)a3;
- (BOOL)trusted;
- (NSMutableArray)appBundleUsages;
- (NSMutableArray)appUsages;
- (NSMutableArray)bundleUsages;
- (NSMutableArray)categories;
- (NSString)musicBundleIdentifier;
- (NSString)photosBundleIdentifier;
- (NSString)podcastsBundleIdentifier;
- (float)standbyTimeInSeconds;
- (float)usageTimeInSeconds;
- (id)appBundleUsageAtIndex:(unint64_t)a3;
- (id)appUsagesAtIndex:(unint64_t)a3;
- (id)bundleUsageAtIndex:(unint64_t)a3;
- (id)categoriesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)appBundleUsagesCount;
- (unint64_t)appUsagesCount;
- (unint64_t)audioCoursesUsage;
- (unint64_t)audioPodcastsUsage;
- (unint64_t)audiobooksUsage;
- (unint64_t)availableStorageInBytes;
- (unint64_t)bundleUsagesCount;
- (unint64_t)cameralRollUsage;
- (unint64_t)capacityInBytes;
- (unint64_t)categoriesCount;
- (unint64_t)hash;
- (unint64_t)homeVideosUsage;
- (unint64_t)movieRentalsUsage;
- (unint64_t)moviesUsage;
- (unint64_t)musicVideosUsage;
- (unint64_t)photoLibraryUsage;
- (unint64_t)photoStreamUsage;
- (unint64_t)songsUsage;
- (unint64_t)tvShowsUsage;
- (unint64_t)usedStorageInBytes;
- (unint64_t)videoCoursesUsage;
- (unint64_t)videoPodcastsUsage;
- (void)addAppBundleUsage:(id)a3;
- (void)addAppUsages:(id)a3;
- (void)addBundleUsage:(id)a3;
- (void)addCategories:(id)a3;
- (void)clearAppBundleUsages;
- (void)clearAppUsages;
- (void)clearBundleUsages;
- (void)clearCategories;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppBundleUsages:(id)a3;
- (void)setAppUsages:(id)a3;
- (void)setAudioCoursesUsage:(unint64_t)a3;
- (void)setAudioPodcastsUsage:(unint64_t)a3;
- (void)setAudiobooksUsage:(unint64_t)a3;
- (void)setAvailableStorageInBytes:(unint64_t)a3;
- (void)setBundleUsages:(id)a3;
- (void)setCameralRollUsage:(unint64_t)a3;
- (void)setCapacityInBytes:(unint64_t)a3;
- (void)setCategories:(id)a3;
- (void)setHasAudioCoursesUsage:(BOOL)a3;
- (void)setHasAudioPodcastsUsage:(BOOL)a3;
- (void)setHasAudiobooksUsage:(BOOL)a3;
- (void)setHasCameralRollUsage:(BOOL)a3;
- (void)setHasCapacityInBytes:(BOOL)a3;
- (void)setHasHomeVideosUsage:(BOOL)a3;
- (void)setHasMovieRentalsUsage:(BOOL)a3;
- (void)setHasMoviesUsage:(BOOL)a3;
- (void)setHasMusicVideosUsage:(BOOL)a3;
- (void)setHasPhotoLibraryUsage:(BOOL)a3;
- (void)setHasPhotoStreamUsage:(BOOL)a3;
- (void)setHasSongsUsage:(BOOL)a3;
- (void)setHasTvShowsUsage:(BOOL)a3;
- (void)setHasVideoCoursesUsage:(BOOL)a3;
- (void)setHasVideoPodcastsUsage:(BOOL)a3;
- (void)setHomeVideosUsage:(unint64_t)a3;
- (void)setMovieRentalsUsage:(unint64_t)a3;
- (void)setMoviesUsage:(unint64_t)a3;
- (void)setMusicBundleIdentifier:(id)a3;
- (void)setMusicVideosUsage:(unint64_t)a3;
- (void)setPartiallyCharged:(BOOL)a3;
- (void)setPhotoLibraryUsage:(unint64_t)a3;
- (void)setPhotoStreamUsage:(unint64_t)a3;
- (void)setPhotosBundleIdentifier:(id)a3;
- (void)setPodcastsBundleIdentifier:(id)a3;
- (void)setSongsUsage:(unint64_t)a3;
- (void)setStandbyTimeInSeconds:(float)a3;
- (void)setTrusted:(BOOL)a3;
- (void)setTvShowsUsage:(unint64_t)a3;
- (void)setUsageTimeInSeconds:(float)a3;
- (void)setUsedStorageInBytes:(unint64_t)a3;
- (void)setVideoCoursesUsage:(unint64_t)a3;
- (void)setVideoPodcastsUsage:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSSUsageRespMsg

- (void)clearAppUsages
{
}

- (void)addAppUsages:(id)a3
{
  id v4 = a3;
  appUsages = self->_appUsages;
  id v8 = v4;
  if (!appUsages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_appUsages;
    self->_appUsages = v6;

    id v4 = v8;
    appUsages = self->_appUsages;
  }
  [(NSMutableArray *)appUsages addObject:v4];
}

- (unint64_t)appUsagesCount
{
  return [(NSMutableArray *)self->_appUsages count];
}

- (id)appUsagesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_appUsages objectAtIndex:a3];
}

+ (Class)appUsagesType
{
  return (Class)objc_opt_class();
}

- (void)setMoviesUsage:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_moviesUsage = a3;
}

- (void)setHasMoviesUsage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasMoviesUsage
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setMovieRentalsUsage:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_movieRentalsUsage = a3;
}

- (void)setHasMovieRentalsUsage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasMovieRentalsUsage
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setTvShowsUsage:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_tvShowsUsage = a3;
}

- (void)setHasTvShowsUsage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasTvShowsUsage
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setAudioCoursesUsage:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_audioCoursesUsage = a3;
}

- (void)setHasAudioCoursesUsage:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAudioCoursesUsage
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setVideoCoursesUsage:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_videoCoursesUsage = a3;
}

- (void)setHasVideoCoursesUsage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasVideoCoursesUsage
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setMusicVideosUsage:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_musicVideosUsage = a3;
}

- (void)setHasMusicVideosUsage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasMusicVideosUsage
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setAudioPodcastsUsage:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_audioPodcastsUsage = a3;
}

- (void)setHasAudioPodcastsUsage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAudioPodcastsUsage
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setVideoPodcastsUsage:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_videoPodcastsUsage = a3;
}

- (void)setHasVideoPodcastsUsage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasVideoPodcastsUsage
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setSongsUsage:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_songsUsage = a3;
}

- (void)setHasSongsUsage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSongsUsage
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setAudiobooksUsage:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_audiobooksUsage = a3;
}

- (void)setHasAudiobooksUsage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAudiobooksUsage
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHomeVideosUsage:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_homeVideosUsage = a3;
}

- (void)setHasHomeVideosUsage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasHomeVideosUsage
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setCameralRollUsage:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_cameralRollUsage = a3;
}

- (void)setHasCameralRollUsage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasCameralRollUsage
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setPhotoLibraryUsage:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_photoLibraryUsage = a3;
}

- (void)setHasPhotoLibraryUsage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasPhotoLibraryUsage
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setPhotoStreamUsage:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_photoStreamUsage = a3;
}

- (void)setHasPhotoStreamUsage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasPhotoStreamUsage
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)clearBundleUsages
{
}

- (void)addBundleUsage:(id)a3
{
  id v4 = a3;
  bundleUsages = self->_bundleUsages;
  id v8 = v4;
  if (!bundleUsages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_bundleUsages;
    self->_bundleUsages = v6;

    id v4 = v8;
    bundleUsages = self->_bundleUsages;
  }
  [(NSMutableArray *)bundleUsages addObject:v4];
}

- (unint64_t)bundleUsagesCount
{
  return [(NSMutableArray *)self->_bundleUsages count];
}

- (id)bundleUsageAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_bundleUsages objectAtIndex:a3];
}

+ (Class)bundleUsageType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasMusicBundleIdentifier
{
  return self->_musicBundleIdentifier != 0;
}

- (BOOL)hasPhotosBundleIdentifier
{
  return self->_photosBundleIdentifier != 0;
}

- (BOOL)hasPodcastsBundleIdentifier
{
  return self->_podcastsBundleIdentifier != 0;
}

- (void)clearAppBundleUsages
{
}

- (void)addAppBundleUsage:(id)a3
{
  id v4 = a3;
  appBundleUsages = self->_appBundleUsages;
  id v8 = v4;
  if (!appBundleUsages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_appBundleUsages;
    self->_appBundleUsages = v6;

    id v4 = v8;
    appBundleUsages = self->_appBundleUsages;
  }
  [(NSMutableArray *)appBundleUsages addObject:v4];
}

- (unint64_t)appBundleUsagesCount
{
  return [(NSMutableArray *)self->_appBundleUsages count];
}

- (id)appBundleUsageAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_appBundleUsages objectAtIndex:a3];
}

+ (Class)appBundleUsageType
{
  return (Class)objc_opt_class();
}

- (void)clearCategories
{
}

- (void)addCategories:(id)a3
{
  id v4 = a3;
  categories = self->_categories;
  id v8 = v4;
  if (!categories)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_categories;
    self->_categories = v6;

    id v4 = v8;
    categories = self->_categories;
  }
  [(NSMutableArray *)categories addObject:v4];
}

- (unint64_t)categoriesCount
{
  return [(NSMutableArray *)self->_categories count];
}

- (id)categoriesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_categories objectAtIndex:a3];
}

+ (Class)categoriesType
{
  return (Class)objc_opt_class();
}

- (void)setCapacityInBytes:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_capacityInBytes = a3;
}

- (void)setHasCapacityInBytes:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasCapacityInBytes
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSSUsageRespMsg;
  id v4 = [(NSSUsageRespMsg *)&v8 description];
  v5 = [(NSSUsageRespMsg *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  __int16 v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [NSNumber numberWithUnsignedLongLong:self->_usedStorageInBytes];
  [v3 setObject:v4 forKey:@"usedStorageInBytes"];

  v5 = [NSNumber numberWithUnsignedLongLong:self->_availableStorageInBytes];
  [v3 setObject:v5 forKey:@"availableStorageInBytes"];

  *(float *)&double v6 = self->_usageTimeInSeconds;
  v7 = [NSNumber numberWithFloat:v6];
  [v3 setObject:v7 forKey:@"usageTimeInSeconds"];

  *(float *)&double v8 = self->_standbyTimeInSeconds;
  v9 = [NSNumber numberWithFloat:v8];
  [v3 setObject:v9 forKey:@"standbyTimeInSeconds"];

  v10 = [NSNumber numberWithBool:self->_trusted];
  [v3 setObject:v10 forKey:@"trusted"];

  v11 = [NSNumber numberWithBool:self->_partiallyCharged];
  [v3 setObject:v11 forKey:@"partiallyCharged"];

  if ([(NSMutableArray *)self->_appUsages count])
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_appUsages, "count"));
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    v13 = self->_appUsages;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v72 objects:v79 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v73;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v73 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v72 + 1) + 8 * i) dictionaryRepresentation];
          [v12 addObject:v18];
        }
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v72 objects:v79 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKey:@"appUsages"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    v47 = [NSNumber numberWithUnsignedLongLong:self->_moviesUsage];
    [v3 setObject:v47 forKey:@"moviesUsage"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_12:
      if ((has & 0x1000) == 0) {
        goto LABEL_13;
      }
      goto LABEL_65;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_12;
  }
  v48 = [NSNumber numberWithUnsignedLongLong:self->_movieRentalsUsage];
  [v3 setObject:v48 forKey:@"movieRentalsUsage"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_66;
  }
LABEL_65:
  v49 = [NSNumber numberWithUnsignedLongLong:self->_tvShowsUsage];
  [v3 setObject:v49 forKey:@"tvShowsUsage"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_67;
  }
LABEL_66:
  v50 = [NSNumber numberWithUnsignedLongLong:self->_audioCoursesUsage];
  [v3 setObject:v50 forKey:@"audioCoursesUsage"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_15:
    if ((has & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_68;
  }
LABEL_67:
  v51 = [NSNumber numberWithUnsignedLongLong:self->_videoCoursesUsage];
  [v3 setObject:v51 forKey:@"videoCoursesUsage"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_16:
    if ((has & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_69;
  }
LABEL_68:
  v52 = [NSNumber numberWithUnsignedLongLong:self->_musicVideosUsage];
  [v3 setObject:v52 forKey:@"musicVideosUsage"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_17:
    if ((has & 0x4000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_70;
  }
LABEL_69:
  v53 = [NSNumber numberWithUnsignedLongLong:self->_audioPodcastsUsage];
  [v3 setObject:v53 forKey:@"audioPodcastsUsage"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_18:
    if ((has & 0x800) == 0) {
      goto LABEL_19;
    }
    goto LABEL_71;
  }
LABEL_70:
  v54 = [NSNumber numberWithUnsignedLongLong:self->_videoPodcastsUsage];
  [v3 setObject:v54 forKey:@"videoPodcastsUsage"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_19:
    if ((has & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_72;
  }
LABEL_71:
  v55 = [NSNumber numberWithUnsignedLongLong:self->_songsUsage];
  [v3 setObject:v55 forKey:@"songsUsage"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_20:
    if ((has & 0x20) == 0) {
      goto LABEL_21;
    }
    goto LABEL_73;
  }
LABEL_72:
  v56 = [NSNumber numberWithUnsignedLongLong:self->_audiobooksUsage];
  [v3 setObject:v56 forKey:@"audiobooksUsage"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_21:
    if ((has & 8) == 0) {
      goto LABEL_22;
    }
    goto LABEL_74;
  }
LABEL_73:
  v57 = [NSNumber numberWithUnsignedLongLong:self->_homeVideosUsage];
  [v3 setObject:v57 forKey:@"homeVideosUsage"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_22:
    if ((has & 0x200) == 0) {
      goto LABEL_23;
    }
    goto LABEL_75;
  }
LABEL_74:
  v58 = [NSNumber numberWithUnsignedLongLong:self->_cameralRollUsage];
  [v3 setObject:v58 forKey:@"cameralRollUsage"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_23:
    if ((has & 0x400) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_75:
  v59 = [NSNumber numberWithUnsignedLongLong:self->_photoLibraryUsage];
  [v3 setObject:v59 forKey:@"photoLibraryUsage"];

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_24:
    v20 = [NSNumber numberWithUnsignedLongLong:self->_photoStreamUsage];
    [v3 setObject:v20 forKey:@"photoStreamUsage"];
  }
LABEL_25:
  if ([(NSMutableArray *)self->_bundleUsages count])
  {
    v21 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_bundleUsages, "count"));
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    v22 = self->_bundleUsages;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v68 objects:v78 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v69;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v69 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = [*(id *)(*((void *)&v68 + 1) + 8 * j) dictionaryRepresentation];
          [v21 addObject:v27];
        }
        uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v68 objects:v78 count:16];
      }
      while (v24);
    }

    [v3 setObject:v21 forKey:@"bundleUsage"];
  }
  musicBundleIdentifier = self->_musicBundleIdentifier;
  if (musicBundleIdentifier) {
    [v3 setObject:musicBundleIdentifier forKey:@"musicBundleIdentifier"];
  }
  photosBundleIdentifier = self->_photosBundleIdentifier;
  if (photosBundleIdentifier) {
    [v3 setObject:photosBundleIdentifier forKey:@"photosBundleIdentifier"];
  }
  podcastsBundleIdentifier = self->_podcastsBundleIdentifier;
  if (podcastsBundleIdentifier) {
    [v3 setObject:podcastsBundleIdentifier forKey:@"podcastsBundleIdentifier"];
  }
  if ([(NSMutableArray *)self->_appBundleUsages count])
  {
    v31 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_appBundleUsages, "count"));
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    v32 = self->_appBundleUsages;
    uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v64 objects:v77 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v65;
      do
      {
        for (uint64_t k = 0; k != v34; ++k)
        {
          if (*(void *)v65 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = [*(id *)(*((void *)&v64 + 1) + 8 * k) dictionaryRepresentation];
          [v31 addObject:v37];
        }
        uint64_t v34 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v64 objects:v77 count:16];
      }
      while (v34);
    }

    [v3 setObject:v31 forKey:@"appBundleUsage"];
  }
  if ([(NSMutableArray *)self->_categories count])
  {
    v38 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_categories, "count"));
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    v39 = self->_categories;
    uint64_t v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v60 objects:v76 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v61;
      do
      {
        for (uint64_t m = 0; m != v41; ++m)
        {
          if (*(void *)v61 != v42) {
            objc_enumerationMutation(v39);
          }
          v44 = objc_msgSend(*(id *)(*((void *)&v60 + 1) + 8 * m), "dictionaryRepresentation", (void)v60);
          [v38 addObject:v44];
        }
        uint64_t v41 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v60 objects:v76 count:16];
      }
      while (v41);
    }

    [v3 setObject:v38 forKey:@"categories"];
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    v45 = [NSNumber numberWithUnsignedLongLong:self->_capacityInBytes];
    [v3 setObject:v45 forKey:@"capacityInBytes"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSSUsageRespMsgReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v5 = self->_appUsages;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v38 objects:v45 count:16];
    }
    while (v7);
  }

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_10:
      if ((has & 0x1000) == 0) {
        goto LABEL_11;
      }
      goto LABEL_55;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_14:
    if ((has & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_15:
    if ((has & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_16:
    if ((has & 0x800) == 0) {
      goto LABEL_17;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_17:
    if ((has & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_18:
    if ((has & 0x20) == 0) {
      goto LABEL_19;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_19:
    if ((has & 8) == 0) {
      goto LABEL_20;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_20:
    if ((has & 0x200) == 0) {
      goto LABEL_21;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_21:
    if ((has & 0x400) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_65:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
LABEL_22:
  }
    PBDataWriterWriteUint64Field();
LABEL_23:
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v11 = self->_bundleUsages;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v34 objects:v44 count:16];
    }
    while (v13);
  }

  if (self->_musicBundleIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_photosBundleIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_podcastsBundleIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v16 = self->_appBundleUsages;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v30 objects:v43 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v31;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v30 objects:v43 count:16];
    }
    while (v18);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v21 = self->_categories;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v26 objects:v42 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v27;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(v21);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v26 objects:v42 count:16];
    }
    while (v23);
  }

  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v4[15] = self->_usedStorageInBytes;
  v4[4] = self->_availableStorageInBytes;
  *((_DWORD *)v4 + 51) = LODWORD(self->_usageTimeInSeconds);
  *((_DWORD *)v4 + 50) = LODWORD(self->_standbyTimeInSeconds);
  *((unsigned char *)v4 + 209) = self->_trusted;
  id v22 = v4;
  *((unsigned char *)v4 + 208) = self->_partiallyCharged;
  if ([(NSSUsageRespMsg *)self appUsagesCount])
  {
    [v22 clearAppUsages];
    unint64_t v5 = [(NSSUsageRespMsg *)self appUsagesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(NSSUsageRespMsg *)self appUsagesAtIndex:i];
        [v22 addAppUsages:v8];
      }
    }
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    *((void *)v22 + 9) = self->_moviesUsage;
    *((_WORD *)v22 + 106) |= 0x80u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_7:
      if ((has & 0x1000) == 0) {
        goto LABEL_8;
      }
      goto LABEL_45;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_7;
  }
  *((void *)v22 + 8) = self->_movieRentalsUsage;
  *((_WORD *)v22 + 106) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((void *)v22 + 14) = self->_tvShowsUsage;
  *((_WORD *)v22 + 106) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x2000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((void *)v22 + 1) = self->_audioCoursesUsage;
  *((_WORD *)v22 + 106) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((void *)v22 + 16) = self->_videoCoursesUsage;
  *((_WORD *)v22 + 106) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((void *)v22 + 10) = self->_musicVideosUsage;
  *((_WORD *)v22 + 106) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((void *)v22 + 2) = self->_audioPodcastsUsage;
  *((_WORD *)v22 + 106) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_13:
    if ((has & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((void *)v22 + 17) = self->_videoPodcastsUsage;
  *((_WORD *)v22 + 106) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_14:
    if ((has & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((void *)v22 + 13) = self->_songsUsage;
  *((_WORD *)v22 + 106) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_15:
    if ((has & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((void *)v22 + 3) = self->_audiobooksUsage;
  *((_WORD *)v22 + 106) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_16:
    if ((has & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((void *)v22 + 7) = self->_homeVideosUsage;
  *((_WORD *)v22 + 106) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_17:
    if ((has & 0x200) == 0) {
      goto LABEL_18;
    }
LABEL_55:
    *((void *)v22 + 11) = self->_photoLibraryUsage;
    *((_WORD *)v22 + 106) |= 0x200u;
    if ((*(_WORD *)&self->_has & 0x400) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_54:
  *((void *)v22 + 5) = self->_cameralRollUsage;
  *((_WORD *)v22 + 106) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0) {
    goto LABEL_55;
  }
LABEL_18:
  if ((has & 0x400) != 0)
  {
LABEL_19:
    *((void *)v22 + 12) = self->_photoStreamUsage;
    *((_WORD *)v22 + 106) |= 0x400u;
  }
LABEL_20:
  if ([(NSSUsageRespMsg *)self bundleUsagesCount])
  {
    [v22 clearBundleUsages];
    unint64_t v10 = [(NSSUsageRespMsg *)self bundleUsagesCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        uint64_t v13 = [(NSSUsageRespMsg *)self bundleUsageAtIndex:j];
        [v22 addBundleUsage:v13];
      }
    }
  }
  if (self->_musicBundleIdentifier) {
    objc_msgSend(v22, "setMusicBundleIdentifier:");
  }
  if (self->_photosBundleIdentifier) {
    objc_msgSend(v22, "setPhotosBundleIdentifier:");
  }
  if (self->_podcastsBundleIdentifier) {
    objc_msgSend(v22, "setPodcastsBundleIdentifier:");
  }
  if ([(NSSUsageRespMsg *)self appBundleUsagesCount])
  {
    [v22 clearAppBundleUsages];
    unint64_t v14 = [(NSSUsageRespMsg *)self appBundleUsagesCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t k = 0; k != v15; ++k)
      {
        uint64_t v17 = [(NSSUsageRespMsg *)self appBundleUsageAtIndex:k];
        [v22 addAppBundleUsage:v17];
      }
    }
  }
  if ([(NSSUsageRespMsg *)self categoriesCount])
  {
    [v22 clearCategories];
    unint64_t v18 = [(NSSUsageRespMsg *)self categoriesCount];
    if (v18)
    {
      unint64_t v19 = v18;
      for (uint64_t m = 0; m != v19; ++m)
      {
        v21 = [(NSSUsageRespMsg *)self categoriesAtIndex:m];
        [v22 addCategories:v21];
      }
    }
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *((void *)v22 + 6) = self->_capacityInBytes;
    *((_WORD *)v22 + 106) |= 0x10u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 120) = self->_usedStorageInBytes;
  *(void *)(v5 + 32) = self->_availableStorageInBytes;
  *(float *)(v5 + 204) = self->_usageTimeInSeconds;
  *(float *)(v5 + 200) = self->_standbyTimeInSeconds;
  *(unsigned char *)(v5 + 209) = self->_trusted;
  *(unsigned char *)(v5 + 208) = self->_partiallyCharged;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  unint64_t v6 = self->_appUsages;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v50 objects:v57 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v51 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = (void *)[*(id *)(*((void *)&v50 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addAppUsages:v11];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v50 objects:v57 count:16];
    }
    while (v8);
  }

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    *(void *)(v5 + 72) = self->_moviesUsage;
    *(_WORD *)(v5 + 212) |= 0x80u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_10:
      if ((has & 0x1000) == 0) {
        goto LABEL_11;
      }
      goto LABEL_49;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_10;
  }
  *(void *)(v5 + 64) = self->_movieRentalsUsage;
  *(_WORD *)(v5 + 212) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_50;
  }
LABEL_49:
  *(void *)(v5 + 112) = self->_tvShowsUsage;
  *(_WORD *)(v5 + 212) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_51;
  }
LABEL_50:
  *(void *)(v5 + 8) = self->_audioCoursesUsage;
  *(_WORD *)(v5 + 212) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_52;
  }
LABEL_51:
  *(void *)(v5 + 128) = self->_videoCoursesUsage;
  *(_WORD *)(v5 + 212) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_14:
    if ((has & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_53;
  }
LABEL_52:
  *(void *)(v5 + 80) = self->_musicVideosUsage;
  *(_WORD *)(v5 + 212) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_15:
    if ((has & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_54;
  }
LABEL_53:
  *(void *)(v5 + 16) = self->_audioPodcastsUsage;
  *(_WORD *)(v5 + 212) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_16:
    if ((has & 0x800) == 0) {
      goto LABEL_17;
    }
    goto LABEL_55;
  }
LABEL_54:
  *(void *)(v5 + 136) = self->_videoPodcastsUsage;
  *(_WORD *)(v5 + 212) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_17:
    if ((has & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_56;
  }
LABEL_55:
  *(void *)(v5 + 104) = self->_songsUsage;
  *(_WORD *)(v5 + 212) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_18:
    if ((has & 0x20) == 0) {
      goto LABEL_19;
    }
    goto LABEL_57;
  }
LABEL_56:
  *(void *)(v5 + 24) = self->_audiobooksUsage;
  *(_WORD *)(v5 + 212) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_19:
    if ((has & 8) == 0) {
      goto LABEL_20;
    }
    goto LABEL_58;
  }
LABEL_57:
  *(void *)(v5 + 56) = self->_homeVideosUsage;
  *(_WORD *)(v5 + 212) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_20:
    if ((has & 0x200) == 0) {
      goto LABEL_21;
    }
    goto LABEL_59;
  }
LABEL_58:
  *(void *)(v5 + 40) = self->_cameralRollUsage;
  *(_WORD *)(v5 + 212) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_21:
    if ((has & 0x400) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_59:
  *(void *)(v5 + 88) = self->_photoLibraryUsage;
  *(_WORD *)(v5 + 212) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_22:
    *(void *)(v5 + 96) = self->_photoStreamUsage;
    *(_WORD *)(v5 + 212) |= 0x400u;
  }
LABEL_23:
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v13 = self->_bundleUsages;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v47 != v16) {
          objc_enumerationMutation(v13);
        }
        unint64_t v18 = (void *)[*(id *)(*((void *)&v46 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addBundleUsage:v18];
      }
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v46 objects:v56 count:16];
    }
    while (v15);
  }

  uint64_t v19 = [(NSString *)self->_musicBundleIdentifier copyWithZone:a3];
  v20 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v19;

  uint64_t v21 = [(NSString *)self->_photosBundleIdentifier copyWithZone:a3];
  id v22 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v21;

  uint64_t v23 = [(NSString *)self->_podcastsBundleIdentifier copyWithZone:a3];
  uint64_t v24 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v23;

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v25 = self->_appBundleUsages;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v42 objects:v55 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v43;
    do
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v43 != v28) {
          objc_enumerationMutation(v25);
        }
        long long v30 = (void *)[*(id *)(*((void *)&v42 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addAppBundleUsage:v30];
      }
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v42 objects:v55 count:16];
    }
    while (v27);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v31 = self->_categories;
  uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v38 objects:v54 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v39;
    do
    {
      for (uint64_t m = 0; m != v33; ++m)
      {
        if (*(void *)v39 != v34) {
          objc_enumerationMutation(v31);
        }
        long long v36 = objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * m), "copyWithZone:", a3, (void)v38);
        [(id)v5 addCategories:v36];
      }
      uint64_t v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v38 objects:v54 count:16];
    }
    while (v33);
  }

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *(void *)(v5 + 48) = self->_capacityInBytes;
    *(_WORD *)(v5 + 212) |= 0x10u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]
    || self->_usedStorageInBytes != *((void *)v4 + 15)
    || self->_availableStorageInBytes != *((void *)v4 + 4)
    || self->_usageTimeInSeconds != *((float *)v4 + 51)
    || self->_standbyTimeInSeconds != *((float *)v4 + 50))
  {
    goto LABEL_103;
  }
  if (self->_trusted)
  {
    if (!*((unsigned char *)v4 + 209)) {
      goto LABEL_103;
    }
  }
  else if (*((unsigned char *)v4 + 209))
  {
    goto LABEL_103;
  }
  if (!self->_partiallyCharged)
  {
    if (!*((unsigned char *)v4 + 208)) {
      goto LABEL_14;
    }
LABEL_103:
    BOOL v15 = 0;
    goto LABEL_104;
  }
  if (!*((unsigned char *)v4 + 208)) {
    goto LABEL_103;
  }
LABEL_14:
  appUsages = self->_appUsages;
  if ((unint64_t)appUsages | *((void *)v4 + 19)
    && !-[NSMutableArray isEqual:](appUsages, "isEqual:"))
  {
    goto LABEL_103;
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)v4 + 106);
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_moviesUsage != *((void *)v4 + 9)) {
      goto LABEL_103;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_103;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_movieRentalsUsage != *((void *)v4 + 8)) {
      goto LABEL_103;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_103;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 106) & 0x1000) == 0 || self->_tvShowsUsage != *((void *)v4 + 14)) {
      goto LABEL_103;
    }
  }
  else if ((*((_WORD *)v4 + 106) & 0x1000) != 0)
  {
    goto LABEL_103;
  }
  if (has)
  {
    if ((v7 & 1) == 0 || self->_audioCoursesUsage != *((void *)v4 + 1)) {
      goto LABEL_103;
    }
  }
  else if (v7)
  {
    goto LABEL_103;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 106) & 0x2000) == 0 || self->_videoCoursesUsage != *((void *)v4 + 16)) {
      goto LABEL_103;
    }
  }
  else if ((*((_WORD *)v4 + 106) & 0x2000) != 0)
  {
    goto LABEL_103;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 106) & 0x100) == 0 || self->_musicVideosUsage != *((void *)v4 + 10)) {
      goto LABEL_103;
    }
  }
  else if ((*((_WORD *)v4 + 106) & 0x100) != 0)
  {
    goto LABEL_103;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_audioPodcastsUsage != *((void *)v4 + 2)) {
      goto LABEL_103;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_103;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 106) & 0x4000) == 0 || self->_videoPodcastsUsage != *((void *)v4 + 17)) {
      goto LABEL_103;
    }
  }
  else if ((*((_WORD *)v4 + 106) & 0x4000) != 0)
  {
    goto LABEL_103;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 106) & 0x800) == 0 || self->_songsUsage != *((void *)v4 + 13)) {
      goto LABEL_103;
    }
  }
  else if ((*((_WORD *)v4 + 106) & 0x800) != 0)
  {
    goto LABEL_103;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_audiobooksUsage != *((void *)v4 + 3)) {
      goto LABEL_103;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_103;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_homeVideosUsage != *((void *)v4 + 7)) {
      goto LABEL_103;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_103;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_cameralRollUsage != *((void *)v4 + 5)) {
      goto LABEL_103;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_103;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 106) & 0x200) == 0 || self->_photoLibraryUsage != *((void *)v4 + 11)) {
      goto LABEL_103;
    }
  }
  else if ((*((_WORD *)v4 + 106) & 0x200) != 0)
  {
    goto LABEL_103;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 106) & 0x400) == 0 || self->_photoStreamUsage != *((void *)v4 + 12)) {
      goto LABEL_103;
    }
  }
  else if ((*((_WORD *)v4 + 106) & 0x400) != 0)
  {
    goto LABEL_103;
  }
  bundleUsages = self->_bundleUsages;
  if ((unint64_t)bundleUsages | *((void *)v4 + 20)
    && !-[NSMutableArray isEqual:](bundleUsages, "isEqual:"))
  {
    goto LABEL_103;
  }
  musicBundleIdentifier = self->_musicBundleIdentifier;
  if ((unint64_t)musicBundleIdentifier | *((void *)v4 + 22))
  {
    if (!-[NSString isEqual:](musicBundleIdentifier, "isEqual:")) {
      goto LABEL_103;
    }
  }
  photosBundleIdentifier = self->_photosBundleIdentifier;
  if ((unint64_t)photosBundleIdentifier | *((void *)v4 + 23))
  {
    if (!-[NSString isEqual:](photosBundleIdentifier, "isEqual:")) {
      goto LABEL_103;
    }
  }
  podcastsBundleIdentifier = self->_podcastsBundleIdentifier;
  if ((unint64_t)podcastsBundleIdentifier | *((void *)v4 + 24))
  {
    if (!-[NSString isEqual:](podcastsBundleIdentifier, "isEqual:")) {
      goto LABEL_103;
    }
  }
  appBundleUsages = self->_appBundleUsages;
  if ((unint64_t)appBundleUsages | *((void *)v4 + 18))
  {
    if (!-[NSMutableArray isEqual:](appBundleUsages, "isEqual:")) {
      goto LABEL_103;
    }
  }
  categories = self->_categories;
  if ((unint64_t)categories | *((void *)v4 + 21))
  {
    if (!-[NSMutableArray isEqual:](categories, "isEqual:")) {
      goto LABEL_103;
    }
  }
  __int16 v14 = *((_WORD *)v4 + 106);
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    if ((v14 & 0x10) == 0 || self->_capacityInBytes != *((void *)v4 + 6)) {
      goto LABEL_103;
    }
    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = (v14 & 0x10) == 0;
  }
LABEL_104:

  return v15;
}

- (unint64_t)hash
{
  unint64_t availableStorageInBytes = self->_availableStorageInBytes;
  unint64_t usedStorageInBytes = self->_usedStorageInBytes;
  float usageTimeInSeconds = self->_usageTimeInSeconds;
  float v4 = -usageTimeInSeconds;
  if (usageTimeInSeconds >= 0.0) {
    float v4 = self->_usageTimeInSeconds;
  }
  float v5 = floorf(v4 + 0.5);
  float v6 = (float)(v4 - v5) * 1.8447e19;
  float v7 = fmodf(v5, 1.8447e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabsf(v6);
  if (v6 >= 0.0) {
    unint64_t v10 = v9;
  }
  unint64_t v48 = v10;
  float standbyTimeInSeconds = self->_standbyTimeInSeconds;
  float v12 = -standbyTimeInSeconds;
  if (standbyTimeInSeconds >= 0.0) {
    float v12 = self->_standbyTimeInSeconds;
  }
  float v13 = floorf(v12 + 0.5);
  float v14 = (float)(v12 - v13) * 1.8447e19;
  float v15 = fmodf(v13, 1.8447e19);
  unint64_t v16 = 2654435761u * (unint64_t)v15;
  unint64_t v17 = v16 + (unint64_t)v14;
  if (v14 <= 0.0) {
    unint64_t v17 = 2654435761u * (unint64_t)v15;
  }
  unint64_t v18 = v16 - (unint64_t)fabsf(v14);
  if (v14 < 0.0) {
    unint64_t v19 = v18;
  }
  else {
    unint64_t v19 = v17;
  }
  BOOL trusted = self->_trusted;
  unint64_t v47 = v19;
  BOOL partiallyCharged = self->_partiallyCharged;
  uint64_t v45 = [(NSMutableArray *)self->_appUsages hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    unint64_t v43 = 2654435761u * self->_moviesUsage;
    if ((has & 0x40) != 0)
    {
LABEL_16:
      unint64_t v42 = 2654435761u * self->_movieRentalsUsage;
      if ((*(_WORD *)&self->_has & 0x1000) != 0) {
        goto LABEL_17;
      }
      goto LABEL_31;
    }
  }
  else
  {
    unint64_t v43 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_16;
    }
  }
  unint64_t v42 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_17:
    unint64_t v41 = 2654435761u * self->_tvShowsUsage;
    if (has) {
      goto LABEL_18;
    }
    goto LABEL_32;
  }
LABEL_31:
  unint64_t v41 = 0;
  if (has)
  {
LABEL_18:
    unint64_t v40 = 2654435761u * self->_audioCoursesUsage;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_33;
  }
LABEL_32:
  unint64_t v40 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_19:
    unint64_t v39 = 2654435761u * self->_videoCoursesUsage;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_20;
    }
    goto LABEL_34;
  }
LABEL_33:
  unint64_t v39 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_20:
    unint64_t v38 = 2654435761u * self->_musicVideosUsage;
    if ((has & 2) != 0) {
      goto LABEL_21;
    }
    goto LABEL_35;
  }
LABEL_34:
  unint64_t v38 = 0;
  if ((has & 2) != 0)
  {
LABEL_21:
    unint64_t v37 = 2654435761u * self->_audioPodcastsUsage;
    if ((*(_WORD *)&self->_has & 0x4000) != 0) {
      goto LABEL_22;
    }
    goto LABEL_36;
  }
LABEL_35:
  unint64_t v37 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_22:
    unint64_t v36 = 2654435761u * self->_videoPodcastsUsage;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_23;
    }
    goto LABEL_37;
  }
LABEL_36:
  unint64_t v36 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_23:
    unint64_t v35 = 2654435761u * self->_songsUsage;
    if ((has & 4) != 0) {
      goto LABEL_24;
    }
    goto LABEL_38;
  }
LABEL_37:
  unint64_t v35 = 0;
  if ((has & 4) != 0)
  {
LABEL_24:
    unint64_t v34 = 2654435761u * self->_audiobooksUsage;
    if ((has & 0x20) != 0) {
      goto LABEL_25;
    }
    goto LABEL_39;
  }
LABEL_38:
  unint64_t v34 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_25:
    unint64_t v32 = 2654435761u * self->_homeVideosUsage;
    if ((has & 8) != 0) {
      goto LABEL_26;
    }
    goto LABEL_40;
  }
LABEL_39:
  unint64_t v32 = 0;
  if ((has & 8) != 0)
  {
LABEL_26:
    unint64_t v21 = 2654435761u * self->_cameralRollUsage;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_27;
    }
LABEL_41:
    unint64_t v22 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_28;
    }
    goto LABEL_42;
  }
LABEL_40:
  unint64_t v21 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_41;
  }
LABEL_27:
  unint64_t v22 = 2654435761u * self->_photoLibraryUsage;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_28:
    unint64_t v23 = 2654435761u * self->_photoStreamUsage;
    goto LABEL_43;
  }
LABEL_42:
  unint64_t v23 = 0;
LABEL_43:
  uint64_t v24 = [(NSMutableArray *)self->_bundleUsages hash];
  NSUInteger v25 = [(NSString *)self->_musicBundleIdentifier hash];
  NSUInteger v26 = [(NSString *)self->_photosBundleIdentifier hash];
  NSUInteger v27 = [(NSString *)self->_podcastsBundleIdentifier hash];
  uint64_t v28 = [(NSMutableArray *)self->_appBundleUsages hash];
  uint64_t v29 = [(NSMutableArray *)self->_categories hash];
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    unint64_t v30 = 2654435761u * self->_capacityInBytes;
  }
  else {
    unint64_t v30 = 0;
  }
  return (2654435761u * availableStorageInBytes) ^ v47 ^ (2654435761u * usedStorageInBytes) ^ v48 ^ (2654435761 * trusted) ^ (2654435761 * partiallyCharged) ^ v45 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  self->_unint64_t usedStorageInBytes = *((void *)v4 + 15);
  self->_unint64_t availableStorageInBytes = *((void *)v4 + 4);
  self->_float usageTimeInSeconds = *((float *)v4 + 51);
  self->_float standbyTimeInSeconds = *((float *)v4 + 50);
  self->_BOOL trusted = *((unsigned char *)v4 + 209);
  self->_BOOL partiallyCharged = *((unsigned char *)v4 + 208);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v5 = *((id *)v4 + 19);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NSSUsageRespMsg *)self addAppUsages:*(void *)(*((void *)&v38 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v38 objects:v45 count:16];
    }
    while (v7);
  }

  __int16 v10 = *((_WORD *)v4 + 106);
  if ((v10 & 0x80) != 0)
  {
    self->_moviesUsage = *((void *)v4 + 9);
    *(_WORD *)&self->_has |= 0x80u;
    __int16 v10 = *((_WORD *)v4 + 106);
    if ((v10 & 0x40) == 0)
    {
LABEL_10:
      if ((v10 & 0x1000) == 0) {
        goto LABEL_11;
      }
      goto LABEL_55;
    }
  }
  else if ((v10 & 0x40) == 0)
  {
    goto LABEL_10;
  }
  self->_movieRentalsUsage = *((void *)v4 + 8);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v10 = *((_WORD *)v4 + 106);
  if ((v10 & 0x1000) == 0)
  {
LABEL_11:
    if ((v10 & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_56;
  }
LABEL_55:
  self->_tvShowsUsage = *((void *)v4 + 14);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v10 = *((_WORD *)v4 + 106);
  if ((v10 & 1) == 0)
  {
LABEL_12:
    if ((v10 & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_audioCoursesUsage = *((void *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v10 = *((_WORD *)v4 + 106);
  if ((v10 & 0x2000) == 0)
  {
LABEL_13:
    if ((v10 & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_videoCoursesUsage = *((void *)v4 + 16);
  *(_WORD *)&self->_has |= 0x2000u;
  __int16 v10 = *((_WORD *)v4 + 106);
  if ((v10 & 0x100) == 0)
  {
LABEL_14:
    if ((v10 & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_musicVideosUsage = *((void *)v4 + 10);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v10 = *((_WORD *)v4 + 106);
  if ((v10 & 2) == 0)
  {
LABEL_15:
    if ((v10 & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_audioPodcastsUsage = *((void *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v10 = *((_WORD *)v4 + 106);
  if ((v10 & 0x4000) == 0)
  {
LABEL_16:
    if ((v10 & 0x800) == 0) {
      goto LABEL_17;
    }
    goto LABEL_61;
  }
LABEL_60:
  self->_videoPodcastsUsage = *((void *)v4 + 17);
  *(_WORD *)&self->_has |= 0x4000u;
  __int16 v10 = *((_WORD *)v4 + 106);
  if ((v10 & 0x800) == 0)
  {
LABEL_17:
    if ((v10 & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_62;
  }
LABEL_61:
  self->_songsUsage = *((void *)v4 + 13);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v10 = *((_WORD *)v4 + 106);
  if ((v10 & 4) == 0)
  {
LABEL_18:
    if ((v10 & 0x20) == 0) {
      goto LABEL_19;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_audiobooksUsage = *((void *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v10 = *((_WORD *)v4 + 106);
  if ((v10 & 0x20) == 0)
  {
LABEL_19:
    if ((v10 & 8) == 0) {
      goto LABEL_20;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_homeVideosUsage = *((void *)v4 + 7);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v10 = *((_WORD *)v4 + 106);
  if ((v10 & 8) == 0)
  {
LABEL_20:
    if ((v10 & 0x200) == 0) {
      goto LABEL_21;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_cameralRollUsage = *((void *)v4 + 5);
  *(_WORD *)&self->_has |= 8u;
  __int16 v10 = *((_WORD *)v4 + 106);
  if ((v10 & 0x200) == 0)
  {
LABEL_21:
    if ((v10 & 0x400) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_65:
  self->_photoLibraryUsage = *((void *)v4 + 11);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)v4 + 106) & 0x400) != 0)
  {
LABEL_22:
    self->_photoStreamUsage = *((void *)v4 + 12);
    *(_WORD *)&self->_has |= 0x400u;
  }
LABEL_23:
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v11 = *((id *)v4 + 20);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(v11);
        }
        [(NSSUsageRespMsg *)self addBundleUsage:*(void *)(*((void *)&v34 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v44 count:16];
    }
    while (v13);
  }

  if (*((void *)v4 + 22)) {
    -[NSSUsageRespMsg setMusicBundleIdentifier:](self, "setMusicBundleIdentifier:");
  }
  if (*((void *)v4 + 23)) {
    -[NSSUsageRespMsg setPhotosBundleIdentifier:](self, "setPhotosBundleIdentifier:");
  }
  if (*((void *)v4 + 24)) {
    -[NSSUsageRespMsg setPodcastsBundleIdentifier:](self, "setPodcastsBundleIdentifier:");
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v16 = *((id *)v4 + 18);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v43 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v31;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v16);
        }
        [(NSSUsageRespMsg *)self addAppBundleUsage:*(void *)(*((void *)&v30 + 1) + 8 * k)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v43 count:16];
    }
    while (v18);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v21 = *((id *)v4 + 21);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v26 objects:v42 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v27;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(v21);
        }
        -[NSSUsageRespMsg addCategories:](self, "addCategories:", *(void *)(*((void *)&v26 + 1) + 8 * m), (void)v26);
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v26 objects:v42 count:16];
    }
    while (v23);
  }

  if ((*((_WORD *)v4 + 106) & 0x10) != 0)
  {
    self->_capacityInBytes = *((void *)v4 + 6);
    *(_WORD *)&self->_has |= 0x10u;
  }
}

- (unint64_t)usedStorageInBytes
{
  return self->_usedStorageInBytes;
}

- (void)setUsedStorageInBytes:(unint64_t)a3
{
  self->_unint64_t usedStorageInBytes = a3;
}

- (unint64_t)availableStorageInBytes
{
  return self->_availableStorageInBytes;
}

- (void)setAvailableStorageInBytes:(unint64_t)a3
{
  self->_unint64_t availableStorageInBytes = a3;
}

- (float)usageTimeInSeconds
{
  return self->_usageTimeInSeconds;
}

- (void)setUsageTimeInSeconds:(float)a3
{
  self->_float usageTimeInSeconds = a3;
}

- (float)standbyTimeInSeconds
{
  return self->_standbyTimeInSeconds;
}

- (void)setStandbyTimeInSeconds:(float)a3
{
  self->_float standbyTimeInSeconds = a3;
}

- (BOOL)trusted
{
  return self->_trusted;
}

- (void)setTrusted:(BOOL)a3
{
  self->_BOOL trusted = a3;
}

- (BOOL)partiallyCharged
{
  return self->_partiallyCharged;
}

- (void)setPartiallyCharged:(BOOL)a3
{
  self->_BOOL partiallyCharged = a3;
}

- (NSMutableArray)appUsages
{
  return self->_appUsages;
}

- (void)setAppUsages:(id)a3
{
}

- (unint64_t)moviesUsage
{
  return self->_moviesUsage;
}

- (unint64_t)movieRentalsUsage
{
  return self->_movieRentalsUsage;
}

- (unint64_t)tvShowsUsage
{
  return self->_tvShowsUsage;
}

- (unint64_t)audioCoursesUsage
{
  return self->_audioCoursesUsage;
}

- (unint64_t)videoCoursesUsage
{
  return self->_videoCoursesUsage;
}

- (unint64_t)musicVideosUsage
{
  return self->_musicVideosUsage;
}

- (unint64_t)audioPodcastsUsage
{
  return self->_audioPodcastsUsage;
}

- (unint64_t)videoPodcastsUsage
{
  return self->_videoPodcastsUsage;
}

- (unint64_t)songsUsage
{
  return self->_songsUsage;
}

- (unint64_t)audiobooksUsage
{
  return self->_audiobooksUsage;
}

- (unint64_t)homeVideosUsage
{
  return self->_homeVideosUsage;
}

- (unint64_t)cameralRollUsage
{
  return self->_cameralRollUsage;
}

- (unint64_t)photoLibraryUsage
{
  return self->_photoLibraryUsage;
}

- (unint64_t)photoStreamUsage
{
  return self->_photoStreamUsage;
}

- (NSMutableArray)bundleUsages
{
  return self->_bundleUsages;
}

- (void)setBundleUsages:(id)a3
{
}

- (NSString)musicBundleIdentifier
{
  return self->_musicBundleIdentifier;
}

- (void)setMusicBundleIdentifier:(id)a3
{
}

- (NSString)photosBundleIdentifier
{
  return self->_photosBundleIdentifier;
}

- (void)setPhotosBundleIdentifier:(id)a3
{
}

- (NSString)podcastsBundleIdentifier
{
  return self->_podcastsBundleIdentifier;
}

- (void)setPodcastsBundleIdentifier:(id)a3
{
}

- (NSMutableArray)appBundleUsages
{
  return self->_appBundleUsages;
}

- (void)setAppBundleUsages:(id)a3
{
}

- (NSMutableArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
}

- (unint64_t)capacityInBytes
{
  return self->_capacityInBytes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_podcastsBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_photosBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_musicBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_bundleUsages, 0);
  objc_storeStrong((id *)&self->_appUsages, 0);
  objc_storeStrong((id *)&self->_appBundleUsages, 0);
}

@end