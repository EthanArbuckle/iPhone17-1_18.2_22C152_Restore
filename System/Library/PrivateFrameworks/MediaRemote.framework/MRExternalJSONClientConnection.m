@interface MRExternalJSONClientConnection
- (MRExternalJSONClientConnection)initWithConnection:(id)a3 queue:(id)a4;
- (id)_createProtocolMessage:(Class)a3 underlyingCodableMessage:(id)a4;
- (id)_encodeDeviceInfo:(id)a3;
- (id)_encodeVolumeDidChange:(id)a3;
- (id)_processDeviceInfo:(id)a3;
- (id)_processSetState:(id)a3;
- (id)_protocolMessageFromData:(id)a3;
- (id)dataForMessage:(id)a3;
@end

@implementation MRExternalJSONClientConnection

- (MRExternalJSONClientConnection)initWithConnection:(id)a3 queue:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MRExternalJSONClientConnection;
  return [(MRExternalClientConnection *)&v5 initWithConnection:a3 queue:a4];
}

- (id)dataForMessage:(id)a3
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(MRProtocolClientConnection *)self disconnected])
  {
    id v5 = 0;
    goto LABEL_25;
  }
  v36[0] = v4;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  objc_opt_class();
  id v26 = v4;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v4 messages];

    v6 = (void *)v7;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v30;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
        v13 = [MEMORY[0x1E4F1CA60] dictionary];
        uint64_t v14 = [v12 type];
        switch(v14)
        {
          case 15:
LABEL_13:
            v15 = [(MRExternalJSONClientConnection *)self _encodeDeviceInfo:v12];
            v16 = v13;
            v17 = v15;
            v18 = @"deviceInfo";
LABEL_15:
            [v16 setObject:v17 forKeyedSubscript:v18];
            goto LABEL_18;
          case 52:
            v15 = [(MRExternalJSONClientConnection *)self _encodeVolumeDidChange:v12];
            v16 = v13;
            v17 = v15;
            v18 = @"volume";
            goto LABEL_15;
          case 37:
            goto LABEL_13;
        }
        v19 = [v12 description];
        [v13 setObject:v19 forKeyedSubscript:@"unsupportedMessage"];

        v15 = _MRLogForCategory(4uLL);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v34 = v12;
          _os_log_error_impl(&dword_194F3C000, v15, OS_LOG_TYPE_ERROR, "[ExternalJSONClientConnection] Unsupported message: %{public}@", buf, 0xCu);
        }
LABEL_18:

        v20 = [v12 replyIdentifier];
        [v13 setObject:v20 forKeyedSubscript:@"identifier"];

        id v28 = 0;
        v21 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v13 options:0 error:&v28];
        id v22 = v28;
        if (v21)
        {
          v23 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
          v24 = objc_msgSend(MEMORY[0x1E4F779A0], "createHeader:", objc_msgSend(v21, "length"));
          [v23 appendData:v24];
          [v23 appendData:v21];
          [v5 appendData:v23];
        }
        else
        {
          v23 = _MRLogForCategory(4uLL);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v34 = v22;
            _os_log_error_impl(&dword_194F3C000, v23, OS_LOG_TYPE_ERROR, "[ExternalJSONClientConnection] Failed to encode message: %{public}@", buf, 0xCu);
          }
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v9);
  }

  id v4 = v26;
LABEL_25:

  return v5;
}

- (id)_protocolMessageFromData:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v59 = 0;
  v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v4 options:0 error:&v59];
  id v7 = v59;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    uint64_t v9 = [v8 objectForKeyedSubscript:@"artwork"];
    artwork = self->_artwork;
    self->_artwork = v9;

    uint64_t v11 = [v8 objectForKeyedSubscript:@"deviceInfo"];
    deviceInfo = self->_deviceInfo;
    self->_deviceInfo = v11;

    v13 = [v8 objectForKeyedSubscript:@"volume"];
    volume = self->_volume;
    self->_volume = v13;

    v15 = [v8 objectForKeyedSubscript:@"playerPath"];
    playerPath = self->_playerPath;
    self->_playerPath = v15;

    v17 = [v8 objectForKeyedSubscript:@"playbackQueue"];
    playbackQueue = self->_playbackQueue;
    self->_playbackQueue = v17;

    v19 = [v8 objectForKeyedSubscript:@"supportedCommands"];
    supportedCommands = self->_supportedCommands;
    self->_supportedCommands = v19;

    v21 = [v8 objectForKeyedSubscript:@"identifier"];
    id v22 = [(MRExternalJSONClientConnection *)self _processDeviceInfo:v21];
    if (v22) {
      [v5 addObject:v22];
    }
    if ([(MRProtocolClientConnection *)self disconnected])
    {

      id v23 = 0;
      goto LABEL_28;
    }
    v54 = [(MRExternalJSONClientConnection *)self _processSetState:v21];
    if (v54) {
      [v5 addObjectsFromArray:v54];
    }
    id v53 = v7;
    if (self->_volume)
    {
      v24 = [(NSDictionary *)self->_deviceInfo objectForKeyedSubscript:@"deviceUID"];
      if ([v24 length])
      {
        v51 = v24;
        v25 = [(NSDictionary *)self->_volume objectForKeyedSubscript:@"volumeCapabilities"];

        if (v25)
        {
          id v26 = [(NSDictionary *)self->_volume objectForKeyedSubscript:@"volumeCapabilities"];
          uint64_t v27 = [v26 unsignedLongValue];

          id v28 = objc_alloc_init(_MRVolumeControlAvailabilityProtobuf);
          [(_MRVolumeControlAvailabilityProtobuf *)v28 setVolumeControlAvailable:v27 != 0];
          v50 = v28;
          [(_MRVolumeControlAvailabilityProtobuf *)v28 setVolumeCapabilities:v27];
          long long v29 = objc_alloc_init(_MRVolumeControlCapabilitiesDidChangeMessageProtobuf);
          [(_MRVolumeControlCapabilitiesDidChangeMessageProtobuf *)v29 setCapabilities:v28];
          [(_MRVolumeControlCapabilitiesDidChangeMessageProtobuf *)v29 setEndpointUID:v51];
          v49 = v29;
          [(_MRVolumeControlCapabilitiesDidChangeMessageProtobuf *)v29 setOutputDeviceUID:v51];
          v48 = [(MRExternalJSONClientConnection *)self _createProtocolMessage:objc_opt_class() underlyingCodableMessage:v29];
          [v5 addObject:v48];
          long long v30 = objc_alloc_init(_MRGetVolumeControlCapabilitiesResultMessageProtobuf);
          [(_MRGetVolumeControlCapabilitiesResultMessageProtobuf *)v30 setCapabilities:v50];
          long long v31 = [(MRExternalJSONClientConnection *)self _createProtocolMessage:objc_opt_class() underlyingCodableMessage:v30];

          [v5 addObject:v31];
        }
        long long v32 = [(NSDictionary *)self->_volume objectForKeyedSubscript:@"volumeLevel"];

        if (v32)
        {
          v33 = [(NSDictionary *)self->_volume objectForKeyedSubscript:@"volumeLevel"];
          [v33 floatValue];
          int v35 = v34;

          v36 = objc_alloc_init(_MRVolumeDidChangeMessageProtobuf);
          LODWORD(v37) = v35;
          [(_MRVolumeDidChangeMessageProtobuf *)v36 setVolume:v37];
          [(_MRVolumeDidChangeMessageProtobuf *)v36 setEndpointUID:v51];
          [(_MRVolumeDidChangeMessageProtobuf *)v36 setOutputDeviceUID:v51];
          v38 = [(MRExternalJSONClientConnection *)self _createProtocolMessage:objc_opt_class() underlyingCodableMessage:v36];

          [v5 addObject:v38];
          v39 = objc_alloc_init(_MRGetVolumeResultMessageProtobuf);
          LODWORD(v40) = v35;
          [(_MRGetVolumeResultMessageProtobuf *)v39 setVolume:v40];
          id v22 = [(MRExternalJSONClientConnection *)self _createProtocolMessage:objc_opt_class() underlyingCodableMessage:v39];

          v24 = v51;
          [v5 addObject:v22];
        }
        else
        {
          v24 = v51;
        }
        id v7 = v53;
      }
    }
    if ([v21 length])
    {
      id v52 = v4;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v41 = v5;
      uint64_t v42 = [v41 countByEnumeratingWithState:&v55 objects:v60 count:16];
      if (v42)
      {
        uint64_t v43 = v42;
        uint64_t v44 = *(void *)v56;
        do
        {
          for (uint64_t i = 0; i != v43; ++i)
          {
            if (*(void *)v56 != v44) {
              objc_enumerationMutation(v41);
            }
            v46 = *(void **)(*((void *)&v55 + 1) + 8 * i);
            [v46 setReplyIdentifier:v21];
            [v46 setIsIncomingReply:1];
          }
          uint64_t v43 = [v41 countByEnumeratingWithState:&v55 objects:v60 count:16];
        }
        while (v43);
      }

      id v4 = v52;
      id v7 = v53;
    }
  }
  id v23 = v5;
