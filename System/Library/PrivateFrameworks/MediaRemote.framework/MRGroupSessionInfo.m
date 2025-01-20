@interface MRGroupSessionInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHosted;
- (BOOL)isPlaceholder;
- (MRGroupSessionHostInfo)hostInfo;
- (MRGroupSessionInfo)initWithCoder:(id)a3;
- (MRGroupSessionInfo)initWithIdentifier:(id)a3 hostInfo:(id)a4 isHosted:(BOOL)a5 equivalentMediaIdentifier:(id)a6 isPlaceholder:(BOOL)a7;
- (MRGroupSessionInfo)initWithProtobuf:(id)a3;
- (MRGroupSessionInfo)initWithToken:(id)a3 isHosted:(BOOL)a4;
- (MRGroupSessionInfo)initWithToken:(id)a3 isHosted:(BOOL)a4 isPlaceholder:(BOOL)a5;
- (NSString)effectiveIdentifier;
- (NSString)equivalentMediaIdentifier;
- (NSString)identifier;
- (_MRGroupSessionInfoProtobuf)protobuf;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MRGroupSessionInfo

- (MRGroupSessionInfo)initWithIdentifier:(id)a3 hostInfo:(id)a4 isHosted:(BOOL)a5 equivalentMediaIdentifier:(id)a6 isPlaceholder:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MRGroupSessionInfo;
  v15 = [(MRGroupSessionInfo *)&v19 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    identifier = v15->_identifier;
    v15->_identifier = (NSString *)v16;

    objc_storeStrong((id *)&v15->_hostInfo, a4);
    v15->_isHosted = a5;
    objc_storeStrong((id *)&v15->_equivalentMediaIdentifier, a6);
    v15->_placeholder = a7;
  }

  return v15;
}

- (MRGroupSessionInfo)initWithToken:(id)a3 isHosted:(BOOL)a4 isPlaceholder:(BOOL)a5
{
  if (a3)
  {
    BOOL v6 = a5;
    BOOL v7 = a4;
    id v8 = a3;
    v9 = [v8 sessionIdentifier];
    v10 = [v8 hostInfo];
    v11 = [v8 equivalentMediaIdentifier];

    self = [(MRGroupSessionInfo *)self initWithIdentifier:v9 hostInfo:v10 isHosted:v7 equivalentMediaIdentifier:v11 isPlaceholder:v6];
    id v12 = self;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (MRGroupSessionInfo)initWithToken:(id)a3 isHosted:(BOOL)a4
{
  return [(MRGroupSessionInfo *)self initWithToken:a3 isHosted:a4 isPlaceholder:0];
}

- (MRGroupSessionInfo)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v5 = [MRGroupSessionHostInfo alloc];
  unsigned int v6 = [v4 routeType] - 1;
  if (v6 > 0xA) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = byte_195224678[v6];
  }
  id v8 = [v4 hostDisplayName];
  v9 = [(MRGroupSessionHostInfo *)v5 initWithRouteType:v7 displayName:v8];

  v10 = [v4 identifier];
  uint64_t v11 = [v4 hosted];
  id v12 = [v4 equivalentMediaIdentifier];
  id v13 = -[MRGroupSessionInfo initWithIdentifier:hostInfo:isHosted:equivalentMediaIdentifier:isPlaceholder:](self, "initWithIdentifier:hostInfo:isHosted:equivalentMediaIdentifier:isPlaceholder:", v10, v9, v11, v12, [v4 placeholder]);

  return v13;
}

- (_MRGroupSessionInfoProtobuf)protobuf
{
  v3 = objc_alloc_init(_MRGroupSessionInfoProtobuf);
  [(_MRGroupSessionInfoProtobuf *)v3 setIdentifier:self->_identifier];
  id v4 = [(MRGroupSessionHostInfo *)self->_hostInfo displayName];
  [(_MRGroupSessionInfoProtobuf *)v3 setHostDisplayName:v4];

  unsigned int v5 = [(MRGroupSessionHostInfo *)self->_hostInfo routeType] - 1;
  if (v5 > 0xA) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = dword_195224684[(char)v5];
  }
  [(_MRGroupSessionInfoProtobuf *)v3 setRouteType:v6];
  [(_MRGroupSessionInfoProtobuf *)v3 setHosted:self->_isHosted];
  [(_MRGroupSessionInfoProtobuf *)v3 setEquivalentMediaIdentifier:self->_equivalentMediaIdentifier];
  [(_MRGroupSessionInfoProtobuf *)v3 setPlaceholder:self->_placeholder];

  return v3;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  unsigned int v5 = [(MRGroupSessionInfo *)self identifier];
  if ([(MRGroupSessionInfo *)self isHosted]) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  equivalentMediaIdentifier = self->_equivalentMediaIdentifier;
  if ([(MRGroupSessionInfo *)self isPlaceholder]) {
    id v8 = @"YES";
  }
  else {
    id v8 = @"NO";
  }
  v9 = (void *)[v3 initWithFormat:@"<%@: identifier=%@, hosted=%@, mediaID=%@, placeholder=%@>", v4, v5, v6, equivalentMediaIdentifier, v8];

  return v9;
}

- (NSString)effectiveIdentifier
{
  id v3 = [(MRGroupSessionInfo *)self equivalentMediaIdentifier];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(MRGroupSessionInfo *)self identifier];
  }
  uint64_t v6 = v5;

  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(MRGroupSessionInfo *)self identifier];
  [v7 encodeObject:v4 forKey:@"identifier"];

  id v5 = [(MRGroupSessionInfo *)self hostInfo];
  [v7 encodeObject:v5 forKey:@"hostInfo"];

  objc_msgSend(v7, "encodeBool:forKey:", -[MRGroupSessionInfo isHosted](self, "isHosted"), @"hosted");
  uint64_t v6 = [(MRGroupSessionInfo *)self equivalentMediaIdentifier];
  [v7 encodeObject:v6 forKey:@"mediaID"];

  objc_msgSend(v7, "encodeBool:forKey:", -[MRGroupSessionInfo isPlaceholder](self, "isPlaceholder"), @"placeholder");
}

- (MRGroupSessionInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MRGroupSessionInfo;
  id v5 = [(MRGroupSessionInfo *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hostInfo"];
    hostInfo = v5->_hostInfo;
    v5->_hostInfo = (MRGroupSessionHostInfo *)v8;

    v5->_isHosted = [v4 decodeBoolForKey:@"hosted"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaID"];
    equivalentMediaIdentifier = v5->_equivalentMediaIdentifier;
    v5->_equivalentMediaIdentifier = (NSString *)v10;

    v5->_placeholder = [v4 decodeBoolForKey:@"placeholder"];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MRGroupSessionInfo *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      identifier = self->_identifier;
      uint64_t v6 = v4->_identifier;
      id v7 = identifier;
      uint64_t v8 = v7;
      if (v7 == v6) {
        char v9 = 1;
      }
      else {
        char v9 = [(NSString *)v7 isEqual:v6];
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)equivalentMediaIdentifier
{
  return self->_equivalentMediaIdentifier;
}

- (MRGroupSessionHostInfo)hostInfo
{
  return self->_hostInfo;
}

- (BOOL)isHosted
{
  return self->_isHosted;
}

- (BOOL)isPlaceholder
{
  return self->_placeholder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostInfo, 0);
  objc_storeStrong((id *)&self->_equivalentMediaIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end