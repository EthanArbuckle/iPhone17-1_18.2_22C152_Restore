@interface MRPlaybackSessionMigrateRequest
- (BOOL)allowFadeTransition;
- (MRContentItem)contentItem;
- (MRPlaybackSessionMigrateRequest)init;
- (MRPlaybackSessionMigrateRequest)initWithData:(id)a3;
- (MRPlaybackSessionMigrateRequest)initWithProtobuf:(id)a3;
- (MRPlaybackSessionRequest)playbackSessionRequest;
- (MRPlayerPath)playerPath;
- (MRPlayerPath)resolvedPlayerPath;
- (NSData)protobufData;
- (NSString)initiator;
- (NSString)report;
- (NSString)requestID;
- (_MRPlaybackSessionMigrateRequestProtobuf)protobuf;
- (double)duration;
- (double)playbackPosition;
- (double)playbackRate;
- (id)analyticsPayload;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)endpointOptions;
- (int64_t)playbackSessionSize;
- (int64_t)playerOptions;
- (unint64_t)fallbackReason;
- (unint64_t)requestType;
- (unsigned)destinationTypes;
- (unsigned)originatorType;
- (unsigned)playbackState;
- (void)addDestinationType:(unsigned int)a3;
- (void)addDestinationTypesFromDevices:(id)a3;
- (void)endEvent:(id)a3;
- (void)endEvent:(id)a3 withError:(id)a4;
- (void)finalize;
- (void)merge:(id)a3;
- (void)setAllowFadeTransition:(BOOL)a3;
- (void)setContentItem:(id)a3;
- (void)setDestinationTypes:(unsigned int)a3;
- (void)setEndpointOptions:(int64_t)a3;
- (void)setFallbackReason:(unint64_t)a3;
- (void)setInitiator:(id)a3;
- (void)setOriginatorType:(unsigned int)a3;
- (void)setOriginatorTypeFromDevice:(id)a3;
- (void)setPlaybackPosition:(double)a3;
- (void)setPlaybackRate:(double)a3;
- (void)setPlaybackSessionRequest:(id)a3;
- (void)setPlaybackSessionSize:(int64_t)a3;
- (void)setPlaybackState:(unsigned int)a3;
- (void)setPlayerOptions:(int64_t)a3;
- (void)setPlayerPath:(id)a3;
- (void)setRequestID:(id)a3;
- (void)setRequestType:(unint64_t)a3;
- (void)setResolvedPlayerPath:(id)a3;
- (void)startEvent:(id)a3;
@end

@implementation MRPlaybackSessionMigrateRequest

- (MRPlaybackSessionMigrateRequest)init
{
  v3 = objc_alloc_init(_MRPlaybackSessionMigrateRequestProtobuf);
  v4 = [(MRPlaybackSessionMigrateRequest *)self initWithProtobuf:v3];

  if (v4)
  {
    [(MRPlaybackSessionMigrateRequest *)v4 setPlayerOptions:58];
    [(MRPlaybackSessionMigrateRequest *)v4 setEndpointOptions:58];
    v5 = [MEMORY[0x1E4F29128] UUID];
    v6 = [v5 UUIDString];
    [(MRPlaybackSessionMigrateRequest *)v4 setRequestID:v6];
  }
  return v4;
}

- (MRPlaybackSessionMigrateRequest)initWithProtobuf:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)MRPlaybackSessionMigrateRequest;
    v6 = [(MRPlaybackSessionMigrateRequest *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_protobuf, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (MRPlaybackSessionMigrateRequest)initWithData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [[_MRPlaybackSessionMigrateRequestProtobuf alloc] initWithData:v4];
    v6 = [(MRPlaybackSessionMigrateRequest *)self initWithProtobuf:v5];
  }
  else
  {
    v6 = [(MRPlaybackSessionMigrateRequest *)self initWithProtobuf:0];
  }

  return v6;
}

- (void)setRequestID:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(_MRPlaybackSessionMigrateRequestProtobuf *)v4->_protobuf setRequestID:v5];
  objc_sync_exit(v4);
}

