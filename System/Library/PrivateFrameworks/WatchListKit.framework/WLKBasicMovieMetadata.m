@interface WLKBasicMovieMetadata
- (NSDate)releaseDate;
- (NSString)studio;
- (WLKBasicMovieMetadata)initWithDictionary:(id)a3;
- (WLKRottenTomatoesRating)rottenTomatoesRating;
- (double)duration;
@end

@implementation WLKBasicMovieMetadata

- (WLKBasicMovieMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WLKBasicMovieMetadata;
  v5 = [(WLKBasicContentMetadata *)&v18 initWithDictionary:v4];
  if (v5)
  {
    v6 = objc_msgSend(v4, "wlk_stringForKey:", @"studio");
    uint64_t v7 = [v6 copy];
    studio = v5->_studio;
    v5->_studio = (NSString *)v7;

    v9 = objc_msgSend(v4, "wlk_stringForKey:", @"tomatometerFreshness");
    v10 = objc_msgSend(v4, "wlk_numberForKey:", @"tomatometerPercentage");
    v11 = [[WLKRottenTomatoesRating alloc] initWithFreshness:+[WLKRottenTomatoesRating freshnessForString:v9] freshnessPercentage:v10];
    rottenTomatoesRating = v5->_rottenTomatoesRating;
    v5->_rottenTomatoesRating = v11;

    v13 = objc_msgSend(v4, "wlk_numberForKey:", @"duration");
    [v13 doubleValue];
    v5->_duration = v14;

    uint64_t v15 = objc_msgSend(v4, "wlk_dateFromMillisecondsSince1970ForKey:", @"releaseDate");
    releaseDate = v5->_releaseDate;
    v5->_releaseDate = (NSDate *)v15;
  }
  return v5;
}

- (NSString)studio
{
  return self->_studio;
}

- (WLKRottenTomatoesRating)rottenTomatoesRating
{
  return self->_rottenTomatoesRating;
}

- (double)duration
{
  return self->_duration;
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_rottenTomatoesRating, 0);

  objc_storeStrong((id *)&self->_studio, 0);
}

@end