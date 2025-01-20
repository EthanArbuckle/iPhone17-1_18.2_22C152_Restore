@interface W5DiagnosticsTestRequest
+ (BOOL)supportsSecureCoding;
+ (id)requestWithTestID:(int64_t)a3 configuration:(id)a4;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDiagnosticsTestRequest:(id)a3;
- (NSDictionary)configuration;
- (NSUUID)uuid;
- (W5DiagnosticsTestRequest)init;
- (W5DiagnosticsTestRequest)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)testID;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setTestID:(int64_t)a3;
- (void)setUuid:(id)a3;
@end

@implementation W5DiagnosticsTestRequest

- (W5DiagnosticsTestRequest)init
{
  v4.receiver = self;
  v4.super_class = (Class)W5DiagnosticsTestRequest;
  v2 = [(W5DiagnosticsTestRequest *)&v4 init];
  if (v2) {
    v2->_uuid = (NSUUID *)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08C38], "UUID"), "copy");
  }
  return v2;
}

+ (id)requestWithTestID:(int64_t)a3 configuration:(id)a4
{
  v6 = objc_alloc_init(W5DiagnosticsTestRequest);
  [(W5DiagnosticsTestRequest *)v6 setTestID:a3];
  [(W5DiagnosticsTestRequest *)v6 setConfiguration:a4];
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)W5DiagnosticsTestRequest;
  [(W5DiagnosticsTestRequest *)&v3 dealloc];
}

- (void)setConfiguration:(id)a3
{
  configuration = self->_configuration;
  if (configuration != a3)
  {

    self->_configuration = 0;
    if (a3)
    {
      uint64_t v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
      if (v6)
      {
        uint64_t v7 = v6;
        v8 = (void *)MEMORY[0x263F08928];
        v9 = (void *)MEMORY[0x263EFFA08];
        uint64_t v10 = objc_opt_class();
        uint64_t v11 = objc_opt_class();
        uint64_t v12 = objc_opt_class();
        uint64_t v13 = objc_opt_class();
        uint64_t v14 = objc_opt_class();
        self->_configuration = (NSDictionary *)(id)objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, v14, objc_opt_class(), 0), v7, 0);
      }
    }
  }
}

- (id)description
{
  objc_super v3 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:0];
  [v3 appendFormat:@"Name: %@ (%ld)\n", W5DescriptionForDiagnosticsTestID(self->_testID), self->_testID];
  [v3 appendFormat:@"Description: %@\n", W5ExtendedDescriptionForDiagnosticsTestID(self->_testID)];
  [v3 appendFormat:@"Configuration: %@\n", self->_configuration];
  objc_super v4 = (void *)[v3 copy];
  return v4;
}

- (BOOL)conformsToProtocol:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)W5DiagnosticsTestRequest;
  if (-[W5DiagnosticsTestRequest conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || ([a3 isEqual:&unk_26C50B870] & 1) != 0)
  {
    return 1;
  }
  else
  {
    return [a3 isEqual:&unk_26C50B6D8];
  }
}

- (BOOL)isEqualToDiagnosticsTestRequest:(id)a3
{
  uuid = self->_uuid;
  uint64_t v4 = [a3 uuid];
  return [(NSUUID *)uuid isEqual:v4];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return [(W5DiagnosticsTestRequest *)self isEqualToDiagnosticsTestRequest:a3];
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_uuid hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[W5DiagnosticsTestRequest allocWithZone:a3] init];
  [(W5DiagnosticsTestRequest *)v4 setTestID:self->_testID];
  [(W5DiagnosticsTestRequest *)v4 setConfiguration:self->_configuration];
  [(W5DiagnosticsTestRequest *)v4 setUuid:self->_uuid];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInteger:self->_testID forKey:@"_testID"];
  [a3 encodeObject:self->_configuration forKey:@"_configuration"];
  uuid = self->_uuid;
  [a3 encodeObject:uuid forKey:@"_uuid"];
}

- (W5DiagnosticsTestRequest)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)W5DiagnosticsTestRequest;
  uint64_t v4 = [(W5DiagnosticsTestRequest *)&v12 init];
  if (v4)
  {
    v4->_testID = [a3 decodeIntegerForKey:@"_testID"];
    objc_super v5 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v4->_configuration = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, v10, objc_opt_class(), 0), @"_configuration"), "copy");
    v4->_uuid = (NSUUID *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_uuid"), "copy");
  }
  return v4;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (int64_t)testID
{
  return self->_testID;
}

- (void)setTestID:(int64_t)a3
{
  self->_testID = a3;
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

@end