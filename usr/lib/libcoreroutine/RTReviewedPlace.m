@interface RTReviewedPlace
- (BOOL)hasUserReviewed;
- (NSDate)lastSuggestedReviewDate;
- (NSDate)modifiedDate;
- (RTReviewedPlace)init;
- (RTReviewedPlace)initWithMuid:(unint64_t)a3 lastSuggestedReviewDate:(id)a4 hasUserReviewed:(BOOL)a5 modifiedDate:(id)a6;
- (id)description;
- (unint64_t)muid;
@end

@implementation RTReviewedPlace

- (RTReviewedPlace)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithMuid_lastSuggestedReviewDate_hasUserReviewed_modifiedDate_);
}

- (RTReviewedPlace)initWithMuid:(unint64_t)a3 lastSuggestedReviewDate:(id)a4 hasUserReviewed:(BOOL)a5 modifiedDate:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)RTReviewedPlace;
  v12 = [(RTReviewedPlace *)&v19 init];
  v13 = v12;
  if (v12)
  {
    v12->_muid = a3;
    uint64_t v14 = [v10 copy];
    lastSuggestedReviewDate = v13->_lastSuggestedReviewDate;
    v13->_lastSuggestedReviewDate = (NSDate *)v14;

    v13->_hasUserReviewed = a5;
    uint64_t v16 = [v11 copy];
    modifiedDate = v13->_modifiedDate;
    v13->_modifiedDate = (NSDate *)v16;
  }
  return v13;
}

- (id)description
{
  v3 = NSString;
  unint64_t muid = self->_muid;
  v5 = [(NSDate *)self->_lastSuggestedReviewDate stringFromDate];
  if (self->_hasUserReviewed) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  v7 = [(NSDate *)self->_modifiedDate stringFromDate];
  v8 = [v3 stringWithFormat:@"muid, %lu, lastSuggestedReviewDate, %@, hasUserReviewed, %@, stringFromDate, %@", muid, v5, v6, v7];

  return v8;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (NSDate)lastSuggestedReviewDate
{
  return self->_lastSuggestedReviewDate;
}

- (BOOL)hasUserReviewed
{
  return self->_hasUserReviewed;
}

- (NSDate)modifiedDate
{
  return self->_modifiedDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedDate, 0);

  objc_storeStrong((id *)&self->_lastSuggestedReviewDate, 0);
}

@end