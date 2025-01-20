@interface NWCSimpleEntryModel
+ (BOOL)supportsSecureCoding;
- (NSArray)hourlyEntryModels;
- (NWCSimpleEntryModel)initWithCoder:(id)a3;
- (NWCSimpleEntryModel)initWithEntries:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NWCSimpleEntryModel

- (NWCSimpleEntryModel)initWithEntries:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NWCSimpleEntryModel;
  v6 = [(NWCSimpleEntryModel *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_hourlyEntryModels, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NWCSimpleEntryModel)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_hourlyEntryModels);
  v7 = [v4 decodeArrayOfObjectsOfClass:v5 forKey:v6];

  v8 = [[NWCSimpleEntryModel alloc] initWithEntries:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(NWCSimpleEntryModel *)self hourlyEntryModels];
  uint64_t v5 = NSStringFromSelector(sel_hourlyEntryModels);
  [v4 encodeObject:v6 forKey:v5];
}

- (NSArray)hourlyEntryModels
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end