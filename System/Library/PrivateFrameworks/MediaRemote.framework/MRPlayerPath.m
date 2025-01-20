@interface MRPlayerPath
+ (BOOL)supportsSecureCoding;
+ (MRPlayerPath)anyPlayerPath;
+ (id)localPlayerPath;
+ (id)localResolvedPlayerPathFromPlayerPath:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHomepodDemoApplication;
- (BOOL)isLocal;
- (BOOL)isResolved;
- (BOOL)isSystemBooksApplication;
- (BOOL)isSystemMediaApplication;
- (BOOL)isSystemPodcastsApplication;
- (MRClient)client;
- (MROrigin)origin;
- (MRPlayer)player;
- (MRPlayerPath)initWithCoder:(id)a3;
- (MRPlayerPath)initWithData:(id)a3;
- (MRPlayerPath)initWithOrigin:(id)a3 bundleIdentifier:(id)a4 player:(id)a5;
- (MRPlayerPath)initWithOrigin:(id)a3 client:(id)a4 player:(id)a5;
- (MRPlayerPath)initWithProtobuf:(id)a3;
- (MRPlayerPath)localResolvedPlayerPath;
- (MRPlayerPath)skeleton;
- (NSData)data;
- (_MRNowPlayingPlayerPathProtobuf)protobuf;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)playerPathByLocalizingWithOrigin:(id)a3;
- (id)playerPathByRedirectingToOrigin:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setClient:(id)a3;
- (void)setOrigin:(id)a3;
- (void)setPlayer:(id)a3;
@end

@implementation MRPlayerPath

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_client, 0);

  objc_storeStrong((id *)&self->_origin, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = [(MRPlayerPath *)self origin];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setOrigin:v7];

  v8 = [(MRPlayerPath *)self client];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setClient:v9];

  v10 = [(MRPlayerPath *)self player];
  v11 = (void *)[v10 copyWithZone:a3];
  [v5 setPlayer:v11];

  return v5;
}

- (MROrigin)origin
{
  return self->_origin;
}

- (MRPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  id v9 = a3;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      v7 = [NSString stringWithUTF8String:"-[MRPlayerPath setPlayer:]"];
      uint64_t v8 = objc_opt_class();
      [v6 handleFailureInFunction:v7, @"MRPlayerPath.m", 103, @"Type mismatch, expecting %@ found %@", v8, objc_opt_class() file lineNumber description];
    }
  }
  v4 = (MRPlayer *)[v9 copy];
  player = self->_player;
  self->_player = v4;
}

- (void)setClient:(id)a3
{
  id v9 = a3;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      v7 = [NSString stringWithUTF8String:"-[MRPlayerPath setClient:]"];
      uint64_t v8 = objc_opt_class();
      [v6 handleFailureInFunction:v7, @"MRPlayerPath.m", 97, @"Type mismatch, expecting %@ found %@", v8, objc_opt_class() file lineNumber description];
    }
  }
  v4 = (MRClient *)[v9 copy];
  client = self->_client;
  self->_client = v4;
}

- (void)setOrigin:(id)a3
{
  id v9 = a3;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      v7 = [NSString stringWithUTF8String:"-[MRPlayerPath setOrigin:]"];
      uint64_t v8 = objc_opt_class();
      [v6 handleFailureInFunction:v7, @"MRPlayerPath.m", 91, @"Type mismatch, expecting %@ found %@", v8, objc_opt_class() file lineNumber description];
    }
  }
  v4 = (MROrigin *)[v9 copy];
  origin = self->_origin;
  self->_origin = v4;
}

