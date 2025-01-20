@interface W5DiagnosticsTestResult
+ (BOOL)supportsSecureCoding;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)didPass;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDiagnosticsTestResult:(id)a3;
- (BOOL)result;
- (NSDictionary)configuration;
- (NSDictionary)info;
- (NSError)error;
- (NSUUID)uuid;
- (W5DiagnosticsTestResult)initWithCoder:(id)a3;
- (double)testCompleted;
- (double)testStarted;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)testID;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDidPass:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setInfo:(id)a3;
- (void)setResult:(BOOL)a3;
- (void)setTestCompleted:(double)a3;
- (void)setTestID:(int64_t)a3;
- (void)setTestStarted:(double)a3;
- (void)setUuid:(id)a3;
@end

@implementation W5DiagnosticsTestResult

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)W5DiagnosticsTestResult;
  [(W5DiagnosticsTestResult *)&v3 dealloc];
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

- (void)setInfo:(id)a3
{
  info = self->_info;
  if (info != a3)
  {

    self->_info = 0;
    if (a3)
    {
      uint64_t v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
      if (v6)
      {
        uint64_t v7 = v6;
        v18 = (void *)MEMORY[0x263EFFA08];
        v19 = (void *)MEMORY[0x263F08928];
        uint64_t v17 = objc_opt_class();
        uint64_t v16 = objc_opt_class();
        uint64_t v8 = objc_opt_class();
        uint64_t v9 = objc_opt_class();
        uint64_t v10 = objc_opt_class();
        uint64_t v11 = objc_opt_class();
        uint64_t v12 = objc_opt_class();
        uint64_t v13 = objc_opt_class();
        uint64_t v14 = objc_opt_class();
        uint64_t v15 = objc_opt_class();
        self->_info = (NSDictionary *)(id)objc_msgSend(v19, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v18, "setWithObjects:", v17, v16, v8, v9, v10, v11, v12, v13, v14, v15, objc_opt_class(), 0), v7, 0);
      }
    }
  }
}

- (id)description
{
  objc_super v3 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:0];
  [v3 appendFormat:@"Name: %@ (%ld)\n", W5DescriptionForDiagnosticsTestID(self->_testID), self->_testID];
  [v3 appendFormat:@"Description: %@\n", W5ExtendedDescriptionForDiagnosticsTestID(self->_testID)];
  if (self->_didPass) {
    v4 = @"Yes";
  }
  else {
    v4 = @"No";
  }
  [v3 appendFormat:@"Pass: %@\n", v4];
  if (self->_result) {
    v5 = @"Yes";
  }
  else {
    v5 = @"No";
  }
  [v3 appendFormat:@"Result: %@\n", v5];
  [v3 appendFormat:@"Error: %@\n", self->_error];
  [v3 appendFormat:@"UUID: %@\n", -[NSUUID UUIDString](self->_uuid, "UUIDString")];
  id v6 = objc_alloc_init(MEMORY[0x263F08790]);
  [v6 setDateStyle:0];
  [v6 setTimeStyle:2];
  objc_msgSend(v6, "setLocale:", objc_msgSend(MEMORY[0x263EFF960], "currentLocale"));
  [v3 appendFormat:@"Started: %@\n", objc_msgSend(v6, "stringFromDate:", objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceReferenceDate:", self->_testStarted))];
  [v3 appendFormat:@"Completed: %@\n", objc_msgSend(v6, "stringFromDate:", objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceReferenceDate:", self->_testCompleted))];
  [v3 appendFormat:@"Configuration: %@\n", self->_configuration];
  [v3 appendFormat:@"Info: %@\n", self->_info];
  uint64_t v7 = (void *)[v3 copy];
  return v7;
}

- (BOOL)conformsToProtocol:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)W5DiagnosticsTestResult;
  if (-[W5DiagnosticsTestResult conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || ([a3 isEqual:&unk_26C50B870] & 1) != 0)
  {
    return 1;
  }
  else
  {
    return [a3 isEqual:&unk_26C50B6D8];
  }
}

- (BOOL)isEqualToDiagnosticsTestResult:(id)a3
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
  return [(W5DiagnosticsTestResult *)self isEqualToDiagnosticsTestResult:a3];
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_uuid hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[W5DiagnosticsTestResult allocWithZone:a3] init];
  [(W5DiagnosticsTestResult *)v4 setUuid:self->_uuid];
  [(W5DiagnosticsTestResult *)v4 setTestID:self->_testID];
  [(W5DiagnosticsTestResult *)v4 setResult:self->_result];
  [(W5DiagnosticsTestResult *)v4 setDidPass:self->_didPass];
  [(W5DiagnosticsTestResult *)v4 setError:self->_error];
  [(W5DiagnosticsTestResult *)v4 setConfiguration:self->_configuration];
  [(W5DiagnosticsTestResult *)v4 setInfo:self->_info];
  [(W5DiagnosticsTestResult *)v4 setTestStarted:self->_testStarted];
  [(W5DiagnosticsTestResult *)v4 setTestCompleted:self->_testCompleted];
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
  [a3 encodeObject:self->_error forKey:@"_error"];
  [a3 encodeObject:self->_uuid forKey:@"_uuid"];
  [a3 encodeBool:self->_result forKey:@"_result"];
  [a3 encodeBool:self->_didPass forKey:@"_didPass"];
  [a3 encodeObject:self->_info forKey:@"_info"];
  [a3 encodeDouble:@"_testStarted" forKey:self->_testStarted];
  double testCompleted = self->_testCompleted;
  [a3 encodeDouble:@"_testCompleted" forKey:testCompleted];
}

- (W5DiagnosticsTestResult)initWithCoder:(id)a3
{
  v25.receiver = self;
  v25.super_class = (Class)W5DiagnosticsTestResult;
  uint64_t v4 = [(W5DiagnosticsTestResult *)&v25 init];
  if (v4)
  {
    v4->_testID = [a3 decodeIntegerForKey:@"_testID"];
    v4->_result = [a3 decodeBoolForKey:@"_result"];
    v4->_didPass = [a3 decodeBoolForKey:@"_didPass"];
    v4->_uuid = (NSUUID *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_uuid"), "copy");
    v4->_error = (NSError *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_error"), "copy");
    objc_super v5 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v4->_configuration = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, v10, objc_opt_class(), 0), @"_configuration"), "copy");
    v24 = (void *)MEMORY[0x263EFFA08];
    uint64_t v23 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    v4->_info = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v24, "setWithObjects:", v23, v22, v11, v12, v13, v14, v15, v16, v17, v18, objc_opt_class(), 0), @"_info"),
                                  "copy");
    [a3 decodeDoubleForKey:@"_testStarted"];
    v4->_testStarted = v19;
    [a3 decodeDoubleForKey:@"_testCompleted"];
    v4->_double testCompleted = v20;
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

- (BOOL)result
{
  return self->_result;
}

- (void)setResult:(BOOL)a3
{
  self->_result = a3;
}

- (BOOL)didPass
{
  return self->_didPass;
}

- (void)setDidPass:(BOOL)a3
{
  self->_didPass = a3;
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (NSDictionary)info
{
  return self->_info;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (double)testStarted
{
  return self->_testStarted;
}

- (void)setTestStarted:(double)a3
{
  self->_testStarted = a3;
}

- (double)testCompleted
{
  return self->_testCompleted;
}

- (void)setTestCompleted:(double)a3
{
  self->_double testCompleted = a3;
}

@end