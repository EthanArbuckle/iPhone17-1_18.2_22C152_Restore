@interface SAMovieV2MovieDetailSnippet
+ (id)movieDetailSnippet;
- (BOOL)canBeFavorited;
- (BOOL)is3d;
- (BOOL)isContainerItem;
- (NSArray)actors;
- (NSArray)alternateProviderPunchouts;
- (NSArray)directors;
- (NSArray)genres;
- (NSArray)posterImages;
- (NSArray)studios;
- (NSDate)theatricalReleaseDate;
- (NSNumber)availableOnItunesForPurchase;
- (NSNumber)availableOnItunesForRent;
- (NSNumber)playTrailer;
- (NSNumber)qualityRating;
- (NSString)adamId;
- (NSString)canonicalId;
- (NSString)name;
- (NSString)rating;
- (NSString)synopsis;
- (NSString)theaterShowtimeSearchRegionDescription;
- (NSURL)hiresTrailerUri;
- (NSURL)iTunesUri;
- (NSURL)lowresTrailerUri;
- (NSURL)movieIdentifier;
- (SAMovieV2ReviewListSnippet)movieReviewListSnippet;
- (SAMovieV2ShowtimeSnippet)showtimeSnippet;
- (SAMovieV2TheaterShowtimeListSnippet)theaterShowtimeListSnippet;
- (SAUIAppPunchOut)playOnItunesPunchout;
- (SAUIAppPunchOut)videosPunchout;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)runtimeInMinutes;
- (void)setActors:(id)a3;
- (void)setAdamId:(id)a3;
- (void)setAlternateProviderPunchouts:(id)a3;
- (void)setAvailableOnItunesForPurchase:(id)a3;
- (void)setAvailableOnItunesForRent:(id)a3;
- (void)setCanBeFavorited:(BOOL)a3;
- (void)setCanonicalId:(id)a3;
- (void)setDirectors:(id)a3;
- (void)setGenres:(id)a3;
- (void)setHiresTrailerUri:(id)a3;
- (void)setITunesUri:(id)a3;
- (void)setIs3d:(BOOL)a3;
- (void)setIsContainerItem:(BOOL)a3;
- (void)setLowresTrailerUri:(id)a3;
- (void)setMovieIdentifier:(id)a3;
- (void)setMovieReviewListSnippet:(id)a3;
- (void)setName:(id)a3;
- (void)setPlayOnItunesPunchout:(id)a3;
- (void)setPlayTrailer:(id)a3;
- (void)setPosterImages:(id)a3;
- (void)setQualityRating:(id)a3;
- (void)setRating:(id)a3;
- (void)setRuntimeInMinutes:(int64_t)a3;
- (void)setShowtimeSnippet:(id)a3;
- (void)setStudios:(id)a3;
- (void)setSynopsis:(id)a3;
- (void)setTheaterShowtimeListSnippet:(id)a3;
- (void)setTheaterShowtimeSearchRegionDescription:(id)a3;
- (void)setTheatricalReleaseDate:(id)a3;
- (void)setVideosPunchout:(id)a3;
@end

@implementation SAMovieV2MovieDetailSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.movieV2";
}

- (id)encodedClassName
{
  return @"MovieDetailSnippet";
}

+ (id)movieDetailSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)actors
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"actors"];
}

- (void)setActors:(id)a3
{
}

- (NSString)adamId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"adamId"];
}

- (void)setAdamId:(id)a3
{
}

- (NSArray)alternateProviderPunchouts
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"alternateProviderPunchouts", v3);
}

- (void)setAlternateProviderPunchouts:(id)a3
{
}

- (NSNumber)availableOnItunesForPurchase
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"availableOnItunesForPurchase"];
}

- (void)setAvailableOnItunesForPurchase:(id)a3
{
}

- (NSNumber)availableOnItunesForRent
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"availableOnItunesForRent"];
}

- (void)setAvailableOnItunesForRent:(id)a3
{
}

- (BOOL)canBeFavorited
{
  return AceObjectBoolForProperty(self, @"canBeFavorited");
}

- (void)setCanBeFavorited:(BOOL)a3
{
}

- (NSString)canonicalId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"canonicalId"];
}

