@interface NWPVarValueItem
+ (BOOL)supportsSecureCoding;
- (NWPVarValueItem)initWithCoder:(id)a3;
- (double)sampleRewardMean;
- (double)sampleRewardSum;
- (double)sampleRewardSumSquares;
- (id)description;
- (unint64_t)armObservedCount;
- (unint64_t)armPullCount;
- (void)encodeWithCoder:(id)a3;
- (void)setArmObservedCount:(unint64_t)a3;
- (void)setArmPullCount:(unint64_t)a3;
- (void)setSampleRewardMean:(double)a3;
- (void)setSampleRewardSum:(double)a3;
- (void)setSampleRewardSumSquares:(double)a3;
@end

@implementation NWPVarValueItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NWPVarValueItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NWPVarValueItem;
  v5 = [(NWPVarValueItem *)&v11 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x2611E0E10]();
    v5->_armPullCount = [v4 decodeInt64ForKey:@"armPullCount"];
    v5->_armObservedCount = [v4 decodeInt64ForKey:@"armObservedCount"];
    [v4 decodeDoubleForKey:@"sampleRewardMean"];
    v5->_sampleRewardMean = v7;
    [v4 decodeDoubleForKey:@"sampleRewardSum"];
    v5->_sampleRewardSum = v8;
    [v4 decodeDoubleForKey:@"sampleRewardSumSquares"];
    v5->_sampleRewardSumSquares = v9;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)MEMORY[0x2611E0E10]();
  objc_msgSend(v5, "encodeInt64:forKey:", -[NWPVarValueItem armPullCount](self, "armPullCount"), @"armPullCount");
  objc_msgSend(v5, "encodeInt64:forKey:", -[NWPVarValueItem armObservedCount](self, "armObservedCount"), @"armObservedCount");
  [(NWPVarValueItem *)self sampleRewardMean];
  objc_msgSend(v5, "encodeDouble:forKey:", @"sampleRewardMean");
  [(NWPVarValueItem *)self sampleRewardSum];
  objc_msgSend(v5, "encodeDouble:forKey:", @"sampleRewardSum");
  [(NWPVarValueItem *)self sampleRewardSumSquares];
  objc_msgSend(v5, "encodeDouble:forKey:", @"sampleRewardSumSquares");
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"pulls: %llu, observed: %llu, mean: %f, sum: %.2f, sum^2: %.2f", self->_armPullCount, self->_armObservedCount, *(void *)&self->_sampleRewardMean, *(void *)&self->_sampleRewardSum, *(void *)&self->_sampleRewardSumSquares];
  return v2;
}

- (unint64_t)armPullCount
{
  return self->_armPullCount;
}

- (void)setArmPullCount:(unint64_t)a3
{
  self->_armPullCount = a3;
}

- (unint64_t)armObservedCount
{
  return self->_armObservedCount;
}

- (void)setArmObservedCount:(unint64_t)a3
{
  self->_armObservedCount = a3;
}

- (double)sampleRewardMean
{
  return self->_sampleRewardMean;
}

- (void)setSampleRewardMean:(double)a3
{
  self->_sampleRewardMean = a3;
}

- (double)sampleRewardSum
{
  return self->_sampleRewardSum;
}

- (void)setSampleRewardSum:(double)a3
{
  self->_sampleRewardSum = a3;
}

- (double)sampleRewardSumSquares
{
  return self->_sampleRewardSumSquares;
}

- (void)setSampleRewardSumSquares:(double)a3
{
  self->_sampleRewardSumSquares = a3;
}

@end