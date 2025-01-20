@interface SUItemReviewStatistics
- (NSString)numberOfUserRatingsString;
- (NSString)numberOfUserReviewsString;
- (SUItemReviewStatistics)initWithDictionary:(id)a3;
- (float)averageUserRating;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)numberOfUserRatings;
- (int64_t)numberOfUserReviews;
- (void)dealloc;
- (void)setAverageUserRating:(float)a3;
- (void)setNumberOfUserRatings:(int64_t)a3;
- (void)setNumberOfUserRatingsString:(id)a3;
- (void)setNumberOfUserReviews:(int64_t)a3;
- (void)setNumberOfUserReviewsString:(id)a3;
@end

@implementation SUItemReviewStatistics

- (SUItemReviewStatistics)initWithDictionary:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SUItemReviewStatistics;
  v4 = [(SUItemReviewStatistics *)&v13 init];
  if (v4)
  {
    v5 = (void *)[a3 objectForKey:@"average-user-rating"];
    if (objc_opt_respondsToSelector())
    {
      [v5 floatValue];
      v4->_averageUserRating = v6;
    }
    v7 = (void *)[a3 objectForKey:@"user-rating-count"];
    if (objc_opt_respondsToSelector()) {
      v4->_int64_t numberOfUserRatings = (int)[v7 intValue];
    }
    v8 = (void *)[a3 objectForKey:@"user-rating-count-string"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 length]) {
      v4->_numberOfUserRatingsString = (NSString *)v8;
    }
    v9 = (void *)[a3 objectForKey:@"user-review-count"];
    if (objc_opt_respondsToSelector()) {
      int64_t numberOfUserRatings = (int)[v9 intValue];
    }
    else {
      int64_t numberOfUserRatings = v4->_numberOfUserRatings;
    }
    v4->_numberOfUserReviews = numberOfUserRatings;
    numberOfUserRatingsString = (NSString *)[a3 objectForKey:@"user-review-count-string"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![(NSString *)numberOfUserRatingsString length]) {
      numberOfUserRatingsString = v4->_numberOfUserRatingsString;
    }
    v4->_numberOfUserReviewsString = numberOfUserRatingsString;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUItemReviewStatistics;
  [(SUItemReviewStatistics *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_opt_class() allocWithZone:a3];
  *(float *)(v5 + 8) = self->_averageUserRating;
  *(void *)(v5 + 16) = self->_numberOfUserRatings;
  *(void *)(v5 + 24) = [(NSString *)self->_numberOfUserRatingsString copyWithZone:a3];
  *(void *)(v5 + 32) = self->_numberOfUserReviews;
  *(void *)(v5 + 40) = [(NSString *)self->_numberOfUserReviewsString copyWithZone:a3];
  return (id)v5;
}

- (float)averageUserRating
{
  return self->_averageUserRating;
}

- (void)setAverageUserRating:(float)a3
{
  self->_averageUserRating = a3;
}

- (int64_t)numberOfUserRatings
{
  return self->_numberOfUserRatings;
}

- (void)setNumberOfUserRatings:(int64_t)a3
{
  self->_int64_t numberOfUserRatings = a3;
}

- (NSString)numberOfUserRatingsString
{
  return self->_numberOfUserRatingsString;
}

- (void)setNumberOfUserRatingsString:(id)a3
{
}

- (int64_t)numberOfUserReviews
{
  return self->_numberOfUserReviews;
}

- (void)setNumberOfUserReviews:(int64_t)a3
{
  self->_numberOfUserReviews = a3;
}

- (NSString)numberOfUserReviewsString
{
  return self->_numberOfUserReviewsString;
}

- (void)setNumberOfUserReviewsString:(id)a3
{
}

@end