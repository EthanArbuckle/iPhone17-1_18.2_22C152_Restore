@interface NPSFileBackupMetadata
+ (BOOL)supportsSecureCoding;
- (NPSFileBackupMetadata)initWithCoder:(id)a3;
- (NSURL)url;
- (NSUUID)uuid;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setUrl:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation NPSFileBackupMetadata

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(NSUUID *)self->_uuid UUIDString];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ %p; uuid = (%@); url = (%@)>",
    v4,
    self,
    v5,
  v6 = self->_url);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uuid = self->_uuid;
  id v5 = a3;
  [v5 encodeObject:uuid forKey:@"uuid"];
  [v5 encodeObject:self->_url forKey:@"url"];
}

- (NPSFileBackupMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NPSFileBackupMetadata;
  id v5 = [(NPSFileBackupMetadata *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    url = v5->_url;
    v5->_url = (NSURL *)v8;
  }
  return v5;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end