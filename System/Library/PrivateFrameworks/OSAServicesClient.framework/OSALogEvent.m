@interface OSALogEvent
+ (BOOL)supportsSecureCoding;
- (NSDictionary)details;
- (OSALogEvent)initWithCoder:(id)a3;
- (OSALogEvent)initWithIdentity:(id)a3 details:(id)a4;
- (OSALogIdentity)identity;
- (void)encodeWithCoder:(id)a3;
@end

@implementation OSALogEvent

- (OSALogEvent)initWithIdentity:(id)a3 details:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OSALogEvent;
  v9 = [(OSALogEvent *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identity, a3);
    objc_storeStrong((id *)&v10->_details, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_identity forKey:@"identity"];
  details = self->_details;
  id v8 = 0;
  v6 = [MEMORY[0x1E4F28F98] dataWithPropertyList:details format:200 options:0 error:&v8];
  id v7 = v8;
  if (v6)
  {
    [v4 encodeObject:v6 forKey:@"details"];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[OSALogEvent encodeWithCoder:]((uint64_t)v7);
  }
}

- (OSALogEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identity"];
  if (!v5) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28460] format:@"OSALogEvent missing identity"];
  }
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"details"];
  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28460] format:@"OSALogEvent missing details serialization"];
  }
  uint64_t v10 = 0;
  id v7 = [MEMORY[0x1E4F28F98] propertyListWithData:v6 options:0 format:0 error:&v10];
  if (!v7) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28460], @"OSALogEvent details could not be deserialized: %@", v10 format];
  }
  id v8 = [(OSALogEvent *)self initWithIdentity:v5 details:v7];

  return v8;
}

- (OSALogIdentity)identity
{
  return self->_identity;
}

- (NSDictionary)details
{
  return self->_details;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

- (void)encodeWithCoder:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1B507E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Log event details could not be serialized: %@", (uint8_t *)&v1, 0xCu);
}

@end