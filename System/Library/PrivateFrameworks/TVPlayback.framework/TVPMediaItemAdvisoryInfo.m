@interface TVPMediaItemAdvisoryInfo
- (NSString)ratingDescription;
- (NSString)ratingName;
- (TVPMediaItemAdvisoryInfo)initWithRatingDescription:(id)a3;
- (id)description;
- (void)setRatingName:(id)a3;
@end

@implementation TVPMediaItemAdvisoryInfo

- (TVPMediaItemAdvisoryInfo)initWithRatingDescription:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVPMediaItemAdvisoryInfo;
  v6 = [(TVPMediaItemAdvisoryInfo *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_ratingDescription, a3);
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  v4 = [(TVPMediaItemAdvisoryInfo *)self ratingName];
  id v5 = [(TVPMediaItemAdvisoryInfo *)self ratingDescription];
  v6 = [v3 stringWithFormat:@"ratingName - %@, ratingDescription - %@", v4, v5];

  return v6;
}

- (NSString)ratingName
{
  return self->_ratingName;
}

- (void)setRatingName:(id)a3
{
}

- (NSString)ratingDescription
{
  return self->_ratingDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingDescription, 0);
  objc_storeStrong((id *)&self->_ratingName, 0);
}

@end