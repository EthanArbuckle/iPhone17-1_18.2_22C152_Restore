@interface SPLocationFetchContext
+ (BOOL)supportsSecureCoding;
- (BOOL)reportDeviceEvents;
- (BOOL)subscribe;
- (NSArray)searchIdentifiers;
- (NSArray)searchLocationSources;
- (NSArray)searchPriority;
- (NSArray)searchTypes;
- (NSDictionary)lastOnlineLocationInfo;
- (NSString)bundleIdentifier;
- (NSString)cachePolicy;
- (SPLocationFetchContext)initWithCoder:(id)a3;
- (_NSRange)primaryIndexRange;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCachePolicy:(id)a3;
- (void)setLastOnlineLocationInfo:(id)a3;
- (void)setPrimaryIndexRange:(_NSRange)a3;
- (void)setReportDeviceEvents:(BOOL)a3;
- (void)setSearchIdentifiers:(id)a3;
- (void)setSearchLocationSources:(id)a3;
- (void)setSearchPriority:(id)a3;
- (void)setSearchTypes:(id)a3;
- (void)setSubscribe:(BOOL)a3;
@end

@implementation SPLocationFetchContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPLocationFetchContext)initWithCoder:(id)a3
{
  v37[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cachePolicy"];
  [(SPLocationFetchContext *)self setCachePolicy:v5];

  v6 = (void *)MEMORY[0x1E4F1CAD0];
  v37[0] = objc_opt_class();
  v37[1] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
  v8 = [v6 setWithArray:v7];
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"searchIdentifiers"];
  [(SPLocationFetchContext *)self setSearchIdentifiers:v9];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  v12 = [v10 setWithArray:v11];
  v13 = [v4 decodeObjectOfClasses:v12 forKey:@"searchPriority"];
  [(SPLocationFetchContext *)self setSearchPriority:v13];

  v14 = (void *)MEMORY[0x1E4F1CAD0];
  v35[0] = objc_opt_class();
  v35[1] = objc_opt_class();
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  v16 = [v14 setWithArray:v15];
  v17 = [v4 decodeObjectOfClasses:v16 forKey:@"searchTypes"];
  [(SPLocationFetchContext *)self setSearchTypes:v17];

  v18 = (void *)MEMORY[0x1E4F1CAD0];
  v34[0] = objc_opt_class();
  v34[1] = objc_opt_class();
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  v20 = [v18 setWithArray:v19];
  v21 = [v4 decodeObjectOfClasses:v20 forKey:@"searchLocationSources"];
  [(SPLocationFetchContext *)self setSearchLocationSources:v21];

  v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
  [(SPLocationFetchContext *)self setBundleIdentifier:v22];

  -[SPLocationFetchContext setSubscribe:](self, "setSubscribe:", [v4 decodeBoolForKey:@"subscribe"]);
  -[SPLocationFetchContext setReportDeviceEvents:](self, "setReportDeviceEvents:", [v4 decodeBoolForKey:@"reportDeviceEvents"]);
  [v4 decodeFloatForKey:@"primaryIndexRangeStart"];
  unint64_t v24 = (unint64_t)v23;
  [v4 decodeFloatForKey:@"primaryIndexRangeLength"];
  -[SPLocationFetchContext setPrimaryIndexRange:](self, "setPrimaryIndexRange:", v24, (unint64_t)v25);
  v26 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v31 = objc_opt_class();
  uint64_t v32 = objc_opt_class();
  uint64_t v33 = objc_opt_class();
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:3];
  v28 = objc_msgSend(v26, "setWithArray:", v27, v31, v32);
  v29 = [v4 decodeObjectOfClasses:v28 forKey:@"lastOnlineLocationInfo"];

  [(SPLocationFetchContext *)self setLastOnlineLocationInfo:v29];
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v14 = a3;
  id v4 = [(SPLocationFetchContext *)self cachePolicy];
  [v14 encodeObject:v4 forKey:@"cachePolicy"];

  v5 = [(SPLocationFetchContext *)self searchIdentifiers];
  [v14 encodeObject:v5 forKey:@"searchIdentifiers"];

  v6 = [(SPLocationFetchContext *)self searchPriority];
  [v14 encodeObject:v6 forKey:@"searchPriority"];

  v7 = [(SPLocationFetchContext *)self searchTypes];
  [v14 encodeObject:v7 forKey:@"searchTypes"];

  v8 = [(SPLocationFetchContext *)self searchLocationSources];
  [v14 encodeObject:v8 forKey:@"searchLocationSources"];

  v9 = [(SPLocationFetchContext *)self bundleIdentifier];
  [v14 encodeObject:v9 forKey:@"bundleIdentifier"];

  objc_msgSend(v14, "encodeBool:forKey:", -[SPLocationFetchContext subscribe](self, "subscribe"), @"subscribe");
  objc_msgSend(v14, "encodeBool:forKey:", -[SPLocationFetchContext reportDeviceEvents](self, "reportDeviceEvents"), @"reportDeviceEvents");
  v10 = [(SPLocationFetchContext *)self lastOnlineLocationInfo];
  [v14 encodeObject:v10 forKey:@"lastOnlineLocationInfo"];

  *(float *)&double v11 = (float)(unint64_t)[(SPLocationFetchContext *)self primaryIndexRange];
  [v14 encodeFloat:@"primaryIndexRangeStart" forKey:v11];
  [(SPLocationFetchContext *)self primaryIndexRange];
  *(float *)&double v13 = (float)v12;
  [v14 encodeFloat:@"primaryIndexRangeLength" forKey:v13];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  v5 = [(SPLocationFetchContext *)self cachePolicy];
  [v4 setCachePolicy:v5];

  v6 = [(SPLocationFetchContext *)self searchIdentifiers];
  [v4 setSearchIdentifiers:v6];

  v7 = [(SPLocationFetchContext *)self searchPriority];
  [v4 setSearchPriority:v7];

  v8 = [(SPLocationFetchContext *)self searchTypes];
  [v4 setSearchTypes:v8];

  v9 = [(SPLocationFetchContext *)self searchLocationSources];
  [v4 setSearchLocationSources:v9];

  v10 = [(SPLocationFetchContext *)self bundleIdentifier];
  [v4 setBundleIdentifier:v10];

  objc_msgSend(v4, "setSubscribe:", -[SPLocationFetchContext subscribe](self, "subscribe"));
  objc_msgSend(v4, "setReportDeviceEvents:", -[SPLocationFetchContext reportDeviceEvents](self, "reportDeviceEvents"));
  double v11 = [(SPLocationFetchContext *)self lastOnlineLocationInfo];
  [v4 setLastOnlineLocationInfo:v11];

  uint64_t v12 = [(SPLocationFetchContext *)self primaryIndexRange];
  objc_msgSend(v4, "setPrimaryIndexRange:", v12, v13);
  return v4;
}

