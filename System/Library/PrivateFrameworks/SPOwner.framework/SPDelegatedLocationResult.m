@interface SPDelegatedLocationResult
+ (BOOL)supportsSecureCoding;
- (NSDate)lastUploadTimestamp;
- (NSDictionary)locationsByUuids;
- (SPDelegatedLocationResult)initWithCoder:(id)a3;
- (SPDelegatedLocationResult)initWithResults:(id)a3;
- (SPDelegatedLocationResult)initWithTimestamp:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLastUploadTimestamp:(id)a3;
- (void)setLocationsByUuids:(id)a3;
@end

@implementation SPDelegatedLocationResult

- (SPDelegatedLocationResult)initWithResults:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SPDelegatedLocationResult;
  v5 = [(SPDelegatedLocationResult *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(SPDelegatedLocationResult *)v5 setLocationsByUuids:v4];
    [(SPDelegatedLocationResult *)v6 setLastUploadTimestamp:0];
  }

  return v6;
}

- (SPDelegatedLocationResult)initWithTimestamp:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SPDelegatedLocationResult;
  v5 = [(SPDelegatedLocationResult *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(SPDelegatedLocationResult *)v5 setLocationsByUuids:0];
    [(SPDelegatedLocationResult *)v6 setLastUploadTimestamp:v4];
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPDelegatedLocationResult)initWithCoder:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUploadTimestamp"];
  [(SPDelegatedLocationResult *)self setLastUploadTimestamp:v5];

  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:3];
  objc_super v8 = objc_msgSend(v6, "setWithArray:", v7, v11, v12);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"locationsByUuids"];

  [(SPDelegatedLocationResult *)self setLocationsByUuids:v9];
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SPDelegatedLocationResult *)self lastUploadTimestamp];
  [v4 encodeObject:v5 forKey:@"lastUploadTimestamp"];

  id v6 = [(SPDelegatedLocationResult *)self locationsByUuids];
  [v4 encodeObject:v6 forKey:@"locationsByUuids"];
}

- (NSDate)lastUploadTimestamp
{
  return self->_lastUploadTimestamp;
}

- (void)setLastUploadTimestamp:(id)a3
{
}

- (NSDictionary)locationsByUuids
{
  return self->_locationsByUuids;
}

- (void)setLocationsByUuids:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationsByUuids, 0);

  objc_storeStrong((id *)&self->_lastUploadTimestamp, 0);
}

@end