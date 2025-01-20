@interface MRClient
+ (BOOL)supportsSecureCoding;
+ (MRClient)anyClient;
+ (MRClient)localClient;
- (BOOL)hasAuxiliaryProperties;
- (BOOL)hasPlaceholder;
- (BOOL)isAirPlay;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocal;
- (BOOL)isSystemBooksApplication;
- (BOOL)isSystemMediaApplication;
- (BOOL)isSystemPodcastsApplication;
- (BOOL)isValid;
- (BOOL)isWebKit;
- (MRClient)initWithBundleIdentifier:(id)a3;
- (MRClient)initWithCoder:(id)a3;
- (MRClient)initWithData:(id)a3;
- (MRClient)initWithProcessIdentifier:(int)a3 bundleIdentifier:(id)a4;
- (MRClient)initWithProtobuf:(id)a3;
- (MRClient)skeleton;
- (MRColorComponents)tintColor;
- (NSArray)bundleIdentifierHierarchy;
- (NSArray)extendedBundleIdentifierHierarchy;
- (NSData)data;
- (NSString)bundleIdentifier;
- (NSString)displayName;
- (NSString)parentApplicationBundleIdentifier;
- (NSString)representedBundleID;
- (NSURL)appIcon;
- (_MRNowPlayingClientProtobuf)protobuf;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (int)processIdentifier;
- (int64_t)visibility;
- (unint64_t)hash;
- (unsigned)processUserIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)resolvePlaceholdersForDeviceInfo:(id)a3;
- (void)setAppIcon:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setExtendedBundleIdentifierHierarchy:(id)a3;
- (void)setParentApplicationBundleIdentifier:(id)a3;
- (void)setProcessIdentifier:(int)a3;
- (void)setProcessUserIdentifier:(unsigned int)a3;
- (void)setTintColor:(id)a3;
- (void)setVisibility:(int64_t)a3;
@end

@implementation MRClient

- (id)description
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v20 = self;
  v4 = [(MRClient *)self bundleIdentifierHierarchy];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * v9++);
        uint64_t v11 = [v4 count];
        v12 = @"/";
        if (v9 + v7 == v11) {
          v12 = &stru_1EE60E7D8;
        }
        [v3 appendFormat:@"%@%@", v10, v12];
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
      v7 += v9;
    }
    while (v6);
  }
  objc_msgSend(v3, "appendFormat:", @"-%d", -[MRClient processIdentifier](v20, "processIdentifier"));
  v13 = [(MRClient *)v20 displayName];

  if (v13)
  {
    v14 = [(MRClient *)v20 displayName];
    [v3 appendFormat:@" (%@)", v14];
  }
  v15 = [(MRClient *)v20 appIcon];

  if (v15)
  {
    v16 = [(MRClient *)v20 appIcon];
    v17 = [v16 absoluteString];
    [v3 appendFormat:@"[%@]", v17];
  }
  v18 = (void *)[v3 copy];

  return v18;
}

- (NSArray)bundleIdentifierHierarchy
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(MRClient *)self bundleIdentifier];

  if (v4)
  {
    uint64_t v5 = [(MRClient *)self bundleIdentifier];
    [v3 addObject:v5];
  }
  uint64_t v6 = [(MRClient *)self parentApplicationBundleIdentifier];

  if (v6)
  {
    uint64_t v7 = [(MRClient *)self parentApplicationBundleIdentifier];
    [v3 addObject:v7];
  }
  uint64_t v8 = [(MRClient *)self extendedBundleIdentifierHierarchy];

  if (v8)
  {
    uint64_t v9 = [(MRClient *)self extendedBundleIdentifierHierarchy];
    [v3 addObjectsFromArray:v9];
  }
  uint64_t v10 = (void *)[v3 copy];

  return (NSArray *)v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setProcessIdentifier:", -[MRClient processIdentifier](self, "processIdentifier"));
  objc_msgSend(v5, "setProcessUserIdentifier:", -[MRClient processUserIdentifier](self, "processUserIdentifier"));
  objc_msgSend(v5, "setVisibility:", -[MRClient visibility](self, "visibility"));
  uint64_t v6 = [(MRClient *)self tintColor];
  uint64_t v7 = (void *)[v6 copyWithZone:a3];
  [v5 setTintColor:v7];

  uint64_t v8 = [(MRClient *)self bundleIdentifier];
  uint64_t v9 = (void *)[v8 copyWithZone:a3];
  [v5 setBundleIdentifier:v9];

  uint64_t v10 = [(MRClient *)self parentApplicationBundleIdentifier];
  uint64_t v11 = (void *)[v10 copyWithZone:a3];
  [v5 setParentApplicationBundleIdentifier:v11];

  v12 = [(MRClient *)self displayName];
  v13 = (void *)[v12 copyWithZone:a3];
  [v5 setDisplayName:v13];

  v14 = [(MRClient *)self extendedBundleIdentifierHierarchy];
  v15 = (void *)[v14 copyWithZone:a3];
  [v5 setExtendedBundleIdentifierHierarchy:v15];

  v16 = [(MRClient *)self appIcon];
  v17 = (void *)[v16 copyWithZone:a3];
  [v5 setAppIcon:v17];

  return v5;
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedBundleIdentifierHierarchy, 0);
  objc_storeStrong((id *)&self->_appIcon, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_parentApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_tintColor, 0);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)parentApplicationBundleIdentifier
{
  return self->_parentApplicationBundleIdentifier;
}