- (NSString)requestID
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(_MRPlaybackSessionMigrateRequestProtobuf *)v2->_protobuf requestID];
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (void)setInitiator:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(_MRPlaybackSessionMigrateRequestProtobuf *)v4->_protobuf setInitiator:v5];
  objc_sync_exit(v4);
}

- (void)setPlayerPath:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [v6 protobuf];
  [(_MRPlaybackSessionMigrateRequestProtobuf *)v4->_protobuf setPlayerPath:v5];

  objc_sync_exit(v4);
}

- (MRPlayerPath)playerPath
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [MRPlayerPath alloc];
  id v4 = [(_MRPlaybackSessionMigrateRequestProtobuf *)v2->_protobuf playerPath];
  id v5 = [(MRPlayerPath *)v3 initWithProtobuf:v4];

  objc_sync_exit(v2);

  return v5;
}

- (void)setResolvedPlayerPath:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [v6 protobuf];
  [(_MRPlaybackSessionMigrateRequestProtobuf *)v4->_protobuf setResolvedPlayerPath:v5];

  objc_sync_exit(v4);
}

- (MRPlayerPath)resolvedPlayerPath
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [MRPlayerPath alloc];
  id v4 = [(_MRPlaybackSessionMigrateRequestProtobuf *)v2->_protobuf resolvedPlayerPath];
  id v5 = [(MRPlayerPath *)v3 initWithProtobuf:v4];

  objc_sync_exit(v2);

  return v5;
}

- (NSString)initiator
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(_MRPlaybackSessionMigrateRequestProtobuf *)v2->_protobuf initiator];
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (void)setPlayerOptions:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  [(_MRPlaybackSessionMigrateRequestProtobuf *)obj->_protobuf setPlayerOptions:a3];
  objc_sync_exit(obj);
}

- (int64_t)playerOptions
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t v3 = [(_MRPlaybackSessionMigrateRequestProtobuf *)v2->_protobuf playerOptions];
  objc_sync_exit(v2);

  return v3;
}

- (void)setEndpointOptions:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  [(_MRPlaybackSessionMigrateRequestProtobuf *)obj->_protobuf setEndpointOptions:a3];
  objc_sync_exit(obj);
}

- (int64_t)endpointOptions
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t v3 = [(_MRPlaybackSessionMigrateRequestProtobuf *)v2->_protobuf endpointOptions];
  objc_sync_exit(v2);

  return v3;
}

- (void)setPlaybackState:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  obj = self;
  objc_sync_enter(obj);
  [(_MRPlaybackSessionMigrateRequestProtobuf *)obj->_protobuf setPlaybackState:v3];
  objc_sync_exit(obj);
}

- (unsigned)playbackState
{
  v2 = self;
  objc_sync_enter(v2);
  unsigned int v3 = [(_MRPlaybackSessionMigrateRequestProtobuf *)v2->_protobuf playbackState];
  objc_sync_exit(v2);

  return v3;
}

- (void)setPlaybackPosition:(double)a3
{
  obj = self;
  objc_sync_enter(obj);
  [(_MRPlaybackSessionMigrateRequestProtobuf *)obj->_protobuf setPlaybackPosition:a3];
  objc_sync_exit(obj);
}

- (double)playbackPosition
{
  v2 = self;
  objc_sync_enter(v2);
  [(_MRPlaybackSessionMigrateRequestProtobuf *)v2->_protobuf playbackPosition];
  double v4 = v3;
  objc_sync_exit(v2);

  return v4;
}

- (void)setPlaybackRate:(double)a3
{
  obj = self;
  objc_sync_enter(obj);
  [(_MRPlaybackSessionMigrateRequestProtobuf *)obj->_protobuf setPlaybackRate:a3];
  objc_sync_exit(obj);
}

- (double)playbackRate
{
  v2 = self;
  objc_sync_enter(v2);
  [(_MRPlaybackSessionMigrateRequestProtobuf *)v2->_protobuf playbackRate];
  double v4 = v3;
  objc_sync_exit(v2);

  return v4;
}

