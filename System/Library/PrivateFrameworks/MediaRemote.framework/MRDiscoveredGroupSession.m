@interface MRDiscoveredGroupSession
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MRDiscoveredGroupSession)initWithCoder:(id)a3;
- (MRDiscoveredGroupSession)initWithData:(id)a3;
- (MRDiscoveredGroupSession)initWithIdentifier:(id)a3 hostInfo:(id)a4;
- (MRDiscoveredGroupSession)initWithIdentifier:(id)a3 hostInfo:(id)a4 source:(int64_t)a5;
- (MRGroupSessionHostInfo)hostInfo;
- (NSData)data;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)source;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MRDiscoveredGroupSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MRDiscoveredGroupSession)initWithIdentifier:(id)a3 hostInfo:(id)a4 source:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRDiscoveredGroupSession;
  v11 = [(MRDiscoveredGroupSession *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    objc_storeStrong((id *)&v12->_hostInfo, a4);
    v12->_source = a5;
  }

  return v12;
}

- (MRDiscoveredGroupSession)initWithIdentifier:(id)a3 hostInfo:(id)a4
{
  return [(MRDiscoveredGroupSession *)self initWithIdentifier:a3 hostInfo:a4 source:0];
}

- (MRDiscoveredGroupSession)initWithData:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = MSVPropertyListDataClasses();
  v6 = (void *)[v5 mutableCopy];

  v14[0] = objc_opt_class();
  v7 = self;
  v14[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  [v6 addObjectsFromArray:v8];

  id v13 = 0;
  id v9 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v6 fromData:v4 error:&v13];

  id v10 = v13;
  if (v10)
  {
    v11 = _MRLogForCategory(0xCuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MRDiscoveredGroupSession initWithData:]();
    }
  }
  return v9;
}

- (MRDiscoveredGroupSession)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRDiscoveredGroupSession;
  v5 = [(MRDiscoveredGroupSession *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"id"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hst"];
    hostInfo = v5->_hostInfo;
    v5->_hostInfo = (MRGroupSessionHostInfo *)v8;

    v5->_source = [v4 decodeIntegerForKey:@"src"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"id"];
  [v5 encodeObject:self->_hostInfo forKey:@"hst"];
  [v5 encodeInteger:self->_source forKey:@"src"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MRDiscoveredGroupSession *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(MRDiscoveredGroupSession *)self identifier];
      v7 = [(MRDiscoveredGroupSession *)v5 identifier];
      if ([v6 isEqual:v7])
      {
        uint64_t v8 = [(MRDiscoveredGroupSession *)self hostInfo];
        id v9 = [(MRDiscoveredGroupSession *)v5 hostInfo];
        if ([v8 isEqual:v9])
        {
          int64_t v10 = [(MRDiscoveredGroupSession *)self source];
          BOOL v11 = v10 == [(MRDiscoveredGroupSession *)v5 source];
        }
        else
        {
          BOOL v11 = 0;
        }
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %@ - hostInfo: %@>", objc_opt_class(), self->_identifier, self->_hostInfo];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  return v3 ^ self->_source ^ [(MRGroupSessionHostInfo *)self->_hostInfo routeType];
}

- (NSData)data
{
  return (NSData *)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [MRDiscoveredGroupSession alloc];
  identifier = self->_identifier;
  hostInfo = self->_hostInfo;
  int64_t source = self->_source;

  return [(MRDiscoveredGroupSession *)v4 initWithIdentifier:identifier hostInfo:hostInfo source:source];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (MRGroupSessionHostInfo)hostInfo
{
  return self->_hostInfo;
}

- (int64_t)source
{
  return self->_source;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostInfo, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithData:.cold.1()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3(&dword_194F3C000, v0, v1, "[MRGroupSession] Failed to decode MRDiscoveredGroupSession: %@", v2, v3, v4, v5, v6);
}

@end