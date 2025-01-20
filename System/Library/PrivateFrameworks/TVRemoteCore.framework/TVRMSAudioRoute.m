@interface TVRMSAudioRoute
+ (id)audioRoutesFromProtobufs:(id)a3;
+ (id)protobufsFromAudioRoutes:(id)a3;
- (BOOL)isEqualToAudioRoute:(id)a3;
- (BOOL)isSelected;
- (BOOL)supportsVideo;
- (NSString)displayName;
- (TVRMSAudioRoute)initWithProtobuf:(id)a3;
- (id)protobuf;
- (unint64_t)macAddress;
- (void)setDisplayName:(id)a3;
- (void)setMacAddress:(unint64_t)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSupportsVideo:(BOOL)a3;
@end

@implementation TVRMSAudioRoute

- (TVRMSAudioRoute)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVRMSAudioRoute;
  v5 = [(TVRMSAudioRoute *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 displayName];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

    v5->_macAddress = [v4 macAddress];
    v5->_supportsVideo = [v4 supportsVideo];
    v5->_selected = [v4 selected];
  }

  return v5;
}

- (id)protobuf
{
  v3 = objc_opt_new();
  [v3 setDisplayName:self->_displayName];
  [v3 setMacAddress:self->_macAddress];
  [v3 setSupportsVideo:self->_supportsVideo];
  [v3 setSelected:self->_selected];

  return v3;
}

- (BOOL)isEqualToAudioRoute:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4
    && (unint64_t macAddress = self->_macAddress, macAddress == [v4 macAddress])
    && (int selected = self->_selected, selected == [v5 isSelected]))
  {
    displayName = self->_displayName;
    objc_super v9 = [v5 displayName];
    BOOL v10 = [(NSString *)displayName isEqualToString:v9];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (id)audioRoutesFromProtobufs:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v11 = [TVRMSAudioRoute alloc];
        v12 = -[TVRMSAudioRoute initWithProtobuf:](v11, "initWithProtobuf:", v10, (void)v14);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)protobufsFromAudioRoutes:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "protobuf", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (unint64_t)macAddress
{
  return self->_macAddress;
}

- (void)setMacAddress:(unint64_t)a3
{
  self->_unint64_t macAddress = a3;
}

- (BOOL)supportsVideo
{
  return self->_supportsVideo;
}

- (void)setSupportsVideo:(BOOL)a3
{
  self->_supportsVideo = a3;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_int selected = a3;
}

- (void).cxx_destruct
{
}

@end