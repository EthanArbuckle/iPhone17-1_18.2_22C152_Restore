@interface MOEventLifeEvents
+ (BOOL)supportsSecureCoding;
+ (id)descriptionOfLifeEventCategory:(unint64_t)a3;
- (MOEventLifeEvents)initWithCoder:(id)a3;
- (double)confidenceScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)lifeEventCategory;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidenceScore:(double)a3;
- (void)setLifeEventCategory:(unint64_t)a3;
@end

@implementation MOEventLifeEvents

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t lifeEventCategory = self->_lifeEventCategory;
  id v6 = a3;
  [v6 encodeInteger:lifeEventCategory forKey:@"lifeEventCategory"];
  double confidenceScore = self->_confidenceScore;
  *(float *)&double confidenceScore = confidenceScore;
  [v6 encodeFloat:@"confidenceScore" forKey:confidenceScore];
}

- (MOEventLifeEvents)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MOEventLifeEvents;
  v5 = [(MOEventLifeEvents *)&v8 init];
  if (v5)
  {
    v5->_unint64_t lifeEventCategory = [v4 decodeIntegerForKey:@"lifeEventCategory"];
    [v4 decodeFloatForKey:@"confidenceScore"];
    v5->_double confidenceScore = v6;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init(MOEventLifeEvents);
  *((void *)result + 1) = self->_lifeEventCategory;
  *((void *)result + 2) = *(void *)&self->_confidenceScore;
  return result;
}

+ (id)descriptionOfLifeEventCategory:(unint64_t)a3
{
  if (a3 > 4) {
    return @"Invalid";
  }
  else {
    return off_1E691F1E0[a3];
  }
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = +[MOEventLifeEvents descriptionOfLifeEventCategory:self->_lifeEventCategory];
  v5 = (void *)[v3 initWithFormat:@"life event category, %@, confidence score, %f", v4, *(void *)&self->_confidenceScore];

  return v5;
}

- (unint64_t)lifeEventCategory
{
  return self->_lifeEventCategory;
}

- (void)setLifeEventCategory:(unint64_t)a3
{
  self->_unint64_t lifeEventCategory = a3;
}

- (double)confidenceScore
{
  return self->_confidenceScore;
}

- (void)setConfidenceScore:(double)a3
{
  self->_double confidenceScore = a3;
}

@end