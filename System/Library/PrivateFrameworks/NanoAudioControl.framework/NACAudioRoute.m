@interface NACAudioRoute
+ (NACAudioRoute)audioRouteWithMPAVRoute:(id)a3;
+ (id)audioRouteFromBuffer:(id)a3;
+ (id)audioRoutesFromBuffers:(id)a3;
+ (id)buffersFromAudioRoutes:(id)a3;
+ (int)_routeBufferTypeFromRouteType:(int64_t)a3;
+ (int64_t)_routeTypeFromMPAVRoute:(id)a3;
+ (int64_t)_routeTypeFromRouteBufferType:(int)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAudioRoute:(id)a3;
- (BOOL)isPicked;
- (BOOL)supportsVolumeControl;
- (NACAudioRoute)initWithMPAVRoute:(id)a3;
- (NSString)routeName;
- (NSString)uniqueIdentifier;
- (id)buffer;
- (id)description;
- (int64_t)routeType;
- (void)setSupportsVolumeControl:(BOOL)a3;
@end

@implementation NACAudioRoute

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(NACAudioRoute *)self isEqualToAudioRoute:v4];

  return v5;
}

- (BOOL)isEqualToAudioRoute:(id)a3
{
  id v4 = (NACAudioRoute *)a3;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v8 = 0;
    goto LABEL_9;
  }
  if (self == v4) {
    goto LABEL_10;
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    v6 = [(NACAudioRoute *)v4 uniqueIdentifier];

    if (v6)
    {
      uniqueIdentifier = self->_uniqueIdentifier;
      goto LABEL_7;
    }
LABEL_10:
    char v8 = 1;
    goto LABEL_9;
  }
LABEL_7:
  v7 = [(NACAudioRoute *)v4 uniqueIdentifier];
  char v8 = [(NSString *)uniqueIdentifier isEqualToString:v7];

LABEL_9:
  return v8;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@ - %@", self->_routeName, self->_uniqueIdentifier];
}

- (NACAudioRoute)initWithMPAVRoute:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NACAudioRoute;
  BOOL v5 = [(NACAudioRoute *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 routeName];
    routeName = v5->_routeName;
    v5->_routeName = (NSString *)v6;

    v5->_routeType = +[NACAudioRoute _routeTypeFromMPAVRoute:v4];
    v5->_picked = [v4 isPicked];
    uint64_t v8 = [v4 routeUID];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)setSupportsVolumeControl:(BOOL)a3
{
  self->_supportsVolumeControl = a3;
}

+ (NACAudioRoute)audioRouteWithMPAVRoute:(id)a3
{
  id v3 = a3;
  id v4 = [[NACAudioRoute alloc] initWithMPAVRoute:v3];

  return v4;
}

+ (id)audioRouteFromBuffer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = [v4 uniqueIdentifier];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [v4 routeName];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  *(void *)(v5 + 32) = objc_msgSend(a1, "_routeTypeFromRouteBufferType:", objc_msgSend(v4, "routeType"));
  *(unsigned char *)(v5 + 8) = [v4 supportsVolumeControl];
  LOBYTE(a1) = [v4 picked];

  *(unsigned char *)(v5 + 9) = (_BYTE)a1;

  return (id)v5;
}

+ (id)audioRoutesFromBuffers:(id)a3
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
        v10 = +[NACAudioRoute audioRouteFromBuffer:](NACAudioRoute, "audioRouteFromBuffer:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)buffersFromAudioRoutes:(id)a3
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
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "buffer", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)buffer
{
  id v3 = objc_opt_new();
  id v4 = [(NACAudioRoute *)self uniqueIdentifier];
  [v3 setUniqueIdentifier:v4];

  id v5 = [(NACAudioRoute *)self routeName];
  [v3 setRouteName:v5];

  objc_msgSend(v3, "setRouteType:", +[NACAudioRoute _routeBufferTypeFromRouteType:](NACAudioRoute, "_routeBufferTypeFromRouteType:", -[NACAudioRoute routeType](self, "routeType")));
  objc_msgSend(v3, "setSupportsVolumeControl:", -[NACAudioRoute supportsVolumeControl](self, "supportsVolumeControl"));
  objc_msgSend(v3, "setPicked:", -[NACAudioRoute isPicked](self, "isPicked"));

  return v3;
}