- (void)setCanonicalId:(id)a3
{
}

- (NSArray)directors
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"directors"];
}

- (void)setDirectors:(id)a3
{
}

- (NSArray)genres
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"genres"];
}

- (void)setGenres:(id)a3
{
}

- (NSURL)hiresTrailerUri
{
  return (NSURL *)AceObjectURLForProperty(self, @"hiresTrailerUri");
}

- (void)setHiresTrailerUri:(id)a3
{
}

- (NSURL)iTunesUri
{
  return (NSURL *)AceObjectURLForProperty(self, @"iTunesUri");
}

- (void)setITunesUri:(id)a3
{
}

- (BOOL)is3d
{
  return AceObjectBoolForProperty(self, @"is3d");
}

- (void)setIs3d:(BOOL)a3
{
}

- (BOOL)isContainerItem
{
  return AceObjectBoolForProperty(self, @"isContainerItem");
}

- (void)setIsContainerItem:(BOOL)a3
{
}

- (NSURL)lowresTrailerUri
{
  return (NSURL *)AceObjectURLForProperty(self, @"lowresTrailerUri");
}

- (void)setLowresTrailerUri:(id)a3
{
}

- (NSURL)movieIdentifier
{
  return (NSURL *)AceObjectURLForProperty(self, @"movieIdentifier");
}

- (void)setMovieIdentifier:(id)a3
{
}

- (SAMovieV2ReviewListSnippet)movieReviewListSnippet
{
  return (SAMovieV2ReviewListSnippet *)AceObjectAceObjectForProperty(self, @"movieReviewListSnippet");
}

- (void)setMovieReviewListSnippet:(id)a3
{
}

- (NSString)name
{
  return (NSString *)[(AceObject *)self propertyForKey:@"name"];
}

- (void)setName:(id)a3
{
}

- (SAUIAppPunchOut)playOnItunesPunchout
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, @"playOnItunesPunchout");
}

- (void)setPlayOnItunesPunchout:(id)a3
{
}

- (NSNumber)playTrailer
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"playTrailer"];
}

- (void)setPlayTrailer:(id)a3
{
}

- (NSArray)posterImages
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"posterImages", v3);
}

- (void)setPosterImages:(id)a3
{
}

- (NSNumber)qualityRating
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"qualityRating"];
}

- (void)setQualityRating:(id)a3
{
}

- (NSString)rating
{
  return (NSString *)[(AceObject *)self propertyForKey:@"rating"];
}

- (void)setRating:(id)a3
{
}

- (int64_t)runtimeInMinutes
{
  return AceObjectIntegerForProperty(self, @"runtimeInMinutes");
}

- (void)setRuntimeInMinutes:(int64_t)a3
{
}

- (SAMovieV2ShowtimeSnippet)showtimeSnippet
{
  return (SAMovieV2ShowtimeSnippet *)AceObjectAceObjectForProperty(self, @"showtimeSnippet");
}

- (void)setShowtimeSnippet:(id)a3
{
}

- (NSArray)studios
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"studios"];
}

- (void)setStudios:(id)a3
{
}

- (NSString)synopsis
{
  return (NSString *)[(AceObject *)self propertyForKey:@"synopsis"];
}

- (void)setSynopsis:(id)a3
{
}

- (SAMovieV2TheaterShowtimeListSnippet)theaterShowtimeListSnippet
{
  return (SAMovieV2TheaterShowtimeListSnippet *)AceObjectAceObjectForProperty(self, @"theaterShowtimeListSnippet");
}

- (void)setTheaterShowtimeListSnippet:(id)a3
{
}

- (NSString)theaterShowtimeSearchRegionDescription
{
  return (NSString *)[(AceObject *)self propertyForKey:@"theaterShowtimeSearchRegionDescription"];
}

- (void)setTheaterShowtimeSearchRegionDescription:(id)a3
{
}

- (NSDate)theatricalReleaseDate
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"theatricalReleaseDate"];
}

- (void)setTheatricalReleaseDate:(id)a3
{
}

- (SAUIAppPunchOut)videosPunchout
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, @"videosPunchout");
}

- (void)setVideosPunchout:(id)a3
{
}

@end