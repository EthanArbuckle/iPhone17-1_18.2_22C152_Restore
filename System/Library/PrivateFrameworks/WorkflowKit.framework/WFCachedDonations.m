@interface WFCachedDonations
- (BOOL)isValidWithBallpark:(unint64_t)a3;
- (NSArray)donations;
- (NSDate)fetchDate;
- (WFCachedDonations)initWithDonations:(id)a3 ballpark:(unint64_t)a4;
- (unint64_t)ballpark;
@end

@implementation WFCachedDonations

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchDate, 0);
  objc_storeStrong((id *)&self->_donations, 0);
}

- (unint64_t)ballpark
{
  return self->_ballpark;
}

- (NSDate)fetchDate
{
  return self->_fetchDate;
}

- (NSArray)donations
{
  return self->_donations;
}

- (BOOL)isValidWithBallpark:(unint64_t)a3
{
  if ([(WFCachedDonations *)self ballpark] != a3) {
    return 0;
  }
  v4 = [(WFCachedDonations *)self fetchDate];
  v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-600.0];
  BOOL v6 = [v4 compare:v5] == 1;

  return v6;
}

- (WFCachedDonations)initWithDonations:(id)a3 ballpark:(unint64_t)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFCachedDonations;
  v7 = [(WFCachedDonations *)&v14 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    donations = v7->_donations;
    v7->_donations = (NSArray *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
    fetchDate = v7->_fetchDate;
    v7->_fetchDate = (NSDate *)v10;

    v7->_ballpark = a4;
    v12 = v7;
  }

  return v7;
}

@end