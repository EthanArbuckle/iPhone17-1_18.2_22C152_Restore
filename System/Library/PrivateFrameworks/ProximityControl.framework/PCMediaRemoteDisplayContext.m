@interface PCMediaRemoteDisplayContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MRNowPlayingPlayerResponse)localDeviceState;
- (MRNowPlayingPlayerResponse)proxDeviceState;
- (MRNowPlayingPlayerResponse)selectedDeviceState;
- (NSString)mediaRemoteID;
- (PCMediaRemoteDisplayContext)initWithCoder:(id)a3;
- (id)userActivityInfo;
- (void)encodeWithCoder:(id)a3;
- (void)setLocalDeviceState:(id)a3;
- (void)setMediaRemoteID:(id)a3;
- (void)setProxDeviceState:(id)a3;
- (void)setSelectedDeviceState:(id)a3;
@end

@implementation PCMediaRemoteDisplayContext

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v21.receiver = self;
    v21.super_class = (Class)PCMediaRemoteDisplayContext;
    if (![(PCDisplayContext *)&v21 isEqual:v5])
    {
LABEL_12:
      char v12 = 0;
LABEL_19:

      goto LABEL_20;
    }
    mediaRemoteID = self->_mediaRemoteID;
    v7 = [v5 mediaRemoteID];
    v8 = mediaRemoteID;
    v9 = v7;
    if (v8 == v9)
    {
    }
    else
    {
      v10 = v9;
      if ((v8 == 0) == (v9 != 0)) {
        goto LABEL_17;
      }
      int v11 = [(NSString *)v8 isEqual:v9];

      if (!v11) {
        goto LABEL_12;
      }
    }
    proxDeviceState = self->_proxDeviceState;
    v14 = [v5 proxDeviceState];
    v8 = proxDeviceState;
    v15 = v14;
    if (v8 == v15)
    {
    }
    else
    {
      v10 = v15;
      if ((v8 == 0) == (v15 != 0)) {
        goto LABEL_17;
      }
      int v16 = [(NSString *)v8 isEqual:v15];

      if (!v16) {
        goto LABEL_12;
      }
    }
    selectedDeviceState = self->_selectedDeviceState;
    v18 = [v5 selectedDeviceState];
    v8 = selectedDeviceState;
    v19 = v18;
    v10 = v19;
    if (v8 == v19)
    {
      char v12 = 1;
      goto LABEL_18;
    }
    if ((v8 == 0) != (v19 != 0))
    {
      char v12 = [(NSString *)v8 isEqual:v19];
LABEL_18:

      goto LABEL_19;
    }
LABEL_17:
    char v12 = 0;
    goto LABEL_18;
  }
  char v12 = 0;
LABEL_20:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PCMediaRemoteDisplayContext;
  [(PCDisplayContext *)&v6 encodeWithCoder:v4];
  mediaRemoteID = self->_mediaRemoteID;
  if (mediaRemoteID) {
    [v4 encodeObject:mediaRemoteID forKey:@"mrID"];
  }
}

- (PCMediaRemoteDisplayContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PCMediaRemoteDisplayContext;
  id v5 = [(PCDisplayContext *)&v8 initWithCoder:v4];
  if (v5)
  {
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();
  }
  return v5;
}

- (id)userActivityInfo
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = [(PCMediaRemoteDisplayContext *)self proxDeviceState];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 playbackQueue];
    v7 = v6;
    if (v6)
    {
      objc_super v8 = [v6 contentItemWithOffset:0];
      if (v8)
      {
        uint64_t v9 = [v5 playbackState];
        v10 = [NSNumber numberWithUnsignedInt:v9];
        [v3 setObject:v10 forKey:@"playbackState"];

        int v11 = [v8 artwork];
        char v12 = v11;
        if (v11)
        {
          v13 = [v11 imageData];
          [v3 setObject:v13 forKey:@"artworkKey"];
        }
        v14 = [v8 metadata];
        v15 = [v14 userInfo];

        if (v15) {
          [v3 setObject:v15 forKey:@"metadataKey"];
        }

        int v16 = [v5 playerPath];
        v17 = [v16 client];
        v18 = [v17 bundleIdentifier];

        if (v18) {
          [v3 setObject:v18 forKey:@"bundleIdentifierKey"];
        }

        v19 = (void *)[v3 copy];
      }
      else
      {
        v19 = 0;
      }
    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (NSString)mediaRemoteID
{
  return self->_mediaRemoteID;
}

- (void)setMediaRemoteID:(id)a3
{
}

- (MRNowPlayingPlayerResponse)proxDeviceState
{
  return self->_proxDeviceState;
}

- (void)setProxDeviceState:(id)a3
{
}

- (MRNowPlayingPlayerResponse)selectedDeviceState
{
  return self->_selectedDeviceState;
}

- (void)setSelectedDeviceState:(id)a3
{
}

- (MRNowPlayingPlayerResponse)localDeviceState
{
  return self->_localDeviceState;
}

- (void)setLocalDeviceState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDeviceState, 0);
  objc_storeStrong((id *)&self->_selectedDeviceState, 0);
  objc_storeStrong((id *)&self->_proxDeviceState, 0);
  objc_storeStrong((id *)&self->_mediaRemoteID, 0);
}

@end