@interface PRChildPosterAttribute
+ (id)decodeObjectWithJSON:(id)a3;
- (NSDate)dateCreated;
- (NSString)attributeType;
- (NSString)providerIdentifier;
- (NSUUID)childPosterUUID;
- (PRChildPosterAttribute)initWithChildPosterUUID:(id)a3 dateCreated:(id)a4 providerIdentifier:(id)a5;
- (id)encodeJSON;
@end

@implementation PRChildPosterAttribute

- (PRChildPosterAttribute)initWithChildPosterUUID:(id)a3 dateCreated:(id)a4 providerIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PRChildPosterAttribute;
  v11 = [(PRChildPosterAttribute *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    childPosterUUID = v11->_childPosterUUID;
    v11->_childPosterUUID = (NSUUID *)v12;

    uint64_t v14 = [v9 copy];
    dateCreated = v11->_dateCreated;
    v11->_dateCreated = (NSDate *)v14;

    uint64_t v16 = [v10 copy];
    providerIdentifier = v11->_providerIdentifier;
    v11->_providerIdentifier = (NSString *)v16;
  }
  return v11;
}

- (NSString)attributeType
{
  return (NSString *)@"PRPosterRoleAttributeTypeChildPosterUUID";
}

+ (id)decodeObjectWithJSON:(id)a3
{
  v3 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:16 error:0];
  v4 = [v3 objectForKey:@"dateCreated"];
  [v4 doubleValue];
  double v6 = v5;

  v7 = [v3 objectForKey:@"UUIDString"];
  id v8 = [v3 objectForKey:@"providerIdentifier"];
  if (v7)
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v7];
    id v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v6];
    v11 = [[PRChildPosterAttribute alloc] initWithChildPosterUUID:v9 dateCreated:v10 providerIdentifier:v8];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)encodeJSON
{
  v15[4] = *MEMORY[0x1E4F143B8];
  if (encodeJSON_onceToken != -1) {
    dispatch_once(&encodeJSON_onceToken, &__block_literal_global_41);
  }
  v3 = (void *)MEMORY[0x1E4F28D90];
  v14[0] = @"dateCreated";
  v4 = (void *)encodeJSON_posixNumberFormatter;
  double v5 = NSNumber;
  [(NSDate *)self->_dateCreated timeIntervalSince1970];
  double v6 = objc_msgSend(v5, "numberWithDouble:");
  v7 = [v4 stringForObjectValue:v6];
  v15[0] = v7;
  v14[1] = @"UUIDString";
  id v8 = [(NSUUID *)self->_childPosterUUID UUIDString];
  providerIdentifier = self->_providerIdentifier;
  v15[1] = v8;
  v15[2] = providerIdentifier;
  v14[2] = @"providerIdentifier";
  v14[3] = @"attributeType";
  id v10 = [(PRChildPosterAttribute *)self attributeType];
  v15[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  uint64_t v12 = [v3 dataWithJSONObject:v11 options:2 error:0];

  return v12;
}

void __36__PRChildPosterAttribute_encodeJSON__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v1 = (void *)encodeJSON_posixNumberFormatter;
  encodeJSON_posixNumberFormatter = (uint64_t)v0;

  v2 = (void *)encodeJSON_posixNumberFormatter;
  id v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];
}

- (NSUUID)childPosterUUID
{
  return self->_childPosterUUID;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_childPosterUUID, 0);
}

@end