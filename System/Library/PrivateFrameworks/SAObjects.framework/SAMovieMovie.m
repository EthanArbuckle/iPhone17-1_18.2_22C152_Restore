@interface SAMovieMovie
+ (id)movie;
- (BOOL)is3d;
- (NSArray)actors;
- (NSArray)directors;
- (NSArray)genres;
- (NSArray)posterImages;
- (NSArray)studios;
- (NSArray)theaterShowtimes;
- (NSDate)theatricalReleaseDate;
- (NSNumber)isAvailableOnItunesForPurchase;
- (NSNumber)isAvailableOnItunesForRent;
- (NSNumber)qualityRating;
- (NSString)name;
- (NSString)rating;
- (NSString)synopsis;
- (NSString)theaterShowtimeSearchRegionDescription;
- (NSURL)hiResTrailerUri;
- (NSURL)iTunesUri;
- (NSURL)lowResTrailerUri;
- (NSURL)posterUri;
- (NSURL)rottenTomatoesUri;
- (SALocalSearchReviewList)reviews;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)runtimeInMinutes;
- (void)setActors:(id)a3;
- (void)setDirectors:(id)a3;
- (void)setGenres:(id)a3;
- (void)setHiResTrailerUri:(id)a3;
- (void)setITunesUri:(id)a3;
- (void)setIs3d:(BOOL)a3;
- (void)setIsAvailableOnItunesForPurchase:(id)a3;
- (void)setIsAvailableOnItunesForRent:(id)a3;
- (void)setLowResTrailerUri:(id)a3;
- (void)setName:(id)a3;
- (void)setPosterImages:(id)a3;
- (void)setPosterUri:(id)a3;
- (void)setQualityRating:(id)a3;
- (void)setRating:(id)a3;
- (void)setReviews:(id)a3;
- (void)setRottenTomatoesUri:(id)a3;
- (void)setRuntimeInMinutes:(int64_t)a3;
- (void)setStudios:(id)a3;
- (void)setSynopsis:(id)a3;
- (void)setTheaterShowtimeSearchRegionDescription:(id)a3;
- (void)setTheaterShowtimes:(id)a3;
- (void)setTheatricalReleaseDate:(id)a3;
@end

@implementation SAMovieMovie

- (id)groupIdentifier
{
  return @"com.apple.ace.movie";
}

- (id)encodedClassName
{
  return @"Movie";
}

+ (id)movie
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

- (NSURL)hiResTrailerUri
{
  return (NSURL *)AceObjectURLForProperty(self, @"hiResTrailerUri");
}

- (void)setHiResTrailerUri:(id)a3
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

- (NSNumber)isAvailableOnItunesForPurchase
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"isAvailableOnItunesForPurchase"];
}

- (void)setIsAvailableOnItunesForPurchase:(id)a3
{
}

- (NSNumber)isAvailableOnItunesForRent
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"isAvailableOnItunesForRent"];
}

- (void)setIsAvailableOnItunesForRent:(id)a3
{
}

- (NSURL)lowResTrailerUri
{
  return (NSURL *)AceObjectURLForProperty(self, @"lowResTrailerUri");
}

- (void)setLowResTrailerUri:(id)a3
{
}

- (NSString)name
{
  return (NSString *)[(AceObject *)self propertyForKey:@"name"];
}

- (void)setName:(id)a3
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

- (NSURL)posterUri
{
  return (NSURL *)AceObjectURLForProperty(self, @"posterUri");
}

- (void)setPosterUri:(id)a3
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

- (SALocalSearchReviewList)reviews
{
  return (SALocalSearchReviewList *)AceObjectAceObjectForProperty(self, @"reviews");
}

- (void)setReviews:(id)a3
{
}

- (NSURL)rottenTomatoesUri
{
  return (NSURL *)AceObjectURLForProperty(self, @"rottenTomatoesUri");
}

- (void)setRottenTomatoesUri:(id)a3
{
}

- (int64_t)runtimeInMinutes
{
  return AceObjectIntegerForProperty(self, @"runtimeInMinutes");
}

- (void)setRuntimeInMinutes:(int64_t)a3
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

- (NSString)theaterShowtimeSearchRegionDescription
{
  return (NSString *)[(AceObject *)self propertyForKey:@"theaterShowtimeSearchRegionDescription"];
}

- (void)setTheaterShowtimeSearchRegionDescription:(id)a3
{
}

- (NSArray)theaterShowtimes
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"theaterShowtimes", v3);
}

- (void)setTheaterShowtimes:(id)a3
{
}

- (NSDate)theatricalReleaseDate
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"theatricalReleaseDate"];
}

- (void)setTheatricalReleaseDate:(id)a3
{
}

@end