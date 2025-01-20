@interface WLKRottenTomatoesRating
+ (unint64_t)freshnessForString:(id)a3;
- (NSNumber)freshnessPercentage;
- (WLKRottenTomatoesRating)init;
- (WLKRottenTomatoesRating)initWithFreshness:(unint64_t)a3 freshnessPercentage:(id)a4;
- (unint64_t)freshness;
@end

@implementation WLKRottenTomatoesRating

+ (unint64_t)freshnessForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:@"Rotten"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqual:@"Fresh"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqual:@"CertifiedFresh"])
  {
    unint64_t v4 = 3;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (WLKRottenTomatoesRating)initWithFreshness:(unint64_t)a3 freshnessPercentage:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WLKRottenTomatoesRating;
  v8 = [(WLKRottenTomatoesRating *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_freshness = a3;
    objc_storeStrong((id *)&v8->_freshnessPercentage, a4);
  }

  return v9;
}

- (WLKRottenTomatoesRating)init
{
  return [(WLKRottenTomatoesRating *)self initWithFreshness:0 freshnessPercentage:0];
}

- (unint64_t)freshness
{
  return self->_freshness;
}

- (NSNumber)freshnessPercentage
{
  return self->_freshnessPercentage;
}

- (void).cxx_destruct
{
}

@end