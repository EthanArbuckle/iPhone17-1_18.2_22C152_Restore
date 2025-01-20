@interface PPScoredLocation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToScoredLocation:(id)a3;
- (PPLocation)location;
- (PPScoredLocation)initWithCoder:(id)a3;
- (PPScoredLocation)initWithLocation:(id)a3 score:(double)a4 sentimentScore:(double)a5;
- (double)score;
- (double)sentimentScore;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPScoredLocation

- (void).cxx_destruct
{
}

- (double)sentimentScore
{
  return self->_sentimentScore;
}

- (double)score
{
  return self->_score;
}

- (PPLocation)location
{
  return self->_location;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PPLocation *)self->_location hash];
  v4 = [NSNumber numberWithDouble:self->_score];
  uint64_t v5 = [v4 hash] - v3 + 32 * v3;

  v6 = [NSNumber numberWithDouble:self->_sentimentScore];
  unint64_t v7 = [v6 hash] - v5 + 32 * v5;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PPScoredLocation *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PPScoredLocation *)self isEqualToScoredLocation:v5];

  return v6;
}

- (BOOL)isEqualToScoredLocation:(id)a3
{
  v4 = (double *)a3;
  BOOL v5 = v4
    && [(PPLocation *)self->_location isEqualToLocation:*((void *)v4 + 1)]
    && self->_score == v4[2]
    && self->_sentimentScore == v4[3];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  location = self->_location;
  id v5 = a3;
  [v5 encodeObject:location forKey:@"loc"];
  [v5 encodeDouble:@"scr" forKey:self->_score];
  [v5 encodeDouble:@"sent" forKey:self->_sentimentScore];
}

- (PPScoredLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"loc"];
  [v4 decodeDoubleForKey:@"scr"];
  double v7 = v6;
  [v4 decodeDoubleForKey:@"sent"];
  double v9 = v8;

  if (v5)
  {
    self = [(PPScoredLocation *)self initWithLocation:v5 score:v7 sentimentScore:v9];
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (PPScoredLocation)initWithLocation:(id)a3 score:(double)a4 sentimentScore:(double)a5
{
  id v10 = a3;
  if (!v10)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PPScoredLocation.m", 25, @"Invalid parameter not satisfying: %@", @"location" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)PPScoredLocation;
  v11 = [(PPScoredLocation *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_location, a3);
    v12->_score = a4;
    v12->_sentimentScore = a5;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end