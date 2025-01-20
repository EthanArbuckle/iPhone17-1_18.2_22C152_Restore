@interface NARWorkspaceInfo
+ (BOOL)supportsSecureCoding;
- (NARWorkspaceInfo)initWithApplications:(id)a3 UUID:(id)a4 sequenceNumber:(id)a5;
- (NARWorkspaceInfo)initWithCoder:(id)a3;
- (NSArray)applications;
- (NSArray)standaloneGlances;
- (NSNumber)sequenceNumber;
- (NSUUID)UUID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NARWorkspaceInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NARWorkspaceInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NARWorkspaceInfo;
  v5 = [(NARWorkspaceInfo *)&v16 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"applications"];
    applications = v5->_applications;
    v5->_applications = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sequenceNumber"];
    sequenceNumber = v5->_sequenceNumber;
    v5->_sequenceNumber = (NSNumber *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  applications = self->_applications;
  id v5 = a3;
  [v5 encodeObject:applications forKey:@"applications"];
  [v5 encodeObject:self->_UUID forKey:@"UUID"];
  [v5 encodeObject:self->_sequenceNumber forKey:@"sequenceNumber"];
}

- (NARWorkspaceInfo)initWithApplications:(id)a3 UUID:(id)a4 sequenceNumber:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NARWorkspaceInfo;
  v12 = [(NARWorkspaceInfo *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_applications, a3);
    objc_storeStrong((id *)&v13->_UUID, a4);
    objc_storeStrong((id *)&v13->_sequenceNumber, a5);
  }

  return v13;
}

- (NSArray)applications
{
  return self->_applications;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSNumber)sequenceNumber
{
  return self->_sequenceNumber;
}

- (NSArray)standaloneGlances
{
  return self->_standaloneGlances;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_standaloneGlances, 0);
  objc_storeStrong((id *)&self->_sequenceNumber, 0);
  objc_storeStrong((id *)&self->_UUID, 0);

  objc_storeStrong((id *)&self->_applications, 0);
}

@end