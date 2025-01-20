@interface ML3ClientImportResult
+ (BOOL)supportsSecureCoding;
- (BOOL)success;
- (ML3ClientImportResult)initWithCoder:(id)a3;
- (ML3ClientImportResult)initWithSuccess:(BOOL)a3 resultingDatabasePersistentIDs:(id)a4;
- (NSDictionary)resultingDatabasePersistentIDs;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ML3ClientImportResult

- (void).cxx_destruct
{
}

- (NSDictionary)resultingDatabasePersistentIDs
{
  return self->_resultingDatabasePersistentIDs;
}

- (BOOL)success
{
  return self->_success;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL success = self->_success;
  id v5 = a3;
  [v5 encodeBool:success forKey:@"success"];
  [v5 encodeObject:self->_resultingDatabasePersistentIDs forKey:@"persistentIDs"];
}

- (ML3ClientImportResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ML3ClientImportResult;
  id v5 = [(ML3ClientImportResult *)&v13 init];
  if (v5)
  {
    v5->_BOOL success = [v4 decodeBoolForKey:@"success"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"persistentIDs"];
    resultingDatabasePersistentIDs = v5->_resultingDatabasePersistentIDs;
    v5->_resultingDatabasePersistentIDs = (NSDictionary *)v10;
  }
  return v5;
}

- (ML3ClientImportResult)initWithSuccess:(BOOL)a3 resultingDatabasePersistentIDs:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(ML3ClientImportResult *)self init];
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_BOOL success = a3;
    uint64_t v9 = [v6 copy];
    resultingDatabasePersistentIDs = v8->_resultingDatabasePersistentIDs;
    v8->_resultingDatabasePersistentIDs = (NSDictionary *)v9;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end