+ (int64_t)_routeTypeFromMPAVRoute:(id)a3
{
  id v3 = a3;
  if ([v3 routeSubtype] == 1)
  {
    int64_t v4 = 1;
    goto LABEL_38;
  }
  if ([v3 routeSubtype] == 2)
  {
    int64_t v4 = 2;
    goto LABEL_38;
  }
  if ([v3 isAirpodsRoute])
  {
    if ([v3 isB298Route])
    {
      int64_t v4 = 5;
      goto LABEL_38;
    }
    if ([v3 isB515Route])
    {
      int64_t v4 = 6;
      goto LABEL_38;
    }
    BOOL v5 = [v3 isB688Route] == 0;
    uint64_t v6 = 3;
    goto LABEL_15;
  }
  if ([v3 isB507Route])
  {
    int64_t v4 = 10;
    goto LABEL_38;
  }
  if ([v3 isPowerbeatsRoute])
  {
    int64_t v4 = 11;
    goto LABEL_38;
  }
  if ([v3 isB364Route])
  {
    int64_t v4 = 8;
    goto LABEL_38;
  }
  if ([v3 isB372Route])
  {
    int64_t v4 = 9;
    goto LABEL_38;
  }
  if ([v3 isB444Route])
  {
    int64_t v4 = 7;
    goto LABEL_38;
  }
  if ([v3 isB494Route])
  {
    int64_t v4 = 12;
    goto LABEL_38;
  }
  if ([v3 isBeatsSoloRoute])
  {
    int64_t v4 = 14;
    goto LABEL_38;
  }
  if ([v3 isB419Route])
  {
    int64_t v4 = 13;
    goto LABEL_38;
  }
  if ([v3 isBeatsStudioRoute])
  {
    int64_t v4 = 15;
    goto LABEL_38;
  }
  if ([v3 isBeatsXRoute])
  {
    int64_t v4 = 16;
    goto LABEL_38;
  }
  if ([v3 isCarplayRoute])
  {
    int64_t v4 = 21;
    goto LABEL_38;
  }
  if ([v3 isAppleTVRoute])
  {
    int64_t v4 = 22;
    goto LABEL_38;
  }
  if ([v3 isB520Route])
  {
    BOOL v5 = [v3 isStereoPair] == 0;
    uint64_t v6 = 17;
    goto LABEL_15;
  }
  if ([v3 isHomePodRoute])
  {
    BOOL v5 = [v3 isStereoPair] == 0;
    uint64_t v6 = 19;
LABEL_15:
    if (v5) {
      int64_t v4 = v6;
    }
    else {
      int64_t v4 = v6 + 1;
    }
    goto LABEL_38;
  }
  if ([v3 routeSubtype] == 9)
  {
    int64_t v4 = 24;
  }
  else if ([v3 routeSubtype] == 16)
  {
    int64_t v4 = 23;
  }
  else
  {
    int64_t v4 = 0;
  }
LABEL_38:

  return v4;
}

+ (int)_routeBufferTypeFromRouteType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x17) {
    return 0;
  }
  else {
    return dword_237CFFFC8[a3 - 1];
  }
}

+ (int64_t)_routeTypeFromRouteBufferType:(int)a3
{
  if ((a3 - 1) > 0x17) {
    return 0;
  }
  else {
    return qword_237D00028[a3 - 1];
  }
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)routeName
{
  return self->_routeName;
}

- (int64_t)routeType
{
  return self->_routeType;
}

- (BOOL)supportsVolumeControl
{
  return self->_supportsVolumeControl;
}

- (BOOL)isPicked
{
  return self->_picked;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeName, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end