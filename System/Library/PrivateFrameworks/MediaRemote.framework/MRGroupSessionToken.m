@interface MRGroupSessionToken
+ (BOOL)supportsSecureCoding;
+ (id)tokenForJoinURLString:(id)a3;
- (BOOL)autoConnect;
- (BOOL)isEqual:(id)a3;
- (MRDiscoveredGroupSession)discoveredSession;
- (MRGroupSessionHostInfo)hostInfo;
- (MRGroupSessionToken)initWithCoder:(id)a3;
- (MRGroupSessionToken)initWithData:(id)a3;
- (MRGroupSessionToken)initWithDeviceInfo:(id)a3;
- (MRGroupSessionToken)initWithDiscoveredSession:(id)a3;
- (MRGroupSessionToken)initWithDiscoveredSession:(id)a3 autoConnect:(BOOL)a4;
- (MRGroupSessionToken)initWithHostInfo:(id)a3 invitationData:(id)a4 sharedSecret:(id)a5 sessionIdentifier:(id)a6 equivalentMediaIdentifier:(id)a7 version:(id)a8;
- (MRGroupSessionToken)initWithProtobuf:(id)a3;
- (NSData)data;
- (NSData)invitationData;
- (NSNumber)version;
- (NSString)effectiveIdentifier;
- (NSString)equivalentMediaIdentifier;
- (NSString)hostDisplayName;
- (NSString)joinURLString;
- (NSString)localizedSessionName;
- (NSString)sessionIdentifier;
- (NSString)sharedSecret;
- (NSString)storefrontCountryCode;
- (_MRGroupSessionTokenProtobuf)protobuf;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)routeType;
- (void)encodeWithCoder:(id)a3;
- (void)setStorefrontCountryCode:(id)a3;
@end

@implementation MRGroupSessionToken

- (NSString)joinURLString
{
  v3 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://music.apple.com"];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v3 resolvingAgainstBaseURL:0];
  if (self->_storefrontCountryCode) {
    [NSString stringWithFormat:@"/%@/%@", self->_storefrontCountryCode, @"join"];
  }
  else {
  v5 = [NSString stringWithFormat:@"/%@", @"join", v25];
  }
  [v4 setPath:v5];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v7 = [(MRGroupSessionToken *)self equivalentMediaIdentifier];

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E4F290C8];
    v9 = [(MRGroupSessionToken *)self equivalentMediaIdentifier];
    v10 = [v8 queryItemWithName:@"h" value:v9];
    [v6 addObject:v10];
  }
  v11 = [(MRGroupSessionToken *)self invitationData];

  if (v11)
  {
    v12 = [(MRGroupSessionToken *)self invitationData];
    v13 = objc_msgSend(v12, "tu_URLSafeBase64EncodedString");

    v14 = [MEMORY[0x1E4F290C8] queryItemWithName:@"p" value:v13];
    [v6 addObject:v14];

    v15 = (void *)MEMORY[0x1E4F290C8];
    v16 = [(MRGroupSessionToken *)self version];
    v17 = [v16 stringValue];
    v18 = [v15 queryItemWithName:@"v" value:v17];
    [v6 addObject:v18];
  }
  else
  {
    v19 = [(MRGroupSessionToken *)self discoveredSession];
    v20 = [v19 data];
    v13 = objc_msgSend(v20, "tu_URLSafeBase64EncodedString");

    v21 = [MEMORY[0x1E4F290C8] queryItemWithName:@"d" value:v13];
    [v6 addObject:v21];

    if (![(MRGroupSessionToken *)self autoConnect]) {
      goto LABEL_11;
    }
    v16 = [MEMORY[0x1E4F290C8] queryItemWithName:@"a" value:@"true"];
    [v6 addObject:v16];
  }