- (MRPlayerPath)initWithOrigin:(id)a3 client:(id)a4 player:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)MRPlayerPath;
  v11 = [(MRPlayerPath *)&v28 init];
  if (!v11) {
    goto LABEL_14;
  }
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v20 = [NSString stringWithUTF8String:"-[MRPlayerPath initWithOrigin:client:player:]"];
    uint64_t v21 = objc_opt_class();
    [v19 handleFailureInFunction:v20, @"MRPlayerPath.m", 55, @"Type mismatch, expecting %@ found %@", v21, objc_opt_class() file lineNumber description];

    if (v9)
    {
LABEL_5:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v22 = [MEMORY[0x1E4F28B00] currentHandler];
        v23 = [NSString stringWithUTF8String:"-[MRPlayerPath initWithOrigin:client:player:]"];
        uint64_t v24 = objc_opt_class();
        [v22 handleFailureInFunction:v23, @"MRPlayerPath.m", 56, @"Type mismatch, expecting %@ found %@", v24, objc_opt_class() file lineNumber description];
      }
    }
  }
  else if (v9)
  {
    goto LABEL_5;
  }
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      v26 = [NSString stringWithUTF8String:"-[MRPlayerPath initWithOrigin:client:player:]"];
      uint64_t v27 = objc_opt_class();
      [v25 handleFailureInFunction:v26, @"MRPlayerPath.m", 57, @"Type mismatch, expecting %@ found %@", v27, objc_opt_class() file lineNumber description];
    }
  }
  uint64_t v12 = [v8 copy];
  origin = v11->_origin;
  v11->_origin = (MROrigin *)v12;

  if ([v9 isValid])
  {
    uint64_t v14 = [v9 copy];
    client = v11->_client;
    v11->_client = (MRClient *)v14;
  }
  else
  {
    client = v11->_client;
    v11->_client = 0;
  }

  uint64_t v16 = [v10 copy];
  player = v11->_player;
  v11->_player = (MRPlayer *)v16;

LABEL_14:
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (MRPlayerPath *)a3;
  if (v6 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
      id v8 = [(MRPlayerPath *)v7 origin];
      id v9 = [(MRPlayerPath *)self origin];
      if (v8 != v9)
      {
        v3 = [(MRPlayerPath *)v7 origin];
        v4 = [(MRPlayerPath *)self origin];
        if (![v3 isEqual:v4])
        {
          char v10 = 0;
          goto LABEL_19;
        }
      }
      v11 = [(MRPlayerPath *)v7 client];
      uint64_t v12 = [(MRPlayerPath *)self client];
      if (v11 == v12)
      {
        v25 = v11;
      }
      else
      {
        v13 = [(MRPlayerPath *)v7 client];
        v26 = [(MRPlayerPath *)self client];
        if (!objc_msgSend(v13, "isEqual:"))
        {
          char v10 = 0;
          goto LABEL_17;
        }
        uint64_t v24 = v13;
        v25 = v11;
      }
      uint64_t v14 = [(MRPlayerPath *)v7 player];
      uint64_t v15 = [(MRPlayerPath *)self player];
      if (v14 == (void *)v15)
      {

        char v10 = 1;
      }
      else
      {
        uint64_t v16 = (void *)v15;
        [(MRPlayerPath *)v7 player];
        v17 = v23 = v3;
        [(MRPlayerPath *)self player];
        v22 = v4;
        v18 = v9;
        v20 = v19 = v8;
        char v10 = [v17 isEqual:v20];

        id v8 = v19;
        id v9 = v18;
        v4 = v22;

        v3 = v23;
      }
      v13 = v24;
      v11 = v25;
      if (v25 == v12)
      {
LABEL_18:

        if (v8 == v9)
        {
LABEL_20:

          goto LABEL_21;
        }
LABEL_19:

        goto LABEL_20;
      }
LABEL_17:

      goto LABEL_18;
    }
    char v10 = 0;
  }
LABEL_21:

  return v10;
}

- (MRClient)client
{
  return self->_client;
}

