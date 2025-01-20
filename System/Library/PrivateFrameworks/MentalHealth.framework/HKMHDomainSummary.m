@interface HKMHDomainSummary
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKMHDomainSummary)initWithCoder:(id)a3;
- (HKMHDomainSummary)initWithDomains:(id)a3 count:(int64_t)a4 totalSampleCount:(int64_t)a5;
- (NSArray)domains;
- (id)description;
- (int64_t)count;
- (int64_t)totalSampleCount;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMHDomainSummary

- (HKMHDomainSummary)initWithDomains:(id)a3 count:(int64_t)a4 totalSampleCount:(int64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKMHDomainSummary;
  v10 = [(HKMHDomainSummary *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_domains, a3);
    v11->_count = a4;
    v11->_totalSampleCount = a5;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    BOOL v6 = [(NSArray *)self->_domains isEqualToArray:v5[1]]
      && self->_count == v5[2]
      && self->_totalSampleCount == v5[3];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_count ^ self->_totalSampleCount ^ [(NSArray *)self->_domains hash];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(NSArray *)self->_domains description];
  BOOL v6 = [NSNumber numberWithInteger:self->_count];
  v7 = [NSNumber numberWithInteger:self->_totalSampleCount];
  v8 = [v3 stringWithFormat:@"<%@:%p Domains:%@ count:%@ total:%@>", v4, self, v5, v6, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMHDomainSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"Count"];
  BOOL v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"Domains"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"TotalSampleCount"];

  v8 = [(HKMHDomainSummary *)self initWithDomains:v6 count:v5 totalSampleCount:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t count = self->_count;
  id v5 = a3;
  [v5 encodeInteger:count forKey:@"Count"];
  [v5 encodeObject:self->_domains forKey:@"Domains"];
  [v5 encodeInteger:self->_totalSampleCount forKey:@"TotalSampleCount"];
}

- (NSArray)domains
{
  return self->_domains;
}

- (int64_t)count
{
  return self->_count;
}

- (int64_t)totalSampleCount
{
  return self->_totalSampleCount;
}

- (void).cxx_destruct
{
}

@end