- (NSArray)extendedBundleIdentifierHierarchy
{
  return self->_extendedBundleIdentifierHierarchy;
}

- (NSURL)appIcon
{
  return self->_appIcon;
}

- (int64_t)visibility
{
  return self->_visibility;
}

- (unsigned)processUserIdentifier
{
  return self->_processUserIdentifier;
}

- (MRColorComponents)tintColor
{
  return self->_tintColor;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void)setProcessUserIdentifier:(unsigned int)a3
{
  self->_processUserIdentifier = a3;
}

- (void)setDisplayName:(id)a3
{
}

- (void)setVisibility:(int64_t)a3
{
  self->_visibility = a3;
}

- (void)setTintColor:(id)a3
{
}

- (void)setProcessIdentifier:(int)a3
{
  self->_processIdentifier = a3;
}

- (void)setParentApplicationBundleIdentifier:(id)a3
{
}

- (void)setExtendedBundleIdentifierHierarchy:(id)a3
{
}

- (void)setAppIcon:(id)a3
{
}

- (BOOL)isValid
{
  if ([(MRClient *)self processIdentifier] > 0) {
    return 1;
  }
  v4 = [(MRClient *)self bundleIdentifier];
  BOOL v3 = [v4 length] != 0;

  return v3;
}

- (BOOL)isLocal
{
  BOOL v3 = +[MRClient localClient];
  LOBYTE(self) = [(MRClient *)self isEqual:v3];

  return (char)self;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MRClient *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      if ([(MRClient *)v5 processIdentifier] < 1
        || [(MRClient *)self processIdentifier] < 1)
      {
        BOOL v8 = 0;
        char v7 = 1;
      }
      else
      {
        int v6 = [(MRClient *)v5 processIdentifier];
        char v7 = 0;
        BOOL v8 = v6 == [(MRClient *)self processIdentifier];
      }
      uint64_t v10 = [(MRClient *)v5 bundleIdentifier];
      uint64_t v11 = [(MRClient *)self bundleIdentifier];
      char v12 = [v10 isEqualToString:v11];

      if (v8) {
        char v9 = 1;
      }
      else {
        char v9 = v7 & v12;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (BOOL)hasPlaceholder
{
  BOOL v3 = [(MRClient *)self bundleIdentifier];
  char v4 = [v3 isEqualToString:@"(System Media Application)"];

  if (v4) {
    return 1;
  }
  uint64_t v5 = [(MRClient *)self bundleIdentifier];
  char v6 = [v5 isEqualToString:@"(System Podcast Application)"];

  if (v6) {
    return 1;
  }
  char v7 = [(MRClient *)self bundleIdentifier];
  char v8 = [v7 isEqualToString:@"(System Books Application)"];

  if (v8) {
    return 1;
  }
  uint64_t v10 = [(MRClient *)self bundleIdentifier];
  char v11 = [v10 isEqualToString:@"(System Classical Room Application)"];

  return v11;
}

+ (MRClient)localClient
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__MRClient_localClient__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (localClient_onceToken != -1) {
    dispatch_once(&localClient_onceToken, block);
  }
  v2 = (void *)localClient_client;

  return (MRClient *)v2;
}

- (_MRNowPlayingClientProtobuf)protobuf
{
  BOOL v3 = objc_alloc_init(_MRNowPlayingClientProtobuf);
  [(_MRNowPlayingClientProtobuf *)v3 setProcessIdentifier:[(MRClient *)self processIdentifier]];
  [(_MRNowPlayingClientProtobuf *)v3 setHasProcessIdentifier:[(MRClient *)self processIdentifier] > 0];
  char v4 = [(MRClient *)self bundleIdentifier];
  [(_MRNowPlayingClientProtobuf *)v3 setBundleIdentifier:v4];

  uint64_t v5 = [(MRClient *)self parentApplicationBundleIdentifier];
  [(_MRNowPlayingClientProtobuf *)v3 setParentApplicationBundleIdentifier:v5];

  [(_MRNowPlayingClientProtobuf *)v3 setProcessUserIdentifier:[(MRClient *)self processUserIdentifier]];
  [(_MRNowPlayingClientProtobuf *)v3 setHasProcessUserIdentifier:[(MRClient *)self processUserIdentifier] != 0];
  unint64_t v6 = [(MRClient *)self visibility];
  if (v6 >= 4) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v6;
  }
  [(_MRNowPlayingClientProtobuf *)v3 setNowPlayingVisibility:v7];
  [(_MRNowPlayingClientProtobuf *)v3 setHasNowPlayingVisibility:[(MRClient *)self visibility] != 0];
  char v8 = [(MRClient *)self tintColor];
  char v9 = [v8 protobuf];
  [(_MRNowPlayingClientProtobuf *)v3 setTintColor:v9];

  uint64_t v10 = [(MRClient *)self displayName];
  [(_MRNowPlayingClientProtobuf *)v3 setDisplayName:v10];

  char v11 = [(MRClient *)self extendedBundleIdentifierHierarchy];
  char v12 = (void *)[v11 mutableCopy];
  [(_MRNowPlayingClientProtobuf *)v3 setExtendedBundleIdentifierHierarchys:v12];

  v13 = [(MRClient *)self appIcon];
  v14 = [v13 absoluteString];
  [(_MRNowPlayingClientProtobuf *)v3 setIconURL:v14];

  return v3;
}

