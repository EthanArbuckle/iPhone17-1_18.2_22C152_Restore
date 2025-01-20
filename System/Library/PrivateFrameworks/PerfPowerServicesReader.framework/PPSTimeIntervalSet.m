@interface PPSTimeIntervalSet
- (BOOL)intersectsIntervalSet:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)dictionary;
- (PPSTimeInterval)firstInterval;
- (PPSTimeInterval)lastInterval;
- (PPSTimeIntervalCoalescePolicy)coalescePolicy;
- (PPSTimeIntervalSet)initWithCoalescePolicy:(id)a3;
- (PPSTimeIntervalSet)initWithTimeInterval:(id)a3;
- (PPSTimeIntervalSet)initWithTimeInterval:(id)a3 coalescePolicy:(id)a4;
- (PPSTimeIntervalSet)initWithTimeIntervalSet:(id)a3 coalescePolicy:(id)a4;
- (double)duration;
- (double)endTimestamp;
- (double)maximumValue;
- (double)mean;
- (double)minimumValue;
- (double)startTimestamp;
- (double)sum;
- (double)timeWeightedMean;
- (double)timeWeightedSum;
- (id)JSONRepresentation;
- (id)differenceFromIntervalSet:(id)a3;
- (id)filteredIntervalSetUsingPredicate:(id)a3;
- (id)intersectingIntervalForTimeInterval:(id)a3;
- (id)intersectingIntervalForTimestamp:(double)a3;
- (id)intersectionFromIntervalSet:(id)a3;
- (id)unionWithIntervalSet:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation PPSTimeIntervalSet

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return 0;
}

- (PPSTimeIntervalSet)initWithCoalescePolicy:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PPSTimeIntervalSet;
  return [(PPSTimeIntervalSet *)&v4 init];
}

- (PPSTimeIntervalSet)initWithTimeInterval:(id)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = +[PPSTimeIntervalCoalescePolicy legacyPolicy];
  v6 = (PPSTimeIntervalSet *)[v4 initWithCoalescePolicy:v5];

  return v6;
}

- (PPSTimeIntervalSet)initWithTimeInterval:(id)a3 coalescePolicy:(id)a4
{
  id v5 = a4;
  v6 = (PPSTimeIntervalSet *)[objc_alloc((Class)objc_opt_class()) initWithCoalescePolicy:v5];

  return v6;
}

- (PPSTimeIntervalSet)initWithTimeIntervalSet:(id)a3 coalescePolicy:(id)a4
{
  id v5 = a4;
  v6 = (PPSTimeIntervalSet *)[objc_alloc((Class)objc_opt_class()) initWithCoalescePolicy:v5];

  return v6;
}

- (unint64_t)count
{
  return 0;
}

- (NSDictionary)dictionary
{
  return 0;
}

- (double)duration
{
  return 0.0;
}

- (double)endTimestamp
{
  return 0.0;
}

- (PPSTimeInterval)firstInterval
{
  return 0;
}

- (PPSTimeInterval)lastInterval
{
  return 0;
}

- (double)startTimestamp
{
  return 0.0;
}

- (double)timeWeightedMean
{
  return 0.0;
}

- (double)timeWeightedSum
{
  return 0.0;
}

- (BOOL)isEqual:(id)a3
{
  return 0;
}

- (id)JSONRepresentation
{
  return 0;
}

- (id)differenceFromIntervalSet:(id)a3
{
  return 0;
}

- (id)filteredIntervalSetUsingPredicate:(id)a3
{
  return 0;
}

- (id)intersectingIntervalForTimeInterval:(id)a3
{
  return 0;
}

- (id)intersectingIntervalForTimestamp:(double)a3
{
  return 0;
}

- (id)intersectionFromIntervalSet:(id)a3
{
  return 0;
}

- (BOOL)intersectsIntervalSet:(id)a3
{
  return 0;
}

- (id)unionWithIntervalSet:(id)a3
{
  return 0;
}

- (PPSTimeIntervalCoalescePolicy)coalescePolicy
{
  return (PPSTimeIntervalCoalescePolicy *)objc_getProperty(self, a2, 16, 1);
}

- (double)maximumValue
{
  return self->_maximumValue;
}

- (double)mean
{
  return self->_mean;
}

- (double)minimumValue
{
  return self->_minimumValue;
}

- (double)sum
{
  return self->_sum;
}

- (void).cxx_destruct
{
}

@end