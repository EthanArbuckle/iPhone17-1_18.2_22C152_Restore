@interface MRNowPlayingControllerConfiguration
- (BOOL)isSingleShot;
- (BOOL)requestClientProperties;
- (BOOL)requestLastPlayingDate;
- (BOOL)requestPlaybackQueue;
- (BOOL)requestPlaybackState;
- (BOOL)requestSupportedCommands;
- (BOOL)wantsChangeCallbacksDuringInitialLoad;
- (MRDestination)destination;
- (MRNowPlayingControllerConfiguration)initWithDestination:(id)a3;
- (MRNowPlayingControllerConfiguration)initWithEndpoint:(id)a3;
- (MRNowPlayingControllerConfiguration)initWithOrigin:(id)a3;
- (MRNowPlayingControllerConfiguration)initWithOutputDeviceUID:(id)a3;
- (MRPlaybackQueueRequest)playbackQueueRequest;
- (NSString)label;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customDescriptionForResponse;
- (id)debugDescription;
- (id)description;
- (id)discoveryPredicate;
- (void)setCustomDescriptionForResponse:(id)a3;
- (void)setDestination:(id)a3;
- (void)setDiscoveryPredicate:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPlaybackQueueRequest:(id)a3;
- (void)setRequestClientProperties:(BOOL)a3;
- (void)setRequestLastPlayingDate:(BOOL)a3;
- (void)setRequestPlaybackQueue:(BOOL)a3;
- (void)setRequestPlaybackState:(BOOL)a3;
- (void)setRequestSupportedCommands:(BOOL)a3;
- (void)setSingleShot:(BOOL)a3;
- (void)setWantsChangeCallbacksDuringInitialLoad:(BOOL)a3;
@end

@implementation MRNowPlayingControllerConfiguration

- (MRNowPlayingControllerConfiguration)initWithOutputDeviceUID:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = +[MRAVOutputDevice localDeviceUID];
  }
  v5 = [[MRDestination alloc] initWithOutputDeviceUID:v4];
  v6 = [(MRNowPlayingControllerConfiguration *)self initWithDestination:v5];

  return v6;
}

- (MRNowPlayingControllerConfiguration)initWithEndpoint:(id)a3
{
  id v4 = a3;
  v5 = [[MRDestination alloc] initWithEndpoint:v4];

  v6 = [(MRNowPlayingControllerConfiguration *)self initWithDestination:v5];
  return v6;
}

- (MRNowPlayingControllerConfiguration)initWithOrigin:(id)a3
{
  id v4 = a3;
  v5 = [[MRDestination alloc] initWithOrigin:v4];

  v6 = [(MRNowPlayingControllerConfiguration *)self initWithDestination:v5];
  return v6;
}

- (MRNowPlayingControllerConfiguration)initWithDestination:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MRNowPlayingControllerConfiguration;
  v5 = [(MRNowPlayingControllerConfiguration *)&v10 init];
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = [v4 copy];
    }
    else
    {
      uint64_t v6 = +[MRDestination localDestination];
    }
    destination = v5->_destination;
    v5->_destination = (MRDestination *)v6;

    id customDescriptionForResponse = v5->_customDescriptionForResponse;
    v5->_id customDescriptionForResponse = &__block_literal_global_571;
  }
  return v5;
}

uint64_t __59__MRNowPlayingControllerConfiguration_initWithDestination___block_invoke(uint64_t a1, void *a2)
{
  return [a2 description];
}

- (MRPlaybackQueueRequest)playbackQueueRequest
{
  playbackQueueRequest = self->_playbackQueueRequest;
  if (playbackQueueRequest)
  {
    v3 = playbackQueueRequest;
  }
  else if ([(MRNowPlayingControllerConfiguration *)self requestPlaybackQueue])
  {
    v3 = +[MRPlaybackQueueRequest defaultPlaybackQueueRequest];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)description
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p - %@", objc_opt_class(), v2, v2->_destination];
  id v4 = v3;
  if (v2->_label) {
    [v3 appendFormat:@"label: %@/", v2->_label];
  }
  v5 = [(MRNowPlayingControllerConfiguration *)v2 playbackQueueRequest];

  if (v5)
  {
    uint64_t v6 = [(MRNowPlayingControllerConfiguration *)v2 playbackQueueRequest];
    [v4 appendFormat:@"PBR=%@", v6];
  }
  if (v2->_requestSupportedCommands) {
    objc_msgSend(v4, "appendFormat:", @"/sc:%u", 1);
  }
  if (v2->_requestPlaybackState) {
    objc_msgSend(v4, "appendFormat:", @"/ps:%u", 1);
  }
  if (v2->_requestLastPlayingDate) {
    objc_msgSend(v4, "appendFormat:", @"/lpd:%u", 1);
  }
  if (v2->_requestClientProperties) {
    objc_msgSend(v4, "appendFormat:", @"/cp:%u", 1);
  }
  if (v2->_discoveryPredicate)
  {
    v7 = (void *)MEMORY[0x1997190F0]();
    [v4 appendFormat:@"/discoveryPredicate:%@", v7];
  }
  if ([(MRNowPlayingControllerConfiguration *)v2 isSingleShot]) {
    [v4 appendString:@"/ss"];
  }
  if ([(MRNowPlayingControllerConfiguration *)v2 wantsChangeCallbacksDuringInitialLoad])
  {
    [v4 appendString:@"/wccdi"];
  }
  [v4 appendFormat:@">"];
  objc_sync_exit(v2);

  return v4;
}