- (void)setContentItem:(id)a3
{
  id v12 = a3;
  double v4 = self;
  objc_sync_enter(v4);
  id v5 = [MRContentItem alloc];
  id v6 = [v12 identifier];
  v7 = [(MRContentItem *)v5 initWithIdentifier:v6];

  Title = (void *)MRContentItemGetTitle(v12);
  MRContentItemSetTitle(v7, Title);
  uint64_t IsAlwaysLive = MRContentItemGetIsAlwaysLive(v12);
  MRContentItemSetIsAlwaysLive(v7, IsAlwaysLive);
  uint64_t v10 = MRContentItemGetIsInTransition(v12);
  MRContentItemSetIsInTransition(v7, v10);
  v11 = [(MRContentItem *)v7 protobufWithEncoding:0];
  [(_MRPlaybackSessionMigrateRequestProtobuf *)v4->_protobuf setContentItem:v11];

  objc_sync_exit(v4);
}

- (MRContentItem)contentItem
{
  v2 = self;
  objc_sync_enter(v2);
  double v3 = [MRContentItem alloc];
  double v4 = [(_MRPlaybackSessionMigrateRequestProtobuf *)v2->_protobuf contentItem];
  id v5 = [(MRContentItem *)v3 initWithProtobuf:v4];

  objc_sync_exit(v2);

  return v5;
}

- (void)setPlaybackSessionRequest:(id)a3
{
  id v6 = a3;
  double v4 = self;
  objc_sync_enter(v4);
  id v5 = [v6 protobuf];
  [(_MRPlaybackSessionMigrateRequestProtobuf *)v4->_protobuf setPlaybackSessionRequest:v5];

  objc_sync_exit(v4);
}

- (MRPlaybackSessionRequest)playbackSessionRequest
{
  v2 = self;
  objc_sync_enter(v2);
  double v3 = [MRPlaybackSessionRequest alloc];
  double v4 = [(_MRPlaybackSessionMigrateRequestProtobuf *)v2->_protobuf playbackSessionRequest];
  id v5 = [(MRPlaybackSessionRequest *)v3 initWithProtobuf:v4];

  objc_sync_exit(v2);

  return v5;
}

- (_MRPlaybackSessionMigrateRequestProtobuf)protobuf
{
  v2 = self;
  objc_sync_enter(v2);
  double v3 = (void *)[(_MRPlaybackSessionMigrateRequestProtobuf *)v2->_protobuf copy];
  objc_sync_exit(v2);

  return (_MRPlaybackSessionMigrateRequestProtobuf *)v3;
}

- (NSData)protobufData
{
  v2 = self;
  objc_sync_enter(v2);
  double v3 = [(_MRPlaybackSessionMigrateRequestProtobuf *)v2->_protobuf data];
  objc_sync_exit(v2);

  return (NSData *)v3;
}

- (NSString)report
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v28 = self;
  objc_sync_enter(v28);
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"\nPlayback Session Migration Report\n"];
  [v2 appendString:@"----------------------------------\n"];
  double v3 = [(MRPlaybackSessionMigrateRequest *)v28 requestID];
  [v2 appendFormat:@"Identifier: %@\n", v3];

  double v4 = -[MRPlaybackSessionMigrateRequest analyticsPayload]((uint64_t)v28);
  id v5 = [(MRPlaybackSessionMigrateRequest *)v28 playerPath];
  [v2 appendFormat:@"playerPath = %@\n", v5];

  id v6 = [(MRPlaybackSessionMigrateRequest *)v28 resolvedPlayerPath];
  [v2 appendFormat:@"resolvedPlayerPath = %@\n", v6];

  v7 = [(_MRPlaybackSessionMigrateRequestProtobuf *)v28->_protobuf events];
  v27 = objc_msgSend(v7, "mr_map:", &__block_literal_global_38);

  v8 = (void *)MEMORY[0x1E4F1CA80];
  v9 = [v4 allKeys];
  uint64_t v10 = [v8 setWithArray:v9];

  v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v27];
  [v10 minusSet:v11];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = v10;
  uint64_t v12 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        v16 = [v4 objectForKeyedSubscript:v15];
        [v2 appendFormat:@"%@: %@\n", v15, v16];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v12);
  }

  [v2 appendString:@"Events:\n"];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v17 = [(_MRPlaybackSessionMigrateRequestProtobuf *)v28->_protobuf events];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v17);
        }
        v21 = *(void **)(*((void *)&v30 + 1) + 8 * j);
        v22 = [v21 name];
        [v21 calculatedDuration];
        [v2 appendFormat:@" %@: %.4f seconds\n", v22, v23];

        v24 = [v21 error];

        if (v24)
        {
          v25 = [v21 error];
          [v2 appendFormat:@"  Error: %@\n", v25];
        }
      }
      uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v18);
  }

  [v2 appendString:@"----------------------------------\n"];
  objc_sync_exit(v28);

  return (NSString *)v2;
}