LABEL_11:
  [v4 setQueryItems:v6];
  v22 = [v4 URL];
  v23 = [v22 absoluteString];

  return (NSString *)v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)tokenForJoinURLString:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  v5 = v4;
  if (!v4)
  {
    v39 = 0;
    goto LABEL_54;
  }
  id v6 = [v4 host];
  char v7 = [v6 isEqual:@"music.apple.com"];

  if ((v7 & 1) == 0)
  {
    v10 = _MRLogForCategory(0xCuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[MRGroupSessionToken tokenForJoinURLString:].cold.5();
    }
    goto LABEL_35;
  }
  v8 = [v5 lastPathComponent];
  char v9 = [v8 isEqual:@"join"];

  if ((v9 & 1) == 0)
  {
    v10 = _MRLogForCategory(0xCuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[MRGroupSessionToken tokenForJoinURLString:].cold.4();
    }
LABEL_35:
    v39 = 0;
    goto LABEL_53;
  }
  v10 = [objc_alloc(MEMORY[0x1E4F29088]) initWithString:v3];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v11 = [v10 queryItems];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (!v12)
  {

    v15 = 0;
    v36 = 0;
LABEL_38:
    v35 = _MRLogForCategory(0xCuLL);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      +[MRGroupSessionToken tokenForJoinURLString:]();
    }
    v14 = 0;
    v39 = 0;
    goto LABEL_52;
  }
  uint64_t v13 = v12;
  v43 = v5;
  id v42 = v3;
  v44 = 0;
  uint64_t v45 = 0;
  v14 = 0;
  v15 = 0;
  uint64_t v16 = *(void *)v47;
  do
  {
    uint64_t v17 = 0;
    do
    {
      if (*(void *)v47 != v16) {
        objc_enumerationMutation(v11);
      }
      v18 = *(void **)(*((void *)&v46 + 1) + 8 * v17);
      v19 = [v18 name];
      int v20 = [v19 isEqual:@"v"];

      if (v20)
      {
        uint64_t v21 = [v18 value];
        v22 = v15;
        v15 = (void *)v21;
LABEL_16:

        goto LABEL_17;
      }
      v23 = [v18 name];
      int v24 = [v23 isEqualToString:@"p"];

      if (v24)
      {
        uint64_t v25 = [v18 value];
        v22 = v14;
        uint64_t v26 = 1;
LABEL_15:
        uint64_t v45 = v26;
        v14 = (void *)v25;
        goto LABEL_16;
      }
      v27 = [v18 name];
      int v28 = [v27 isEqualToString:@"d"];

      if (v28)
      {
        uint64_t v25 = [v18 value];
        v22 = v14;
        uint64_t v26 = 2;
        goto LABEL_15;
      }
      v29 = [v18 name];
      int v30 = [v29 isEqualToString:@"h"];

      if (v30)
      {
        v31 = +[MRSharedSettings currentSettings];
        int v32 = [v31 supportGroupSessionHome];

        if (v32)
        {
          uint64_t v33 = [v18 value];
          v22 = v44;
          v44 = (void *)v33;
          goto LABEL_16;
        }
      }
LABEL_17:
      ++v17;
    }
    while (v13 != v17);
    uint64_t v34 = [v11 countByEnumeratingWithState:&v46 objects:v50 count:16];
    uint64_t v13 = v34;
  }
  while (v34);

  if (!v14)
  {
    id v3 = v42;
    v5 = v43;
    v36 = v44;
    goto LABEL_38;
  }
  v35 = objc_msgSend(MEMORY[0x1E4F1C9B8], "tu_dataForURLSafeBase64EncodedString:", v14);
  v5 = v43;
  v36 = v44;
  if (!v35)
  {
    _MRLogForCategory(0xCuLL);
    v37 = (MRDiscoveredGroupSession *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v37->super, OS_LOG_TYPE_ERROR)) {
      +[MRGroupSessionToken tokenForJoinURLString:]();
    }
    goto LABEL_49;
  }
  if (v45 == 2)
  {
    v37 = [[MRDiscoveredGroupSession alloc] initWithData:v35];
    v38 = [[MRGroupSessionToken alloc] initWithDiscoveredSession:v37];
LABEL_44:
    v39 = v38;
    goto LABEL_50;
  }
  if (v45 == 1)
  {
    objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v15, "intValue"));
    v37 = (MRDiscoveredGroupSession *)objc_claimAutoreleasedReturnValue();
    if (v15 && ([&unk_1EE66F450 containsObject:v37] & 1) != 0)
    {
      MRGroupSessionTokenCreateWithInvitationData(v35, v44, v37);
      v38 = (MRGroupSessionToken *)objc_claimAutoreleasedReturnValue();
      goto LABEL_44;
    }
    v40 = _MRLogForCategory(0xCuLL);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      +[MRGroupSessionToken tokenForJoinURLString:]();
    }

LABEL_49:
    v39 = 0;
LABEL_50:
  }
  else
  {
    v39 = 0;
  }
  id v3 = v42;
LABEL_52:

LABEL_53:
LABEL_54:

  return v39;
}