- (BOOL)isLocal
{
  BOOL v3 = [(MRPlayerPath *)self isResolved];
  if (v3)
  {
    v4 = [(MRPlayerPath *)self client];
    int v5 = [v4 isLocal];

    if (!v5)
    {
LABEL_9:
      LOBYTE(v3) = 0;
      return v3;
    }
    v6 = +[MRUserSettings currentSettings];
    int v7 = [v6 supportMultiplayerHost];

    id v8 = [(MRPlayerPath *)self origin];
    int v9 = [v8 isLocal];
    int v10 = v9;
    if (v7)
    {
      if (v9)
      {

        goto LABEL_9;
      }
      v11 = [(MRPlayerPath *)self origin];
      int v12 = [v11 isLocallyHosted];

      if ((v12 & 1) == 0) {
        goto LABEL_9;
      }
    }
    else
    {

      if (!v10) {
        goto LABEL_9;
      }
    }
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)isResolved
{
  BOOL v3 = [(MRPlayerPath *)self origin];
  if (v3)
  {
    v4 = [(MRPlayerPath *)self client];
    if (v4)
    {
      int v5 = [(MRPlayerPath *)self player];
      if (v5)
      {
        v6 = [(MRPlayerPath *)self client];
        if ((int)[v6 processIdentifier] < 1)
        {
          LOBYTE(v8) = 0;
        }
        else
        {
          int v7 = [(MRPlayerPath *)self client];
          int v8 = [v7 hasPlaceholder] ^ 1;
        }
      }
      else
      {
        LOBYTE(v8) = 0;
      }
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (NSData)data
{
  v2 = [(MRPlayerPath *)self protobuf];
  BOOL v3 = [v2 data];

  return (NSData *)v3;
}

- (_MRNowPlayingPlayerPathProtobuf)protobuf
{
  BOOL v3 = objc_alloc_init(_MRNowPlayingPlayerPathProtobuf);
  v4 = [(MRPlayerPath *)self origin];
  int v5 = [v4 protobuf];
  [(_MRNowPlayingPlayerPathProtobuf *)v3 setOrigin:v5];

  v6 = [(MRPlayerPath *)self client];
  int v7 = [v6 protobuf];
  [(_MRNowPlayingPlayerPathProtobuf *)v3 setClient:v7];

  int v8 = [(MRPlayerPath *)self player];
  int v9 = -[MRPlayer protobuf](v8);
  [(_MRNowPlayingPlayerPathProtobuf *)v3 setPlayer:v9];

  return v3;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(MRPlayerPath *)self origin];
  int v5 = [v4 displayName];
  v6 = [(MRPlayerPath *)self origin];
  uint64_t v7 = (int)[v6 identifier];
  int v8 = [(MRPlayerPath *)self client];
  int v9 = [(MRPlayerPath *)self player];
  int v10 = [v9 identifier];
  v11 = (void *)[v3 initWithFormat:@"origin-%@-%ld/client-%@/player-%@", v5, v7, v8, v10];

  return v11;
}

- (MRPlayerPath)initWithData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    int v5 = [[_MRNowPlayingPlayerPathProtobuf alloc] initWithData:v4];

    self = [(MRPlayerPath *)self initWithProtobuf:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (MRPlayerPath)initWithProtobuf:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    int v5 = [MROrigin alloc];
    v6 = [v4 origin];
    uint64_t v7 = [(MROrigin *)v5 initWithProtobuf:v6];

    int v8 = [MRClient alloc];
    int v9 = [v4 client];
    int v10 = [(MRClient *)v8 initWithProtobuf:v9];

    v11 = [MRPlayer alloc];
    int v12 = [v4 player];

    id v13 = -[MRPlayer initWithProtobuf:](v11, v12);
    self = [(MRPlayerPath *)self initWithOrigin:v7 client:v10 player:v13];

    uint64_t v14 = self;
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3 = [(MROrigin *)self->_origin hash];
  unint64_t v4 = [(MRClient *)self->_client hash] ^ v3;
  return v4 ^ [(MRPlayer *)self->_player hash];
}

+ (MRPlayerPath)anyPlayerPath
{
  v2 = [MRPlayerPath alloc];
  unint64_t v3 = +[MROrigin anyOrigin];
  unint64_t v4 = +[MRClient anyClient];
  int v5 = +[MRPlayer anyPlayer];
  v6 = [(MRPlayerPath *)v2 initWithOrigin:v3 client:v4 player:v5];

  return v6;
}

+ (id)localResolvedPlayerPathFromPlayerPath:(id)a3
{
  unint64_t v3 = (MRPlayerPath *)a3;
  if (!v3) {
    unint64_t v3 = [[MRPlayerPath alloc] initWithOrigin:0 client:0 player:0];
  }
  unint64_t v4 = [(MRPlayerPath *)v3 localResolvedPlayerPath];

  return v4;
}

- (MRPlayerPath)localResolvedPlayerPath
{
  unint64_t v3 = [(MRPlayerPath *)self origin];
  unint64_t v4 = v3;
  if (v3)
  {
    int v5 = (void *)[v3 copy];
  }
  else
  {
    v6 = +[MROrigin localOrigin];
    int v5 = (void *)[v6 copy];
  }
  uint64_t v7 = [(MRPlayerPath *)self client];
  int v8 = v7;
  if (v7)
  {
    int v9 = (void *)[v7 copy];
  }
  else
  {
    int v10 = +[MRClient localClient];
    int v9 = (void *)[v10 copy];
  }
  v11 = [(MRPlayerPath *)self player];
  int v12 = v11;
  if (v11)
  {
    id v13 = (void *)[v11 copy];
  }
  else
  {
    uint64_t v14 = +[MRPlayer defaultPlayer];
    id v13 = (void *)[v14 copy];
  }
  if (![v9 processIdentifier])
  {
    uint64_t v15 = +[MRClient localClient];
    objc_msgSend(v9, "setProcessIdentifier:", objc_msgSend(v15, "processIdentifier"));
  }
  uint64_t v16 = [v9 bundleIdentifier];

  if (!v16)
  {
    v17 = +[MRClient localClient];
    v18 = [v17 bundleIdentifier];
    [v9 setBundleIdentifier:v18];
  }
  v19 = [v13 identifier];

  if (!v19)
  {
    v20 = +[MRPlayer defaultPlayer];
    uint64_t v21 = [v20 identifier];
    [v13 setIdentifier:v21];
  }
  v22 = [[MRPlayerPath alloc] initWithOrigin:v5 client:v9 player:v13];

  return v22;
}

- (BOOL)isSystemMediaApplication
{
  v2 = [(MRPlayerPath *)self client];
  char v3 = [v2 isSystemMediaApplication];

  return v3;
}

+ (id)localPlayerPath
{
  if (localPlayerPath_onceToken != -1) {
    dispatch_once(&localPlayerPath_onceToken, &__block_literal_global_40);
  }
  v2 = (void *)localPlayerPath_localPlayerPath;

  return v2;
}

void __31__MRPlayerPath_localPlayerPath__block_invoke()
{
  id v4 = +[MROrigin localOrigin];
  v0 = +[MRClient localClient];
  v1 = +[MRPlayer defaultPlayer];
  v2 = [[MRPlayerPath alloc] initWithOrigin:v4 client:v0 player:v1];
  char v3 = (void *)localPlayerPath_localPlayerPath;
  localPlayerPath_localPlayerPath = (uint64_t)v2;
}

- (MRPlayerPath)initWithOrigin:(id)a3 bundleIdentifier:(id)a4 player:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[MRClient alloc] initWithBundleIdentifier:v9];

  int v12 = [(MRPlayerPath *)self initWithOrigin:v10 client:v11 player:v8];
  return v12;
}

- (MRPlayerPath)skeleton
{
  id v3 = objc_alloc((Class)objc_opt_class());
  id v4 = [(MRPlayerPath *)self origin];
  int v5 = [v4 skeleton];
  v6 = [(MRPlayerPath *)self client];
  uint64_t v7 = [v6 skeleton];
  id v8 = [(MRPlayerPath *)self player];
  id v9 = [v8 skeleton];
  id v10 = (void *)[v3 initWithOrigin:v5 client:v7 player:v9];

  return (MRPlayerPath *)v10;
}

- (BOOL)isSystemPodcastsApplication
{
  v2 = [(MRPlayerPath *)self client];
  char v3 = [v2 isSystemPodcastsApplication];

  return v3;
}

- (BOOL)isSystemBooksApplication
{
  v2 = [(MRPlayerPath *)self client];
  char v3 = [v2 isSystemBooksApplication];

  return v3;
}

- (BOOL)isHomepodDemoApplication
{
  char v3 = [(MRPlayerPath *)self client];
  uint64_t v4 = [v3 bundleIdentifier];
  char v5 = [(id)v4 isEqualToString:@"com.apple.HomePodCannedDemo"];

  v6 = [(MRPlayerPath *)self client];
  uint64_t v7 = [v6 bundleIdentifier];
  LOBYTE(v4) = [v7 isEqualToString:@"com.apple.ChannelDemoCap"];

  return v5 | v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MRPlayerPath)initWithCoder:(id)a3
{
  id v4 = a3;
  char v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobuf"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = _MRLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MRLanguageOption initWithCoder:]((uint64_t)v5, v6);
    }

    char v5 = 0;
  }
  uint64_t v7 = [(MRPlayerPath *)self initWithProtobuf:v5];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MRPlayerPath *)self protobuf];
  [v4 encodeObject:v5 forKey:@"protobuf"];
}

