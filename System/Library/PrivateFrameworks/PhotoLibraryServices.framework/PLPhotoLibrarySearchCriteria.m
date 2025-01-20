@interface PLPhotoLibrarySearchCriteria
+ (BOOL)supportsSecureCoding;
- (NSDictionary)internalTestOptions;
- (NSString)containerIdentifier;
- (NSString)uuid;
- (PLPhotoLibrarySearchCriteria)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (int64_t)domain;
- (void)encodeWithCoder:(id)a3;
- (void)setContainerIdentifier:(id)a3;
- (void)setDomain:(int64_t)a3;
- (void)setInternalTestOptions:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation PLPhotoLibrarySearchCriteria

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalTestOptions, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setInternalTestOptions:(id)a3
{
}

- (NSDictionary)internalTestOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setContainerIdentifier:(id)a3
{
}

- (NSString)containerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDomain:(int64_t)a3
{
  self->_domain = a3;
}

- (int64_t)domain
{
  return self->_domain;
}

- (void)setUuid:(id)a3
{
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(PLPhotoLibrarySearchCriteria *)self uuid];
  [v4 setUuid:v5];

  objc_msgSend(v4, "setDomain:", -[PLPhotoLibrarySearchCriteria domain](self, "domain"));
  v6 = [(PLPhotoLibrarySearchCriteria *)self containerIdentifier];
  [v4 setContainerIdentifier:v6];

  v7 = [(PLPhotoLibrarySearchCriteria *)self internalTestOptions];
  [v4 setInternalTestOptions:v7];

  return v4;
}

- (PLPhotoLibrarySearchCriteria)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PLPhotoLibrarySearchCriteria;
  v5 = [(PLPhotoLibrarySearchCriteria *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v6;

    v5->_domain = [v4 decodeIntegerForKey:@"domain"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containerIdentifier"];
    containerIdentifier = v5->_containerIdentifier;
    v5->_containerIdentifier = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"internalTestOptions"];
    internalTestOptions = v5->_internalTestOptions;
    v5->_internalTestOptions = (NSDictionary *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PLPhotoLibrarySearchCriteria *)self uuid];
  [v4 encodeObject:v5 forKey:@"uuid"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[PLPhotoLibrarySearchCriteria domain](self, "domain"), @"domain");
  uint64_t v6 = [(PLPhotoLibrarySearchCriteria *)self containerIdentifier];
  [v4 encodeObject:v6 forKey:@"containerIdentifier"];

  id v7 = [(PLPhotoLibrarySearchCriteria *)self internalTestOptions];
  [v4 encodeObject:v7 forKey:@"internalTestOptions"];
}

- (id)debugDescription
{
  v12.receiver = self;
  v12.super_class = (Class)PLPhotoLibrarySearchCriteria;
  v3 = [(PLPhotoLibrarySearchCriteria *)&v12 description];
  id v4 = [(PLPhotoLibrarySearchCriteria *)self uuid];
  int64_t v5 = [(PLPhotoLibrarySearchCriteria *)self domain];
  uint64_t v6 = [(PLPhotoLibrarySearchCriteria *)self containerIdentifier];
  uint64_t v7 = [(PLPhotoLibrarySearchCriteria *)self internalTestOptions];
  uint64_t v8 = (void *)v7;
  v9 = &stru_1EEB2EB80;
  if (v7) {
    v9 = (__CFString *)v7;
  }
  v10 = [v3 stringByAppendingFormat:@": UUID:[%@] domain:[%d] container:[%@] %@", v4, v5, v6, v9];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end