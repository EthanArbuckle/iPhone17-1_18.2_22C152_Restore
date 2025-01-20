@interface FLTMutableCDMCATISwiftBloomFilter
- (FLTCDMCATISwiftBitVector)bit_vector;
- (FLTMutableCDMCATISwiftBloomFilter)init;
- (NSString)name;
- (double)false_positive_rate;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)number_of_bits;
- (unint64_t)number_of_hashes;
- (unint64_t)seed;
- (unsigned)expected_items_buffer;
- (unsigned)expected_number_of_items;
- (unsigned)number_of_items;
- (void)setBit_vector:(id)a3;
- (void)setExpected_items_buffer:(unsigned int)a3;
- (void)setExpected_number_of_items:(unsigned int)a3;
- (void)setFalse_positive_rate:(double)a3;
- (void)setName:(id)a3;
- (void)setNumber_of_bits:(unint64_t)a3;
- (void)setNumber_of_hashes:(unint64_t)a3;
- (void)setNumber_of_items:(unsigned int)a3;
- (void)setSeed:(unint64_t)a3;
@end

@implementation FLTMutableCDMCATISwiftBloomFilter

- (void)setExpected_items_buffer:(unsigned int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (unsigned)expected_items_buffer
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"expected_items_buffer"];
  unsigned int v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setNumber_of_items:(unsigned int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (unsigned)number_of_items
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"number_of_items"];
  unsigned int v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setName:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)name
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"name"];
}

- (void)setFalse_positive_rate:(double)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithDouble:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (double)false_positive_rate
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"false_positive_rate"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (void)setExpected_number_of_items:(unsigned int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (unsigned)expected_number_of_items
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"expected_number_of_items"];
  unsigned int v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setSeed:(unint64_t)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithUnsignedLong:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (unint64_t)seed
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"seed"];
  unint64_t v3 = [v2 unsignedLongValue];

  return v3;
}

- (void)setNumber_of_hashes:(unint64_t)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithUnsignedLong:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (unint64_t)number_of_hashes
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"number_of_hashes"];
  unint64_t v3 = [v2 unsignedLongValue];

  return v3;
}

- (void)setNumber_of_bits:(unint64_t)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithUnsignedLong:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (unint64_t)number_of_bits
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"number_of_bits"];
  unint64_t v3 = [v2 unsignedLongValue];

  return v3;
}

- (void)setBit_vector:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FLTCDMCATISwiftBitVector)bit_vector
{
  return (FLTCDMCATISwiftBitVector *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"bit_vector"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (FLTMutableCDMCATISwiftBloomFilter)init
{
  v6.receiver = self;
  v6.super_class = (Class)FLTMutableCDMCATISwiftBloomFilter;
  v2 = [(FLTMutableCDMCATISwiftBloomFilter *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end