- (id)playerPathByRedirectingToOrigin:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    v32 = [NSString stringWithUTF8String:"-[MRPlayerPath playerPathByRedirectingToOrigin:]"];
    [v31 handleFailureInFunction:v32, @"MRPlayerPath.m", 250, @"Invalid parameter not satisfying: %@", @"origin" file lineNumber description];
  }
  id v5 = objc_alloc_init(MRPlayerPath);
  [(MRPlayerPath *)v5 setOrigin:v4];
  v6 = [(MRPlayerPath *)self client];

  if (v6)
  {
    uint64_t v7 = objc_alloc_init(MRClient);
    [(MRPlayerPath *)v5 setClient:v7];

    id v8 = [(MRPlayerPath *)self client];
    id v9 = [v8 bundleIdentifier];
    id v10 = [(MRPlayerPath *)v5 client];
    [v10 setBundleIdentifier:v9];
  }
  v11 = [(MRPlayerPath *)self player];

  if (v11)
  {
    int v12 = [MRPlayer alloc];
    id v13 = [(MRPlayerPath *)self player];
    uint64_t v14 = [v13 identifier];
    uint64_t v15 = [(MRPlayerPath *)self player];
    uint64_t v16 = [v15 displayName];
    v17 = [(MRPlayer *)v12 initWithIdentifier:v14 displayName:v16];
    [(MRPlayerPath *)v5 setPlayer:v17];
  }
  v18 = [(MRPlayerPath *)self client];
  v19 = [v18 bundleIdentifier];
  int IsSystemMediaApplication = MRMediaRemoteApplicationIsSystemMediaApplication((uint64_t)v19);

  if (IsSystemMediaApplication)
  {
    uint64_t v21 = kMRMediaRemoteSystemMediaApplicationDisplayIdentifier;
  }
  else
  {
    v22 = [(MRPlayerPath *)self client];
    v23 = [v22 bundleIdentifier];
    int IsSystemPodcastApplication = MRMediaRemoteApplicationIsSystemPodcastApplication((uint64_t)v23);

    if (IsSystemPodcastApplication)
    {
      uint64_t v21 = kMRMediaRemoteSystemPodcastApplicationDisplayIdentifier;
    }
    else
    {
      v25 = [(MRPlayerPath *)self client];
      v26 = [v25 bundleIdentifier];
      int IsSystemBooksApplication = MRMediaRemoteApplicationIsSystemBooksApplication((uint64_t)v26);

      if (!IsSystemBooksApplication) {
        goto LABEL_14;
      }
      uint64_t v21 = kMRMediaRemoteSystemBooksApplicationDisplayIdentifier;
    }
  }
  objc_super v28 = *v21;
  v29 = [(MRPlayerPath *)v5 client];
  [v29 setBundleIdentifier:v28];

LABEL_14:

  return v5;
}

- (id)playerPathByLocalizingWithOrigin:(id)a3
{
  id v4 = a3;
  id v5 = [MRPlayerPath alloc];
  v6 = [(MRPlayerPath *)self client];
  uint64_t v7 = [(MRPlayerPath *)self player];
  id v8 = [(MRPlayerPath *)v5 initWithOrigin:v4 client:v6 player:v7];

  return v8;
}

@end