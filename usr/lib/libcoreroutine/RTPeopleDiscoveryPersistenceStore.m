@interface RTPeopleDiscoveryPersistenceStore
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (RTPeopleDensityRecord)densityRecord;
- (RTPeopleDiscoveryContactRecord)contactRecord;
- (RTPeopleDiscoveryPersistenceStore)initWithCoder:(id)a3;
- (RTPeopleDiscoveryPersistenceStore)initWithContactRecord:(id)a3 densityRecord:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setContactRecord:(id)a3;
- (void)setDensityRecord:(id)a3;
@end

@implementation RTPeopleDiscoveryPersistenceStore

- (RTPeopleDiscoveryPersistenceStore)initWithContactRecord:(id)a3 densityRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RTPeopleDiscoveryPersistenceStore;
  v8 = [(RTPeopleDiscoveryPersistenceStore *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(RTPeopleDiscoveryPersistenceStore *)v8 setContactRecord:v6];
    [(RTPeopleDiscoveryPersistenceStore *)v9 setDensityRecord:v7];
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RTPeopleDiscoveryPersistenceStore *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(RTPeopleDiscoveryPersistenceStore *)self contactRecord];
      id v7 = [(RTPeopleDiscoveryPersistenceStore *)v5 contactRecord];
      if ([v6 isEqual:v7])
      {
        v8 = [(RTPeopleDiscoveryPersistenceStore *)self densityRecord];
        v9 = [(RTPeopleDiscoveryPersistenceStore *)v5 densityRecord];
        char v10 = [v8 isEqual:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTPeopleDiscoveryPersistenceStore)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RTPeopleDiscoveryPersistenceStore;
  v5 = [(RTPeopleDiscoveryPersistenceStore *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ContactRecord"];
    contactRecord = v5->_contactRecord;
    v5->_contactRecord = (RTPeopleDiscoveryContactRecord *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DensityRecord"];
    densityRecord = v5->_densityRecord;
    v5->_densityRecord = (RTPeopleDensityRecord *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  contactRecord = self->_contactRecord;
  id v5 = a3;
  [v5 encodeObject:contactRecord forKey:@"ContactRecord"];
  [v5 encodeObject:self->_densityRecord forKey:@"DensityRecord"];
}

- (RTPeopleDiscoveryContactRecord)contactRecord
{
  return self->_contactRecord;
}

- (void)setContactRecord:(id)a3
{
}

- (RTPeopleDensityRecord)densityRecord
{
  return self->_densityRecord;
}

- (void)setDensityRecord:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_densityRecord, 0);

  objc_storeStrong((id *)&self->_contactRecord, 0);
}

@end