- (id)analyticsPayload
{
  v54[7] = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    uint64_t v18 = 0;
    goto LABEL_54;
  }
  v2 = [*(id *)(a1 + 8) events];
  uint64_t v3 = objc_msgSend(v2, "mr_first:", &__block_literal_global_105);

  uint64_t v4 = *(void *)(a1 + 32);
  v47 = (void *)v3;
  if (v4 == 2)
  {
    [*(id *)(a1 + 8) setOriginatorType:MRAnalyticsCompositionForLocalDevice()];
  }
  else if (v4 == 1)
  {
    [*(id *)(a1 + 8) setDestinationTypes:MRAnalyticsCompositionForLocalDevice()];
  }
  v53[0] = @"originator";
  id v5 = MRAnalyticsDeviceCompositionDescription([(id)a1 originatorType]);
  v54[0] = v5;
  v53[1] = @"destination";
  id v6 = MRAnalyticsDeviceCompositionDescription([(id)a1 destinationTypes]);
  v54[1] = v6;
  v53[2] = @"duration";
  v7 = NSNumber;
  [(id)a1 duration];
  v8 = objc_msgSend(v7, "numberWithDouble:");
  v54[2] = v8;
  v53[3] = @"initiator";
  uint64_t v9 = [(id)a1 initiator];
  uint64_t v10 = (void *)v9;
  v11 = @"unknown";
  if (v9) {
    v11 = (__CFString *)v9;
  }
  v54[3] = v11;
  v53[4] = @"queueSize";
  uint64_t v12 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend((id)a1, "playbackSessionSize"));
  v54[4] = v12;
  v53[5] = @"failedPlayingAudio";
  if (*(void *)(a1 + 24))
  {
    BOOL v13 = 1;
  }
  else if (*(void *)(a1 + 16))
  {
    BOOL v13 = *(void *)(a1 + 40) == 0;
  }
  else
  {
    BOOL v13 = 0;
  }
  v14 = [NSNumber numberWithInt:v13];
  v54[5] = v14;
  v53[6] = @"type";
  unint64_t v15 = *(void *)(a1 + 32);
  if (v15 > 3) {
    v16 = @"addProxDevice";
  }
  else {
    v16 = off_1E57D3BA8[v15];
  }
  v54[6] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:7];
  uint64_t v18 = (void *)[v17 mutableCopy];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v19 = [*(id *)(a1 + 8) events];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v49 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        v25 = NSNumber;
        [v24 calculatedDuration];
        v26 = objc_msgSend(v25, "numberWithDouble:");
        v27 = NSString;
        v28 = [v24 name];
        v29 = [v27 stringWithFormat:@"%@Duration", v28];
        [v18 setObject:v26 forKeyedSubscript:v29];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v21);
  }

  long long v30 = [*(id *)(a1 + 8) events];
  long long v31 = objc_msgSend(v30, "mr_first:", &__block_literal_global_112);

  if (v31)
  {
    long long v32 = [v31 error];
    if (!v32)
    {
      if (![(id)a1 playbackSessionSize]) {
        goto LABEL_28;
      }
      long long v33 = NSNumber;
      double v34 = (float)[(id)a1 playbackSessionSize];
      [v31 calculatedDuration];
      long long v32 = [v33 numberWithDouble:v34 / v35];
      [v18 setObject:v32 forKeyedSubscript:@"sendPlaybackSessionThroughput"];
    }
  }
