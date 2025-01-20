@interface TRIDiskUsage
+ (id)usageWithNaiveSum:(unint64_t)a3 deduplicatedSum:(unint64_t)a4 compressedSum:(unint64_t)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToUsage:(id)a3;
- (TRIDiskUsage)initWithNaiveSum:(unint64_t)a3 deduplicatedSum:(unint64_t)a4 compressedSum:(unint64_t)a5;
- (id)copyWithReplacementCompressedSum:(unint64_t)a3;
- (id)copyWithReplacementDeduplicatedSum:(unint64_t)a3;
- (id)copyWithReplacementNaiveSum:(unint64_t)a3;
- (id)description;
- (unint64_t)compressedSum;
- (unint64_t)deduplicatedSum;
- (unint64_t)hash;
- (unint64_t)naiveSum;
@end

@implementation TRIDiskUsage

- (TRIDiskUsage)initWithNaiveSum:(unint64_t)a3 deduplicatedSum:(unint64_t)a4 compressedSum:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)TRIDiskUsage;
  result = [(TRIDiskUsage *)&v9 init];
  if (result)
  {
    result->_naiveSum = a3;
    result->_deduplicatedSum = a4;
    result->_compressedSum = a5;
  }
  return result;
}

+ (id)usageWithNaiveSum:(unint64_t)a3 deduplicatedSum:(unint64_t)a4 compressedSum:(unint64_t)a5
{
  v5 = (void *)[objc_alloc((Class)a1) initWithNaiveSum:a3 deduplicatedSum:a4 compressedSum:a5];
  return v5;
}

- (id)copyWithReplacementNaiveSum:(unint64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  unint64_t deduplicatedSum = self->_deduplicatedSum;
  unint64_t compressedSum = self->_compressedSum;
  return (id)[v5 initWithNaiveSum:a3 deduplicatedSum:deduplicatedSum compressedSum:compressedSum];
}

- (id)copyWithReplacementDeduplicatedSum:(unint64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  unint64_t naiveSum = self->_naiveSum;
  unint64_t compressedSum = self->_compressedSum;
  return (id)[v5 initWithNaiveSum:naiveSum deduplicatedSum:a3 compressedSum:compressedSum];
}

- (id)copyWithReplacementCompressedSum:(unint64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  unint64_t naiveSum = self->_naiveSum;
  unint64_t deduplicatedSum = self->_deduplicatedSum;
  return (id)[v5 initWithNaiveSum:naiveSum deduplicatedSum:deduplicatedSum compressedSum:a3];
}

- (BOOL)isEqualToUsage:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4
    && (unint64_t naiveSum = self->_naiveSum, naiveSum == [v4 naiveSum])
    && (unint64_t deduplicatedSum = self->_deduplicatedSum, deduplicatedSum == [v5 deduplicatedSum]))
  {
    unint64_t compressedSum = self->_compressedSum;
    BOOL v9 = compressedSum == [v5 compressedSum];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIDiskUsage *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIDiskUsage *)self isEqualToUsage:v5];

  return v6;
}

- (unint64_t)hash
{
  unint64_t v2 = self->_deduplicatedSum - self->_naiveSum + 32 * self->_naiveSum;
  return self->_compressedSum - v2 + 32 * v2;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [NSNumber numberWithUnsignedLongLong:self->_naiveSum];
  id v5 = [NSNumber numberWithUnsignedLongLong:self->_deduplicatedSum];
  BOOL v6 = [NSNumber numberWithUnsignedLongLong:self->_compressedSum];
  v7 = (void *)[v3 initWithFormat:@"<TRIDiskUsage | naiveSum:%@ deduplicatedSum:%@ compressedSum:%@>", v4, v5, v6];

  return v7;
}

- (unint64_t)naiveSum
{
  return self->_naiveSum;
}

- (unint64_t)deduplicatedSum
{
  return self->_deduplicatedSum;
}

- (unint64_t)compressedSum
{
  return self->_compressedSum;
}

@end