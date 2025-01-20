@interface UPModelIdentifier
- (BOOL)isEqual:(id)a3;
- (NSString)appBundleId;
- (NSUUID)uuid;
- (UPModelIdentifier)initWithAppBundleId:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation UPModelIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (NSString)appBundleId
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_uuid hash];
  return [(NSString *)self->_appBundleId hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [v4 uuid];
  if ([v5 isEqual:self->_uuid])
  {
    v6 = [v4 appBundleId];
    char v7 = [v6 isEqualToString:self->_appBundleId];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[UPModelIdentifier allocWithZone:](UPModelIdentifier, "allocWithZone:") init];
  uint64_t v6 = [(NSUUID *)self->_uuid copyWithZone:a3];
  uuid = v5->_uuid;
  v5->_uuid = (NSUUID *)v6;

  uint64_t v8 = [(NSString *)self->_appBundleId copyWithZone:a3];
  appBundleId = v5->_appBundleId;
  v5->_appBundleId = (NSString *)v8;

  return v5;
}

- (UPModelIdentifier)initWithAppBundleId:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UPModelIdentifier;
  uint64_t v6 = [(UPModelIdentifier *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
    uuid = v6->_uuid;
    v6->_uuid = (NSUUID *)v7;

    objc_storeStrong((id *)&v6->_appBundleId, a3);
  }

  return v6;
}

@end