- (MRClient)initWithProtobuf:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v30.receiver = self;
    v30.super_class = (Class)MRClient;
    uint64_t v5 = [(MRClient *)&v30 init];
    if (v5)
    {
      v5->_processIdentifier = [v4 processIdentifier];
      unint64_t v6 = [v4 bundleIdentifier];
      uint64_t v7 = [v6 copy];
      bundleIdentifier = v5->_bundleIdentifier;
      v5->_bundleIdentifier = (NSString *)v7;

      char v9 = [v4 parentApplicationBundleIdentifier];
      uint64_t v10 = [v9 copy];
      parentApplicationBundleIdentifier = v5->_parentApplicationBundleIdentifier;
      v5->_parentApplicationBundleIdentifier = (NSString *)v10;

      v5->_processUserIdentifier = [v4 processUserIdentifier];
      unsigned int v12 = [v4 nowPlayingVisibility];
      if (v12 >= 4) {
        int64_t v13 = 0;
      }
      else {
        int64_t v13 = v12;
      }
      v5->_visibility = v13;
      v14 = [MRColorComponents alloc];
      v15 = [v4 tintColor];
      uint64_t v16 = [(MRColorComponents *)v14 initWithProtobuf:v15];
      tintColor = v5->_tintColor;
      v5->_tintColor = (MRColorComponents *)v16;

      v18 = [v4 displayName];
      uint64_t v19 = [v18 copy];
      displayName = v5->_displayName;
      v5->_displayName = (NSString *)v19;

      long long v21 = [v4 extendedBundleIdentifierHierarchys];
      uint64_t v22 = [v21 copy];
      extendedBundleIdentifierHierarchy = v5->_extendedBundleIdentifierHierarchy;
      v5->_extendedBundleIdentifierHierarchy = (NSArray *)v22;

      if ([v4 hasIconURL])
      {
        id v24 = objc_alloc(MEMORY[0x1E4F1CB10]);
        v25 = [v4 iconURL];
        uint64_t v26 = [v24 initWithString:v25];
        appIcon = v5->_appIcon;
        v5->_appIcon = (NSURL *)v26;
      }
      else
      {
        v25 = v5->_appIcon;
        v5->_appIcon = 0;
      }
    }
    self = v5;
    v28 = self;
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (unint64_t)hash
{
  return [(NSString *)self->_bundleIdentifier hash] ^ self->_processIdentifier;
}

