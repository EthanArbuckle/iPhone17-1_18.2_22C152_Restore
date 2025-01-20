@interface PSYSyncOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)dryRun;
- (BOOL)terminateDuringDryRun;
- (NSUUID)pairingIdentifier;
- (NSUUID)sessionIdentifier;
- (PSYSyncOptions)initWithCoder:(id)a3;
- (PSYTestInput)testInput;
- (id)description;
- (unint64_t)syncSessionType;
- (void)encodeWithCoder:(id)a3;
- (void)setDryRun:(BOOL)a3;
- (void)setPairingIdentifier:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setSyncSessionType:(unint64_t)a3;
- (void)setTerminateDuringDryRun:(BOOL)a3;
- (void)setTestInput:(id)a3;
@end

@implementation PSYSyncOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PSYSyncOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PSYSyncOptions;
  v5 = [(PSYSyncOptions *)&v13 init];
  if (v5)
  {
    v5->_dryRun = [v4 decodeBoolForKey:@"dryRun"];
    v5->_terminateDuringDryRun = [v4 decodeBoolForKey:@"terminateDuringDryRun"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"testInput"];
    testInput = v5->_testInput;
    v5->_testInput = (PSYTestInput *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pairingIdentifier"];
    pairingIdentifier = v5->_pairingIdentifier;
    v5->_pairingIdentifier = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionIdentifier"];
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSUUID *)v10;

    v5->_syncSessionType = [v4 decodeIntegerForKey:@"syncSessionType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL dryRun = self->_dryRun;
  id v5 = a3;
  [v5 encodeBool:dryRun forKey:@"dryRun"];
  [v5 encodeBool:self->_terminateDuringDryRun forKey:@"terminateDuringDryRun"];
  [v5 encodeObject:self->_testInput forKey:@"testInput"];
  [v5 encodeObject:self->_pairingIdentifier forKey:@"pairingIdentifier"];
  [v5 encodeObject:self->_sessionIdentifier forKey:@"sessionIdentifier"];
  [v5 encodeInteger:self->_syncSessionType forKey:@"syncSessionType"];
}

- (id)description
{
  v3 = NSString;
  id v4 = [(NSUUID *)self->_pairingIdentifier UUIDString];
  id v5 = [(NSUUID *)self->_sessionIdentifier UUIDString];
  uint64_t v6 = NSStringfromPSYSyncSessionType(self->_syncSessionType);
  v7 = [v3 stringWithFormat:@"pairingIdentifier=%@ sessionIdentifier=%@ syncSessionType=%@", v4, v5, v6];

  return v7;
}

- (BOOL)dryRun
{
  return self->_dryRun;
}

- (void)setDryRun:(BOOL)a3
{
  self->_BOOL dryRun = a3;
}

- (BOOL)terminateDuringDryRun
{
  return self->_terminateDuringDryRun;
}

- (void)setTerminateDuringDryRun:(BOOL)a3
{
  self->_terminateDuringDryRun = a3;
}

- (PSYTestInput)testInput
{
  return self->_testInput;
}

- (void)setTestInput:(id)a3
{
}

- (NSUUID)pairingIdentifier
{
  return self->_pairingIdentifier;
}

- (void)setPairingIdentifier:(id)a3
{
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (unint64_t)syncSessionType
{
  return self->_syncSessionType;
}

- (void)setSyncSessionType:(unint64_t)a3
{
  self->_syncSessionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_pairingIdentifier, 0);

  objc_storeStrong((id *)&self->_testInput, 0);
}

@end