LABEL_28:

  return v23;
}

- (id)_processDeviceInfo:(id)a3
{
  if (self->_deviceInfo)
  {
    id v4 = objc_alloc_init(_MRDeviceInfoMessageProtobuf);
    id v5 = [(NSDictionary *)self->_deviceInfo objectForKeyedSubscript:@"deviceName"];
    [(_MRDeviceInfoMessageProtobuf *)v4 setName:v5];

    v6 = [(NSDictionary *)self->_deviceInfo objectForKeyedSubscript:@"systemVersion"];
    [(_MRDeviceInfoMessageProtobuf *)v4 setSystemBuildVersion:v6];

    id v7 = [(NSDictionary *)self->_deviceInfo objectForKeyedSubscript:@"protocolVersion"];
    -[_MRDeviceInfoMessageProtobuf setProtocolVersion:](v4, "setProtocolVersion:", [v7 longLongValue]);

    [(_MRDeviceInfoMessageProtobuf *)v4 setAllowsPairing:0];
    id v8 = [(NSDictionary *)self->_deviceInfo objectForKeyedSubscript:@"deviceClass"];
    [(_MRDeviceInfoMessageProtobuf *)v4 setDeviceClass:[(_MRDeviceInfoMessageProtobuf *)v4 StringAsDeviceClass:v8]];

    [(_MRDeviceInfoMessageProtobuf *)v4 setIsProxyGroupPlayer:0];
    [(_MRDeviceInfoMessageProtobuf *)v4 setIsGroupLeader:0];
    uint64_t v9 = [(NSDictionary *)self->_deviceInfo objectForKeyedSubscript:@"deviceUID"];
    [(_MRDeviceInfoMessageProtobuf *)v4 setDeviceUID:v9];

    uint64_t v10 = [(NSDictionary *)self->_deviceInfo objectForKeyedSubscript:@"deviceUID"];
    [(_MRDeviceInfoMessageProtobuf *)v4 setUniqueIdentifier:v10];

    [(_MRDeviceInfoMessageProtobuf *)v4 setSupportsSystemPairing:0];
    [(_MRDeviceInfoMessageProtobuf *)v4 setSupportsSharedQueue:1];
    uint64_t v11 = [(NSDictionary *)self->_deviceInfo objectForKeyedSubscript:@"lastSupportedMessageType"];
    -[_MRDeviceInfoMessageProtobuf setLastSupportedMessageType:](v4, "setLastSupportedMessageType:", [v11 unsignedIntValue]);

    v12 = [(MRExternalJSONClientConnection *)self _createProtocolMessage:objc_opt_class() underlyingCodableMessage:v4];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_encodeDeviceInfo:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = [v3 dictionary];
  v6 = [v4 underlyingCodableMessage];

  id v7 = [v6 name];
  [v5 setObject:v7 forKeyedSubscript:@"deviceName"];

  id v8 = [v6 systemBuildVersion];
  [v5 setObject:v8 forKeyedSubscript:@"systemVersion"];

  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "protocolVersion"));
  [v5 setObject:v9 forKeyedSubscript:@"protocolVersion"];

  uint64_t v10 = objc_msgSend(v6, "deviceClassAsString:", objc_msgSend(v6, "deviceClass"));
  [v5 setObject:v10 forKeyedSubscript:@"deviceClass"];

  uint64_t v11 = [v6 deviceUID];
  [v5 setObject:v11 forKeyedSubscript:@"deviceUID"];

  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v6, "lastSupportedMessageType"));
  [v5 setObject:v12 forKeyedSubscript:@"lastSupportedMessageType"];

  return v5;
}