- (MRGroupSessionToken)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v5 = [MRGroupSessionHostInfo alloc];
  unsigned __int8 v6 = [v4 routeType];
  char v7 = [v4 displayName];
  v8 = [(MRGroupSessionHostInfo *)v5 initWithRouteType:v6 displayName:v7];

  char v9 = [v4 invitationData];
  v10 = [v4 sharedSecret];
  v11 = [v4 sessionIdentifier];
  uint64_t v12 = [v4 equivalentMediaIdentifier];
  if ([v4 hasVersion])
  {
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "version"));
    v14 = [(MRGroupSessionToken *)self initWithHostInfo:v8 invitationData:v9 sharedSecret:v10 sessionIdentifier:v11 equivalentMediaIdentifier:v12 version:v13];
  }
  else
  {
    v14 = [(MRGroupSessionToken *)self initWithHostInfo:v8 invitationData:v9 sharedSecret:v10 sessionIdentifier:v11 equivalentMediaIdentifier:v12 version:0];
  }

  return v14;
}

- (MRGroupSessionToken)initWithHostInfo:(id)a3 invitationData:(id)a4 sharedSecret:(id)a5 sessionIdentifier:(id)a6 equivalentMediaIdentifier:(id)a7 version:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v25 = a5;
  id v24 = a6;
  id obj = a8;
  id v23 = a7;
  id v17 = a8;
  v18 = 0;
  if (v15 && v16)
  {
    v26.receiver = self;
    v26.super_class = (Class)MRGroupSessionToken;
    v19 = [(MRGroupSessionToken *)&v26 init];
    p_isa = (id *)&v19->super.isa;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_invitationData, a4);
      objc_storeStrong(p_isa + 2, a3);
      objc_storeStrong(p_isa + 7, a5);
      objc_storeStrong(p_isa + 4, a6);
      objc_storeStrong(p_isa + 5, a7);
      objc_storeStrong(p_isa + 3, obj);
    }
    self = p_isa;
    v18 = self;
  }

  return v18;
}

- (MRGroupSessionToken)initWithDiscoveredSession:(id)a3 autoConnect:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRGroupSessionToken;
  v8 = [(MRGroupSessionToken *)&v11 init];
  char v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_discoveredSession, a3);
    v9->_autoConnect = a4;
  }

  return v9;
}

- (MRGroupSessionToken)initWithDiscoveredSession:(id)a3
{
  return [(MRGroupSessionToken *)self initWithDiscoveredSession:a3 autoConnect:0];
}

- (MRGroupSessionToken)initWithDeviceInfo:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MRGroupSessionToken;
  v5 = [(MRGroupSessionToken *)&v18 init];
  if (v5)
  {
    unsigned __int8 v6 = [v4 modelID];
    uint64_t v7 = MRGroupSessionRouteTypeFromModelIdentifier(v6);

    v8 = [MRGroupSessionHostInfo alloc];
    char v9 = [v4 name];
    v10 = [v4 modelID];
    uint64_t v11 = [(MRGroupSessionHostInfo *)v8 initWithRouteType:v7 displayName:v9 modelIdentifier:v10 color:0];
    hostInfo = v5->_hostInfo;
    v5->_hostInfo = (MRGroupSessionHostInfo *)v11;

    uint64_t v13 = [v4 deviceUID];
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v13;

    uint64_t v15 = [v4 deviceUID];
    equivalentMediaIdentifier = v5->_equivalentMediaIdentifier;
    v5->_equivalentMediaIdentifier = (NSString *)v15;
  }
  return v5;
}

- (MRGroupSessionToken)initWithData:(id)a3
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = MSVPropertyListDataClasses();
  unsigned __int8 v6 = (void *)[v5 mutableCopy];

  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v13[2] = objc_opt_class();
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  [v6 addObjectsFromArray:v7];

  id v12 = 0;
  v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v6 fromData:v4 error:&v12];

  id v9 = v12;
  if (v9)
  {
    v10 = _MRLogForCategory(0xCuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MRGroupSessionToken initWithData:]();
    }
  }
  return v8;
}

- (MRGroupSessionToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MRGroupSessionToken;
  v5 = [(MRGroupSessionToken *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ds"];
    discoveredSession = v5->_discoveredSession;
    v5->_discoveredSession = (MRDiscoveredGroupSession *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inv"];
    invitationData = v5->_invitationData;
    v5->_invitationData = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hi"];
    hostInfo = v5->_hostInfo;
    v5->_hostInfo = (MRGroupSessionHostInfo *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ss"];
    sharedSecret = v5->_sharedSecret;
    v5->_sharedSecret = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"si"];
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"emi"];
    equivalentMediaIdentifier = v5->_equivalentMediaIdentifier;
    v5->_equivalentMediaIdentifier = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"v"];
    version = v5->_version;
    v5->_version = (NSNumber *)v18;
  }
  return v5;
}