- (NSString)cachePolicy
{
  return self->_cachePolicy;
}

- (void)setCachePolicy:(id)a3
{
}

- (NSArray)searchIdentifiers
{
  return self->_searchIdentifiers;
}

- (void)setSearchIdentifiers:(id)a3
{
}

- (NSArray)searchPriority
{
  return self->_searchPriority;
}

- (void)setSearchPriority:(id)a3
{
}

- (NSArray)searchTypes
{
  return self->_searchTypes;
}

- (void)setSearchTypes:(id)a3
{
}

- (NSArray)searchLocationSources
{
  return self->_searchLocationSources;
}

- (void)setSearchLocationSources:(id)a3
{
}

- (NSDictionary)lastOnlineLocationInfo
{
  return self->_lastOnlineLocationInfo;
}

- (void)setLastOnlineLocationInfo:(id)a3
{
}

- (_NSRange)primaryIndexRange
{
  NSUInteger length = self->_primaryIndexRange.length;
  NSUInteger location = self->_primaryIndexRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setPrimaryIndexRange:(_NSRange)a3
{
  self->_primaryIndexRange = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (BOOL)subscribe
{
  return self->_subscribe;
}

- (void)setSubscribe:(BOOL)a3
{
  self->_subscribe = a3;
}

- (BOOL)reportDeviceEvents
{
  return self->_reportDeviceEvents;
}

- (void)setReportDeviceEvents:(BOOL)a3
{
  self->_reportDeviceEvents = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_lastOnlineLocationInfo, 0);
  objc_storeStrong((id *)&self->_searchLocationSources, 0);
  objc_storeStrong((id *)&self->_searchTypes, 0);
  objc_storeStrong((id *)&self->_searchPriority, 0);
  objc_storeStrong((id *)&self->_searchIdentifiers, 0);

  objc_storeStrong((id *)&self->_cachePolicy, 0);
}

@end