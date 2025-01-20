@interface REMResolutionToken
+ (BOOL)supportsSecureCoding;
+ (id)resolutionTokenWithJSONObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSUUID)replicaID;
- (REMResolutionToken)init;
- (REMResolutionToken)initWithCoder:(id)a3;
- (REMResolutionToken)initWithCounter:(int64_t)a3 modificationTime:(double)a4 replicaID:(id)a5;
- (REMResolutionToken)initWithDefaultValue;
- (double)generateNonce;
- (double)modificationTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)compare:(id)a3;
- (int64_t)counter;
- (void)encodeWithCoder:(id)a3;
- (void)setCounter:(int64_t)a3;
- (void)setModificationTime:(double)a3;
- (void)setReplicaID:(id)a3;
- (void)update;
@end

@implementation REMResolutionToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMResolutionToken)initWithCounter:(int64_t)a3 modificationTime:(double)a4 replicaID:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)REMResolutionToken;
  v9 = [(REMResolutionToken *)&v12 init];
  v10 = v9;
  if (v9)
  {
    [(REMResolutionToken *)v9 setCounter:a3];
    [(REMResolutionToken *)v10 setModificationTime:a4];
    [(REMResolutionToken *)v10 setReplicaID:v8];
  }

  return v10;
}

- (REMResolutionToken)init
{
  double Current = CFAbsoluteTimeGetCurrent();
  v4 = [MEMORY[0x1E4F29128] UUID];
  v5 = [(REMResolutionToken *)self initWithCounter:0 modificationTime:v4 replicaID:Current];

  return v5;
}

- (REMResolutionToken)initWithDefaultValue
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C6613346-F378-45AB-8DBD-57BE9AAFB009"];
  v4 = [(REMResolutionToken *)self initWithCounter:0 modificationTime:v3 replicaID:0.0];

  return v4;
}

- (REMResolutionToken)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"counter"];
  [v4 decodeDoubleForKey:@"modificationTime"];
  double v7 = v6;
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"replicaID"];

  v9 = [(REMResolutionToken *)self initWithCounter:v5 modificationTime:v8 replicaID:v7];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMResolutionToken counter](self, "counter"), @"counter");
  [(REMResolutionToken *)self modificationTime];
  objc_msgSend(v4, "encodeDouble:forKey:", @"modificationTime");
  id v5 = [(REMResolutionToken *)self replicaID];
  [v4 encodeObject:v5 forKey:@"replicaID"];
}

- (void)update
{
  [(REMResolutionToken *)self setCounter:[(REMResolutionToken *)self counter] + 1];
  double Current = CFAbsoluteTimeGetCurrent();

  [(REMResolutionToken *)self setModificationTime:Current];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [REMResolutionToken alloc];
  int64_t v5 = [(REMResolutionToken *)self counter];
  [(REMResolutionToken *)self modificationTime];
  double v7 = v6;
  id v8 = [(REMResolutionToken *)self replicaID];
  v9 = [(REMResolutionToken *)v4 initWithCounter:v5 modificationTime:v8 replicaID:v7];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REMResolutionToken *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(REMResolutionToken *)self compare:v4] == 0;
  }

  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(REMResolutionToken *)self counter];
  if (v5 == [v4 counter])
  {
    [(REMResolutionToken *)self modificationTime];
    double v7 = v6;
    [v4 modificationTime];
    if (vabdd_f64(v7, v8) <= 2.22044605e-16)
    {
      v11 = [(REMResolutionToken *)self replicaID];
      objc_super v12 = [v4 replicaID];
      int64_t v9 = objc_msgSend(v11, "CR_compare:", v12);
    }
    else if (v7 - v8 > 0.0)
    {
      int64_t v9 = 1;
    }
    else
    {
      int64_t v9 = -1;
    }
  }
  else
  {
    uint64_t v10 = [(REMResolutionToken *)self counter];
    if (v10 > [v4 counter]) {
      int64_t v9 = 1;
    }
    else {
      int64_t v9 = -1;
    }
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  int64_t v4 = [(REMResolutionToken *)self counter];
  [(REMResolutionToken *)self modificationTime];
  uint64_t v6 = v5;
  double v7 = [(REMResolutionToken *)self replicaID];
  double v8 = [v7 UUIDString];
  int64_t v9 = [v3 stringWithFormat:@"<counter=%ld modificationTime=%lf replicaID=%@>", v4, v6, v8];

  return v9;
}

+ (id)resolutionTokenWithJSONObject:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [v3 objectForKey:@"counter"];
  uint64_t v6 = REMDynamicCast(v4, (uint64_t)v5);

  uint64_t v7 = objc_opt_class();
  double v8 = [v3 objectForKey:@"modificationTime"];
  int64_t v9 = REMDynamicCast(v7, (uint64_t)v8);

  uint64_t v10 = objc_opt_class();
  v11 = [v3 objectForKey:@"replicaID"];
  objc_super v12 = REMDynamicCast(v10, (uint64_t)v11);

  if (!v6
    || !v9
    || !v12
    || (uint64_t v13 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v12]) == 0
    || (v14 = (void *)v13,
        v15 = [REMResolutionToken alloc],
        uint64_t v16 = [v6 integerValue],
        [v9 doubleValue],
        v17 = -[REMResolutionToken initWithCounter:modificationTime:replicaID:](v15, "initWithCounter:modificationTime:replicaID:", v16, v14), v14, !v17))
  {
    v18 = +[REMLogStore utility];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      +[REMResolutionToken resolutionTokenWithJSONObject:]((uint64_t)v3, v18);
    }

    v17 = 0;
  }

  return v17;
}

- (double)generateNonce
{
  double v3 = (double)[(REMResolutionToken *)self counter];
  [(REMResolutionToken *)self modificationTime];
  return v4 + v3 * 1.0e11;
}

- (int64_t)counter
{
  return self->_counter;
}

- (void)setCounter:(int64_t)a3
{
  self->_counter = a3;
}

- (double)modificationTime
{
  return self->_modificationTime;
}

- (void)setModificationTime:(double)a3
{
  self->_modificationTime = a3;
}

- (NSUUID)replicaID
{
  return self->_replicaID;
}

- (void)setReplicaID:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)resolutionTokenWithJSONObject:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_ERROR, "Can't construct REMResolutionToken from invalid JSON {jsonObject: %@}", (uint8_t *)&v2, 0xCu);
}

@end