- (_MRGroupSessionTokenProtobuf)protobuf
{
  id v3 = objc_alloc_init(_MRGroupSessionTokenProtobuf);
  id v4 = [(MRGroupSessionToken *)self invitationData];
  [(_MRGroupSessionTokenProtobuf *)v3 setInvitationData:v4];

  v5 = [(MRGroupSessionToken *)self sharedSecret];
  [(_MRGroupSessionTokenProtobuf *)v3 setSharedSecret:v5];

  uint64_t v6 = [(MRGroupSessionToken *)self sessionIdentifier];
  [(_MRGroupSessionTokenProtobuf *)v3 setSessionIdentifier:v6];

  uint64_t v7 = [(MRGroupSessionToken *)self equivalentMediaIdentifier];
  [(_MRGroupSessionTokenProtobuf *)v3 setEquivalentMediaIdentifier:v7];

  uint64_t v8 = [(MRGroupSessionToken *)self hostInfo];
  -[_MRGroupSessionTokenProtobuf setRouteType:](v3, "setRouteType:", [v8 routeType]);

  id v9 = [(MRGroupSessionToken *)self hostInfo];
  uint64_t v10 = [v9 displayName];
  [(_MRGroupSessionTokenProtobuf *)v3 setDisplayName:v10];

  uint64_t v11 = [(MRGroupSessionToken *)self version];
  -[_MRGroupSessionTokenProtobuf setVersion:](v3, "setVersion:", [v11 unsignedIntValue]);

  return v3;
}

- (NSData)data
{
  return (NSData *)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
}

- (void)encodeWithCoder:(id)a3
{
  discoveredSession = self->_discoveredSession;
  id v5 = a3;
  [v5 encodeObject:discoveredSession forKey:@"ds"];
  [v5 encodeObject:self->_invitationData forKey:@"inv"];
  [v5 encodeObject:self->_hostInfo forKey:@"hi"];
  [v5 encodeObject:self->_sharedSecret forKey:@"ss"];
  [v5 encodeObject:self->_sessionIdentifier forKey:@"si"];
  [v5 encodeObject:self->_equivalentMediaIdentifier forKey:@"emi"];
  [v5 encodeObject:self->_version forKey:@"v"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  discoveredSession = self->_discoveredSession;
  id v5 = [MRGroupSessionToken alloc];
  if (discoveredSession)
  {
    uint64_t v6 = (void *)[(MRDiscoveredGroupSession *)self->_discoveredSession copy];
    uint64_t v7 = [(MRGroupSessionToken *)v5 initWithDiscoveredSession:v6];
  }
  else
  {
    uint64_t v6 = (void *)[(MRGroupSessionHostInfo *)self->_hostInfo copy];
    uint64_t v8 = (void *)[(NSData *)self->_invitationData copy];
    id v9 = (void *)[(NSString *)self->_sharedSecret copy];
    uint64_t v10 = (void *)[(NSString *)self->_sessionIdentifier copy];
    uint64_t v11 = (void *)[(NSString *)self->_equivalentMediaIdentifier copy];
    uint64_t v7 = [(MRGroupSessionToken *)v5 initWithHostInfo:v6 invitationData:v8 sharedSecret:v9 sessionIdentifier:v10 equivalentMediaIdentifier:v11 version:self->_version];
  }
  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_invitationData hash];
  unint64_t v4 = [(MRDiscoveredGroupSession *)self->_discoveredSession hash] ^ v3;
  return v4 ^ [(NSString *)self->_sharedSecret hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 invitationData];
    id v7 = [(MRGroupSessionToken *)self invitationData];
    if (v6 == v7)
    {
    }
    else
    {
      int v8 = [v6 isEqual:v7];

      if (!v8)
      {
        char v9 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    uint64_t v10 = [v5 discoveredSession];
    uint64_t v11 = self->_discoveredSession;
    if (v10 == v11)
    {
    }
    else
    {
      uint64_t v12 = v11;
      BOOL v13 = [(MRDiscoveredGroupSession *)v10 isEqual:v11];

      if (!v13)
      {
        char v9 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    uint64_t v14 = [v5 version];
    uint64_t v15 = [(MRGroupSessionToken *)self version];
    if (v14 == v15) {
      char v9 = 1;
    }
    else {
      char v9 = [v14 isEqual:v15];
    }

    goto LABEL_15;
  }
  char v9 = 0;
LABEL_17:

  return v9;
}

- (id)description
{
  uint64_t v3 = [(MRGroupSessionHostInfo *)self->_hostInfo description];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(MRDiscoveredGroupSession *)self->_discoveredSession description];
  }
  id v6 = v5;

  id v7 = [NSString stringWithFormat:@"<%@:%p %@", objc_opt_class(), self, v6];
  int v8 = (void *)[v7 mutableCopy];

  if (self->_sharedSecret) {
    [v8 appendFormat:@", secret=%@", self->_sharedSecret];
  }
  if (self->_sessionIdentifier) {
    [v8 appendFormat:@", id=%@", self->_sessionIdentifier];
  }
  if (self->_equivalentMediaIdentifier) {
    [v8 appendFormat:@", mediaID=%@", self->_equivalentMediaIdentifier];
  }
  if (self->_version) {
    [v8 appendFormat:@", version=%@", self->_version];
  }
  [v8 appendString:@">"];

  return v8;
}

- (NSString)hostDisplayName
{
  hostInfo = self->_hostInfo;
  if (hostInfo)
  {
    id v4 = [(MRGroupSessionHostInfo *)hostInfo displayName];
  }
  else
  {
    id v5 = [(MRDiscoveredGroupSession *)self->_discoveredSession hostInfo];
    id v4 = [v5 displayName];
  }

  return (NSString *)v4;
}

- (unsigned)routeType
{
  hostInfo = self->_hostInfo;
  if (hostInfo)
  {
    return [(MRGroupSessionHostInfo *)hostInfo routeType];
  }
  else
  {
    id v5 = [(MRDiscoveredGroupSession *)self->_discoveredSession hostInfo];
    unsigned __int8 v6 = [v5 routeType];

    return v6;
  }
}

- (NSString)localizedSessionName
{
  uint64_t v3 = [(MRGroupSessionToken *)self hostDisplayName];
  id v4 = MRGroupSessionRouteMakeName(v3, [(MRGroupSessionToken *)self routeType]);

  return (NSString *)v4;
}

- (NSString)effectiveIdentifier
{
  uint64_t v3 = [(MRGroupSessionToken *)self equivalentMediaIdentifier];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(MRGroupSessionToken *)self sessionIdentifier];
  }
  unsigned __int8 v6 = v5;

  return (NSString *)v6;
}