LABEL_28:
  long long v36 = [(id)a1 playerPath];
  long long v37 = [v36 client];
  v38 = [v37 bundleIdentifier];
  [v18 setObject:v38 forKeyedSubscript:@"appBundle"];

  v39 = @"LocalDeviceIsGroupable";
  uint64_t v40 = v47;
  switch(*(void *)(a1 + 40))
  {
    case 0:
      goto LABEL_49;
    case 1:
      goto LABEL_45;
    case 2:
      v39 = @"MoreThanOneLogicalDevice";
      goto LABEL_45;
    case 3:
      v39 = @"UnsupportedType";
      goto LABEL_45;
    case 4:
      v39 = @"EndpointNotFound";
      goto LABEL_45;
    case 5:
      v39 = @"SearchFailed";
      goto LABEL_45;
    case 6:
      v39 = @"MigrateFromGroupNotAllowed";
      goto LABEL_45;
    case 7:
      v39 = @"MigrateToGroupNotAllowed";
      goto LABEL_45;
    case 8:
      v39 = @"SetPlaybackNotSupportedOnSource";
      goto LABEL_45;
    case 9:
      v39 = @"SetPlaybackNotSupportedOnDestination";
      goto LABEL_45;
    case 0xALL:
      v39 = @"SetPlaybackMismatch";
      goto LABEL_45;
    case 0xBLL:
      v39 = @"ResolvedPlayerPathIsAirPlay";
      goto LABEL_45;
    case 0xCLL:
      v39 = @"FailedToBreakGroup";
      goto LABEL_45;
    case 0xDLL:
      v39 = @"Companion";
      goto LABEL_45;
    case 0xELL:
      v39 = @"ExpanseFailed";
      goto LABEL_45;
    case 0xFLL:
      v39 = @"GroupSession";
      goto LABEL_45;
    case 0x10:
      v39 = @"Other";
      goto LABEL_45;
    default:
      uint64_t v40 = v47;
LABEL_45:
      [v18 setObject:v39 forKeyedSubscript:@"fallbackReason"];
      unint64_t v41 = *(void *)(a1 + 40) - 1;
      if (v41 > 0xF) {
        v42 = 0;
      }
      else {
        v42 = *off_1E57D3BC8[v41];
      }
      [v18 setObject:v42 forKeyedSubscript:@"fallbackStatus"];

LABEL_49:
      v43 = *(__CFError **)(a1 + 24);
      if (v43)
      {
        v44 = (__CFString *)MRErrorCopyDescription(v43);
        [v18 setObject:v44 forKeyedSubscript:@"fallbackError"];
      }
      if (v40)
      {
        v45 = objc_msgSend(v40, "name", v39);
        [v18 setObject:v45 forKeyedSubscript:@"errorStep"];
      }
      break;
  }
LABEL_54:

  return v18;
}

id __41__MRPlaybackSessionMigrateRequest_report__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSString;
  uint64_t v3 = [a2 name];
  uint64_t v4 = [v2 stringWithFormat:@"%@Duration", v3];

  return v4;
}

- (id)description
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v4 = MRMediaRemotePlaybackSessionMigratePlayerOptionsCopyDescription([(MRPlaybackSessionMigrateRequest *)v2 playerOptions]);
  id v5 = MRMediaRemotePlaybackSessionMigrateEndpointOptionsCopyDescription([(MRPlaybackSessionMigrateRequest *)v2 endpointOptions]);
  id v6 = (void *)[v3 initWithFormat:@"playerOptions = <%@>, endpointOptions = <%@>", v4, v5];

  if ([(_MRPlaybackSessionMigrateRequestProtobuf *)v2->_protobuf hasPlaybackRate])
  {
    [(MRPlaybackSessionMigrateRequest *)v2 playbackRate];
    [v6 appendFormat:@", playbackRate = <%lf>", v7];
  }
  if ([(_MRPlaybackSessionMigrateRequestProtobuf *)v2->_protobuf hasPlaybackPosition])
  {
    [(MRPlaybackSessionMigrateRequest *)v2 playbackPosition];
    [v6 appendFormat:@", playbackPosition = <%lf>", v8];
  }
  if ([(_MRPlaybackSessionMigrateRequestProtobuf *)v2->_protobuf hasPlaybackState])
  {
    uint64_t v9 = MRMediaRemoteCopyPlaybackStateDescription([(MRPlaybackSessionMigrateRequest *)v2 playbackState]);
    [v6 appendFormat:@", playbackState = <%@>", v9];
  }
  if ([(_MRPlaybackSessionMigrateRequestProtobuf *)v2->_protobuf hasContentItem])
  {
    uint64_t v10 = [(MRPlaybackSessionMigrateRequest *)v2 contentItem];
    v11 = MRContentItemCopyMinimalReadableDescription(v10);
    [v6 appendFormat:@", item = <%@>", v11];
  }
  objc_sync_exit(v2);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = self;
  objc_sync_enter(v3);
  uint64_t v4 = (void *)[(_MRPlaybackSessionMigrateRequestProtobuf *)v3->_protobuf copy];
  [v4 setEvents:0];
  id v5 = [[MRPlaybackSessionMigrateRequest alloc] initWithProtobuf:v4];

  objc_sync_exit(v3);
  return v5;
}