- (id)debugDescription
{
  v2 = self;
  objc_sync_enter(v2);
  id v16 = [NSString alloc];
  uint64_t v15 = objc_opt_class();
  label = v2->_label;
  v3 = MRCreateIndentedDebugDescriptionFromObject(v2->_destination);
  if (v2->_requestSupportedCommands) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  if (v2->_requestPlaybackState) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  if (v2->_requestLastPlayingDate) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  if (v2->_requestClientProperties) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  if (v2->_wantsChangeCallbacksDuringInitialLoad) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  if (v2->_singleShot) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  playbackQueueRequest = v2->_playbackQueueRequest;
  v11 = (void *)MEMORY[0x1997190F0](v2->_discoveryPredicate);
  v12 = (void *)[v16 initWithFormat:@"<%@: %p {\n   label = %@\n   destination = %@\n   playbackQueueRequest = %@\n   requestSupportedCommands = %@\n   requestPlaybackState = %@\n   requestLastPlayingdate = %@\n   requestClientProperties = %@\n   wantsChangeCallbacksDuringInitialLoad = %@\n   isSingleShot = %@\n   discoveryPredicate = %@\n}>\n", v15, v2, label, v3, playbackQueueRequest, v4, v5, v6, v7, v8, v9, v11];

  objc_sync_exit(v2);

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(MRNowPlayingControllerConfiguration *)self destination];
  uint64_t v7 = [v6 copyWithZone:a3];
  v8 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v7;

  v9 = [(MRNowPlayingControllerConfiguration *)self playbackQueueRequest];
  uint64_t v10 = [v9 copyWithZone:a3];
  v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  *(unsigned char *)(v5 + 8) = [(MRNowPlayingControllerConfiguration *)self requestSupportedCommands];
  *(unsigned char *)(v5 + 9) = [(MRNowPlayingControllerConfiguration *)self requestPlaybackState];
  *(unsigned char *)(v5 + 10) = [(MRNowPlayingControllerConfiguration *)self requestLastPlayingDate];
  *(unsigned char *)(v5 + 12) = [(MRNowPlayingControllerConfiguration *)self requestPlaybackQueue];
  *(unsigned char *)(v5 + 11) = [(MRNowPlayingControllerConfiguration *)self requestClientProperties];
  *(unsigned char *)(v5 + 14) = [(MRNowPlayingControllerConfiguration *)self isSingleShot];
  v12 = [(MRNowPlayingControllerConfiguration *)self label];
  uint64_t v13 = [v12 copyWithZone:a3];
  v14 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v13;

  uint64_t v15 = [(MRNowPlayingControllerConfiguration *)self discoveryPredicate];
  uint64_t v16 = [v15 copy];
  v17 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v16;

  *(unsigned char *)(v5 + 13) = [(MRNowPlayingControllerConfiguration *)self wantsChangeCallbacksDuringInitialLoad];
  v18 = [(MRNowPlayingControllerConfiguration *)self customDescriptionForResponse];
  uint64_t v19 = [v18 copy];
  v20 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v19;

  return (id)v5;
}

- (MRDestination)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (BOOL)requestSupportedCommands
{
  return self->_requestSupportedCommands;
}

- (void)setRequestSupportedCommands:(BOOL)a3
{
  self->_requestSupportedCommands = a3;
}

- (BOOL)requestPlaybackState
{
  return self->_requestPlaybackState;
}

- (void)setRequestPlaybackState:(BOOL)a3
{
  self->_requestPlaybackState = a3;
}

- (BOOL)requestLastPlayingDate
{
  return self->_requestLastPlayingDate;
}

- (void)setRequestLastPlayingDate:(BOOL)a3
{
  self->_requestLastPlayingDate = a3;
}

- (BOOL)requestClientProperties
{
  return self->_requestClientProperties;
}

- (void)setRequestClientProperties:(BOOL)a3
{
  self->_requestClientProperties = a3;
}

- (BOOL)requestPlaybackQueue
{
  return self->_requestPlaybackQueue;
}

- (void)setRequestPlaybackQueue:(BOOL)a3
{
  self->_requestPlaybackQueue = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (BOOL)wantsChangeCallbacksDuringInitialLoad
{
  return self->_wantsChangeCallbacksDuringInitialLoad;
}

- (void)setWantsChangeCallbacksDuringInitialLoad:(BOOL)a3
{
  self->_wantsChangeCallbacksDuringInitialLoad = a3;
}

- (id)customDescriptionForResponse
{
  return self->_customDescriptionForResponse;
}

- (void)setCustomDescriptionForResponse:(id)a3
{
}

- (BOOL)isSingleShot
{
  return self->_singleShot;
}

- (void)setSingleShot:(BOOL)a3
{
  self->_singleShot = a3;
}

- (id)discoveryPredicate
{
  return self->_discoveryPredicate;
}

- (void)setDiscoveryPredicate:(id)a3
{
}

- (void)setPlaybackQueueRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackQueueRequest, 0);
  objc_storeStrong(&self->_discoveryPredicate, 0);
  objc_storeStrong(&self->_customDescriptionForResponse, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_destination, 0);
}

@end