void __23__MRClient_localClient__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v3 = [v2 processIdentifier];

  id v4 = [MEMORY[0x1E4F28B50] mainBundle];
  id v8 = [v4 bundleIdentifier];

  if (!v8)
  {
    uint64_t v5 = [MEMORY[0x1E4F28F80] processInfo];
    id v8 = [v5 processName];
  }
  uint64_t v6 = [objc_alloc(*(Class *)(a1 + 32)) initWithProcessIdentifier:v3 bundleIdentifier:v8];
  uint64_t v7 = (void *)localClient_client;
  localClient_client = v6;
}

+ (MRClient)anyClient
{
  v2 = (void *)[objc_alloc((Class)a1) initWithBundleIdentifier:@"any"];

  return (MRClient *)v2;
}

- (MRClient)initWithProcessIdentifier:(int)a3 bundleIdentifier:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MRClient;
  uint64_t v7 = [(MRClient *)&v12 init];
  id v8 = v7;
  if (v7)
  {
    v7->_processIdentifier = a3;
    uint64_t v9 = [v6 copy];
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v9;
  }
  return v8;
}

- (MRClient)initWithBundleIdentifier:(id)a3
{
  return [(MRClient *)self initWithProcessIdentifier:0 bundleIdentifier:a3];
}

- (void)resolvePlaceholdersForDeviceInfo:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MRClient *)self bundleIdentifier];
  if ([v5 isEqualToString:@"(System Media Application)"])
  {
    id v6 = [v4 systemMediaApplication];
    if (!v6)
    {
      id v6 = (void *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
      uint64_t v7 = _MRLogForCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v8 = 138543362;
        *(void *)&v8[4] = v6;
LABEL_13:
        _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "Falling back to %{public}@ for system app since none specified in deviceInfo", v8, 0xCu);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  if ([v5 isEqualToString:@"(System Podcast Application)"])
  {
    id v6 = [v4 systemPodcastApplication];
    if (!v6)
    {
      id v6 = (void *)MRMediaRemoteCopyLocalDeviceSystemPodcastApplicationDisplayID();
      uint64_t v7 = _MRLogForCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v8 = 138543362;
        *(void *)&v8[4] = v6;
        goto LABEL_13;
      }
LABEL_14:
    }
LABEL_15:
    -[MRClient setBundleIdentifier:](self, "setBundleIdentifier:", v6, *(_OWORD *)v8);

    goto LABEL_16;
  }
  if ([v5 isEqualToString:@"(System Books Application)"])
  {
    id v6 = [v4 systemBooksApplication];
    if (!v6)
    {
      id v6 = (void *)MRMediaRemoteCopyLocalDeviceSystemBooksApplicationDisplayID();
      uint64_t v7 = _MRLogForCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v8 = 138543362;
        *(void *)&v8[4] = v6;
        goto LABEL_13;
      }
      goto LABEL_14;
    }
    goto LABEL_15;
  }
LABEL_16:
}

- (BOOL)isSystemMediaApplication
{
  v2 = [(MRClient *)self bundleIdentifier];
  char IsSystemMediaApplication = MRMediaRemoteApplicationIsSystemMediaApplication((uint64_t)v2);

  return IsSystemMediaApplication;
}

- (MRClient)initWithData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [[_MRNowPlayingClientProtobuf alloc] initWithData:v4];

    self = [(MRClient *)self initWithProtobuf:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (MRClient)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobuf"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = _MRLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MRLanguageOption initWithCoder:]((uint64_t)v5, v6);
    }

    uint64_t v5 = 0;
  }
  uint64_t v7 = [(MRClient *)self initWithProtobuf:v5];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MRClient *)self protobuf];
  [v4 encodeObject:v5 forKey:@"protobuf"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)data
{
  v2 = [(MRClient *)self protobuf];
  uint64_t v3 = [v2 data];

  return (NSData *)v3;
}

