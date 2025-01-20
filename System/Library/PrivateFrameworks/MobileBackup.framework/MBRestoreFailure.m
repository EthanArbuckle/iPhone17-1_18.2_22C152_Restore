@interface MBRestoreFailure
+ (BOOL)supportsSecureCoding;
- (MBRestoreFailure)initWithCoder:(id)a3;
- (MBRestoreFailure)initWithIdentifier:(id)a3 dataclass:(id)a4 assetType:(id)a5 displayName:(id)a6 error:(id)a7;
- (NSData)icon;
- (NSError)error;
- (NSString)assetType;
- (NSString)dataclass;
- (NSString)displayName;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetType:(id)a3;
- (void)setDataclass:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setError:(id)a3;
- (void)setIcon:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation MBRestoreFailure

- (MBRestoreFailure)initWithIdentifier:(id)a3 dataclass:(id)a4 assetType:(id)a5 displayName:(id)a6 error:(id)a7
{
  v15.receiver = self;
  v15.super_class = (Class)MBRestoreFailure;
  v12 = [(MBRestoreFailure *)&v15 init];
  if (v12)
  {
    v12->_identifier = (NSString *)[a3 copy];
    v12->_dataclass = (NSString *)[a4 copy];
    v12->_assetType = (NSString *)[a5 copy];
    v12->_displayName = (NSString *)[a6 copy];
    uint64_t v13 = [a7 copy];
    v12->_icon = 0;
    v12->_error = (NSError *)v13;
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MBRestoreFailure)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MBRestoreFailure;
  v4 = [(MBRestoreFailure *)&v6 init];
  if (v4)
  {
    v4->_identifier = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    v4->_displayName = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    v4->_dataclass = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"dataclass"];
    v4->_assetType = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"assetType"];
    v4->_icon = (NSData *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"icon"];
    v4->_error = (NSError *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_identifier forKey:@"identifier"];
  [a3 encodeObject:self->_displayName forKey:@"displayName"];
  [a3 encodeObject:self->_dataclass forKey:@"dataclass"];
  [a3 encodeObject:self->_assetType forKey:@"assetType"];
  [a3 encodeObject:self->_icon forKey:@"icon"];
  error = self->_error;
  [a3 encodeObject:error forKey:@"error"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MBRestoreFailure);
  [(MBRestoreFailure *)v4 setIdentifier:self->_identifier];
  [(MBRestoreFailure *)v4 setDisplayName:self->_displayName];
  [(MBRestoreFailure *)v4 setDataclass:self->_dataclass];
  [(MBRestoreFailure *)v4 setAssetType:self->_assetType];
  [(MBRestoreFailure *)v4 setIcon:self->_icon];
  [(MBRestoreFailure *)v4 setError:self->_error];
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBRestoreFailure;
  [(MBRestoreFailure *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)MBRestoreFailure;
  id v4 = [(MBRestoreFailure *)&v7 description];
  if (self->_icon) {
    v5 = @"has icon";
  }
  else {
    v5 = @"no icon";
  }
  return (id)[v3 stringWithFormat:@"{ %@, identifier = %@, dataclass = %@, assetType = %@, error = %@, %@ }", v4, self->_identifier, self->_dataclass, self->_assetType, self->_error, v5];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)dataclass
{
  return self->_dataclass;
}

- (void)setDataclass:(id)a3
{
}

- (NSString)assetType
{
  return self->_assetType;
}

- (void)setAssetType:(id)a3
{
}

- (NSData)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

@end