- (void)startEvent:(id)a3
{
  id v10 = a3;
  uint64_t v4 = objc_alloc_init(_MRPlaybackSessionMigrateRequestEventProtobuf);
  [(_MRPlaybackSessionMigrateRequestEventProtobuf *)v4 setName:v10];
  id v5 = [MEMORY[0x1E4F1C9C8] now];
  [v5 timeIntervalSinceReferenceDate];
  -[_MRPlaybackSessionMigrateRequestEventProtobuf setStartTimestamp:](v4, "setStartTimestamp:");

  id v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = [(_MRPlaybackSessionMigrateRequestProtobuf *)v6->_protobuf events];

  if (!v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(_MRPlaybackSessionMigrateRequestProtobuf *)v6->_protobuf setEvents:v8];
  }
  uint64_t v9 = [(_MRPlaybackSessionMigrateRequestProtobuf *)v6->_protobuf events];
  [v9 addObject:v4];

  objc_sync_exit(v6);
}

- (void)endEvent:(id)a3
{
}

- (void)endEvent:(id)a3 withError:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v9 = [(_MRPlaybackSessionMigrateRequestProtobuf *)v8->_protobuf events];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v9);
        }
        BOOL v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v14 = [v13 name];
        int v15 = [v14 isEqualToString:v6];

        if (v15)
        {
          [v13 endTimestamp];
          if (v16 == 0.0)
          {
            v17 = [MEMORY[0x1E4F1C9C8] now];
            [v17 timeIntervalSinceReferenceDate];
            objc_msgSend(v13, "setEndTimestamp:");

            if (v7)
            {
              objc_msgSend(v13, "setErrorCode:", objc_msgSend(v7, "code"));
              uint64_t v18 = [v7 localizedFailureReason];
              uint64_t v19 = v18;
              if (!v18)
              {
                uint64_t v19 = [v7 localizedDescription];
              }
              [v13 setErrorDescription:v19];
              if (!v18) {
            }
              }
            goto LABEL_17;
          }
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  if (v7 && !MRMediaRemoteErrorIsInformational(v7))
  {
    if (v8->_fallbackReason) {
      uint64_t v20 = 24;
    }
    else {
      uint64_t v20 = 16;
    }
    uint64_t v21 = *(Class *)((char *)&v8->super.isa + v20);
    if (!v21) {
      uint64_t v21 = v7;
    }
    uint64_t v22 = v21;
    uint64_t v23 = *(Class *)((char *)&v8->super.isa + v20);
    *(Class *)((char *)&v8->super.isa + v20) = v22;
  }
  objc_sync_exit(v8);
}

- (void)finalize
{
  id v3 = -[MRPlaybackSessionMigrateRequest analyticsPayload]((uint64_t)self);
  migrateError = self->_migrateError;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__MRPlaybackSessionMigrateRequest_finalize__block_invoke;
  v6[3] = &unk_1E57D3B68;
  id v7 = v3;
  id v5 = v3;
  MRAnalyticsSendEvent(@"com.apple.mediaremote.queue-handoff", migrateError, v6);
}

id __43__MRPlaybackSessionMigrateRequest_finalize__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

BOOL __51__MRPlaybackSessionMigrateRequest_analyticsPayload__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 error];
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __51__MRPlaybackSessionMigrateRequest_analyticsPayload__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 name];
  uint64_t v3 = [v2 isEqualToString:@"sendPlaybackSession"];

  return v3;
}

