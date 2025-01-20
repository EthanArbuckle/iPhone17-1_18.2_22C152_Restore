@interface PRPosterUsageMetadataAttribute
+ (id)decodeObjectWithJSON:(id)a3;
- (NSDate)creationDate;
- (NSDate)lastActivatedDate;
- (NSDate)lastModifiedDate;
- (NSDate)lastSelectedDate;
- (NSString)attributeType;
- (NSString)description;
- (PRPosterUsageMetadataAttribute)init;
- (id)encodeJSON;
- (id)usageMetadataForUpdatedLastActivatedDate:(id)a3;
- (id)usageMetadataForUpdatedLastModifiedDate:(id)a3;
- (id)usageMetadataWithUpdatedLastActivatedDate;
- (id)usageMetadataWithUpdatedLastModifiedDate;
- (id)usageMetadataWithUpdatedLastSelectedDate;
@end

@implementation PRPosterUsageMetadataAttribute

- (PRPosterUsageMetadataAttribute)init
{
  v6.receiver = self;
  v6.super_class = (Class)PRPosterUsageMetadataAttribute;
  v2 = [(PRPosterUsageMetadataAttribute *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    creationDate = v2->_creationDate;
    v2->_creationDate = (NSDate *)v3;
  }
  return v2;
}

- (id)usageMetadataWithUpdatedLastModifiedDate
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(NSDate *)self->_creationDate copy];
  v5 = (void *)v3[1];
  v3[1] = v4;

  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  v7 = (void *)v3[2];
  v3[2] = v6;

  uint64_t v8 = [(NSDate *)self->_lastSelectedDate copy];
  v9 = (void *)v3[3];
  v3[3] = v8;

  uint64_t v10 = [(NSDate *)self->_lastActivatedDate copy];
  v11 = (void *)v3[4];
  v3[4] = v10;

  return v3;
}

- (id)usageMetadataWithUpdatedLastSelectedDate
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(NSDate *)self->_creationDate copy];
  v5 = (void *)v3[1];
  v3[1] = v4;

  uint64_t v6 = [(NSDate *)self->_lastModifiedDate copy];
  v7 = (void *)v3[2];
  v3[2] = v6;

  uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  v9 = (void *)v3[3];
  v3[3] = v8;

  uint64_t v10 = [(NSDate *)self->_lastActivatedDate copy];
  v11 = (void *)v3[4];
  v3[4] = v10;

  return v3;
}

- (id)usageMetadataWithUpdatedLastActivatedDate
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(NSDate *)self->_creationDate copy];
  v5 = (void *)v3[1];
  v3[1] = v4;

  uint64_t v6 = [(NSDate *)self->_lastModifiedDate copy];
  v7 = (void *)v3[2];
  v3[2] = v6;

  uint64_t v8 = [(NSDate *)self->_lastSelectedDate copy];
  v9 = (void *)v3[3];
  v3[3] = v8;

  uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
  v11 = (void *)v3[4];
  v3[4] = v10;

  return v3;
}

- (id)usageMetadataForUpdatedLastActivatedDate:(id)a3
{
  uint64_t v4 = (NSDate *)a3;
  v5 = objc_opt_new();
  if ([(NSDate *)self->_creationDate compare:v4] == NSOrderedDescending) {
    creationDate = self->_creationDate;
  }
  else {
    creationDate = v4;
  }
  uint64_t v7 = [(NSDate *)creationDate copy];
  uint64_t v8 = (void *)v5[1];
  v5[1] = v7;

  uint64_t v9 = [(NSDate *)self->_lastModifiedDate copy];
  uint64_t v10 = (void *)v5[2];
  v5[2] = v9;

  uint64_t v11 = [(NSDate *)self->_lastSelectedDate copy];
  v12 = (void *)v5[3];
  v5[3] = v11;

  uint64_t v13 = [(NSDate *)v4 copy];
  v14 = (void *)v5[4];
  v5[4] = v13;

  return v5;
}