- (id)_processSetState:(id)a3
{
  uint64_t v448 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_playerPath)
  {
    LocalOrigiuint64_t n = MRMediaRemoteGetLocalOrigin();
    v6 = objc_alloc_init(_MRNowPlayingPlayerPathProtobuf);
    id v7 = objc_alloc_init(_MROriginProtobuf);
    [(_MRNowPlayingPlayerPathProtobuf *)v6 setOrigin:v7];

    uint64_t UniqueIdentifier = MROriginGetUniqueIdentifier(LocalOrigin);
    uint64_t v9 = [(_MRNowPlayingPlayerPathProtobuf *)v6 origin];
    [v9 setIdentifier:UniqueIdentifier];

    DisplayName = MROriginGetDisplayName(LocalOrigin);
    uint64_t v11 = [(_MRNowPlayingPlayerPathProtobuf *)v6 origin];
    [v11 setDisplayName:DisplayName];

    v12 = objc_alloc_init(_MRNowPlayingClientProtobuf);
    [(_MRNowPlayingPlayerPathProtobuf *)v6 setClient:v12];

    v13 = [(NSDictionary *)self->_playerPath objectForKeyedSubscript:@"bundleIdentifier"];
    uint64_t v14 = [(_MRNowPlayingPlayerPathProtobuf *)v6 client];
    [v14 setBundleIdentifier:v13];

    v15 = [(NSDictionary *)self->_playerPath objectForKeyedSubscript:@"displayName"];
    v16 = [(_MRNowPlayingPlayerPathProtobuf *)v6 client];
    [v16 setDisplayName:v15];

    v17 = [(_MRNowPlayingPlayerPathProtobuf *)v6 client];
    [v17 setProcessIdentifier:1];

    v18 = objc_alloc_init(_MRNowPlayingClientProtobuf);
    v19 = [(NSDictionary *)self->_playerPath objectForKeyedSubscript:@"bundleIdentifier"];
    [(_MRNowPlayingClientProtobuf *)v18 setBundleIdentifier:v19];

    v20 = [(NSDictionary *)self->_playerPath objectForKeyedSubscript:@"displayName"];
    [(_MRNowPlayingClientProtobuf *)v18 setDisplayName:v20];

    v417 = v18;
    [(_MRNowPlayingClientProtobuf *)v18 setProcessIdentifier:1];
  }
  else
  {
    v6 = 0;
    v417 = 0;
  }
  p_playbackQueue = &self->_playbackQueue;
  playbackQueue = self->_playbackQueue;
  BOOL v23 = playbackQueue != 0;
  unint64_t v24 = 0x1E4F1C000;
  if (playbackQueue)
  {
    v25 = objc_alloc_init(_MRContentItemProtobuf);
    id v26 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"queueIdentifier"];
    [(_MRContentItemProtobuf *)v25 setIdentifier:v26];

    uint64_t v27 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"queueIdentifier"];
    [(_MRContentItemProtobuf *)v25 setQueueIdentifier:v27];

    id v28 = objc_alloc_init(_MRContentItemMetadataProtobuf);
    [(_MRContentItemProtobuf *)v25 setMetadata:v28];

    long long v29 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"albumArtistName"];
    long long v30 = [(_MRContentItemProtobuf *)v25 metadata];
    [v30 setAlbumArtistName:v29];

    long long v31 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"albumName"];
    long long v32 = [(_MRContentItemProtobuf *)v25 metadata];
    [v32 setAlbumName:v31];

    v33 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"artworkIdentifier"];
    int v34 = [(_MRContentItemProtobuf *)v25 metadata];
    [v34 setArtworkIdentifier:v33];

    int v35 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"artworkMIMEType"];
    v36 = [(_MRContentItemProtobuf *)v25 metadata];
    [v36 setArtworkMIMEType:v35];

    double v37 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"artworkURL"];
    v38 = [(_MRContentItemProtobuf *)v25 metadata];
    [v38 setArtworkURL:v37];

    v39 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"assetURLString"];
    double v40 = [(_MRContentItemProtobuf *)v25 metadata];
    [v40 setAssetURLString:v39];

    id v41 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"collectionIdentifier"];
    uint64_t v42 = [(_MRContentItemProtobuf *)v25 metadata];
    [v42 setCollectionIdentifier:v41];

    uint64_t v43 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"composer"];
    uint64_t v44 = [(_MRContentItemProtobuf *)v25 metadata];
    [v44 setComposer:v43];

    v45 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"contentIdentifier"];
    v46 = [(_MRContentItemProtobuf *)v25 metadata];
    [v46 setContentIdentifier:v45];

    v47 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"internationalStandardRecordingCode"];
    v48 = [(_MRContentItemProtobuf *)v25 metadata];
    [v48 setInternationalStandardRecordingCode:v47];

    v49 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"directorName"];
    v50 = [(_MRContentItemProtobuf *)v25 metadata];
    [v50 setDirectorName:v49];

    v51 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"genre"];
    id v52 = [(_MRContentItemProtobuf *)v25 metadata];
    [v52 setGenre:v51];

    id v53 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"localizedContentRating"];
    v54 = [(_MRContentItemProtobuf *)v25 metadata];
    [v54 setLocalizedContentRating:v53];

    long long v55 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"lyricsURL"];
    long long v56 = [(_MRContentItemProtobuf *)v25 metadata];
    [v56 setLyricsURL:v55];

    long long v57 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"serviceIdentifier"];
    long long v58 = [(_MRContentItemProtobuf *)v25 metadata];
    [v58 setServiceIdentifier:v57];

    id v59 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"profileIdentifier"];
    v60 = [(_MRContentItemProtobuf *)v25 metadata];
    [v60 setProfileIdentifier:v59];

    uint64_t v61 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"radioStationName"];
    v62 = [(_MRContentItemProtobuf *)v25 metadata];
    [v62 setRadioStationName:v61];

    v63 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"radioStationString"];
    v64 = [(_MRContentItemProtobuf *)v25 metadata];
    [v64 setRadioStationString:v63];

    v65 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"seriesName"];
    v66 = [(_MRContentItemProtobuf *)v25 metadata];
    [v66 setSeriesName:v65];

    v67 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"serviceIdentifier"];
    v68 = [(_MRContentItemProtobuf *)v25 metadata];
    [v68 setServiceIdentifier:v67];

    v69 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"subtitle"];
    v70 = [(_MRContentItemProtobuf *)v25 metadata];
    [v70 setSubtitle:v69];

    v71 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"title"];
    v72 = [(_MRContentItemProtobuf *)v25 metadata];
    [v72 setTitle:v71];

    v73 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"trackArtistName"];
    v74 = [(_MRContentItemProtobuf *)v25 metadata];
    [v74 setTrackArtistName:v73];

    v75 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"appMetricsData"];

    if (v75)
    {
      id v76 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      v77 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"appMetricsData"];
      v78 = (void *)[v76 initWithBase64EncodedString:v77 options:0];
      v79 = [(_MRContentItemProtobuf *)v25 metadata];
      [v79 setAppMetricsData:v78];
    }
    v80 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"artworkURLTemplatesData"];

    if (v80)
    {
      id v81 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      v82 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"artworkURLTemplatesData"];
      v83 = (void *)[v81 initWithBase64EncodedString:v82 options:0];
      v84 = [(_MRContentItemProtobuf *)v25 metadata];
      [v84 setArtworkURLTemplatesData:v83];
    }
    v85 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"collectionInfoData"];

    if (v85)
    {
      id v86 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      v87 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"collectionInfoData"];
      v88 = (void *)[v86 initWithBase64EncodedString:v87 options:0];
      v89 = [(_MRContentItemProtobuf *)v25 metadata];
      [v89 setCollectionInfoData:v88];
    }
    v90 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"currentPlaybackDateData"];

    if (v90)
    {
      id v91 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      v92 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"currentPlaybackDateData"];
      v93 = (void *)[v91 initWithBase64EncodedString:v92 options:0];
      v94 = [(_MRContentItemProtobuf *)v25 metadata];
      [v94 setCurrentPlaybackDateData:v93];
    }
    v95 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"deviceSpecificUserInfoData"];

    if (v95)
    {
      id v96 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      v97 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"deviceSpecificUserInfoData"];
      v98 = (void *)[v96 initWithBase64EncodedString:v97 options:0];
      v99 = [(_MRContentItemProtobuf *)v25 metadata];
      [v99 setDeviceSpecificUserInfoData:v98];
    }
    v100 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"nowPlayingInfoData"];

    if (v100)
    {
      id v101 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      v102 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"nowPlayingInfoData"];
      v103 = (void *)[v101 initWithBase64EncodedString:v102 options:0];
      v104 = [(_MRContentItemProtobuf *)v25 metadata];
      [v104 setNowPlayingInfoData:v103];
    }
    v105 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"purchaseInfoData"];

    if (v105)
    {
      id v106 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      v107 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"purchaseInfoData"];
      v108 = (void *)[v106 initWithBase64EncodedString:v107 options:0];
      v109 = [(_MRContentItemProtobuf *)v25 metadata];
      [v109 setPurchaseInfoData:v108];
    }
    v110 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"userInfoData"];

    if (v110)
    {
      id v111 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      v112 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"userInfoData"];
      v113 = (void *)[v111 initWithBase64EncodedString:v112 options:0];
      v114 = [(_MRContentItemProtobuf *)v25 metadata];
      [v114 setUserInfoData:v113];
    }
    v115 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"artworkAvailable"];

    if (v115)
    {
      v116 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"artworkAvailable"];
      uint64_t v117 = [v116 BOOLValue];
      v118 = [(_MRContentItemProtobuf *)v25 metadata];
      [v118 setArtworkAvailable:v117];
    }
    v119 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"infoAvailable"];

    if (v119)
    {
      v120 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"infoAvailable"];
      uint64_t v121 = [v120 BOOLValue];
      v122 = [(_MRContentItemProtobuf *)v25 metadata];
      [v122 setInfoAvailable:v121];
    }
    v123 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"isAlwaysLive"];

    if (v123)
    {
      v124 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"isAlwaysLive"];
      uint64_t v125 = [v124 BOOLValue];
      v126 = [(_MRContentItemProtobuf *)v25 metadata];
      [v126 setIsAlwaysLive:v125];
    }
    v127 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"isContainer"];

    if (v127)
    {
      v128 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"isContainer"];
      uint64_t v129 = [v128 BOOLValue];
      v130 = [(_MRContentItemProtobuf *)v25 metadata];
      [v130 setIsContainer:v129];
    }
    v131 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"isCurrentlyPlaying"];

    if (v131)
    {
      v132 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"isCurrentlyPlaying"];
      uint64_t v133 = [v132 BOOLValue];
      v134 = [(_MRContentItemProtobuf *)v25 metadata];
      [v134 setIsCurrentlyPlaying:v133];
    }
    v135 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"isExplicitItem"];

    if (v135)
    {
      v136 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"isExplicitItem"];
      uint64_t v137 = [v136 BOOLValue];
      v138 = [(_MRContentItemProtobuf *)v25 metadata];
      [v138 setIsExplicitItem:v137];
    }
    v139 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"isInWishList"];

    if (v139)
    {
      v140 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"isInWishList"];
      uint64_t v141 = [v140 BOOLValue];
      v142 = [(_MRContentItemProtobuf *)v25 metadata];
      [v142 setIsInWishList:v141];
    }
    v143 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"isLiked"];

    if (v143)
    {
      v144 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"isLiked"];
      uint64_t v145 = [v144 BOOLValue];
      v146 = [(_MRContentItemProtobuf *)v25 metadata];
      [v146 setIsLiked:v145];
    }
    v147 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"isLoading"];

    if (v147)
    {
      v148 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"isLoading"];
      uint64_t v149 = [v148 BOOLValue];
      v150 = [(_MRContentItemProtobuf *)v25 metadata];
      [v150 setIsLoading:v149];
    }
    v151 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"isInTransition"];

    if (v151)
    {
      v152 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"isInTransition"];
      uint64_t v153 = [v152 BOOLValue];
      v154 = [(_MRContentItemProtobuf *)v25 metadata];
      [v154 setIsInTransition:v153];
    }
    v155 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"isPlayable"];

    if (v155)
    {
      v156 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"isPlayable"];
      uint64_t v157 = [v156 BOOLValue];
      v158 = [(_MRContentItemProtobuf *)v25 metadata];
      [v158 setIsPlayable:v157];
    }
    v159 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"isSharable"];

    if (v159)
    {
      v160 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"isSharable"];
      uint64_t v161 = [v160 BOOLValue];
      v162 = [(_MRContentItemProtobuf *)v25 metadata];
      [v162 setIsSharable:v161];
    }
    v163 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"isAdvertisement"];

    if (v163)
    {
      v164 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"isAdvertisement"];
      uint64_t v165 = [v164 BOOLValue];
      v166 = [(_MRContentItemProtobuf *)v25 metadata];
      [v166 setIsAdvertisement:v165];
    }
    v167 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"isSteerable"];

    if (v167)
    {
      v168 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"isSteerable"];
      uint64_t v169 = [v168 BOOLValue];
      v170 = [(_MRContentItemProtobuf *)v25 metadata];
      [v170 setIsSteerable:v169];
    }
    v171 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"isStreamingContent"];

    if (v171)
    {
      v172 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"isStreamingContent"];
      uint64_t v173 = [v172 BOOLValue];
      v174 = [(_MRContentItemProtobuf *)v25 metadata];
      [v174 setIsStreamingContent:v173];
    }
    v175 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"languageOptionsAvailable"];

    if (v175)
    {
      v176 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"languageOptionsAvailable"];
      uint64_t v177 = [v176 BOOLValue];
      v178 = [(_MRContentItemProtobuf *)v25 metadata];
      [v178 setLanguageOptionsAvailable:v177];
    }
    v179 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"lyricsAvailable"];

    if (v179)
    {
      v180 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"lyricsAvailable"];
      uint64_t v181 = [v180 BOOLValue];
      v182 = [(_MRContentItemProtobuf *)v25 metadata];
      [v182 setLyricsAvailable:v181];
    }
    v183 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"duration"];

    if (v183)
    {
      v184 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"duration"];
      [v184 doubleValue];
      double v186 = v185;
      v187 = [(_MRContentItemProtobuf *)v25 metadata];
      [v187 setDuration:v186];
    }
    v188 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"elapsedTime"];

    if (v188)
    {
      v189 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"elapsedTime"];
      [v189 doubleValue];
      double v191 = v190;
      v192 = [(_MRContentItemProtobuf *)v25 metadata];
      [v192 setElapsedTime:v191];
    }
    v193 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"elapsedTimeTimestamp"];

    if (v193)
    {
      v194 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"elapsedTimeTimestamp"];
      [v194 doubleValue];
      double v196 = v195;
      v197 = [(_MRContentItemProtobuf *)v25 metadata];
      [v197 setElapsedTimeTimestamp:v196];
    }
    v198 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"inferredTimestamp"];

    if (v198)
    {
      v199 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"inferredTimestamp"];
      [v199 doubleValue];
      double v201 = v200;
      v202 = [(_MRContentItemProtobuf *)v25 metadata];
      [v202 setInferredTimestamp:v201];
    }
    v203 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"releaseDate"];

    if (v203)
    {
      v204 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"releaseDate"];
      [v204 doubleValue];
      double v206 = v205;
      v207 = [(_MRContentItemProtobuf *)v25 metadata];
      [v207 setReleaseDate:v206];
    }
    v208 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"startTime"];

    if (v208)
    {
      v209 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"startTime"];
      [v209 doubleValue];
      double v211 = v210;
      v212 = [(_MRContentItemProtobuf *)v25 metadata];
      [v212 setStartTime:v211];
    }
    v213 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"defaultPlaybackRate"];

    if (v213)
    {
      v214 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"defaultPlaybackRate"];
      [v214 floatValue];
      int v216 = v215;
      v217 = [(_MRContentItemProtobuf *)v25 metadata];
      LODWORD(v218) = v216;
      [v217 setDefaultPlaybackRate:v218];
    }
    v219 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"iTunesStoreAlbumIdentifier"];

    if (v219)
    {
      v220 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"iTunesStoreAlbumIdentifier"];
      uint64_t v221 = [v220 longLongValue];
      v222 = [(_MRContentItemProtobuf *)v25 metadata];
      [v222 setITunesStoreAlbumIdentifier:v221];
    }
    v223 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"iTunesStoreArtistIdentifier"];

    if (v223)
    {
      v224 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"iTunesStoreArtistIdentifier"];
      uint64_t v225 = [v224 longLongValue];
      v226 = [(_MRContentItemProtobuf *)v25 metadata];
      [v226 setITunesStoreArtistIdentifier:v225];
    }
    v227 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"iTunesStoreIdentifier"];

    if (v227)
    {
      v228 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"iTunesStoreIdentifier"];
      uint64_t v229 = [v228 longLongValue];
      v230 = [(_MRContentItemProtobuf *)v25 metadata];
      [v230 setITunesStoreIdentifier:v229];
    }
    v231 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"iTunesStoreSubscriptionIdentifier"];

    if (v231)
    {
      v232 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"iTunesStoreSubscriptionIdentifier"];
      uint64_t v233 = [v232 longLongValue];
      v234 = [(_MRContentItemProtobuf *)v25 metadata];
      [v234 setITunesStoreSubscriptionIdentifier:v233];
    }
    v235 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"legacyUniqueIdentifier"];

    if (v235)
    {
      v236 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"legacyUniqueIdentifier"];
      uint64_t v237 = [v236 longLongValue];
      v238 = [(_MRContentItemProtobuf *)v25 metadata];
      [v238 setLegacyUniqueIdentifier:v237];
    }
    v239 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"radioStationIdentifier"];

    if (v239)
    {
      v240 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"radioStationIdentifier"];
      uint64_t v241 = [v240 longLongValue];
      v242 = [(_MRContentItemProtobuf *)v25 metadata];
      [v242 setRadioStationIdentifier:v241];
    }
    v243 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"artworkDataHeightDeprecated"];

    if (v243)
    {
      v244 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"artworkDataHeightDeprecated"];
      uint64_t v245 = [v244 intValue];
      v246 = [(_MRContentItemProtobuf *)v25 metadata];
      [v246 setArtworkDataHeightDeprecated:v245];
    }
    v247 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"artworkDataWidthDeprecated"];

    if (v247)
    {
      v248 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"artworkDataWidthDeprecated"];
      uint64_t v249 = [v248 intValue];
      v250 = [(_MRContentItemProtobuf *)v25 metadata];
      [v250 setArtworkDataWidthDeprecated:v249];
    }
    v251 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"chapterCount"];

    if (v251)
    {
      v252 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"chapterCount"];
      uint64_t v253 = [v252 intValue];
      v254 = [(_MRContentItemProtobuf *)v25 metadata];
      [v254 setChapterCount:v253];
    }
    v255 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"discNumber"];

    if (v255)
    {
      v256 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"discNumber"];
      uint64_t v257 = [v256 intValue];
      v258 = [(_MRContentItemProtobuf *)v25 metadata];
      [v258 setDiscNumber:v257];
    }
    v259 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"downloadProgress"];

    if (v259)
    {
      v260 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"downloadProgress"];
      [v260 floatValue];
      int v262 = v261;
      v263 = [(_MRContentItemProtobuf *)v25 metadata];
      LODWORD(v264) = v262;
      [v263 setDownloadProgress:v264];
    }
    v265 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"downloadState"];

    if (v265)
    {
      v266 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"downloadState"];
      uint64_t v267 = [v266 intValue];
      v268 = [(_MRContentItemProtobuf *)v25 metadata];
      [v268 setDownloadState:v267];
    }
    v269 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"editingStyleFlags"];

    if (v269)
    {
      v270 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"editingStyleFlags"];
      uint64_t v271 = [v270 intValue];
      v272 = [(_MRContentItemProtobuf *)v25 metadata];
      [v272 setEditingStyleFlags:v271];
    }
    v273 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"episodeNumber"];

    if (v273)
    {
      v274 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"episodeNumber"];
      uint64_t v275 = [v274 intValue];
      v276 = [(_MRContentItemProtobuf *)v25 metadata];
      [v276 setEpisodeNumber:v275];
    }
    v277 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"episodeType"];

    if (v277)
    {
      v278 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"episodeType"];
      uint64_t v279 = [v278 intValue];
      v280 = [(_MRContentItemProtobuf *)v25 metadata];
      [v280 setEpisodeType:v279];
    }
    v281 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"mediaSubType"];

    if (v281)
    {
      v282 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"mediaSubType"];
      uint64_t v283 = [v282 intValue];
      v284 = [(_MRContentItemProtobuf *)v25 metadata];
      [v284 setMediaSubType:v283];
    }
    v285 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"mediaType"];

    if (v285)
    {
      v286 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"mediaType"];
      uint64_t v287 = [v286 intValue];
      v288 = [(_MRContentItemProtobuf *)v25 metadata];
      [v288 setMediaType:v287];
    }
    v289 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"numberOfSections"];

    if (v289)
    {
      v290 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"numberOfSections"];
      uint64_t v291 = [v290 intValue];
      v292 = [(_MRContentItemProtobuf *)v25 metadata];
      [v292 setNumberOfSections:v291];
    }
    v293 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"playCount"];

    if (v293)
    {
      v294 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"playCount"];
      uint64_t v295 = [v294 intValue];
      v296 = [(_MRContentItemProtobuf *)v25 metadata];
      [v296 setPlayCount:v295];
    }
    v297 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"playbackProgress"];

    if (v297)
    {
      v298 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"playbackProgress"];
      [v298 floatValue];
      int v300 = v299;
      v301 = [(_MRContentItemProtobuf *)v25 metadata];
      LODWORD(v302) = v300;
      [v301 setPlaybackProgress:v302];
    }
    v303 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"playbackRate"];

    if (v303)
    {
      v304 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"playbackRate"];
      [v304 floatValue];
      int v306 = v305;
      v307 = [(_MRContentItemProtobuf *)v25 metadata];
      LODWORD(v308) = v306;
      [v307 setPlaybackRate:v308];
    }
    v309 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"playlistType"];

    if (v309)
    {
      v310 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"playlistType"];
      uint64_t v311 = [v310 intValue];
      v312 = [(_MRContentItemProtobuf *)v25 metadata];
      [v312 setPlaylistType:v311];
    }
    v313 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"radioStationType"];

    if (v313)
    {
      v314 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"radioStationType"];
      uint64_t v315 = [v314 intValue];
      v316 = [(_MRContentItemProtobuf *)v25 metadata];
      [v316 setRadioStationType:v315];
    }
    v317 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"seasonNumber"];

    if (v317)
    {
      v318 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"seasonNumber"];
      uint64_t v319 = [v318 intValue];
      v320 = [(_MRContentItemProtobuf *)v25 metadata];
      [v320 setSeasonNumber:v319];
    }
    v321 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"totalDiscCount"];

    if (v321)
    {
      v322 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"totalDiscCount"];
      uint64_t v323 = [v322 intValue];
      v324 = [(_MRContentItemProtobuf *)v25 metadata];
      [v324 setTotalDiscCount:v323];
    }
    v325 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"totalTrackCount"];

    if (v325)
    {
      v326 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"totalTrackCount"];
      uint64_t v327 = [v326 intValue];
      v328 = [(_MRContentItemProtobuf *)v25 metadata];
      [v328 setTotalTrackCount:v327];
    }
    v329 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"trackNumber"];

    if (v329)
    {
      v330 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"trackNumber"];
      uint64_t v331 = [v330 intValue];
      v332 = [(_MRContentItemProtobuf *)v25 metadata];
      [v332 setTrackNumber:v331];
    }
    v333 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"classicalWork"];

    if (v333)
    {
      v334 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"classicalWork"];
      v335 = [v334 stringValue];
      v336 = [(_MRContentItemProtobuf *)v25 metadata];
      [v336 setClassicalWork:v335];
    }
    artworuint64_t k = self->_artwork;
    if (artwork)
    {
      v338 = [(NSDictionary *)artwork objectForKeyedSubscript:@"jpeg"];

      if (v338)
      {
        id v339 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        v340 = [(NSDictionary *)self->_artwork objectForKeyedSubscript:@"jpeg"];
        v341 = (void *)[v339 initWithBase64EncodedString:v340 options:0];
        [(_MRContentItemProtobuf *)v25 setArtworkData:v341];
      }
      v342 = objc_alloc_init(_MRUpdateContentItemArtworkMessageProtobuf);
      unint64_t v24 = 0x1E4F1C000uLL;
      v343 = [MEMORY[0x1E4F1CA48] array];
      [(_MRUpdateContentItemArtworkMessageProtobuf *)v342 setContentItems:v343];

      v344 = v342;
      v345 = [(_MRUpdateContentItemArtworkMessageProtobuf *)v342 contentItems];
      [v345 addObject:v25];
    }
    else
    {
      v344 = 0;
      unint64_t v24 = 0x1E4F1C000uLL;
    }
    v347 = objc_alloc_init(_MRPlaybackQueueProtobuf);
    [(_MRPlaybackQueueProtobuf *)v347 setLocation:0];
    v348 = [MEMORY[0x1E4F1CA48] array];
    [(_MRPlaybackQueueProtobuf *)v347 setContentItems:v348];

    v349 = [(_MRPlaybackQueueProtobuf *)v347 contentItems];
    [v349 addObject:v25];

    [(_MRPlaybackQueueProtobuf *)v347 setResolvedPlayerPath:v6];
    v350 = [(NSDictionary *)*p_playbackQueue objectForKeyedSubscript:@"queueIdentifier"];
    v418 = v347;
    [(_MRPlaybackQueueProtobuf *)v347 setQueueIdentifier:v350];

    v346 = v344;
  }
  else
  {
    v346 = 0;
    v418 = 0;
  }
  if (self->_supportedCommands)
  {
    v414 = v346;
    v415 = v6;
    id v416 = v4;
    v421 = objc_alloc_init(_MRSupportedCommandsProtobuf);
    long long v439 = 0u;
    long long v440 = 0u;
    long long v441 = 0u;
    long long v442 = 0u;
    id obj = self->_supportedCommands;
    uint64_t v422 = [(NSDictionary *)obj countByEnumeratingWithState:&v439 objects:v447 count:16];
    if (v422)
    {
      uint64_t v420 = *(void *)v440;
      v351 = @"command";
      v352 = @"maximumRating";
      do
      {
        for (uint64_t i = 0; i != v422; ++i)
        {
          v354 = v352;
          v355 = v351;
          if (*(void *)v440 != v420) {
            objc_enumerationMutation(obj);
          }
          v356 = *(void **)(*((void *)&v439 + 1) + 8 * i);
          v357 = objc_alloc_init(_MRCommandInfoProtobuf);
          v358 = [v356 objectForKeyedSubscript:@"localizedShortTitle"];
          [(_MRCommandInfoProtobuf *)v357 setLocalizedShortTitle:v358];

          v359 = [v356 objectForKeyedSubscript:@"localizedTitle"];
          [(_MRCommandInfoProtobuf *)v357 setLocalizedTitle:v359];

          long long v437 = 0u;
          long long v438 = 0u;
          long long v435 = 0u;
          long long v436 = 0u;
          v360 = [v356 objectForKeyedSubscript:@"preferredIntervals"];
          uint64_t v361 = [v360 countByEnumeratingWithState:&v435 objects:v446 count:16];
          if (v361)
          {
            uint64_t v362 = v361;
            uint64_t v363 = *(void *)v436;
            do
            {
              for (uint64_t j = 0; j != v362; ++j)
              {
                if (*(void *)v436 != v363) {
                  objc_enumerationMutation(v360);
                }
                objc_msgSend(*(id *)(*((void *)&v435 + 1) + 8 * j), "doubleValue", v414);
                -[_MRCommandInfoProtobuf addPreferredInterval:](v357, "addPreferredInterval:");
              }
              uint64_t v362 = [v360 countByEnumeratingWithState:&v435 objects:v446 count:16];
            }
            while (v362);
          }

          long long v433 = 0u;
          long long v434 = 0u;
          long long v431 = 0u;
          long long v432 = 0u;
          v365 = [v356 objectForKeyedSubscript:@"supportedInterstionPositions"];
          uint64_t v366 = [v365 countByEnumeratingWithState:&v431 objects:v445 count:16];
          if (v366)
          {
            uint64_t v367 = v366;
            uint64_t v368 = *(void *)v432;
            do
            {
              for (uint64_t k = 0; k != v367; ++k)
              {
                if (*(void *)v432 != v368) {
                  objc_enumerationMutation(v365);
                }
                -[_MRCommandInfoProtobuf addSupportedInsertionPositions:](v357, "addSupportedInsertionPositions:", objc_msgSend(*(id *)(*((void *)&v431 + 1) + 8 * k), "intValue", v414));
              }
              uint64_t v367 = [v365 countByEnumeratingWithState:&v431 objects:v445 count:16];
            }
            while (v367);
          }

          long long v429 = 0u;
          long long v430 = 0u;
          long long v427 = 0u;
          long long v428 = 0u;
          v370 = [v356 objectForKeyedSubscript:@"supportedPlaybackQueueTypes"];
          uint64_t v371 = [v370 countByEnumeratingWithState:&v427 objects:v444 count:16];
          if (v371)
          {
            uint64_t v372 = v371;
            uint64_t v373 = *(void *)v428;
            do
            {
              for (uint64_t m = 0; m != v372; ++m)
              {
                if (*(void *)v428 != v373) {
                  objc_enumerationMutation(v370);
                }
                -[_MRCommandInfoProtobuf addSupportedPlaybackQueueTypes:](v357, "addSupportedPlaybackQueueTypes:", objc_msgSend(*(id *)(*((void *)&v427 + 1) + 8 * m), "intValue", v414));
              }
              uint64_t v372 = [v370 countByEnumeratingWithState:&v427 objects:v444 count:16];
            }
            while (v372);
          }

          long long v425 = 0u;
          long long v426 = 0u;
          long long v423 = 0u;
          long long v424 = 0u;
          v375 = [v356 objectForKeyedSubscript:@"supportedRates"];
          uint64_t v376 = [v375 countByEnumeratingWithState:&v423 objects:v443 count:16];
          if (v376)
          {
            uint64_t v377 = v376;
            uint64_t v378 = *(void *)v424;
            do
            {
              for (uint64_t n = 0; n != v377; ++n)
              {
                if (*(void *)v424 != v378) {
                  objc_enumerationMutation(v375);
                }
                objc_msgSend(*(id *)(*((void *)&v423 + 1) + 8 * n), "doubleValue", v414);
                *(float *)&double v380 = v380;
                [(_MRCommandInfoProtobuf *)v357 addSupportedRate:v380];
              }
              uint64_t v377 = [v375 countByEnumeratingWithState:&v423 objects:v443 count:16];
            }
            while (v377);
          }

          v351 = v355;
          v381 = [v356 objectForKeyedSubscript:v355];

          if (v381)
          {
            v382 = [v356 objectForKeyedSubscript:v355];
            -[_MRCommandInfoProtobuf setCommand:](v357, "setCommand:", [v382 intValue]);
          }
          v352 = v354;
          v383 = objc_msgSend(v356, "objectForKeyedSubscript:", v354, v414);

          if (v383)
          {
            v384 = [v356 objectForKeyedSubscript:v354];
            [v384 floatValue];
            -[_MRCommandInfoProtobuf setMaximumRating:](v357, "setMaximumRating:");
          }
          v385 = [v356 objectForKeyedSubscript:@"minimumRating"];

          if (v385)
          {
            v386 = [v356 objectForKeyedSubscript:@"minimumRating"];
            [v386 floatValue];
            -[_MRCommandInfoProtobuf setMinimumRating:](v357, "setMinimumRating:");
          }
          v387 = [v356 objectForKeyedSubscript:@"preferredPlaybackRate"];

          if (v387)
          {
            v388 = [v356 objectForKeyedSubscript:@"preferredPlaybackRate"];
            [v388 floatValue];
            -[_MRCommandInfoProtobuf setPreferredPlaybackRate:](v357, "setPreferredPlaybackRate:");
          }
          v389 = [v356 objectForKeyedSubscript:@"canScrub"];

          if (v389)
          {
            v390 = [v356 objectForKeyedSubscript:@"canScrub"];
            -[_MRCommandInfoProtobuf setCanScrub:](v357, "setCanScrub:", [v390 intValue]);
          }
          v391 = [v356 objectForKeyedSubscript:@"numAvailableSkips"];

          if (v391)
          {
            v392 = [v356 objectForKeyedSubscript:@"numAvailableSkips"];
            -[_MRCommandInfoProtobuf setNumAvailableSkips:](v357, "setNumAvailableSkips:", [v392 intValue]);
          }
          v393 = [v356 objectForKeyedSubscript:@"presentationStyle"];

          if (v393)
          {
            v394 = [v356 objectForKeyedSubscript:@"presentationStyle"];
            -[_MRCommandInfoProtobuf setPresentationStyle:](v357, "setPresentationStyle:", [v394 intValue]);
          }
          v395 = [v356 objectForKeyedSubscript:@"skipFrequency"];

          if (v395)
          {
            v396 = [v356 objectForKeyedSubscript:@"skipFrequency"];
            -[_MRCommandInfoProtobuf setSkipFrequency:](v357, "setSkipFrequency:", [v396 intValue]);
          }
          v397 = [v356 objectForKeyedSubscript:@"skipInterval"];

          if (v397)
          {
            v398 = [v356 objectForKeyedSubscript:@"skipInterval"];
            -[_MRCommandInfoProtobuf setSkipInterval:](v357, "setSkipInterval:", [v398 intValue]);
          }
          v399 = [v356 objectForKeyedSubscript:@"upNextItemCount"];

          if (v399)
          {
            v400 = [v356 objectForKeyedSubscript:@"upNextItemCount"];
            -[_MRCommandInfoProtobuf setUpNextItemCount:](v357, "setUpNextItemCount:", [v400 intValue]);
          }
          v401 = [v356 objectForKeyedSubscript:@"active"];

          if (v401)
          {
            v402 = [v356 objectForKeyedSubscript:@"active"];
            -[_MRCommandInfoProtobuf setActive:](v357, "setActive:", [v402 BOOLValue]);
          }
          v403 = [v356 objectForKeyedSubscript:@"enabled"];

          if (v403)
          {
            v404 = [v356 objectForKeyedSubscript:@"enabled"];
            -[_MRCommandInfoProtobuf setEnabled:](v357, "setEnabled:", [v404 BOOLValue]);
          }
          [(_MRSupportedCommandsProtobuf *)v421 addSupportedCommand:v357];
        }
        uint64_t v422 = [(NSDictionary *)obj countByEnumeratingWithState:&v439 objects:v447 count:16];
      }
      while (v422);
    }

    BOOL v23 = 1;
    v6 = v415;
    id v4 = v416;
    v346 = v414;
    unint64_t v24 = 0x1E4F1C000;
  }
  else
  {
    v421 = 0;
  }
  v405 = objc_msgSend(*(id *)(v24 + 2632), "array", v414);
  if (v23)
  {
    if (!v6)
    {
      id v412 = 0;
      v409 = v417;
      goto LABEL_202;
    }
    v406 = objc_alloc_init(_MRSetStateMessageProtobuf);
    [(_MRSetStateMessageProtobuf *)v406 setPlayerPath:v6];
    [(_MRSetStateMessageProtobuf *)v406 setPlaybackQueue:v418];
    [(_MRSetStateMessageProtobuf *)v406 setSupportedCommands:v421];
    v407 = [(MRExternalJSONClientConnection *)self _createProtocolMessage:objc_opt_class() underlyingCodableMessage:v406];
    if (v346)
    {
      v408 = [(MRExternalJSONClientConnection *)self _createProtocolMessage:objc_opt_class() underlyingCodableMessage:v346];
      [v405 addObject:v408];
    }
    [v405 addObject:v407];
  }
  v409 = v417;
  if (v417)
  {
    v410 = objc_alloc_init(_MRSetNowPlayingClientMessageProtobuf);
    [(_MRSetNowPlayingClientMessageProtobuf *)v410 setClient:v417];
    v411 = [(MRExternalJSONClientConnection *)self _createProtocolMessage:objc_opt_class() underlyingCodableMessage:v410];
    [v405 addObject:v411];
  }
  id v412 = v405;
