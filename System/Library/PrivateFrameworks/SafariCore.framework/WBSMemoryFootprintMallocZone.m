@interface WBSMemoryFootprintMallocZone
+ (BOOL)supportsSecureCoding;
- (NSString)name;
- (WBSMemoryFootprintMallocZone)initWithCoder:(id)a3;
- (WBSMemoryFootprintMallocZone)initWithMallocZone:(_malloc_zone_t *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)sizeAllocated;
- (unint64_t)sizeInUse;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSMemoryFootprintMallocZone

- (WBSMemoryFootprintMallocZone)initWithMallocZone:(_malloc_zone_t *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)WBSMemoryFootprintMallocZone;
  v4 = [(WBSMemoryFootprintMallocZone *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_addr = (unint64_t)a3;
    zone_name = malloc_get_zone_name(a3);
    if (zone_name)
    {
      uint64_t v7 = [NSString stringWithUTF8String:zone_name];
      name = v5->_name;
      v5->_name = (NSString *)v7;
    }
    malloc_zone_statistics(a3, &v5->_statistics);
    v9 = v5;
  }

  return v5;
}

- (WBSMemoryFootprintMallocZone)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WBSMemoryFootprintMallocZone;
  v5 = [(WBSMemoryFootprintMallocZone *)&v13 init];
  if (v5)
  {
    v5->_addr = [v4 decodeIntegerForKey:@"addr"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stats"];
    if ((unint64_t)[v8 length] >= 0x20)
    {
      v9 = (_OWORD *)[v8 bytes];
      long long v10 = v9[1];
      *(_OWORD *)&v5->_statistics.blocks_in_use = *v9;
      *(_OWORD *)&v5->_statistics.max_size_in_use = v10;
    }
    objc_super v11 = v5;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t addr = self->_addr;
  id v5 = a3;
  [v5 encodeInteger:addr forKey:@"addr"];
  [v5 encodeObject:self->_name forKey:@"name"];
  id v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&self->_statistics length:32];
  [v5 encodeObject:v6 forKey:@"stats"];
}

- (unint64_t)sizeInUse
{
  return self->_statistics.size_in_use;
}

- (unint64_t)sizeAllocated
{
  return self->_statistics.size_allocated;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [NSNumber numberWithUnsignedLongLong:self->_addr];
  [v3 setObject:v4 forKeyedSubscript:@"addr"];

  id v5 = [NSNumber numberWithUnsignedInt:self->_statistics.blocks_in_use];
  [v3 setObject:v5 forKeyedSubscript:@"blocks_in_use"];

  id v6 = [NSNumber numberWithUnsignedLong:self->_statistics.max_size_in_use];
  [v3 setObject:v6 forKeyedSubscript:@"max_size_in_use"];

  uint64_t v7 = [NSNumber numberWithUnsignedLong:self->_statistics.size_allocated];
  [v3 setObject:v7 forKeyedSubscript:@"size_allocated"];

  v8 = [NSNumber numberWithUnsignedLong:self->_statistics.size_in_use];
  [v3 setObject:v8 forKeyedSubscript:@"size_in_use"];

  [v3 setObject:self->_name forKeyedSubscript:@"name"];
  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end