@interface SPBeaconIndex
+ (BOOL)supportsSecureCoding;
- (SPBeaconIndex)initWithCoder:(id)a3;
- (SPBeaconIndex)initWithSequence:(unsigned __int8)a3 index:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)index;
- (unsigned)sequence;
- (void)encodeWithCoder:(id)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setSequence:(unsigned __int8)a3;
@end

@implementation SPBeaconIndex

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPBeaconIndex)initWithSequence:(unsigned __int8)a3 index:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SPBeaconIndex;
  result = [(SPBeaconIndex *)&v7 init];
  if (result)
  {
    result->_sequence = a3;
    result->_index = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPBeaconIndex alloc];
  uint64_t sequence = self->_sequence;
  unint64_t index = self->_index;

  return [(SPBeaconIndex *)v4 initWithSequence:sequence index:index];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t sequence = self->_sequence;
  id v5 = a3;
  [v5 encodeInteger:sequence forKey:@"sequence"];
  [v5 encodeInt64:self->_index forKey:@"index"];
}

- (SPBeaconIndex)initWithCoder:(id)a3
{
  id v4 = a3;
  self->_uint64_t sequence = [v4 decodeIntegerForKey:@"sequence"];
  unint64_t v5 = [v4 decodeInt64ForKey:@"index"];

  self->_unint64_t index = v5;
  return self;
}

- (unsigned)sequence
{
  return self->_sequence;
}

- (void)setSequence:(unsigned __int8)a3
{
  self->_uint64_t sequence = a3;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_unint64_t index = a3;
}

@end