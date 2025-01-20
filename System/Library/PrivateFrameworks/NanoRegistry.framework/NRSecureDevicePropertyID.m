@interface NRSecureDevicePropertyID
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NRSecureDevicePropertyID)init;
- (NRSecureDevicePropertyID)initWithCoder:(id)a3;
- (NRSecureDevicePropertyID)initWithData:(id)a3;
- (NRSecureDevicePropertyID)initWithPropertyString:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)data;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NRSecureDevicePropertyID

- (NRSecureDevicePropertyID)init
{
  v6.receiver = self;
  v6.super_class = (Class)NRSecureDevicePropertyID;
  v2 = [(NRSecureDevicePropertyID *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v3;
  }
  return v2;
}

- (NRSecureDevicePropertyID)initWithPropertyString:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NRSecureDevicePropertyID;
  v5 = [(NRSecureDevicePropertyID *)&v10 init];
  if (v5
    && (uint64_t v6 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v4],
        uuid = v5->_uuid,
        v5->_uuid = (NSUUID *)v6,
        uuid,
        !v5->_uuid))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (NRSecureDevicePropertyID)initWithData:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NRSecureDevicePropertyID;
  v5 = [(NRSecureDevicePropertyID *)&v10 init];
  if (v5
    && ([v4 toUUID],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        uuid = v5->_uuid,
        v5->_uuid = (NSUUID *)v6,
        uuid,
        !v5->_uuid))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (id)data
{
  return (id)[MEMORY[0x1E4F1C9B8] fromUUID:self->_uuid];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NRSecureDevicePropertyID)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NRSecureDevicePropertyID *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    +[NRUnarchivedObjectVerifier unarchivingVerifyObjectIsNotNil:v5->_uuid name:@"secure property UUID" owner:v5];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSUUID *)self->_uuid copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_uuid hash];
}

- (id)description
{
  v2 = [(NSUUID *)self->_uuid UUIDString];
  uint64_t v3 = [@"Secure property ID: " stringByAppendingString:v2];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NRSecureDevicePropertyID *)a3;
  if (v4 == self) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v6 = 0;
    goto LABEL_7;
  }
  uuid = self->_uuid;
  if (uuid == v4->_uuid) {
LABEL_5:
  }
    char v6 = 1;
  else {
    char v6 = -[NSUUID isEqual:](uuid, "isEqual:");
  }
LABEL_7:

  return v6;
}

- (void).cxx_destruct
{
}

@end