- (MRClient)skeleton
{
  id v3 = objc_alloc((Class)objc_opt_class());
  uint64_t v4 = [(MRClient *)self processIdentifier];
  id v5 = [(MRClient *)self bundleIdentifier];
  id v6 = (void *)[v3 initWithProcessIdentifier:v4 bundleIdentifier:v5];

  return (MRClient *)v6;
}

- (NSString)representedBundleID
{
  id v3 = [(MRClient *)self bundleIdentifier];
  uint64_t v4 = [(MRClient *)self bundleIdentifierHierarchy];
  id v5 = [(MRClient *)self parentApplicationBundleIdentifier];
  if ([v4 count])
  {
    id v6 = [v4 lastObject];
  }
  else
  {
    if (![v5 length]) {
      goto LABEL_6;
    }
    id v6 = v5;
  }
  id v7 = v6;

  id v3 = v7;
LABEL_6:

  return (NSString *)v3;
}

- (BOOL)hasAuxiliaryProperties
{
  id v3 = [(MRClient *)self displayName];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(MRClient *)self parentApplicationBundleIdentifier];
    if (v5)
    {
      BOOL v4 = 1;
    }
    else
    {
      id v6 = [(MRClient *)self tintColor];
      if (v6 || [(MRClient *)self visibility])
      {
        BOOL v4 = 1;
      }
      else
      {
        id v8 = [(MRClient *)self appIcon];
        BOOL v4 = v8 != 0;
      }
    }
  }
  return v4;
}

- (BOOL)isSystemPodcastsApplication
{
  v2 = [(MRClient *)self bundleIdentifier];
  char IsSystemPodcastApplication = MRMediaRemoteApplicationIsSystemPodcastApplication((uint64_t)v2);

  return IsSystemPodcastApplication;
}

- (BOOL)isSystemBooksApplication
{
  v2 = [(MRClient *)self bundleIdentifier];
  char IsSystemBooksApplication = MRMediaRemoteApplicationIsSystemBooksApplication((uint64_t)v2);

  return IsSystemBooksApplication;
}

- (BOOL)isAirPlay
{
  v2 = [(MRClient *)self bundleIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.tvairplayd"];

  return v3;
}

- (BOOL)isWebKit
{
  v2 = [(MRClient *)self bundleIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.WebKit.GPU"];

  return v3;
}

- (id)debugDescription
{
  v2 = [(MRClient *)self protobuf];
  char v3 = [v2 dictionaryRepresentation];
  BOOL v4 = [v3 description];

  return v4;
}

- (void)mergeFrom:(id)a3
{
  id v16 = a3;
  if ([v16 processIdentifier]) {
    -[MRClient setProcessIdentifier:](self, "setProcessIdentifier:", [v16 processIdentifier]);
  }
  if ([v16 processUserIdentifier]) {
    -[MRClient setProcessUserIdentifier:](self, "setProcessUserIdentifier:", [v16 processUserIdentifier]);
  }
  if ([v16 visibility]) {
    -[MRClient setVisibility:](self, "setVisibility:", [v16 visibility]);
  }
  BOOL v4 = [v16 tintColor];

  if (v4)
  {
    id v5 = [v16 tintColor];
    [(MRClient *)self setTintColor:v5];
  }
  id v6 = [v16 bundleIdentifier];

  if (v6)
  {
    id v7 = [v16 bundleIdentifier];
    [(MRClient *)self setBundleIdentifier:v7];
  }
  id v8 = [v16 parentApplicationBundleIdentifier];

  if (v8)
  {
    uint64_t v9 = [v16 parentApplicationBundleIdentifier];
    [(MRClient *)self setParentApplicationBundleIdentifier:v9];
  }
  uint64_t v10 = [v16 displayName];

  if (v10)
  {
    char v11 = [v16 displayName];
    [(MRClient *)self setDisplayName:v11];
  }
  objc_super v12 = [v16 extendedBundleIdentifierHierarchy];

  if (v12)
  {
    int64_t v13 = [v16 extendedBundleIdentifierHierarchy];
    [(MRClient *)self setExtendedBundleIdentifierHierarchy:v13];
  }
  v14 = [v16 appIcon];

  if (v14)
  {
    v15 = [v16 appIcon];
    [(MRClient *)self setAppIcon:v15];
  }
}

@end