- (id)usageMetadataForUpdatedLastModifiedDate:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  uint64_t v6 = [(NSDate *)self->_creationDate copy];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [v4 copy];
  uint64_t v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSDate *)self->_lastSelectedDate copy];
  uint64_t v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSDate *)self->_lastActivatedDate copy];
  uint64_t v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(PRPosterUsageMetadataAttribute *)self creationDate];
  id v5 = (id)[v3 appendObject:v4 withName:@"creationDate"];

  uint64_t v6 = [(PRPosterUsageMetadataAttribute *)self lastModifiedDate];
  id v7 = (id)[v3 appendObject:v6 withName:@"lastModifiedDate"];

  uint64_t v8 = [(PRPosterUsageMetadataAttribute *)self lastSelectedDate];
  id v9 = (id)[v3 appendObject:v8 withName:@"lastSelectedDate"];

  uint64_t v10 = [(PRPosterUsageMetadataAttribute *)self lastActivatedDate];
  id v11 = (id)[v3 appendObject:v10 withName:@"lastActivatedDate"];

  uint64_t v12 = [v3 build];

  return (NSString *)v12;
}

- (NSString)attributeType
{
  return (NSString *)@"PRPosterRoleAttributeTypeUsageMetadata";
}

+ (id)decodeObjectWithJSON:(id)a3
{
  if (a3)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:16 error:0];
    if ([v3 count])
    {
      id v4 = [v3 objectForKeyedSubscript:@"creationDate"];
      id v5 = [v3 objectForKeyedSubscript:@"lastModifiedDate"];
      uint64_t v6 = [v3 objectForKeyedSubscript:@"lastSelectedDate"];
      id v7 = [v3 objectForKeyedSubscript:@"lastActivatedDate"];
      uint64_t v8 = objc_opt_new();
      if (v4)
      {
        id v9 = (void *)MEMORY[0x1E4F1C9C8];
        [v4 doubleValue];
        uint64_t v10 = objc_msgSend(v9, "dateWithTimeIntervalSince1970:");
        id v11 = (void *)v8[1];
        v8[1] = v10;
      }
      if (v5)
      {
        uint64_t v12 = (void *)MEMORY[0x1E4F1C9C8];
        [v5 doubleValue];
        uint64_t v13 = objc_msgSend(v12, "dateWithTimeIntervalSince1970:");
        v14 = (void *)v8[2];
        v8[2] = v13;
      }
      if (v6)
      {
        v15 = (void *)MEMORY[0x1E4F1C9C8];
        [v6 doubleValue];
        uint64_t v16 = objc_msgSend(v15, "dateWithTimeIntervalSince1970:");
        v17 = (void *)v8[3];
        v8[3] = v16;
      }
      if (v7)
      {
        v18 = (void *)MEMORY[0x1E4F1C9C8];
        [v7 doubleValue];
        uint64_t v19 = objc_msgSend(v18, "dateWithTimeIntervalSince1970:");
        v20 = (void *)v8[4];
        v8[4] = v19;
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (id)encodeJSON
{
  uint64_t v3 = objc_opt_new();
  creationDate = self->_creationDate;
  if (creationDate)
  {
    id v5 = NSNumber;
    [(NSDate *)creationDate timeIntervalSince1970];
    uint64_t v6 = objc_msgSend(v5, "numberWithDouble:");
    [v3 setObject:v6 forKeyedSubscript:@"creationDate"];
  }
  lastModifiedDate = self->_lastModifiedDate;
  if (lastModifiedDate)
  {
    uint64_t v8 = NSNumber;
    [(NSDate *)lastModifiedDate timeIntervalSince1970];
    id v9 = objc_msgSend(v8, "numberWithDouble:");
    [v3 setObject:v9 forKeyedSubscript:@"lastModifiedDate"];
  }
  lastSelectedDate = self->_lastSelectedDate;
  if (lastSelectedDate)
  {
    id v11 = NSNumber;
    [(NSDate *)lastSelectedDate timeIntervalSince1970];
    uint64_t v12 = objc_msgSend(v11, "numberWithDouble:");
    [v3 setObject:v12 forKeyedSubscript:@"lastSelectedDate"];
  }
  lastActivatedDate = self->_lastActivatedDate;
  if (lastActivatedDate)
  {
    v14 = NSNumber;
    [(NSDate *)lastActivatedDate timeIntervalSince1970];
    v15 = objc_msgSend(v14, "numberWithDouble:");
    [v3 setObject:v15 forKeyedSubscript:@"lastActivatedDate"];
  }
  uint64_t v16 = [(PRPosterUsageMetadataAttribute *)self attributeType];
  [v3 setObject:v16 forKey:@"attributeType"];

  v17 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:0 error:0];

  return v17;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (NSDate)lastSelectedDate
{
  return self->_lastSelectedDate;
}

- (NSDate)lastActivatedDate
{
  return self->_lastActivatedDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActivatedDate, 0);
  objc_storeStrong((id *)&self->_lastSelectedDate, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end