- (MRGroupSessionHostInfo)hostInfo
{
  return self->_hostInfo;
}

- (NSNumber)version
{
  return self->_version;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSString)equivalentMediaIdentifier
{
  return self->_equivalentMediaIdentifier;
}

- (NSString)storefrontCountryCode
{
  return self->_storefrontCountryCode;
}

- (void)setStorefrontCountryCode:(id)a3
{
}

- (NSString)sharedSecret
{
  return self->_sharedSecret;
}

- (MRDiscoveredGroupSession)discoveredSession
{
  return self->_discoveredSession;
}

- (NSData)invitationData
{
  return self->_invitationData;
}

- (BOOL)autoConnect
{
  return self->_autoConnect;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationData, 0);
  objc_storeStrong((id *)&self->_discoveredSession, 0);
  objc_storeStrong((id *)&self->_sharedSecret, 0);
  objc_storeStrong((id *)&self->_storefrontCountryCode, 0);
  objc_storeStrong((id *)&self->_equivalentMediaIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_version, 0);

  objc_storeStrong((id *)&self->_hostInfo, 0);
}

+ (void)tokenForJoinURLString:.cold.1()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3(&dword_194F3C000, v0, v1, "[MRGroupSession] [tokenForJoinURLString] No payload encoded in URL: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)tokenForJoinURLString:.cold.2()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_1_4(&dword_194F3C000, v0, v1, "[MRGroupSession] [tokenForJoinURLString] Failed to decode payload: %{public}@ from URL: %{public}@");
}

+ (void)tokenForJoinURLString:.cold.3()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3(&dword_194F3C000, v0, v1, "[MRGroupSession] [tokenForJoinURLString] Unexpected URL version: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)tokenForJoinURLString:.cold.4()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3(&dword_194F3C000, v0, v1, "[MRGroupSession] [tokenForJoinURLString] URL isn't group session join: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)tokenForJoinURLString:.cold.5()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3(&dword_194F3C000, v0, v1, "[MRGroupSession] [tokenForJoinURLString] URL doesn't have music domain: %{public}@", v2, v3, v4, v5, v6);
}

- (void)initWithData:.cold.1()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3(&dword_194F3C000, v0, v1, "[MRGroupSession] Failed to decode MRGroupSessionToken: %@", v2, v3, v4, v5, v6);
}

@end