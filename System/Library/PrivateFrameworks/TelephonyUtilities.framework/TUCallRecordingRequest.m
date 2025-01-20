@interface TUCallRecordingRequest
+ (BOOL)supportsSecureCoding;
- (NSUUID)UUID;
- (NSUUID)callUUID;
- (TUCallRecordingRequest)initWithCall:(id)a3;
- (TUCallRecordingRequest)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCallUUID:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation TUCallRecordingRequest

- (TUCallRecordingRequest)initWithCall:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TUCallRecordingRequest;
  v5 = [(TUCallRecordingRequest *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    id v8 = objc_alloc(MEMORY[0x1E4F29128]);
    v9 = [v4 uniqueProxyIdentifier];
    uint64_t v10 = [v8 initWithUUIDString:v9];
    callUUID = v5->_callUUID;
    v5->_callUUID = (NSUUID *)v10;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  id v4 = [(TUCallRecordingRequest *)self UUID];
  [v3 appendFormat:@" UUID=%@", v4];

  v5 = [(TUCallRecordingRequest *)self callUUID];
  [v3 appendFormat:@" callUUID=%@", v5];

  [v3 appendString:@">"];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  UUID = self->_UUID;
  id v5 = a3;
  [v5 encodeObject:UUID forKey:@"UUID"];
  [v5 encodeObject:self->_callUUID forKey:@"callUUID"];
}

- (TUCallRecordingRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallRecordingRequest *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callUUID"];
    callUUID = v5->_callUUID;
    v5->_callUUID = (NSUUID *)v8;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = [(TUCallRecordingRequest *)self UUID];
  [v4 setUUID:v5];

  uint64_t v6 = [(TUCallRecordingRequest *)self callUUID];
  [v4 setCallUUID:v6];

  return v4;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (NSUUID)callUUID
{
  return self->_callUUID;
}

- (void)setCallUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callUUID, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end