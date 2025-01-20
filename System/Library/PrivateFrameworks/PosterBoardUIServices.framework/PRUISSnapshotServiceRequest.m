@interface PRUISSnapshotServiceRequest
+ (BOOL)supportsSecureCoding;
- (BSAuditToken)requestOriginAuditToken;
- (PRUISSnapshotServiceRequest)initWithCoder:(id)a3;
- (PRUISSnapshotServiceRequest)initWithSnapshotRequest:(id)a3;
- (PUIPosterSnapshotRequest)posterSnapshotRequest;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRUISSnapshotServiceRequest

- (PRUISSnapshotServiceRequest)initWithSnapshotRequest:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v7 = v6;
    v12.receiver = self;
    v12.super_class = (Class)PRUISSnapshotServiceRequest;
    v8 = [(PRUISSnapshotServiceRequest *)&v12 init];
    v9 = v8;
    if (v8) {
      objc_storeStrong((id *)&v8->_posterSnapshotRequest, a3);
    }

    return v9;
  }
  else
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"request"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      [(PRUISSnapshotServiceRequest *)a2 initWithSnapshotRequest:(uint64_t)v11];
    }
    [v11 UTF8String];
    result = (PRUISSnapshotServiceRequest *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRUISSnapshotServiceRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRUISSnapshotServiceRequest;
  v5 = [(PRUISSnapshotServiceRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_posterSnapshotRequest"];
    posterSnapshotRequest = v5->_posterSnapshotRequest;
    v5->_posterSnapshotRequest = (PUIPosterSnapshotRequest *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (PUIPosterSnapshotRequest)posterSnapshotRequest
{
  return self->_posterSnapshotRequest;
}

- (BSAuditToken)requestOriginAuditToken
{
  return self->_requestOriginAuditToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestOriginAuditToken, 0);

  objc_storeStrong((id *)&self->_posterSnapshotRequest, 0);
}

- (void)initWithSnapshotRequest:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v5 = NSStringFromSelector(a1);
  uint64_t v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  objc_super v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"PRUISSnapshotServiceRequest.m";
  __int16 v16 = 1024;
  int v17 = 16;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_25A03F000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end