LABEL_202:

  return v412;
}

- (id)_encodeVolumeDidChange:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = [v3 dictionary];
  v6 = [v4 underlyingCodableMessage];

  id v7 = [v6 endpointUID];
  [v5 setObject:v7 forKeyedSubscript:@"deviceUID"];

  id v8 = (void *)MEMORY[0x1E4F28C28];
  uint64_t v9 = NSNumber;
  [v6 volume];
  uint64_t v10 = objc_msgSend(v9, "numberWithFloat:");
  uint64_t v11 = v10;
  if (v10)
  {
    [v10 decimalValue];
  }
  else
  {
    v14[0] = 0;
    v14[1] = 0;
    int v15 = 0;
  }
  v12 = [v8 decimalNumberWithDecimal:v14];
  [v5 setObject:v12 forKeyedSubscript:@"volumeLevel"];

  [v5 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"muting"];

  return v5;
}

- (id)_createProtocolMessage:(Class)a3 underlyingCodableMessage:(id)a4
{
  id v5 = a4;
  v6 = (void *)[[a3 alloc] initWithUnderlyingCodableMessage:v5 error:0];

  [v6 setTimestamp:mach_absolute_time()];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedCommands, 0);
  objc_storeStrong((id *)&self->_playbackQueue, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);

  objc_storeStrong((id *)&self->_artwork, 0);
}

@end