- (void)setOriginatorTypeFromDevice:(id)a3
{
  uint64_t v4 = MRAnalyticsCompositionForOutputDevice(a3);
  protobuf = self->_protobuf;

  [(_MRPlaybackSessionMigrateRequestProtobuf *)protobuf setOriginatorType:v4];
}

- (void)addDestinationType:(unsigned int)a3
{
  protobuf = self->_protobuf;
  uint64_t v4 = [(_MRPlaybackSessionMigrateRequestProtobuf *)protobuf destinationTypes] | a3;

  [(_MRPlaybackSessionMigrateRequestProtobuf *)protobuf setDestinationTypes:v4];
}

- (void)addDestinationTypesFromDevices:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(MRPlaybackSessionMigrateRequest *)self addDestinationType:MRAnalyticsCompositionForOutputDevice(*(void **)(*((void *)&v9 + 1) + 8 * v8++))];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (double)duration
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(_MRPlaybackSessionMigrateRequestProtobuf *)v2->_protobuf events];
  id v4 = [v3 lastObject];
  [v4 endTimestamp];
  double v6 = v5;
  uint64_t v7 = [(_MRPlaybackSessionMigrateRequestProtobuf *)v2->_protobuf events];
  uint64_t v8 = [v7 firstObject];
  [v8 startTimestamp];
  double v10 = v6 - v9;

  objc_sync_exit(v2);
  return v10;
}

- (BOOL)allowFadeTransition
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(_MRPlaybackSessionMigrateRequestProtobuf *)v2->_protobuf allowFadeTransition];
  objc_sync_exit(v2);

  return v3;
}

- (void)setAllowFadeTransition:(BOOL)a3
{
  BOOL v3 = a3;
  obuint64_t j = self;
  objc_sync_enter(obj);
  [(_MRPlaybackSessionMigrateRequestProtobuf *)obj->_protobuf setAllowFadeTransition:v3];
  objc_sync_exit(obj);
}

- (unsigned)originatorType
{
  return [(_MRPlaybackSessionMigrateRequestProtobuf *)self->_protobuf originatorType];
}

- (void)setOriginatorType:(unsigned int)a3
{
}

- (unsigned)destinationTypes
{
  return [(_MRPlaybackSessionMigrateRequestProtobuf *)self->_protobuf destinationTypes];
}

- (void)setDestinationTypes:(unsigned int)a3
{
}

- (void)merge:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = self;
  objc_sync_enter(v5);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v6 = objc_msgSend(v4, "protobuf", 0);
  uint64_t v7 = [v6 events];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        [(_MRPlaybackSessionMigrateRequestProtobuf *)v5->_protobuf addEvents:*(void *)(*((void *)&v14 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  long long v11 = [v4 protobuf];
  -[_MRPlaybackSessionMigrateRequestProtobuf setAllowFadeTransition:](v5->_protobuf, "setAllowFadeTransition:", [v11 allowFadeTransition]);

  if ([v4 originatorType])
  {
    long long v12 = [v4 protobuf];
    -[_MRPlaybackSessionMigrateRequestProtobuf setOriginatorType:](v5->_protobuf, "setOriginatorType:", [v12 originatorType]);
  }
  if ([v4 destinationTypes])
  {
    BOOL v13 = [v4 protobuf];
    -[_MRPlaybackSessionMigrateRequestProtobuf setDestinationTypes:](v5->_protobuf, "setDestinationTypes:", [v13 destinationTypes]);
  }
  objc_sync_exit(v5);
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (unint64_t)fallbackReason
{
  return self->_fallbackReason;
}

- (void)setFallbackReason:(unint64_t)a3
{
  self->_fallbackReason = a3;
}

- (int64_t)playbackSessionSize
{
  return self->_playbackSessionSize;
}

- (void)setPlaybackSessionSize:(int64_t)a3
{
  self->_playbackSessionSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackError, 0);
  objc_storeStrong((id *)&self->_migrateError, 0);

  objc_storeStrong((id *)&self->_protobuf, 0);
}

@end