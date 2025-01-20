@interface ResourceHint
+ (BOOL)supportsSecureCoding;
- (BOOL)updateState:(unint64_t)a3;
- (NSUUID)uuid;
- (ResourceHint)initWithCoder:(id)a3;
- (ResourceHint)initWithResourceType:(unint64_t)a3 andState:(unint64_t)a4;
- (id)description;
- (unint64_t)resourceType;
- (unint64_t)state;
- (void)encodeWithCoder:(id)a3;
- (void)setResourceType:(unint64_t)a3;
- (void)setState:(unint64_t)a3;
- (void)setUuid:(id)a3;
@end

@implementation ResourceHint

- (id)description
{
  unint64_t v2 = [(ResourceHint *)self resourceType];
  if (v2 > 0xA) {
    return @"Unknown";
  }
  else {
    return off_265476748[v2];
  }
}

- (unint64_t)resourceType
{
  return self->_resourceType;
}

- (void).cxx_destruct
{
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  v4 = [NSNumber numberWithUnsignedInteger:self->_resourceType];
  [v7 encodeObject:v4 forKey:@"resourceType"];

  v5 = [NSNumber numberWithUnsignedInteger:self->_state];
  [v7 encodeObject:v5 forKey:@"state"];

  uuid = self->_uuid;
  if (uuid) {
    [v7 encodeObject:uuid forKey:@"uuid"];
  }
}

- (unint64_t)state
{
  return self->_state;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (BOOL)updateState:(unint64_t)a3
{
  [(ResourceHint *)self setState:a3];
  v4 = +[ResourceConnection sharedInstance];
  v5 = v4;
  if (v4)
  {
    char v6 = [v4 updateResourceHint:self];
  }
  else
  {
    id v7 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
      -[ResourceHint initWithResourceType:andState:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
    char v6 = 0;
  }

  return v6;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (ResourceHint)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ResourceHint;
  v5 = [(ResourceHint *)&v11 init];
  if (v5)
  {
    char v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resourceType"];
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    v5->_resourceType = [v6 unsignedIntValue];
    v5->_state = [v7 unsignedIntValue];
    if (v8) {
      objc_storeStrong((id *)&v5->_uuid, v8);
    }
    uint64_t v9 = v5;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ResourceHint)initWithResourceType:(unint64_t)a3 andState:(unint64_t)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v30.receiver = self;
  v30.super_class = (Class)ResourceHint;
  char v6 = [(ResourceHint *)&v30 init];
  v6->_resourceType = a3;
  v6->_state = a4;
  id v7 = +[ResourceConnection sharedInstance];
  uint64_t v8 = v7;
  if (!v7)
  {
    uint64_t v14 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
      -[ResourceHint initWithResourceType:andState:](v14, v15, v16, v17, v18, v19, v20, v21);
    }
    goto LABEL_10;
  }
  int v9 = [v7 createResourceHint:v6];
  uint64_t v10 = _log;
  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
      -[ResourceHint initWithResourceType:andState:](v10, v22, v23, v24, v25, v26, v27, v28);
    }
LABEL_10:
    uint64_t v13 = 0;
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
  {
    objc_super v11 = v10;
    uint64_t v12 = [(ResourceHint *)v6 uuid];
    *(_DWORD *)buf = 138412290;
    v32 = v12;
    _os_log_impl(&dword_25A13D000, v11, OS_LOG_TYPE_INFO, "Resource init uuid: %@", buf, 0xCu);
  }
  uint64_t v13 = v6;
LABEL_11:

  return v13;
}

- (void)setResourceType:(unint64_t)a3
{
  self->_resourceType = a3;
}

- (void)setUuid:(id)a3
{
}

- (void)initWithResourceType:(uint64_t)a3 andState:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithResourceType:(uint64_t)a3 andState:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end